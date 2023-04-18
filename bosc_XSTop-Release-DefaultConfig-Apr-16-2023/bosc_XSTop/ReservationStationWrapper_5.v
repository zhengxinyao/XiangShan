module ReservationStationWrapper_5(
  input         clock,
  input         reset,
  input         io_redirect_valid,
  input         io_redirect_bits_robIdx_flag,
  input  [4:0]  io_redirect_bits_robIdx_value,
  input         io_redirect_bits_level,
  output        io_fromDispatch_0_ready,
  input         io_fromDispatch_0_valid,
  input  [9:0]  io_fromDispatch_0_bits_cf_foldpc,
  input         io_fromDispatch_0_bits_cf_trigger_backendEn_0,
  input         io_fromDispatch_0_bits_cf_trigger_backendEn_1,
  input         io_fromDispatch_0_bits_cf_pd_isRVC,
  input  [1:0]  io_fromDispatch_0_bits_cf_pd_brType,
  input         io_fromDispatch_0_bits_cf_pd_isCall,
  input         io_fromDispatch_0_bits_cf_pd_isRet,
  input         io_fromDispatch_0_bits_cf_pred_taken,
  input         io_fromDispatch_0_bits_cf_storeSetHit,
  input         io_fromDispatch_0_bits_cf_waitForRobIdx_flag,
  input  [4:0]  io_fromDispatch_0_bits_cf_waitForRobIdx_value,
  input         io_fromDispatch_0_bits_cf_loadWaitBit,
  input         io_fromDispatch_0_bits_cf_loadWaitStrict,
  input  [4:0]  io_fromDispatch_0_bits_cf_ssid,
  input         io_fromDispatch_0_bits_cf_ftqPtr_flag,
  input  [2:0]  io_fromDispatch_0_bits_cf_ftqPtr_value,
  input  [2:0]  io_fromDispatch_0_bits_cf_ftqOffset,
  input  [1:0]  io_fromDispatch_0_bits_ctrl_srcType_0,
  input  [3:0]  io_fromDispatch_0_bits_ctrl_fuType,
  input  [6:0]  io_fromDispatch_0_bits_ctrl_fuOpType,
  input         io_fromDispatch_0_bits_ctrl_rfWen,
  input         io_fromDispatch_0_bits_ctrl_fpWen,
  input  [19:0] io_fromDispatch_0_bits_ctrl_imm,
  input         io_fromDispatch_0_bits_srcState_0,
  input  [5:0]  io_fromDispatch_0_bits_psrc_0,
  input  [5:0]  io_fromDispatch_0_bits_pdest,
  input         io_fromDispatch_0_bits_robIdx_flag,
  input  [4:0]  io_fromDispatch_0_bits_robIdx_value,
  input         io_fromDispatch_0_bits_lqIdx_flag,
  input  [3:0]  io_fromDispatch_0_bits_lqIdx_value,
  input         io_fromDispatch_0_bits_sqIdx_flag,
  input  [3:0]  io_fromDispatch_0_bits_sqIdx_value,
  output        io_fromDispatch_1_ready,
  input         io_fromDispatch_1_valid,
  input  [9:0]  io_fromDispatch_1_bits_cf_foldpc,
  input         io_fromDispatch_1_bits_cf_trigger_backendEn_0,
  input         io_fromDispatch_1_bits_cf_trigger_backendEn_1,
  input         io_fromDispatch_1_bits_cf_pd_isRVC,
  input  [1:0]  io_fromDispatch_1_bits_cf_pd_brType,
  input         io_fromDispatch_1_bits_cf_pd_isCall,
  input         io_fromDispatch_1_bits_cf_pd_isRet,
  input         io_fromDispatch_1_bits_cf_pred_taken,
  input         io_fromDispatch_1_bits_cf_storeSetHit,
  input         io_fromDispatch_1_bits_cf_waitForRobIdx_flag,
  input  [4:0]  io_fromDispatch_1_bits_cf_waitForRobIdx_value,
  input         io_fromDispatch_1_bits_cf_loadWaitBit,
  input         io_fromDispatch_1_bits_cf_loadWaitStrict,
  input  [4:0]  io_fromDispatch_1_bits_cf_ssid,
  input         io_fromDispatch_1_bits_cf_ftqPtr_flag,
  input  [2:0]  io_fromDispatch_1_bits_cf_ftqPtr_value,
  input  [2:0]  io_fromDispatch_1_bits_cf_ftqOffset,
  input  [1:0]  io_fromDispatch_1_bits_ctrl_srcType_0,
  input  [3:0]  io_fromDispatch_1_bits_ctrl_fuType,
  input  [6:0]  io_fromDispatch_1_bits_ctrl_fuOpType,
  input         io_fromDispatch_1_bits_ctrl_rfWen,
  input         io_fromDispatch_1_bits_ctrl_fpWen,
  input  [19:0] io_fromDispatch_1_bits_ctrl_imm,
  input         io_fromDispatch_1_bits_srcState_0,
  input  [5:0]  io_fromDispatch_1_bits_psrc_0,
  input  [5:0]  io_fromDispatch_1_bits_pdest,
  input         io_fromDispatch_1_bits_robIdx_flag,
  input  [4:0]  io_fromDispatch_1_bits_robIdx_value,
  input         io_fromDispatch_1_bits_lqIdx_flag,
  input  [3:0]  io_fromDispatch_1_bits_lqIdx_value,
  input         io_fromDispatch_1_bits_sqIdx_flag,
  input  [3:0]  io_fromDispatch_1_bits_sqIdx_value,
  input  [63:0] io_srcRegValue_0_0,
  input  [63:0] io_srcRegValue_1_0,
  input  [63:0] io_fpRegValue_0,
  input  [63:0] io_fpRegValue_1,
  input         io_deq_0_ready,
  output        io_deq_0_valid,
  output [3:0]  io_deq_0_bits_uop_ctrl_fuType,
  output [6:0]  io_deq_0_bits_uop_ctrl_fuOpType,
  output        io_deq_0_bits_uop_robIdx_flag,
  output [4:0]  io_deq_0_bits_uop_robIdx_value,
  output        io_deq_0_bits_uop_sqIdx_flag,
  output [3:0]  io_deq_0_bits_uop_sqIdx_value,
  output [63:0] io_deq_0_bits_src_0,
  input         io_deq_1_ready,
  output        io_deq_1_valid,
  output [3:0]  io_deq_1_bits_uop_ctrl_fuType,
  output [6:0]  io_deq_1_bits_uop_ctrl_fuOpType,
  output        io_deq_1_bits_uop_robIdx_flag,
  output [4:0]  io_deq_1_bits_uop_robIdx_value,
  output        io_deq_1_bits_uop_sqIdx_flag,
  output [3:0]  io_deq_1_bits_uop_sqIdx_value,
  output [63:0] io_deq_1_bits_src_0,
  input         io_slowPorts_0_valid,
  input         io_slowPorts_0_bits_uop_ctrl_rfWen,
  input         io_slowPorts_0_bits_uop_ctrl_fpWen,
  input  [5:0]  io_slowPorts_0_bits_uop_pdest,
  input  [63:0] io_slowPorts_0_bits_data,
  input         io_slowPorts_1_valid,
  input         io_slowPorts_1_bits_uop_ctrl_rfWen,
  input         io_slowPorts_1_bits_uop_ctrl_fpWen,
  input  [5:0]  io_slowPorts_1_bits_uop_pdest,
  input  [63:0] io_slowPorts_1_bits_data,
  input         io_slowPorts_2_valid,
  input         io_slowPorts_2_bits_uop_ctrl_rfWen,
  input         io_slowPorts_2_bits_uop_ctrl_fpWen,
  input  [5:0]  io_slowPorts_2_bits_uop_pdest,
  input  [63:0] io_slowPorts_2_bits_data,
  input         io_slowPorts_3_valid,
  input         io_slowPorts_3_bits_uop_ctrl_rfWen,
  input         io_slowPorts_3_bits_uop_ctrl_fpWen,
  input  [5:0]  io_slowPorts_3_bits_uop_pdest,
  input  [63:0] io_slowPorts_3_bits_data,
  input         io_slowPorts_4_valid,
  input         io_slowPorts_4_bits_uop_ctrl_rfWen,
  input         io_slowPorts_4_bits_uop_ctrl_fpWen,
  input  [5:0]  io_slowPorts_4_bits_uop_pdest,
  input  [63:0] io_slowPorts_4_bits_data,
  input         io_slowPorts_5_valid,
  input         io_slowPorts_5_bits_uop_ctrl_rfWen,
  input         io_slowPorts_5_bits_uop_ctrl_fpWen,
  input  [5:0]  io_slowPorts_5_bits_uop_pdest,
  input  [63:0] io_slowPorts_5_bits_data,
  input         io_slowPorts_6_valid,
  input         io_slowPorts_6_bits_uop_ctrl_rfWen,
  input         io_slowPorts_6_bits_uop_ctrl_fpWen,
  input  [5:0]  io_slowPorts_6_bits_uop_pdest,
  input  [63:0] io_slowPorts_6_bits_data,
  input         io_slowPorts_7_valid,
  input         io_slowPorts_7_bits_uop_ctrl_rfWen,
  input         io_slowPorts_7_bits_uop_ctrl_fpWen,
  input  [5:0]  io_slowPorts_7_bits_uop_pdest,
  input  [63:0] io_slowPorts_7_bits_data,
  input         io_slowPorts_8_valid,
  input         io_slowPorts_8_bits_uop_ctrl_rfWen,
  input         io_slowPorts_8_bits_uop_ctrl_fpWen,
  input  [5:0]  io_slowPorts_8_bits_uop_pdest,
  input  [63:0] io_slowPorts_8_bits_data,
  output [5:0]  io_perf_0_value
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
`endif // RANDOMIZE_REG_INIT
  wire  stdRS_0_clock; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_reset; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_redirect_valid; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_redirect_bits_robIdx_flag; // @[ReservationStation.scala 156:13]
  wire [4:0] stdRS_0_io_redirect_bits_robIdx_value; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_redirect_bits_level; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_fromDispatch_0_ready; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_fromDispatch_0_valid; // @[ReservationStation.scala 156:13]
  wire [9:0] stdRS_0_io_fromDispatch_0_bits_cf_foldpc; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_fromDispatch_0_bits_cf_trigger_backendEn_0; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_fromDispatch_0_bits_cf_trigger_backendEn_1; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_fromDispatch_0_bits_cf_pd_isRVC; // @[ReservationStation.scala 156:13]
  wire [1:0] stdRS_0_io_fromDispatch_0_bits_cf_pd_brType; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_fromDispatch_0_bits_cf_pd_isCall; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_fromDispatch_0_bits_cf_pd_isRet; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_fromDispatch_0_bits_cf_pred_taken; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_fromDispatch_0_bits_cf_storeSetHit; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_fromDispatch_0_bits_cf_waitForRobIdx_flag; // @[ReservationStation.scala 156:13]
  wire [4:0] stdRS_0_io_fromDispatch_0_bits_cf_waitForRobIdx_value; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_fromDispatch_0_bits_cf_loadWaitBit; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_fromDispatch_0_bits_cf_loadWaitStrict; // @[ReservationStation.scala 156:13]
  wire [4:0] stdRS_0_io_fromDispatch_0_bits_cf_ssid; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_fromDispatch_0_bits_cf_ftqPtr_flag; // @[ReservationStation.scala 156:13]
  wire [2:0] stdRS_0_io_fromDispatch_0_bits_cf_ftqPtr_value; // @[ReservationStation.scala 156:13]
  wire [2:0] stdRS_0_io_fromDispatch_0_bits_cf_ftqOffset; // @[ReservationStation.scala 156:13]
  wire [1:0] stdRS_0_io_fromDispatch_0_bits_ctrl_srcType_0; // @[ReservationStation.scala 156:13]
  wire [3:0] stdRS_0_io_fromDispatch_0_bits_ctrl_fuType; // @[ReservationStation.scala 156:13]
  wire [6:0] stdRS_0_io_fromDispatch_0_bits_ctrl_fuOpType; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_fromDispatch_0_bits_ctrl_rfWen; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_fromDispatch_0_bits_ctrl_fpWen; // @[ReservationStation.scala 156:13]
  wire [19:0] stdRS_0_io_fromDispatch_0_bits_ctrl_imm; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_fromDispatch_0_bits_srcState_0; // @[ReservationStation.scala 156:13]
  wire [5:0] stdRS_0_io_fromDispatch_0_bits_psrc_0; // @[ReservationStation.scala 156:13]
  wire [5:0] stdRS_0_io_fromDispatch_0_bits_pdest; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_fromDispatch_0_bits_robIdx_flag; // @[ReservationStation.scala 156:13]
  wire [4:0] stdRS_0_io_fromDispatch_0_bits_robIdx_value; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_fromDispatch_0_bits_lqIdx_flag; // @[ReservationStation.scala 156:13]
  wire [3:0] stdRS_0_io_fromDispatch_0_bits_lqIdx_value; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_fromDispatch_0_bits_sqIdx_flag; // @[ReservationStation.scala 156:13]
  wire [3:0] stdRS_0_io_fromDispatch_0_bits_sqIdx_value; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_fromDispatch_1_ready; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_fromDispatch_1_valid; // @[ReservationStation.scala 156:13]
  wire [9:0] stdRS_0_io_fromDispatch_1_bits_cf_foldpc; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_fromDispatch_1_bits_cf_trigger_backendEn_0; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_fromDispatch_1_bits_cf_trigger_backendEn_1; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_fromDispatch_1_bits_cf_pd_isRVC; // @[ReservationStation.scala 156:13]
  wire [1:0] stdRS_0_io_fromDispatch_1_bits_cf_pd_brType; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_fromDispatch_1_bits_cf_pd_isCall; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_fromDispatch_1_bits_cf_pd_isRet; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_fromDispatch_1_bits_cf_pred_taken; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_fromDispatch_1_bits_cf_storeSetHit; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_fromDispatch_1_bits_cf_waitForRobIdx_flag; // @[ReservationStation.scala 156:13]
  wire [4:0] stdRS_0_io_fromDispatch_1_bits_cf_waitForRobIdx_value; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_fromDispatch_1_bits_cf_loadWaitBit; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_fromDispatch_1_bits_cf_loadWaitStrict; // @[ReservationStation.scala 156:13]
  wire [4:0] stdRS_0_io_fromDispatch_1_bits_cf_ssid; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_fromDispatch_1_bits_cf_ftqPtr_flag; // @[ReservationStation.scala 156:13]
  wire [2:0] stdRS_0_io_fromDispatch_1_bits_cf_ftqPtr_value; // @[ReservationStation.scala 156:13]
  wire [2:0] stdRS_0_io_fromDispatch_1_bits_cf_ftqOffset; // @[ReservationStation.scala 156:13]
  wire [1:0] stdRS_0_io_fromDispatch_1_bits_ctrl_srcType_0; // @[ReservationStation.scala 156:13]
  wire [3:0] stdRS_0_io_fromDispatch_1_bits_ctrl_fuType; // @[ReservationStation.scala 156:13]
  wire [6:0] stdRS_0_io_fromDispatch_1_bits_ctrl_fuOpType; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_fromDispatch_1_bits_ctrl_rfWen; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_fromDispatch_1_bits_ctrl_fpWen; // @[ReservationStation.scala 156:13]
  wire [19:0] stdRS_0_io_fromDispatch_1_bits_ctrl_imm; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_fromDispatch_1_bits_srcState_0; // @[ReservationStation.scala 156:13]
  wire [5:0] stdRS_0_io_fromDispatch_1_bits_psrc_0; // @[ReservationStation.scala 156:13]
  wire [5:0] stdRS_0_io_fromDispatch_1_bits_pdest; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_fromDispatch_1_bits_robIdx_flag; // @[ReservationStation.scala 156:13]
  wire [4:0] stdRS_0_io_fromDispatch_1_bits_robIdx_value; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_fromDispatch_1_bits_lqIdx_flag; // @[ReservationStation.scala 156:13]
  wire [3:0] stdRS_0_io_fromDispatch_1_bits_lqIdx_value; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_fromDispatch_1_bits_sqIdx_flag; // @[ReservationStation.scala 156:13]
  wire [3:0] stdRS_0_io_fromDispatch_1_bits_sqIdx_value; // @[ReservationStation.scala 156:13]
  wire [63:0] stdRS_0_io_srcRegValue_0_0; // @[ReservationStation.scala 156:13]
  wire [63:0] stdRS_0_io_srcRegValue_1_0; // @[ReservationStation.scala 156:13]
  wire [63:0] stdRS_0_io_fpRegValue_0; // @[ReservationStation.scala 156:13]
  wire [63:0] stdRS_0_io_fpRegValue_1; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_deq_0_ready; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_deq_0_valid; // @[ReservationStation.scala 156:13]
  wire [3:0] stdRS_0_io_deq_0_bits_uop_ctrl_fuType; // @[ReservationStation.scala 156:13]
  wire [6:0] stdRS_0_io_deq_0_bits_uop_ctrl_fuOpType; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_deq_0_bits_uop_robIdx_flag; // @[ReservationStation.scala 156:13]
  wire [4:0] stdRS_0_io_deq_0_bits_uop_robIdx_value; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_deq_0_bits_uop_sqIdx_flag; // @[ReservationStation.scala 156:13]
  wire [3:0] stdRS_0_io_deq_0_bits_uop_sqIdx_value; // @[ReservationStation.scala 156:13]
  wire [63:0] stdRS_0_io_deq_0_bits_src_0; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_deq_1_ready; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_deq_1_valid; // @[ReservationStation.scala 156:13]
  wire [3:0] stdRS_0_io_deq_1_bits_uop_ctrl_fuType; // @[ReservationStation.scala 156:13]
  wire [6:0] stdRS_0_io_deq_1_bits_uop_ctrl_fuOpType; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_deq_1_bits_uop_robIdx_flag; // @[ReservationStation.scala 156:13]
  wire [4:0] stdRS_0_io_deq_1_bits_uop_robIdx_value; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_deq_1_bits_uop_sqIdx_flag; // @[ReservationStation.scala 156:13]
  wire [3:0] stdRS_0_io_deq_1_bits_uop_sqIdx_value; // @[ReservationStation.scala 156:13]
  wire [63:0] stdRS_0_io_deq_1_bits_src_0; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_slowPorts_0_valid; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_slowPorts_0_bits_uop_ctrl_rfWen; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_slowPorts_0_bits_uop_ctrl_fpWen; // @[ReservationStation.scala 156:13]
  wire [5:0] stdRS_0_io_slowPorts_0_bits_uop_pdest; // @[ReservationStation.scala 156:13]
  wire [63:0] stdRS_0_io_slowPorts_0_bits_data; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_slowPorts_1_valid; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_slowPorts_1_bits_uop_ctrl_rfWen; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_slowPorts_1_bits_uop_ctrl_fpWen; // @[ReservationStation.scala 156:13]
  wire [5:0] stdRS_0_io_slowPorts_1_bits_uop_pdest; // @[ReservationStation.scala 156:13]
  wire [63:0] stdRS_0_io_slowPorts_1_bits_data; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_slowPorts_2_valid; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_slowPorts_2_bits_uop_ctrl_rfWen; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_slowPorts_2_bits_uop_ctrl_fpWen; // @[ReservationStation.scala 156:13]
  wire [5:0] stdRS_0_io_slowPorts_2_bits_uop_pdest; // @[ReservationStation.scala 156:13]
  wire [63:0] stdRS_0_io_slowPorts_2_bits_data; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_slowPorts_3_valid; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_slowPorts_3_bits_uop_ctrl_rfWen; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_slowPorts_3_bits_uop_ctrl_fpWen; // @[ReservationStation.scala 156:13]
  wire [5:0] stdRS_0_io_slowPorts_3_bits_uop_pdest; // @[ReservationStation.scala 156:13]
  wire [63:0] stdRS_0_io_slowPorts_3_bits_data; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_slowPorts_4_valid; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_slowPorts_4_bits_uop_ctrl_rfWen; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_slowPorts_4_bits_uop_ctrl_fpWen; // @[ReservationStation.scala 156:13]
  wire [5:0] stdRS_0_io_slowPorts_4_bits_uop_pdest; // @[ReservationStation.scala 156:13]
  wire [63:0] stdRS_0_io_slowPorts_4_bits_data; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_slowPorts_5_valid; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_slowPorts_5_bits_uop_ctrl_rfWen; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_slowPorts_5_bits_uop_ctrl_fpWen; // @[ReservationStation.scala 156:13]
  wire [5:0] stdRS_0_io_slowPorts_5_bits_uop_pdest; // @[ReservationStation.scala 156:13]
  wire [63:0] stdRS_0_io_slowPorts_5_bits_data; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_slowPorts_6_valid; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_slowPorts_6_bits_uop_ctrl_rfWen; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_slowPorts_6_bits_uop_ctrl_fpWen; // @[ReservationStation.scala 156:13]
  wire [5:0] stdRS_0_io_slowPorts_6_bits_uop_pdest; // @[ReservationStation.scala 156:13]
  wire [63:0] stdRS_0_io_slowPorts_6_bits_data; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_slowPorts_7_valid; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_slowPorts_7_bits_uop_ctrl_rfWen; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_slowPorts_7_bits_uop_ctrl_fpWen; // @[ReservationStation.scala 156:13]
  wire [5:0] stdRS_0_io_slowPorts_7_bits_uop_pdest; // @[ReservationStation.scala 156:13]
  wire [63:0] stdRS_0_io_slowPorts_7_bits_data; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_slowPorts_8_valid; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_slowPorts_8_bits_uop_ctrl_rfWen; // @[ReservationStation.scala 156:13]
  wire  stdRS_0_io_slowPorts_8_bits_uop_ctrl_fpWen; // @[ReservationStation.scala 156:13]
  wire [5:0] stdRS_0_io_slowPorts_8_bits_uop_pdest; // @[ReservationStation.scala 156:13]
  wire [63:0] stdRS_0_io_slowPorts_8_bits_data; // @[ReservationStation.scala 156:13]
  wire [5:0] stdRS_0_io_perf_0_value; // @[ReservationStation.scala 156:13]
  reg  stdRS_0_io_redirect_next_valid_REG; // @[BitUtils.scala 28:28]
  reg  stdRS_0_io_redirect_next_bits_rrobIdx_flag; // @[Reg.scala 16:16]
  reg [4:0] stdRS_0_io_redirect_next_bits_rrobIdx_value; // @[Reg.scala 16:16]
  reg  stdRS_0_io_redirect_next_bits_rlevel; // @[Reg.scala 16:16]
  reg [5:0] io_perf_0_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg [5:0] io_perf_0_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  ReservationStation_5 stdRS_0 ( // @[ReservationStation.scala 156:13]
    .clock(stdRS_0_clock),
    .reset(stdRS_0_reset),
    .io_redirect_valid(stdRS_0_io_redirect_valid),
    .io_redirect_bits_robIdx_flag(stdRS_0_io_redirect_bits_robIdx_flag),
    .io_redirect_bits_robIdx_value(stdRS_0_io_redirect_bits_robIdx_value),
    .io_redirect_bits_level(stdRS_0_io_redirect_bits_level),
    .io_fromDispatch_0_ready(stdRS_0_io_fromDispatch_0_ready),
    .io_fromDispatch_0_valid(stdRS_0_io_fromDispatch_0_valid),
    .io_fromDispatch_0_bits_cf_foldpc(stdRS_0_io_fromDispatch_0_bits_cf_foldpc),
    .io_fromDispatch_0_bits_cf_trigger_backendEn_0(stdRS_0_io_fromDispatch_0_bits_cf_trigger_backendEn_0),
    .io_fromDispatch_0_bits_cf_trigger_backendEn_1(stdRS_0_io_fromDispatch_0_bits_cf_trigger_backendEn_1),
    .io_fromDispatch_0_bits_cf_pd_isRVC(stdRS_0_io_fromDispatch_0_bits_cf_pd_isRVC),
    .io_fromDispatch_0_bits_cf_pd_brType(stdRS_0_io_fromDispatch_0_bits_cf_pd_brType),
    .io_fromDispatch_0_bits_cf_pd_isCall(stdRS_0_io_fromDispatch_0_bits_cf_pd_isCall),
    .io_fromDispatch_0_bits_cf_pd_isRet(stdRS_0_io_fromDispatch_0_bits_cf_pd_isRet),
    .io_fromDispatch_0_bits_cf_pred_taken(stdRS_0_io_fromDispatch_0_bits_cf_pred_taken),
    .io_fromDispatch_0_bits_cf_storeSetHit(stdRS_0_io_fromDispatch_0_bits_cf_storeSetHit),
    .io_fromDispatch_0_bits_cf_waitForRobIdx_flag(stdRS_0_io_fromDispatch_0_bits_cf_waitForRobIdx_flag),
    .io_fromDispatch_0_bits_cf_waitForRobIdx_value(stdRS_0_io_fromDispatch_0_bits_cf_waitForRobIdx_value),
    .io_fromDispatch_0_bits_cf_loadWaitBit(stdRS_0_io_fromDispatch_0_bits_cf_loadWaitBit),
    .io_fromDispatch_0_bits_cf_loadWaitStrict(stdRS_0_io_fromDispatch_0_bits_cf_loadWaitStrict),
    .io_fromDispatch_0_bits_cf_ssid(stdRS_0_io_fromDispatch_0_bits_cf_ssid),
    .io_fromDispatch_0_bits_cf_ftqPtr_flag(stdRS_0_io_fromDispatch_0_bits_cf_ftqPtr_flag),
    .io_fromDispatch_0_bits_cf_ftqPtr_value(stdRS_0_io_fromDispatch_0_bits_cf_ftqPtr_value),
    .io_fromDispatch_0_bits_cf_ftqOffset(stdRS_0_io_fromDispatch_0_bits_cf_ftqOffset),
    .io_fromDispatch_0_bits_ctrl_srcType_0(stdRS_0_io_fromDispatch_0_bits_ctrl_srcType_0),
    .io_fromDispatch_0_bits_ctrl_fuType(stdRS_0_io_fromDispatch_0_bits_ctrl_fuType),
    .io_fromDispatch_0_bits_ctrl_fuOpType(stdRS_0_io_fromDispatch_0_bits_ctrl_fuOpType),
    .io_fromDispatch_0_bits_ctrl_rfWen(stdRS_0_io_fromDispatch_0_bits_ctrl_rfWen),
    .io_fromDispatch_0_bits_ctrl_fpWen(stdRS_0_io_fromDispatch_0_bits_ctrl_fpWen),
    .io_fromDispatch_0_bits_ctrl_imm(stdRS_0_io_fromDispatch_0_bits_ctrl_imm),
    .io_fromDispatch_0_bits_srcState_0(stdRS_0_io_fromDispatch_0_bits_srcState_0),
    .io_fromDispatch_0_bits_psrc_0(stdRS_0_io_fromDispatch_0_bits_psrc_0),
    .io_fromDispatch_0_bits_pdest(stdRS_0_io_fromDispatch_0_bits_pdest),
    .io_fromDispatch_0_bits_robIdx_flag(stdRS_0_io_fromDispatch_0_bits_robIdx_flag),
    .io_fromDispatch_0_bits_robIdx_value(stdRS_0_io_fromDispatch_0_bits_robIdx_value),
    .io_fromDispatch_0_bits_lqIdx_flag(stdRS_0_io_fromDispatch_0_bits_lqIdx_flag),
    .io_fromDispatch_0_bits_lqIdx_value(stdRS_0_io_fromDispatch_0_bits_lqIdx_value),
    .io_fromDispatch_0_bits_sqIdx_flag(stdRS_0_io_fromDispatch_0_bits_sqIdx_flag),
    .io_fromDispatch_0_bits_sqIdx_value(stdRS_0_io_fromDispatch_0_bits_sqIdx_value),
    .io_fromDispatch_1_ready(stdRS_0_io_fromDispatch_1_ready),
    .io_fromDispatch_1_valid(stdRS_0_io_fromDispatch_1_valid),
    .io_fromDispatch_1_bits_cf_foldpc(stdRS_0_io_fromDispatch_1_bits_cf_foldpc),
    .io_fromDispatch_1_bits_cf_trigger_backendEn_0(stdRS_0_io_fromDispatch_1_bits_cf_trigger_backendEn_0),
    .io_fromDispatch_1_bits_cf_trigger_backendEn_1(stdRS_0_io_fromDispatch_1_bits_cf_trigger_backendEn_1),
    .io_fromDispatch_1_bits_cf_pd_isRVC(stdRS_0_io_fromDispatch_1_bits_cf_pd_isRVC),
    .io_fromDispatch_1_bits_cf_pd_brType(stdRS_0_io_fromDispatch_1_bits_cf_pd_brType),
    .io_fromDispatch_1_bits_cf_pd_isCall(stdRS_0_io_fromDispatch_1_bits_cf_pd_isCall),
    .io_fromDispatch_1_bits_cf_pd_isRet(stdRS_0_io_fromDispatch_1_bits_cf_pd_isRet),
    .io_fromDispatch_1_bits_cf_pred_taken(stdRS_0_io_fromDispatch_1_bits_cf_pred_taken),
    .io_fromDispatch_1_bits_cf_storeSetHit(stdRS_0_io_fromDispatch_1_bits_cf_storeSetHit),
    .io_fromDispatch_1_bits_cf_waitForRobIdx_flag(stdRS_0_io_fromDispatch_1_bits_cf_waitForRobIdx_flag),
    .io_fromDispatch_1_bits_cf_waitForRobIdx_value(stdRS_0_io_fromDispatch_1_bits_cf_waitForRobIdx_value),
    .io_fromDispatch_1_bits_cf_loadWaitBit(stdRS_0_io_fromDispatch_1_bits_cf_loadWaitBit),
    .io_fromDispatch_1_bits_cf_loadWaitStrict(stdRS_0_io_fromDispatch_1_bits_cf_loadWaitStrict),
    .io_fromDispatch_1_bits_cf_ssid(stdRS_0_io_fromDispatch_1_bits_cf_ssid),
    .io_fromDispatch_1_bits_cf_ftqPtr_flag(stdRS_0_io_fromDispatch_1_bits_cf_ftqPtr_flag),
    .io_fromDispatch_1_bits_cf_ftqPtr_value(stdRS_0_io_fromDispatch_1_bits_cf_ftqPtr_value),
    .io_fromDispatch_1_bits_cf_ftqOffset(stdRS_0_io_fromDispatch_1_bits_cf_ftqOffset),
    .io_fromDispatch_1_bits_ctrl_srcType_0(stdRS_0_io_fromDispatch_1_bits_ctrl_srcType_0),
    .io_fromDispatch_1_bits_ctrl_fuType(stdRS_0_io_fromDispatch_1_bits_ctrl_fuType),
    .io_fromDispatch_1_bits_ctrl_fuOpType(stdRS_0_io_fromDispatch_1_bits_ctrl_fuOpType),
    .io_fromDispatch_1_bits_ctrl_rfWen(stdRS_0_io_fromDispatch_1_bits_ctrl_rfWen),
    .io_fromDispatch_1_bits_ctrl_fpWen(stdRS_0_io_fromDispatch_1_bits_ctrl_fpWen),
    .io_fromDispatch_1_bits_ctrl_imm(stdRS_0_io_fromDispatch_1_bits_ctrl_imm),
    .io_fromDispatch_1_bits_srcState_0(stdRS_0_io_fromDispatch_1_bits_srcState_0),
    .io_fromDispatch_1_bits_psrc_0(stdRS_0_io_fromDispatch_1_bits_psrc_0),
    .io_fromDispatch_1_bits_pdest(stdRS_0_io_fromDispatch_1_bits_pdest),
    .io_fromDispatch_1_bits_robIdx_flag(stdRS_0_io_fromDispatch_1_bits_robIdx_flag),
    .io_fromDispatch_1_bits_robIdx_value(stdRS_0_io_fromDispatch_1_bits_robIdx_value),
    .io_fromDispatch_1_bits_lqIdx_flag(stdRS_0_io_fromDispatch_1_bits_lqIdx_flag),
    .io_fromDispatch_1_bits_lqIdx_value(stdRS_0_io_fromDispatch_1_bits_lqIdx_value),
    .io_fromDispatch_1_bits_sqIdx_flag(stdRS_0_io_fromDispatch_1_bits_sqIdx_flag),
    .io_fromDispatch_1_bits_sqIdx_value(stdRS_0_io_fromDispatch_1_bits_sqIdx_value),
    .io_srcRegValue_0_0(stdRS_0_io_srcRegValue_0_0),
    .io_srcRegValue_1_0(stdRS_0_io_srcRegValue_1_0),
    .io_fpRegValue_0(stdRS_0_io_fpRegValue_0),
    .io_fpRegValue_1(stdRS_0_io_fpRegValue_1),
    .io_deq_0_ready(stdRS_0_io_deq_0_ready),
    .io_deq_0_valid(stdRS_0_io_deq_0_valid),
    .io_deq_0_bits_uop_ctrl_fuType(stdRS_0_io_deq_0_bits_uop_ctrl_fuType),
    .io_deq_0_bits_uop_ctrl_fuOpType(stdRS_0_io_deq_0_bits_uop_ctrl_fuOpType),
    .io_deq_0_bits_uop_robIdx_flag(stdRS_0_io_deq_0_bits_uop_robIdx_flag),
    .io_deq_0_bits_uop_robIdx_value(stdRS_0_io_deq_0_bits_uop_robIdx_value),
    .io_deq_0_bits_uop_sqIdx_flag(stdRS_0_io_deq_0_bits_uop_sqIdx_flag),
    .io_deq_0_bits_uop_sqIdx_value(stdRS_0_io_deq_0_bits_uop_sqIdx_value),
    .io_deq_0_bits_src_0(stdRS_0_io_deq_0_bits_src_0),
    .io_deq_1_ready(stdRS_0_io_deq_1_ready),
    .io_deq_1_valid(stdRS_0_io_deq_1_valid),
    .io_deq_1_bits_uop_ctrl_fuType(stdRS_0_io_deq_1_bits_uop_ctrl_fuType),
    .io_deq_1_bits_uop_ctrl_fuOpType(stdRS_0_io_deq_1_bits_uop_ctrl_fuOpType),
    .io_deq_1_bits_uop_robIdx_flag(stdRS_0_io_deq_1_bits_uop_robIdx_flag),
    .io_deq_1_bits_uop_robIdx_value(stdRS_0_io_deq_1_bits_uop_robIdx_value),
    .io_deq_1_bits_uop_sqIdx_flag(stdRS_0_io_deq_1_bits_uop_sqIdx_flag),
    .io_deq_1_bits_uop_sqIdx_value(stdRS_0_io_deq_1_bits_uop_sqIdx_value),
    .io_deq_1_bits_src_0(stdRS_0_io_deq_1_bits_src_0),
    .io_slowPorts_0_valid(stdRS_0_io_slowPorts_0_valid),
    .io_slowPorts_0_bits_uop_ctrl_rfWen(stdRS_0_io_slowPorts_0_bits_uop_ctrl_rfWen),
    .io_slowPorts_0_bits_uop_ctrl_fpWen(stdRS_0_io_slowPorts_0_bits_uop_ctrl_fpWen),
    .io_slowPorts_0_bits_uop_pdest(stdRS_0_io_slowPorts_0_bits_uop_pdest),
    .io_slowPorts_0_bits_data(stdRS_0_io_slowPorts_0_bits_data),
    .io_slowPorts_1_valid(stdRS_0_io_slowPorts_1_valid),
    .io_slowPorts_1_bits_uop_ctrl_rfWen(stdRS_0_io_slowPorts_1_bits_uop_ctrl_rfWen),
    .io_slowPorts_1_bits_uop_ctrl_fpWen(stdRS_0_io_slowPorts_1_bits_uop_ctrl_fpWen),
    .io_slowPorts_1_bits_uop_pdest(stdRS_0_io_slowPorts_1_bits_uop_pdest),
    .io_slowPorts_1_bits_data(stdRS_0_io_slowPorts_1_bits_data),
    .io_slowPorts_2_valid(stdRS_0_io_slowPorts_2_valid),
    .io_slowPorts_2_bits_uop_ctrl_rfWen(stdRS_0_io_slowPorts_2_bits_uop_ctrl_rfWen),
    .io_slowPorts_2_bits_uop_ctrl_fpWen(stdRS_0_io_slowPorts_2_bits_uop_ctrl_fpWen),
    .io_slowPorts_2_bits_uop_pdest(stdRS_0_io_slowPorts_2_bits_uop_pdest),
    .io_slowPorts_2_bits_data(stdRS_0_io_slowPorts_2_bits_data),
    .io_slowPorts_3_valid(stdRS_0_io_slowPorts_3_valid),
    .io_slowPorts_3_bits_uop_ctrl_rfWen(stdRS_0_io_slowPorts_3_bits_uop_ctrl_rfWen),
    .io_slowPorts_3_bits_uop_ctrl_fpWen(stdRS_0_io_slowPorts_3_bits_uop_ctrl_fpWen),
    .io_slowPorts_3_bits_uop_pdest(stdRS_0_io_slowPorts_3_bits_uop_pdest),
    .io_slowPorts_3_bits_data(stdRS_0_io_slowPorts_3_bits_data),
    .io_slowPorts_4_valid(stdRS_0_io_slowPorts_4_valid),
    .io_slowPorts_4_bits_uop_ctrl_rfWen(stdRS_0_io_slowPorts_4_bits_uop_ctrl_rfWen),
    .io_slowPorts_4_bits_uop_ctrl_fpWen(stdRS_0_io_slowPorts_4_bits_uop_ctrl_fpWen),
    .io_slowPorts_4_bits_uop_pdest(stdRS_0_io_slowPorts_4_bits_uop_pdest),
    .io_slowPorts_4_bits_data(stdRS_0_io_slowPorts_4_bits_data),
    .io_slowPorts_5_valid(stdRS_0_io_slowPorts_5_valid),
    .io_slowPorts_5_bits_uop_ctrl_rfWen(stdRS_0_io_slowPorts_5_bits_uop_ctrl_rfWen),
    .io_slowPorts_5_bits_uop_ctrl_fpWen(stdRS_0_io_slowPorts_5_bits_uop_ctrl_fpWen),
    .io_slowPorts_5_bits_uop_pdest(stdRS_0_io_slowPorts_5_bits_uop_pdest),
    .io_slowPorts_5_bits_data(stdRS_0_io_slowPorts_5_bits_data),
    .io_slowPorts_6_valid(stdRS_0_io_slowPorts_6_valid),
    .io_slowPorts_6_bits_uop_ctrl_rfWen(stdRS_0_io_slowPorts_6_bits_uop_ctrl_rfWen),
    .io_slowPorts_6_bits_uop_ctrl_fpWen(stdRS_0_io_slowPorts_6_bits_uop_ctrl_fpWen),
    .io_slowPorts_6_bits_uop_pdest(stdRS_0_io_slowPorts_6_bits_uop_pdest),
    .io_slowPorts_6_bits_data(stdRS_0_io_slowPorts_6_bits_data),
    .io_slowPorts_7_valid(stdRS_0_io_slowPorts_7_valid),
    .io_slowPorts_7_bits_uop_ctrl_rfWen(stdRS_0_io_slowPorts_7_bits_uop_ctrl_rfWen),
    .io_slowPorts_7_bits_uop_ctrl_fpWen(stdRS_0_io_slowPorts_7_bits_uop_ctrl_fpWen),
    .io_slowPorts_7_bits_uop_pdest(stdRS_0_io_slowPorts_7_bits_uop_pdest),
    .io_slowPorts_7_bits_data(stdRS_0_io_slowPorts_7_bits_data),
    .io_slowPorts_8_valid(stdRS_0_io_slowPorts_8_valid),
    .io_slowPorts_8_bits_uop_ctrl_rfWen(stdRS_0_io_slowPorts_8_bits_uop_ctrl_rfWen),
    .io_slowPorts_8_bits_uop_ctrl_fpWen(stdRS_0_io_slowPorts_8_bits_uop_ctrl_fpWen),
    .io_slowPorts_8_bits_uop_pdest(stdRS_0_io_slowPorts_8_bits_uop_pdest),
    .io_slowPorts_8_bits_data(stdRS_0_io_slowPorts_8_bits_data),
    .io_perf_0_value(stdRS_0_io_perf_0_value)
  );
  assign io_fromDispatch_0_ready = stdRS_0_io_fromDispatch_0_ready; // @[ReservationStation.scala 174:21]
  assign io_fromDispatch_1_ready = stdRS_0_io_fromDispatch_1_ready; // @[ReservationStation.scala 174:21]
  assign io_deq_0_valid = stdRS_0_io_deq_0_valid; // @[ReservationStation.scala 180:12]
  assign io_deq_0_bits_uop_ctrl_fuType = stdRS_0_io_deq_0_bits_uop_ctrl_fuType; // @[ReservationStation.scala 180:12]
  assign io_deq_0_bits_uop_ctrl_fuOpType = stdRS_0_io_deq_0_bits_uop_ctrl_fuOpType; // @[ReservationStation.scala 180:12]
  assign io_deq_0_bits_uop_robIdx_flag = stdRS_0_io_deq_0_bits_uop_robIdx_flag; // @[ReservationStation.scala 180:12]
  assign io_deq_0_bits_uop_robIdx_value = stdRS_0_io_deq_0_bits_uop_robIdx_value; // @[ReservationStation.scala 180:12]
  assign io_deq_0_bits_uop_sqIdx_flag = stdRS_0_io_deq_0_bits_uop_sqIdx_flag; // @[ReservationStation.scala 180:12]
  assign io_deq_0_bits_uop_sqIdx_value = stdRS_0_io_deq_0_bits_uop_sqIdx_value; // @[ReservationStation.scala 180:12]
  assign io_deq_0_bits_src_0 = stdRS_0_io_deq_0_bits_src_0; // @[ReservationStation.scala 180:12]
  assign io_deq_1_valid = stdRS_0_io_deq_1_valid; // @[ReservationStation.scala 180:12]
  assign io_deq_1_bits_uop_ctrl_fuType = stdRS_0_io_deq_1_bits_uop_ctrl_fuType; // @[ReservationStation.scala 180:12]
  assign io_deq_1_bits_uop_ctrl_fuOpType = stdRS_0_io_deq_1_bits_uop_ctrl_fuOpType; // @[ReservationStation.scala 180:12]
  assign io_deq_1_bits_uop_robIdx_flag = stdRS_0_io_deq_1_bits_uop_robIdx_flag; // @[ReservationStation.scala 180:12]
  assign io_deq_1_bits_uop_robIdx_value = stdRS_0_io_deq_1_bits_uop_robIdx_value; // @[ReservationStation.scala 180:12]
  assign io_deq_1_bits_uop_sqIdx_flag = stdRS_0_io_deq_1_bits_uop_sqIdx_flag; // @[ReservationStation.scala 180:12]
  assign io_deq_1_bits_uop_sqIdx_value = stdRS_0_io_deq_1_bits_uop_sqIdx_value; // @[ReservationStation.scala 180:12]
  assign io_deq_1_bits_src_0 = stdRS_0_io_deq_1_bits_src_0; // @[ReservationStation.scala 180:12]
  assign io_perf_0_value = io_perf_0_value_REG_1; // @[PerfCounterUtils.scala 188:17]
  assign stdRS_0_clock = clock;
  assign stdRS_0_reset = reset;
  assign stdRS_0_io_redirect_valid = stdRS_0_io_redirect_next_valid_REG; // @[BitUtils.scala 26:20 28:18]
  assign stdRS_0_io_redirect_bits_robIdx_flag = stdRS_0_io_redirect_next_bits_rrobIdx_flag; // @[BitUtils.scala 26:20 33:15]
  assign stdRS_0_io_redirect_bits_robIdx_value = stdRS_0_io_redirect_next_bits_rrobIdx_value; // @[BitUtils.scala 26:20 33:15]
  assign stdRS_0_io_redirect_bits_level = stdRS_0_io_redirect_next_bits_rlevel; // @[BitUtils.scala 26:20 33:15]
  assign stdRS_0_io_fromDispatch_0_valid = io_fromDispatch_0_valid; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_0_bits_cf_foldpc = io_fromDispatch_0_bits_cf_foldpc; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_0_bits_cf_trigger_backendEn_0 = io_fromDispatch_0_bits_cf_trigger_backendEn_0; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_0_bits_cf_trigger_backendEn_1 = io_fromDispatch_0_bits_cf_trigger_backendEn_1; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_0_bits_cf_pd_isRVC = io_fromDispatch_0_bits_cf_pd_isRVC; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_0_bits_cf_pd_brType = io_fromDispatch_0_bits_cf_pd_brType; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_0_bits_cf_pd_isCall = io_fromDispatch_0_bits_cf_pd_isCall; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_0_bits_cf_pd_isRet = io_fromDispatch_0_bits_cf_pd_isRet; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_0_bits_cf_pred_taken = io_fromDispatch_0_bits_cf_pred_taken; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_0_bits_cf_storeSetHit = io_fromDispatch_0_bits_cf_storeSetHit; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_0_bits_cf_waitForRobIdx_flag = io_fromDispatch_0_bits_cf_waitForRobIdx_flag; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_0_bits_cf_waitForRobIdx_value = io_fromDispatch_0_bits_cf_waitForRobIdx_value; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_0_bits_cf_loadWaitBit = io_fromDispatch_0_bits_cf_loadWaitBit; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_0_bits_cf_loadWaitStrict = io_fromDispatch_0_bits_cf_loadWaitStrict; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_0_bits_cf_ssid = io_fromDispatch_0_bits_cf_ssid; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_0_bits_cf_ftqPtr_flag = io_fromDispatch_0_bits_cf_ftqPtr_flag; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_0_bits_cf_ftqPtr_value = io_fromDispatch_0_bits_cf_ftqPtr_value; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_0_bits_cf_ftqOffset = io_fromDispatch_0_bits_cf_ftqOffset; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_0_bits_ctrl_srcType_0 = io_fromDispatch_0_bits_ctrl_srcType_0; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_0_bits_ctrl_fuType = io_fromDispatch_0_bits_ctrl_fuType; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_0_bits_ctrl_fuOpType = io_fromDispatch_0_bits_ctrl_fuOpType; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_0_bits_ctrl_rfWen = io_fromDispatch_0_bits_ctrl_rfWen; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_0_bits_ctrl_fpWen = io_fromDispatch_0_bits_ctrl_fpWen; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_0_bits_ctrl_imm = io_fromDispatch_0_bits_ctrl_imm; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_0_bits_srcState_0 = io_fromDispatch_0_bits_srcState_0; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_0_bits_psrc_0 = io_fromDispatch_0_bits_psrc_0; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_0_bits_pdest = io_fromDispatch_0_bits_pdest; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_0_bits_robIdx_flag = io_fromDispatch_0_bits_robIdx_flag; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_0_bits_robIdx_value = io_fromDispatch_0_bits_robIdx_value; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_0_bits_lqIdx_flag = io_fromDispatch_0_bits_lqIdx_flag; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_0_bits_lqIdx_value = io_fromDispatch_0_bits_lqIdx_value; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_0_bits_sqIdx_flag = io_fromDispatch_0_bits_sqIdx_flag; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_0_bits_sqIdx_value = io_fromDispatch_0_bits_sqIdx_value; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_1_valid = io_fromDispatch_1_valid; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_1_bits_cf_foldpc = io_fromDispatch_1_bits_cf_foldpc; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_1_bits_cf_trigger_backendEn_0 = io_fromDispatch_1_bits_cf_trigger_backendEn_0; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_1_bits_cf_trigger_backendEn_1 = io_fromDispatch_1_bits_cf_trigger_backendEn_1; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_1_bits_cf_pd_isRVC = io_fromDispatch_1_bits_cf_pd_isRVC; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_1_bits_cf_pd_brType = io_fromDispatch_1_bits_cf_pd_brType; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_1_bits_cf_pd_isCall = io_fromDispatch_1_bits_cf_pd_isCall; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_1_bits_cf_pd_isRet = io_fromDispatch_1_bits_cf_pd_isRet; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_1_bits_cf_pred_taken = io_fromDispatch_1_bits_cf_pred_taken; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_1_bits_cf_storeSetHit = io_fromDispatch_1_bits_cf_storeSetHit; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_1_bits_cf_waitForRobIdx_flag = io_fromDispatch_1_bits_cf_waitForRobIdx_flag; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_1_bits_cf_waitForRobIdx_value = io_fromDispatch_1_bits_cf_waitForRobIdx_value; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_1_bits_cf_loadWaitBit = io_fromDispatch_1_bits_cf_loadWaitBit; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_1_bits_cf_loadWaitStrict = io_fromDispatch_1_bits_cf_loadWaitStrict; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_1_bits_cf_ssid = io_fromDispatch_1_bits_cf_ssid; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_1_bits_cf_ftqPtr_flag = io_fromDispatch_1_bits_cf_ftqPtr_flag; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_1_bits_cf_ftqPtr_value = io_fromDispatch_1_bits_cf_ftqPtr_value; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_1_bits_cf_ftqOffset = io_fromDispatch_1_bits_cf_ftqOffset; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_1_bits_ctrl_srcType_0 = io_fromDispatch_1_bits_ctrl_srcType_0; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_1_bits_ctrl_fuType = io_fromDispatch_1_bits_ctrl_fuType; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_1_bits_ctrl_fuOpType = io_fromDispatch_1_bits_ctrl_fuOpType; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_1_bits_ctrl_rfWen = io_fromDispatch_1_bits_ctrl_rfWen; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_1_bits_ctrl_fpWen = io_fromDispatch_1_bits_ctrl_fpWen; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_1_bits_ctrl_imm = io_fromDispatch_1_bits_ctrl_imm; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_1_bits_srcState_0 = io_fromDispatch_1_bits_srcState_0; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_1_bits_psrc_0 = io_fromDispatch_1_bits_psrc_0; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_1_bits_pdest = io_fromDispatch_1_bits_pdest; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_1_bits_robIdx_flag = io_fromDispatch_1_bits_robIdx_flag; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_1_bits_robIdx_value = io_fromDispatch_1_bits_robIdx_value; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_1_bits_lqIdx_flag = io_fromDispatch_1_bits_lqIdx_flag; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_1_bits_lqIdx_value = io_fromDispatch_1_bits_lqIdx_value; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_1_bits_sqIdx_flag = io_fromDispatch_1_bits_sqIdx_flag; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_fromDispatch_1_bits_sqIdx_value = io_fromDispatch_1_bits_sqIdx_value; // @[ReservationStation.scala 174:21]
  assign stdRS_0_io_srcRegValue_0_0 = io_srcRegValue_0_0; // @[ReservationStation.scala 175:20]
  assign stdRS_0_io_srcRegValue_1_0 = io_srcRegValue_1_0; // @[ReservationStation.scala 175:20]
  assign stdRS_0_io_fpRegValue_0 = io_fpRegValue_0; // @[ReservationStation.scala 178:25]
  assign stdRS_0_io_fpRegValue_1 = io_fpRegValue_1; // @[ReservationStation.scala 178:25]
  assign stdRS_0_io_deq_0_ready = io_deq_0_ready; // @[ReservationStation.scala 180:12]
  assign stdRS_0_io_deq_1_ready = io_deq_1_ready; // @[ReservationStation.scala 180:12]
  assign stdRS_0_io_slowPorts_0_valid = io_slowPorts_0_valid; // @[ReservationStation.scala 183:31]
  assign stdRS_0_io_slowPorts_0_bits_uop_ctrl_rfWen = io_slowPorts_0_bits_uop_ctrl_rfWen; // @[ReservationStation.scala 183:31]
  assign stdRS_0_io_slowPorts_0_bits_uop_ctrl_fpWen = io_slowPorts_0_bits_uop_ctrl_fpWen; // @[ReservationStation.scala 183:31]
  assign stdRS_0_io_slowPorts_0_bits_uop_pdest = io_slowPorts_0_bits_uop_pdest; // @[ReservationStation.scala 183:31]
  assign stdRS_0_io_slowPorts_0_bits_data = io_slowPorts_0_bits_data; // @[ReservationStation.scala 183:31]
  assign stdRS_0_io_slowPorts_1_valid = io_slowPorts_1_valid; // @[ReservationStation.scala 183:31]
  assign stdRS_0_io_slowPorts_1_bits_uop_ctrl_rfWen = io_slowPorts_1_bits_uop_ctrl_rfWen; // @[ReservationStation.scala 183:31]
  assign stdRS_0_io_slowPorts_1_bits_uop_ctrl_fpWen = io_slowPorts_1_bits_uop_ctrl_fpWen; // @[ReservationStation.scala 183:31]
  assign stdRS_0_io_slowPorts_1_bits_uop_pdest = io_slowPorts_1_bits_uop_pdest; // @[ReservationStation.scala 183:31]
  assign stdRS_0_io_slowPorts_1_bits_data = io_slowPorts_1_bits_data; // @[ReservationStation.scala 183:31]
  assign stdRS_0_io_slowPorts_2_valid = io_slowPorts_2_valid; // @[ReservationStation.scala 183:31]
  assign stdRS_0_io_slowPorts_2_bits_uop_ctrl_rfWen = io_slowPorts_2_bits_uop_ctrl_rfWen; // @[ReservationStation.scala 183:31]
  assign stdRS_0_io_slowPorts_2_bits_uop_ctrl_fpWen = io_slowPorts_2_bits_uop_ctrl_fpWen; // @[ReservationStation.scala 183:31]
  assign stdRS_0_io_slowPorts_2_bits_uop_pdest = io_slowPorts_2_bits_uop_pdest; // @[ReservationStation.scala 183:31]
  assign stdRS_0_io_slowPorts_2_bits_data = io_slowPorts_2_bits_data; // @[ReservationStation.scala 183:31]
  assign stdRS_0_io_slowPorts_3_valid = io_slowPorts_3_valid; // @[ReservationStation.scala 183:31]
  assign stdRS_0_io_slowPorts_3_bits_uop_ctrl_rfWen = io_slowPorts_3_bits_uop_ctrl_rfWen; // @[ReservationStation.scala 183:31]
  assign stdRS_0_io_slowPorts_3_bits_uop_ctrl_fpWen = io_slowPorts_3_bits_uop_ctrl_fpWen; // @[ReservationStation.scala 183:31]
  assign stdRS_0_io_slowPorts_3_bits_uop_pdest = io_slowPorts_3_bits_uop_pdest; // @[ReservationStation.scala 183:31]
  assign stdRS_0_io_slowPorts_3_bits_data = io_slowPorts_3_bits_data; // @[ReservationStation.scala 183:31]
  assign stdRS_0_io_slowPorts_4_valid = io_slowPorts_4_valid; // @[ReservationStation.scala 183:31]
  assign stdRS_0_io_slowPorts_4_bits_uop_ctrl_rfWen = io_slowPorts_4_bits_uop_ctrl_rfWen; // @[ReservationStation.scala 183:31]
  assign stdRS_0_io_slowPorts_4_bits_uop_ctrl_fpWen = io_slowPorts_4_bits_uop_ctrl_fpWen; // @[ReservationStation.scala 183:31]
  assign stdRS_0_io_slowPorts_4_bits_uop_pdest = io_slowPorts_4_bits_uop_pdest; // @[ReservationStation.scala 183:31]
  assign stdRS_0_io_slowPorts_4_bits_data = io_slowPorts_4_bits_data; // @[ReservationStation.scala 183:31]
  assign stdRS_0_io_slowPorts_5_valid = io_slowPorts_5_valid; // @[ReservationStation.scala 183:31]
  assign stdRS_0_io_slowPorts_5_bits_uop_ctrl_rfWen = io_slowPorts_5_bits_uop_ctrl_rfWen; // @[ReservationStation.scala 183:31]
  assign stdRS_0_io_slowPorts_5_bits_uop_ctrl_fpWen = io_slowPorts_5_bits_uop_ctrl_fpWen; // @[ReservationStation.scala 183:31]
  assign stdRS_0_io_slowPorts_5_bits_uop_pdest = io_slowPorts_5_bits_uop_pdest; // @[ReservationStation.scala 183:31]
  assign stdRS_0_io_slowPorts_5_bits_data = io_slowPorts_5_bits_data; // @[ReservationStation.scala 183:31]
  assign stdRS_0_io_slowPorts_6_valid = io_slowPorts_6_valid; // @[ReservationStation.scala 183:31]
  assign stdRS_0_io_slowPorts_6_bits_uop_ctrl_rfWen = io_slowPorts_6_bits_uop_ctrl_rfWen; // @[ReservationStation.scala 183:31]
  assign stdRS_0_io_slowPorts_6_bits_uop_ctrl_fpWen = io_slowPorts_6_bits_uop_ctrl_fpWen; // @[ReservationStation.scala 183:31]
  assign stdRS_0_io_slowPorts_6_bits_uop_pdest = io_slowPorts_6_bits_uop_pdest; // @[ReservationStation.scala 183:31]
  assign stdRS_0_io_slowPorts_6_bits_data = io_slowPorts_6_bits_data; // @[ReservationStation.scala 183:31]
  assign stdRS_0_io_slowPorts_7_valid = io_slowPorts_7_valid; // @[ReservationStation.scala 183:31]
  assign stdRS_0_io_slowPorts_7_bits_uop_ctrl_rfWen = io_slowPorts_7_bits_uop_ctrl_rfWen; // @[ReservationStation.scala 183:31]
  assign stdRS_0_io_slowPorts_7_bits_uop_ctrl_fpWen = io_slowPorts_7_bits_uop_ctrl_fpWen; // @[ReservationStation.scala 183:31]
  assign stdRS_0_io_slowPorts_7_bits_uop_pdest = io_slowPorts_7_bits_uop_pdest; // @[ReservationStation.scala 183:31]
  assign stdRS_0_io_slowPorts_7_bits_data = io_slowPorts_7_bits_data; // @[ReservationStation.scala 183:31]
  assign stdRS_0_io_slowPorts_8_valid = io_slowPorts_8_valid; // @[ReservationStation.scala 183:31]
  assign stdRS_0_io_slowPorts_8_bits_uop_ctrl_rfWen = io_slowPorts_8_bits_uop_ctrl_rfWen; // @[ReservationStation.scala 183:31]
  assign stdRS_0_io_slowPorts_8_bits_uop_ctrl_fpWen = io_slowPorts_8_bits_uop_ctrl_fpWen; // @[ReservationStation.scala 183:31]
  assign stdRS_0_io_slowPorts_8_bits_uop_pdest = io_slowPorts_8_bits_uop_pdest; // @[ReservationStation.scala 183:31]
  assign stdRS_0_io_slowPorts_8_bits_data = io_slowPorts_8_bits_data; // @[ReservationStation.scala 183:31]
  always @(posedge clock) begin
    if (io_redirect_valid) begin // @[Reg.scala 17:18]
      stdRS_0_io_redirect_next_bits_rrobIdx_flag <= io_redirect_bits_robIdx_flag; // @[Reg.scala 17:22]
    end
    if (io_redirect_valid) begin // @[Reg.scala 17:18]
      stdRS_0_io_redirect_next_bits_rrobIdx_value <= io_redirect_bits_robIdx_value; // @[Reg.scala 17:22]
    end
    if (io_redirect_valid) begin // @[Reg.scala 17:18]
      stdRS_0_io_redirect_next_bits_rlevel <= io_redirect_bits_level; // @[Reg.scala 17:22]
    end
    io_perf_0_value_REG <= stdRS_0_io_perf_0_value; // @[PerfCounterUtils.scala 188:35]
    io_perf_0_value_REG_1 <= io_perf_0_value_REG; // @[PerfCounterUtils.scala 188:27]
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[BitUtils.scala 28:28]
      stdRS_0_io_redirect_next_valid_REG <= 1'h0; // @[BitUtils.scala 28:28]
    end else begin
      stdRS_0_io_redirect_next_valid_REG <= io_redirect_valid; // @[BitUtils.scala 28:28]
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
  stdRS_0_io_redirect_next_valid_REG = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  stdRS_0_io_redirect_next_bits_rrobIdx_flag = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  stdRS_0_io_redirect_next_bits_rrobIdx_value = _RAND_2[4:0];
  _RAND_3 = {1{`RANDOM}};
  stdRS_0_io_redirect_next_bits_rlevel = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  io_perf_0_value_REG = _RAND_4[5:0];
  _RAND_5 = {1{`RANDOM}};
  io_perf_0_value_REG_1 = _RAND_5[5:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    stdRS_0_io_redirect_next_valid_REG = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

