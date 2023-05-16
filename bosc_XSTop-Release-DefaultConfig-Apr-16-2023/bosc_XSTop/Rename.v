module Rename(
  input         clock,
  input         reset,
  input         io_redirect_valid,
  input         io_redirect_bits_robIdx_flag,
  input  [4:0]  io_redirect_bits_robIdx_value,
  input         io_redirect_bits_level,
  input         io_robCommits_isCommit,
  input         io_robCommits_commitValid_0,
  input         io_robCommits_commitValid_1,
  input         io_robCommits_isWalk,
  input         io_robCommits_walkValid_0,
  input         io_robCommits_walkValid_1,
  input  [4:0]  io_robCommits_info_0_ldest,
  input         io_robCommits_info_0_rfWen,
  input         io_robCommits_info_0_fpWen,
  input  [5:0]  io_robCommits_info_0_pdest,
  input  [5:0]  io_robCommits_info_0_old_pdest,
  input         io_robCommits_info_0_isMove,
  input  [4:0]  io_robCommits_info_1_ldest,
  input         io_robCommits_info_1_rfWen,
  input         io_robCommits_info_1_fpWen,
  input  [5:0]  io_robCommits_info_1_pdest,
  input  [5:0]  io_robCommits_info_1_old_pdest,
  input         io_robCommits_info_1_isMove,
  output        io_in_0_ready,
  input         io_in_0_valid,
  input  [9:0]  io_in_0_bits_cf_foldpc,
  input         io_in_0_bits_cf_exceptionVec_1,
  input         io_in_0_bits_cf_exceptionVec_2,
  input         io_in_0_bits_cf_exceptionVec_12,
  input         io_in_0_bits_cf_trigger_frontendHit_0,
  input         io_in_0_bits_cf_trigger_frontendHit_1,
  input         io_in_0_bits_cf_trigger_frontendHit_2,
  input         io_in_0_bits_cf_trigger_frontendHit_3,
  input         io_in_0_bits_cf_trigger_backendEn_0,
  input         io_in_0_bits_cf_trigger_backendEn_1,
  input         io_in_0_bits_cf_pd_isRVC,
  input  [1:0]  io_in_0_bits_cf_pd_brType,
  input         io_in_0_bits_cf_pd_isCall,
  input         io_in_0_bits_cf_pd_isRet,
  input         io_in_0_bits_cf_pred_taken,
  input         io_in_0_bits_cf_crossPageIPFFix,
  input         io_in_0_bits_cf_ftqPtr_flag,
  input  [2:0]  io_in_0_bits_cf_ftqPtr_value,
  input  [2:0]  io_in_0_bits_cf_ftqOffset,
  input  [1:0]  io_in_0_bits_ctrl_srcType_0,
  input  [1:0]  io_in_0_bits_ctrl_srcType_1,
  input  [1:0]  io_in_0_bits_ctrl_srcType_2,
  input  [4:0]  io_in_0_bits_ctrl_lsrc_0,
  input  [4:0]  io_in_0_bits_ctrl_lsrc_1,
  input  [4:0]  io_in_0_bits_ctrl_ldest,
  input  [3:0]  io_in_0_bits_ctrl_fuType,
  input  [6:0]  io_in_0_bits_ctrl_fuOpType,
  input         io_in_0_bits_ctrl_rfWen,
  input         io_in_0_bits_ctrl_fpWen,
  input         io_in_0_bits_ctrl_isXSTrap,
  input         io_in_0_bits_ctrl_noSpecExec,
  input         io_in_0_bits_ctrl_blockBackward,
  input         io_in_0_bits_ctrl_flushPipe,
  input  [3:0]  io_in_0_bits_ctrl_selImm,
  input  [19:0] io_in_0_bits_ctrl_imm,
  input  [2:0]  io_in_0_bits_ctrl_commitType,
  input         io_in_0_bits_ctrl_fpu_isAddSub,
  input         io_in_0_bits_ctrl_fpu_typeTagIn,
  input         io_in_0_bits_ctrl_fpu_typeTagOut,
  input         io_in_0_bits_ctrl_fpu_fromInt,
  input         io_in_0_bits_ctrl_fpu_wflags,
  input         io_in_0_bits_ctrl_fpu_fpWen,
  input  [1:0]  io_in_0_bits_ctrl_fpu_fmaCmd,
  input         io_in_0_bits_ctrl_fpu_div,
  input         io_in_0_bits_ctrl_fpu_sqrt,
  input         io_in_0_bits_ctrl_fpu_fcvt,
  input  [1:0]  io_in_0_bits_ctrl_fpu_typ,
  input  [1:0]  io_in_0_bits_ctrl_fpu_fmt,
  input         io_in_0_bits_ctrl_fpu_ren3,
  input  [2:0]  io_in_0_bits_ctrl_fpu_rm,
  input         io_in_0_bits_ctrl_isMove,
  output        io_in_1_ready,
  input         io_in_1_valid,
  input  [9:0]  io_in_1_bits_cf_foldpc,
  input         io_in_1_bits_cf_exceptionVec_1,
  input         io_in_1_bits_cf_exceptionVec_2,
  input         io_in_1_bits_cf_exceptionVec_12,
  input         io_in_1_bits_cf_trigger_frontendHit_0,
  input         io_in_1_bits_cf_trigger_frontendHit_1,
  input         io_in_1_bits_cf_trigger_frontendHit_2,
  input         io_in_1_bits_cf_trigger_frontendHit_3,
  input         io_in_1_bits_cf_trigger_backendEn_0,
  input         io_in_1_bits_cf_trigger_backendEn_1,
  input         io_in_1_bits_cf_pd_isRVC,
  input  [1:0]  io_in_1_bits_cf_pd_brType,
  input         io_in_1_bits_cf_pd_isCall,
  input         io_in_1_bits_cf_pd_isRet,
  input         io_in_1_bits_cf_pred_taken,
  input         io_in_1_bits_cf_crossPageIPFFix,
  input         io_in_1_bits_cf_ftqPtr_flag,
  input  [2:0]  io_in_1_bits_cf_ftqPtr_value,
  input  [2:0]  io_in_1_bits_cf_ftqOffset,
  input  [1:0]  io_in_1_bits_ctrl_srcType_0,
  input  [1:0]  io_in_1_bits_ctrl_srcType_1,
  input  [1:0]  io_in_1_bits_ctrl_srcType_2,
  input  [4:0]  io_in_1_bits_ctrl_lsrc_0,
  input  [4:0]  io_in_1_bits_ctrl_lsrc_1,
  input  [4:0]  io_in_1_bits_ctrl_lsrc_2,
  input  [4:0]  io_in_1_bits_ctrl_ldest,
  input  [3:0]  io_in_1_bits_ctrl_fuType,
  input  [6:0]  io_in_1_bits_ctrl_fuOpType,
  input         io_in_1_bits_ctrl_rfWen,
  input         io_in_1_bits_ctrl_fpWen,
  input         io_in_1_bits_ctrl_isXSTrap,
  input         io_in_1_bits_ctrl_noSpecExec,
  input         io_in_1_bits_ctrl_blockBackward,
  input         io_in_1_bits_ctrl_flushPipe,
  input  [3:0]  io_in_1_bits_ctrl_selImm,
  input  [19:0] io_in_1_bits_ctrl_imm,
  input         io_in_1_bits_ctrl_fpu_isAddSub,
  input         io_in_1_bits_ctrl_fpu_typeTagIn,
  input         io_in_1_bits_ctrl_fpu_typeTagOut,
  input         io_in_1_bits_ctrl_fpu_fromInt,
  input         io_in_1_bits_ctrl_fpu_wflags,
  input         io_in_1_bits_ctrl_fpu_fpWen,
  input  [1:0]  io_in_1_bits_ctrl_fpu_fmaCmd,
  input         io_in_1_bits_ctrl_fpu_div,
  input         io_in_1_bits_ctrl_fpu_sqrt,
  input         io_in_1_bits_ctrl_fpu_fcvt,
  input  [1:0]  io_in_1_bits_ctrl_fpu_typ,
  input  [1:0]  io_in_1_bits_ctrl_fpu_fmt,
  input         io_in_1_bits_ctrl_fpu_ren3,
  input  [2:0]  io_in_1_bits_ctrl_fpu_rm,
  input         io_in_1_bits_ctrl_isMove,
  input         io_fusionInfo_0_rs2FromRs1,
  input         io_fusionInfo_0_rs2FromRs2,
  input         io_fusionInfo_0_rs2FromZero,
  input         io_ssit_0_valid,
  input  [4:0]  io_ssit_0_ssid,
  input         io_ssit_0_strict,
  input         io_ssit_1_valid,
  input  [4:0]  io_ssit_1_ssid,
  input         io_ssit_1_strict,
  input  [5:0]  io_intReadPorts_0_0,
  input  [5:0]  io_intReadPorts_0_1,
  input  [5:0]  io_intReadPorts_0_2,
  input  [5:0]  io_intReadPorts_1_0,
  input  [5:0]  io_intReadPorts_1_1,
  input  [5:0]  io_intReadPorts_1_2,
  input  [5:0]  io_fpReadPorts_0_0,
  input  [5:0]  io_fpReadPorts_0_1,
  input  [5:0]  io_fpReadPorts_0_2,
  input  [5:0]  io_fpReadPorts_0_3,
  input  [5:0]  io_fpReadPorts_1_0,
  input  [5:0]  io_fpReadPorts_1_1,
  input  [5:0]  io_fpReadPorts_1_2,
  input  [5:0]  io_fpReadPorts_1_3,
  output        io_intRenamePorts_0_wen,
  output [4:0]  io_intRenamePorts_0_addr,
  output [5:0]  io_intRenamePorts_0_data,
  output        io_intRenamePorts_1_wen,
  output [4:0]  io_intRenamePorts_1_addr,
  output [5:0]  io_intRenamePorts_1_data,
  output        io_fpRenamePorts_0_wen,
  output [4:0]  io_fpRenamePorts_0_addr,
  output [5:0]  io_fpRenamePorts_0_data,
  output        io_fpRenamePorts_1_wen,
  output [4:0]  io_fpRenamePorts_1_addr,
  output [5:0]  io_fpRenamePorts_1_data,
  input         io_out_0_ready,
  output        io_out_0_valid,
  output [9:0]  io_out_0_bits_cf_foldpc,
  output        io_out_0_bits_cf_exceptionVec_1,
  output        io_out_0_bits_cf_exceptionVec_2,
  output        io_out_0_bits_cf_exceptionVec_12,
  output        io_out_0_bits_cf_trigger_frontendHit_0,
  output        io_out_0_bits_cf_trigger_frontendHit_1,
  output        io_out_0_bits_cf_trigger_frontendHit_2,
  output        io_out_0_bits_cf_trigger_frontendHit_3,
  output        io_out_0_bits_cf_trigger_backendEn_0,
  output        io_out_0_bits_cf_trigger_backendEn_1,
  output        io_out_0_bits_cf_pd_isRVC,
  output [1:0]  io_out_0_bits_cf_pd_brType,
  output        io_out_0_bits_cf_pd_isCall,
  output        io_out_0_bits_cf_pd_isRet,
  output        io_out_0_bits_cf_pred_taken,
  output        io_out_0_bits_cf_crossPageIPFFix,
  output        io_out_0_bits_cf_storeSetHit,
  output        io_out_0_bits_cf_loadWaitStrict,
  output [4:0]  io_out_0_bits_cf_ssid,
  output        io_out_0_bits_cf_ftqPtr_flag,
  output [2:0]  io_out_0_bits_cf_ftqPtr_value,
  output [2:0]  io_out_0_bits_cf_ftqOffset,
  output [1:0]  io_out_0_bits_ctrl_srcType_0,
  output [1:0]  io_out_0_bits_ctrl_srcType_1,
  output [1:0]  io_out_0_bits_ctrl_srcType_2,
  output [4:0]  io_out_0_bits_ctrl_ldest,
  output [3:0]  io_out_0_bits_ctrl_fuType,
  output [6:0]  io_out_0_bits_ctrl_fuOpType,
  output        io_out_0_bits_ctrl_rfWen,
  output        io_out_0_bits_ctrl_fpWen,
  output        io_out_0_bits_ctrl_isXSTrap,
  output        io_out_0_bits_ctrl_noSpecExec,
  output        io_out_0_bits_ctrl_blockBackward,
  output        io_out_0_bits_ctrl_flushPipe,
  output [3:0]  io_out_0_bits_ctrl_selImm,
  output [19:0] io_out_0_bits_ctrl_imm,
  output [2:0]  io_out_0_bits_ctrl_commitType,
  output        io_out_0_bits_ctrl_fpu_isAddSub,
  output        io_out_0_bits_ctrl_fpu_typeTagIn,
  output        io_out_0_bits_ctrl_fpu_typeTagOut,
  output        io_out_0_bits_ctrl_fpu_fromInt,
  output        io_out_0_bits_ctrl_fpu_wflags,
  output        io_out_0_bits_ctrl_fpu_fpWen,
  output [1:0]  io_out_0_bits_ctrl_fpu_fmaCmd,
  output        io_out_0_bits_ctrl_fpu_div,
  output        io_out_0_bits_ctrl_fpu_sqrt,
  output        io_out_0_bits_ctrl_fpu_fcvt,
  output [1:0]  io_out_0_bits_ctrl_fpu_typ,
  output [1:0]  io_out_0_bits_ctrl_fpu_fmt,
  output        io_out_0_bits_ctrl_fpu_ren3,
  output [2:0]  io_out_0_bits_ctrl_fpu_rm,
  output        io_out_0_bits_ctrl_isMove,
  output [5:0]  io_out_0_bits_psrc_0,
  output [5:0]  io_out_0_bits_psrc_1,
  output [5:0]  io_out_0_bits_psrc_2,
  output [5:0]  io_out_0_bits_pdest,
  output [5:0]  io_out_0_bits_old_pdest,
  output        io_out_0_bits_robIdx_flag,
  output [4:0]  io_out_0_bits_robIdx_value,
  output        io_out_0_bits_eliminatedMove,
  output        io_out_1_valid,
  output [9:0]  io_out_1_bits_cf_foldpc,
  output        io_out_1_bits_cf_exceptionVec_1,
  output        io_out_1_bits_cf_exceptionVec_2,
  output        io_out_1_bits_cf_exceptionVec_12,
  output        io_out_1_bits_cf_trigger_frontendHit_0,
  output        io_out_1_bits_cf_trigger_frontendHit_1,
  output        io_out_1_bits_cf_trigger_frontendHit_2,
  output        io_out_1_bits_cf_trigger_frontendHit_3,
  output        io_out_1_bits_cf_trigger_backendEn_0,
  output        io_out_1_bits_cf_trigger_backendEn_1,
  output        io_out_1_bits_cf_pd_isRVC,
  output [1:0]  io_out_1_bits_cf_pd_brType,
  output        io_out_1_bits_cf_pd_isCall,
  output        io_out_1_bits_cf_pd_isRet,
  output        io_out_1_bits_cf_pred_taken,
  output        io_out_1_bits_cf_crossPageIPFFix,
  output        io_out_1_bits_cf_storeSetHit,
  output        io_out_1_bits_cf_loadWaitStrict,
  output [4:0]  io_out_1_bits_cf_ssid,
  output        io_out_1_bits_cf_ftqPtr_flag,
  output [2:0]  io_out_1_bits_cf_ftqPtr_value,
  output [2:0]  io_out_1_bits_cf_ftqOffset,
  output [1:0]  io_out_1_bits_ctrl_srcType_0,
  output [1:0]  io_out_1_bits_ctrl_srcType_1,
  output [1:0]  io_out_1_bits_ctrl_srcType_2,
  output [4:0]  io_out_1_bits_ctrl_ldest,
  output [3:0]  io_out_1_bits_ctrl_fuType,
  output [6:0]  io_out_1_bits_ctrl_fuOpType,
  output        io_out_1_bits_ctrl_rfWen,
  output        io_out_1_bits_ctrl_fpWen,
  output        io_out_1_bits_ctrl_isXSTrap,
  output        io_out_1_bits_ctrl_noSpecExec,
  output        io_out_1_bits_ctrl_blockBackward,
  output        io_out_1_bits_ctrl_flushPipe,
  output [3:0]  io_out_1_bits_ctrl_selImm,
  output [19:0] io_out_1_bits_ctrl_imm,
  output        io_out_1_bits_ctrl_fpu_isAddSub,
  output        io_out_1_bits_ctrl_fpu_typeTagIn,
  output        io_out_1_bits_ctrl_fpu_typeTagOut,
  output        io_out_1_bits_ctrl_fpu_fromInt,
  output        io_out_1_bits_ctrl_fpu_wflags,
  output        io_out_1_bits_ctrl_fpu_fpWen,
  output [1:0]  io_out_1_bits_ctrl_fpu_fmaCmd,
  output        io_out_1_bits_ctrl_fpu_div,
  output        io_out_1_bits_ctrl_fpu_sqrt,
  output        io_out_1_bits_ctrl_fpu_fcvt,
  output [1:0]  io_out_1_bits_ctrl_fpu_typ,
  output [1:0]  io_out_1_bits_ctrl_fpu_fmt,
  output        io_out_1_bits_ctrl_fpu_ren3,
  output [2:0]  io_out_1_bits_ctrl_fpu_rm,
  output        io_out_1_bits_ctrl_isMove,
  output [5:0]  io_out_1_bits_psrc_0,
  output [5:0]  io_out_1_bits_psrc_1,
  output [5:0]  io_out_1_bits_psrc_2,
  output [5:0]  io_out_1_bits_pdest,
  output [5:0]  io_out_1_bits_old_pdest,
  output        io_out_1_bits_robIdx_flag,
  output [4:0]  io_out_1_bits_robIdx_value,
  output        io_out_1_bits_eliminatedMove,
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
  output [5:0]  io_perf_13_value
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
`endif // RANDOMIZE_REG_INIT
  wire  intFreeList_clock; // @[Rename.scala 54:27]
  wire  intFreeList_reset; // @[Rename.scala 54:27]
  wire  intFreeList_io_redirect; // @[Rename.scala 54:27]
  wire  intFreeList_io_walk; // @[Rename.scala 54:27]
  wire  intFreeList_io_allocateReq_0; // @[Rename.scala 54:27]
  wire  intFreeList_io_allocateReq_1; // @[Rename.scala 54:27]
  wire [5:0] intFreeList_io_allocatePhyReg_0; // @[Rename.scala 54:27]
  wire [5:0] intFreeList_io_allocatePhyReg_1; // @[Rename.scala 54:27]
  wire  intFreeList_io_canAllocate; // @[Rename.scala 54:27]
  wire  intFreeList_io_doAllocate; // @[Rename.scala 54:27]
  wire  intFreeList_io_freeReq_0; // @[Rename.scala 54:27]
  wire  intFreeList_io_freeReq_1; // @[Rename.scala 54:27]
  wire [5:0] intFreeList_io_freePhyReg_0; // @[Rename.scala 54:27]
  wire [5:0] intFreeList_io_freePhyReg_1; // @[Rename.scala 54:27]
  wire  intFreeList_io_commit_isCommit; // @[Rename.scala 54:27]
  wire  intFreeList_io_commit_commitValid_0; // @[Rename.scala 54:27]
  wire  intFreeList_io_commit_commitValid_1; // @[Rename.scala 54:27]
  wire [4:0] intFreeList_io_commit_info_0_ldest; // @[Rename.scala 54:27]
  wire  intFreeList_io_commit_info_0_rfWen; // @[Rename.scala 54:27]
  wire  intFreeList_io_commit_info_0_isMove; // @[Rename.scala 54:27]
  wire [4:0] intFreeList_io_commit_info_1_ldest; // @[Rename.scala 54:27]
  wire  intFreeList_io_commit_info_1_rfWen; // @[Rename.scala 54:27]
  wire  intFreeList_io_commit_info_1_isMove; // @[Rename.scala 54:27]
  wire [5:0] intFreeList_io_perf_0_value; // @[Rename.scala 54:27]
  wire [5:0] intFreeList_io_perf_1_value; // @[Rename.scala 54:27]
  wire [5:0] intFreeList_io_perf_2_value; // @[Rename.scala 54:27]
  wire [5:0] intFreeList_io_perf_3_value; // @[Rename.scala 54:27]
  wire  intRefCounter_clock; // @[Rename.scala 55:29]
  wire  intRefCounter_reset; // @[Rename.scala 55:29]
  wire  intRefCounter_io_allocate_0_valid; // @[Rename.scala 55:29]
  wire [5:0] intRefCounter_io_allocate_0_bits; // @[Rename.scala 55:29]
  wire  intRefCounter_io_allocate_1_valid; // @[Rename.scala 55:29]
  wire [5:0] intRefCounter_io_allocate_1_bits; // @[Rename.scala 55:29]
  wire  intRefCounter_io_deallocate_0_valid; // @[Rename.scala 55:29]
  wire [5:0] intRefCounter_io_deallocate_0_bits; // @[Rename.scala 55:29]
  wire  intRefCounter_io_deallocate_1_valid; // @[Rename.scala 55:29]
  wire [5:0] intRefCounter_io_deallocate_1_bits; // @[Rename.scala 55:29]
  wire  intRefCounter_io_freeRegs_0_valid; // @[Rename.scala 55:29]
  wire [5:0] intRefCounter_io_freeRegs_0_bits; // @[Rename.scala 55:29]
  wire  intRefCounter_io_freeRegs_1_valid; // @[Rename.scala 55:29]
  wire [5:0] intRefCounter_io_freeRegs_1_bits; // @[Rename.scala 55:29]
  wire  intRefCounter_io_commit_isCommit; // @[Rename.scala 55:29]
  wire  intRefCounter_io_commit_commitValid_0; // @[Rename.scala 55:29]
  wire  intRefCounter_io_commit_commitValid_1; // @[Rename.scala 55:29]
  wire  intRefCounter_io_commit_info_0_rfWen; // @[Rename.scala 55:29]
  wire [5:0] intRefCounter_io_commit_info_0_pdest; // @[Rename.scala 55:29]
  wire [5:0] intRefCounter_io_commit_info_0_old_pdest; // @[Rename.scala 55:29]
  wire  intRefCounter_io_commit_info_1_rfWen; // @[Rename.scala 55:29]
  wire [5:0] intRefCounter_io_commit_info_1_pdest; // @[Rename.scala 55:29]
  wire [5:0] intRefCounter_io_commit_info_1_old_pdest; // @[Rename.scala 55:29]
  wire  intRefCounter_io_redirect; // @[Rename.scala 55:29]
  wire  fpFreeList_clock; // @[Rename.scala 56:26]
  wire  fpFreeList_reset; // @[Rename.scala 56:26]
  wire  fpFreeList_io_redirect; // @[Rename.scala 56:26]
  wire  fpFreeList_io_walk; // @[Rename.scala 56:26]
  wire  fpFreeList_io_allocateReq_0; // @[Rename.scala 56:26]
  wire  fpFreeList_io_allocateReq_1; // @[Rename.scala 56:26]
  wire [5:0] fpFreeList_io_allocatePhyReg_0; // @[Rename.scala 56:26]
  wire [5:0] fpFreeList_io_allocatePhyReg_1; // @[Rename.scala 56:26]
  wire  fpFreeList_io_canAllocate; // @[Rename.scala 56:26]
  wire  fpFreeList_io_doAllocate; // @[Rename.scala 56:26]
  wire  fpFreeList_io_freeReq_0; // @[Rename.scala 56:26]
  wire  fpFreeList_io_freeReq_1; // @[Rename.scala 56:26]
  wire [5:0] fpFreeList_io_freePhyReg_0; // @[Rename.scala 56:26]
  wire [5:0] fpFreeList_io_freePhyReg_1; // @[Rename.scala 56:26]
  wire  fpFreeList_io_commit_isCommit; // @[Rename.scala 56:26]
  wire  fpFreeList_io_commit_commitValid_0; // @[Rename.scala 56:26]
  wire  fpFreeList_io_commit_commitValid_1; // @[Rename.scala 56:26]
  wire  fpFreeList_io_commit_info_0_fpWen; // @[Rename.scala 56:26]
  wire  fpFreeList_io_commit_info_1_fpWen; // @[Rename.scala 56:26]
  wire [5:0] fpFreeList_io_perf_0_value; // @[Rename.scala 56:26]
  wire [5:0] fpFreeList_io_perf_1_value; // @[Rename.scala 56:26]
  wire [5:0] fpFreeList_io_perf_2_value; // @[Rename.scala 56:26]
  wire [5:0] fpFreeList_io_perf_3_value; // @[Rename.scala 56:26]
  wire  _canOut_T_2 = ~io_robCommits_isWalk; // @[Rename.scala 88:94]
  wire  canOut = io_out_0_ready & fpFreeList_io_canAllocate & intFreeList_io_canAllocate & ~io_robCommits_isWalk; // @[Rename.scala 88:91]
  wire [1:0] validCount = io_in_0_valid + io_in_1_valid; // @[Bitwise.scala 48:55]
  reg  robIdxHead_flag; // @[Rename.scala 93:27]
  reg [4:0] robIdxHead_value; // @[Rename.scala 93:27]
  reg  lastCycleMisprediction; // @[Rename.scala 94:39]
  wire [5:0] _robIdxHeadNext_new_ptr_T = {robIdxHead_flag,robIdxHead_value}; // @[Cat.scala 31:58]
  wire [5:0] _robIdxHeadNext_new_ptr_T_2 = _robIdxHeadNext_new_ptr_T + 6'h1; // @[CircularQueuePtr.scala 39:46]
  wire [4:0] robIdxHeadNext_new_ptr_value = _robIdxHeadNext_new_ptr_T_2[4:0]; // @[CircularQueuePtr.scala 39:59]
  wire  robIdxHeadNext_new_ptr_flag = _robIdxHeadNext_new_ptr_T_2[5]; // @[CircularQueuePtr.scala 39:59]
  wire [5:0] _GEN_16 = {{4'd0}, validCount}; // @[CircularQueuePtr.scala 39:46]
  wire [5:0] _robIdxHeadNext_new_ptr_T_7 = _robIdxHeadNext_new_ptr_T + _GEN_16; // @[CircularQueuePtr.scala 39:46]
  wire [4:0] robIdxHeadNext_new_ptr_1_value = _robIdxHeadNext_new_ptr_T_7[4:0]; // @[CircularQueuePtr.scala 39:59]
  wire  robIdxHeadNext_new_ptr_1_flag = _robIdxHeadNext_new_ptr_T_7[5]; // @[CircularQueuePtr.scala 39:59]
  wire [1:0] _hasValid_T = {io_in_0_valid,io_in_1_valid}; // @[Cat.scala 31:58]
  wire  hasValid = |_hasValid_T; // @[Rename.scala 119:42]
  wire  needFpDest_0 = io_in_0_valid & io_in_0_bits_ctrl_fpWen; // @[Rename.scala 148:37]
  wire  _needIntDest_0_T_1 = io_in_0_bits_ctrl_rfWen & io_in_0_bits_ctrl_ldest != 5'h0; // @[Rename.scala 68:44]
  wire  needIntDest_0 = io_in_0_valid & _needIntDest_0_T_1; // @[Rename.scala 149:38]
  wire  walkNeedFpDest_0 = io_robCommits_walkValid_0 & io_robCommits_info_0_fpWen; // @[Rename.scala 151:55]
  wire  _walkNeedIntDest_0_T_1 = io_robCommits_info_0_rfWen & io_robCommits_info_0_ldest != 5'h0; // @[Rename.scala 74:33]
  wire  walkNeedIntDest_0 = io_robCommits_walkValid_0 & _walkNeedIntDest_0_T_1; // @[Rename.scala 152:56]
  wire [6:0] _uops_0_robIdx_new_ptr_T_1 = {{1'd0}, _robIdxHeadNext_new_ptr_T}; // @[CircularQueuePtr.scala 39:46]
  wire [5:0] uops_0_psrc_0 = io_in_0_bits_ctrl_srcType_0 == 2'h0 ? io_intReadPorts_0_0 : io_fpReadPorts_0_0; // @[Rename.scala 163:27]
  wire [5:0] _uops_0_psrc_1_T_1 = io_in_0_bits_ctrl_srcType_1 == 2'h0 ? io_intReadPorts_0_1 : io_fpReadPorts_0_1; // @[Rename.scala 164:27]
  wire [5:0] _uops_0_psrc_1_T_2 = io_fusionInfo_0_rs2FromRs2 ? io_intReadPorts_1_1 : io_intReadPorts_1_0; // @[Rename.scala 168:31]
  wire [5:0] _GEN_0 = io_fusionInfo_0_rs2FromZero ? 6'h0 : _uops_0_psrc_1_T_1; // @[Rename.scala 164:21 169:48 170:25]
  wire [5:0] _uops_0_pdest_T = needFpDest_0 ? fpFreeList_io_allocatePhyReg_0 : 6'h0; // @[Rename.scala 180:10]
  wire [5:0] uops_0_pdest = needIntDest_0 ? intFreeList_io_allocatePhyReg_0 : _uops_0_pdest_T; // @[Rename.scala 178:25]
  wire [9:0] _io_out_0_bits_ctrl_imm_T = {io_in_0_bits_ctrl_lsrc_1,io_in_0_bits_ctrl_lsrc_0}; // @[Cat.scala 31:58]
  wire [19:0] _GEN_2 = io_out_0_bits_ctrl_fuType == 4'h3 ? {{10'd0}, _io_out_0_bits_ctrl_imm_T} : io_in_0_bits_ctrl_imm; // @[Rename.scala 187:20 189:56 190:31]
  wire  _T_8 = io_in_0_bits_ctrl_fuType == 4'h6 & io_in_0_bits_ctrl_fuOpType == 7'h42 & io_in_0_bits_ctrl_selImm == 4'h4
     & io_in_0_bits_ctrl_ldest == 5'h0; // @[Bundle.scala 194:83]
  wire [3:0] _io_out_0_bits_ctrl_fuOpType_T_1 = io_in_0_bits_ctrl_lsrc_1 == 5'h1 ? 4'h9 : 4'ha; // @[Rename.scala 195:42]
  wire [19:0] _io_out_0_bits_ctrl_imm_T_2 = {io_in_0_bits_ctrl_imm[19:5],5'h0}; // @[Cat.scala 31:58]
  wire  _intSpecWen_0_T_4 = ~io_redirect_valid; // @[Rename.scala 202:124]
  wire  intSpecWen_0 = needIntDest_0 & intFreeList_io_canAllocate & intFreeList_io_doAllocate & _canOut_T_2 & ~
    io_redirect_valid; // @[Rename.scala 202:121]
  wire  walkIntSpecWen_0 = walkNeedIntDest_0 & _intSpecWen_0_T_4; // @[Rename.scala 206:47]
  wire  needFpDest_1 = io_in_1_valid & io_in_1_bits_ctrl_fpWen; // @[Rename.scala 148:37]
  wire  _needIntDest_1_T_1 = io_in_1_bits_ctrl_rfWen & io_in_1_bits_ctrl_ldest != 5'h0; // @[Rename.scala 68:44]
  wire  needIntDest_1 = io_in_1_valid & _needIntDest_1_T_1; // @[Rename.scala 149:38]
  wire  walkNeedFpDest_1 = io_robCommits_walkValid_1 & io_robCommits_info_1_fpWen; // @[Rename.scala 151:55]
  wire  _walkNeedIntDest_1_T_1 = io_robCommits_info_1_rfWen & io_robCommits_info_1_ldest != 5'h0; // @[Rename.scala 74:33]
  wire  walkNeedIntDest_1 = io_robCommits_walkValid_1 & _walkNeedIntDest_1_T_1; // @[Rename.scala 152:56]
  wire [5:0] _GEN_17 = {{5'd0}, io_in_0_valid}; // @[CircularQueuePtr.scala 39:46]
  wire [5:0] _uops_1_robIdx_new_ptr_T_2 = _robIdxHeadNext_new_ptr_T + _GEN_17; // @[CircularQueuePtr.scala 39:46]
  wire  _uops_1_psrc_0_T = io_in_1_bits_ctrl_srcType_0 == 2'h0; // @[Rename.scala 163:52]
  wire [5:0] uops_1_psrc_0 = io_in_1_bits_ctrl_srcType_0 == 2'h0 ? io_intReadPorts_1_0 : io_fpReadPorts_1_0; // @[Rename.scala 163:27]
  wire  _uops_1_psrc_1_T = io_in_1_bits_ctrl_srcType_1 == 2'h0; // @[Rename.scala 164:52]
  wire [5:0] uops_1_psrc_1 = io_in_1_bits_ctrl_srcType_1 == 2'h0 ? io_intReadPorts_1_1 : io_fpReadPorts_1_1; // @[Rename.scala 164:27]
  wire [5:0] uops_1_old_pdest = io_in_1_bits_ctrl_rfWen ? io_intReadPorts_1_2 : io_fpReadPorts_1_3; // @[Rename.scala 174:29]
  wire [5:0] _uops_1_pdest_T = needFpDest_1 ? fpFreeList_io_allocatePhyReg_1 : 6'h0; // @[Rename.scala 180:10]
  wire [5:0] uops_1_pdest = needIntDest_1 ? intFreeList_io_allocatePhyReg_1 : _uops_1_pdest_T; // @[Rename.scala 178:25]
  wire [9:0] _io_out_1_bits_ctrl_imm_T = {io_in_1_bits_ctrl_lsrc_1,io_in_1_bits_ctrl_lsrc_0}; // @[Cat.scala 31:58]
  wire [19:0] _GEN_7 = io_out_1_bits_ctrl_fuType == 4'h3 ? {{10'd0}, _io_out_1_bits_ctrl_imm_T} : io_in_1_bits_ctrl_imm; // @[Rename.scala 187:20 189:56 190:31]
  wire  _T_16 = io_in_1_bits_ctrl_fuType == 4'h6 & io_in_1_bits_ctrl_fuOpType == 7'h42 & io_in_1_bits_ctrl_selImm == 4'h4
     & io_in_1_bits_ctrl_ldest == 5'h0; // @[Bundle.scala 194:83]
  wire [3:0] _io_out_1_bits_ctrl_fuOpType_T_1 = io_in_1_bits_ctrl_lsrc_1 == 5'h1 ? 4'h9 : 4'ha; // @[Rename.scala 195:42]
  wire [19:0] _io_out_1_bits_ctrl_imm_T_2 = {io_in_1_bits_ctrl_imm[19:5],5'h0}; // @[Cat.scala 31:58]
  wire [19:0] _GEN_11 = _T_16 ? _io_out_1_bits_ctrl_imm_T_2 : _GEN_7; // @[Rename.scala 193:46 197:31]
  wire  intSpecWen_1 = needIntDest_1 & intFreeList_io_canAllocate & intFreeList_io_doAllocate & _canOut_T_2 & ~
    io_redirect_valid; // @[Rename.scala 202:121]
  wire  walkIntSpecWen_1 = walkNeedIntDest_1 & _intSpecWen_0_T_4; // @[Rename.scala 206:47]
  wire  fpCond_0 = io_in_1_bits_ctrl_srcType_0 == 2'h2; // @[Rename.scala 240:51]
  wire  fpCond_1 = io_in_1_bits_ctrl_srcType_1 == 2'h2; // @[Rename.scala 240:51]
  wire  fpCond_2 = io_in_1_bits_ctrl_srcType_2 == 2'h2; // @[Rename.scala 240:51]
  wire  intCond_2 = io_in_1_bits_ctrl_srcType_2 == 2'h0; // @[Rename.scala 241:52]
  wire  destToSrc_indexMatch = io_in_0_bits_ctrl_ldest == io_in_1_bits_ctrl_lsrc_0; // @[Rename.scala 245:45]
  wire  destToSrc_writeMatch = _uops_1_psrc_0_T & needIntDest_0 | fpCond_0 & needFpDest_0; // @[Rename.scala 246:51]
  wire  destToSrc_0 = destToSrc_indexMatch & destToSrc_writeMatch; // @[Rename.scala 247:20]
  wire  destToSrc_indexMatch_1 = io_in_0_bits_ctrl_ldest == io_in_1_bits_ctrl_lsrc_1; // @[Rename.scala 245:45]
  wire  destToSrc_writeMatch_1 = _uops_1_psrc_1_T & needIntDest_0 | fpCond_1 & needFpDest_0; // @[Rename.scala 246:51]
  wire  destToSrc_0_1 = destToSrc_indexMatch_1 & destToSrc_writeMatch_1; // @[Rename.scala 247:20]
  wire  destToSrc_indexMatch_2 = io_in_0_bits_ctrl_ldest == io_in_1_bits_ctrl_lsrc_2; // @[Rename.scala 245:45]
  wire  destToSrc_writeMatch_2 = intCond_2 & needIntDest_0 | fpCond_2 & needFpDest_0; // @[Rename.scala 246:51]
  wire  destToSrc_0_2 = destToSrc_indexMatch_2 & destToSrc_writeMatch_2; // @[Rename.scala 247:20]
  wire  destToSrc_indexMatch_3 = io_in_0_bits_ctrl_ldest == io_in_1_bits_ctrl_ldest; // @[Rename.scala 245:45]
  wire  destToSrc_writeMatch_3 = needIntDest_1 & needIntDest_0 | needFpDest_1 & needFpDest_0; // @[Rename.scala 246:51]
  wire  destToSrc_0_3 = destToSrc_indexMatch_3 & destToSrc_writeMatch_3; // @[Rename.scala 247:20]
  wire [5:0] _io_out_1_bits_psrc_0_T_1 = destToSrc_0 ? io_out_0_bits_pdest : uops_1_psrc_0; // @[Rename.scala 252:23]
  wire [5:0] _io_out_1_bits_psrc_1_T_1 = destToSrc_0_1 ? io_out_0_bits_pdest : uops_1_psrc_1; // @[Rename.scala 255:23]
  wire  last_is_lui = io_in_0_bits_ctrl_selImm == 4'h2 & io_in_0_bits_ctrl_srcType_0 != 2'h1; // @[Rename.scala 266:70]
  wire  this_is_load = io_in_1_bits_ctrl_fuType == 4'hc; // @[Rename.scala 267:50]
  wire  lui_to_load = io_in_0_valid & destToSrc_indexMatch; // @[Rename.scala 268:42]
  wire  fused_lui_load = last_is_lui & this_is_load & lui_to_load; // @[Rename.scala 269:54]
  wire [11:0] io_out_1_bits_ctrl_imm_loadImm = io_in_1_bits_ctrl_imm[11:0]; // @[DecodeUnit.scala 551:27]
  wire [19:0] _io_out_1_bits_ctrl_imm_T_4 = {io_in_0_bits_ctrl_imm[7:0],io_out_1_bits_ctrl_imm_loadImm}; // @[Cat.scala 31:58]
  wire  commitValid = io_robCommits_isCommit & io_robCommits_commitValid_0; // @[Rename.scala 290:46]
  wire  commitValid_1 = io_robCommits_isCommit & io_robCommits_commitValid_1; // @[Rename.scala 290:46]
  wire  _T_33 = io_in_0_valid & ~io_in_0_ready; // @[Rename.scala 368:88]
  wire  _T_35 = io_in_1_valid & ~io_in_1_ready; // @[Rename.scala 368:88]
  wire  _T_41 = hasValid & ~io_out_0_ready & fpFreeList_io_canAllocate & intFreeList_io_canAllocate; // @[Rename.scala 369:102]
  wire  _T_44 = hasValid & io_out_0_ready; // @[Rename.scala 370:47]
  wire  _T_47 = hasValid & io_out_0_ready & ~fpFreeList_io_canAllocate & intFreeList_io_canAllocate; // @[Rename.scala 370:96]
  wire  _T_51 = _T_44 & fpFreeList_io_canAllocate; // @[Rename.scala 371:67]
  wire  _T_53 = _T_44 & fpFreeList_io_canAllocate & ~intFreeList_io_canAllocate; // @[Rename.scala 371:96]
  wire  _T_58 = _T_51 & intFreeList_io_canAllocate; // @[Rename.scala 372:97]
  wire  _T_78 = io_in_0_valid & io_in_0_ready; // @[Rename.scala 381:64]
  wire  _T_79 = io_in_1_valid & io_in_0_ready; // @[Rename.scala 381:64]
  reg [1:0] io_perf_0_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg [1:0] io_perf_0_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg [1:0] io_perf_1_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg [1:0] io_perf_1_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg  io_perf_2_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg  io_perf_2_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg  io_perf_3_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg  io_perf_3_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg  io_perf_4_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg  io_perf_4_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg  io_perf_5_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg  io_perf_5_value_REG_1; // @[PerfCounterUtils.scala 188:27]
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
  MEFreeList intFreeList ( // @[Rename.scala 54:27]
    .clock(intFreeList_clock),
    .reset(intFreeList_reset),
    .io_redirect(intFreeList_io_redirect),
    .io_walk(intFreeList_io_walk),
    .io_allocateReq_0(intFreeList_io_allocateReq_0),
    .io_allocateReq_1(intFreeList_io_allocateReq_1),
    .io_allocatePhyReg_0(intFreeList_io_allocatePhyReg_0),
    .io_allocatePhyReg_1(intFreeList_io_allocatePhyReg_1),
    .io_canAllocate(intFreeList_io_canAllocate),
    .io_doAllocate(intFreeList_io_doAllocate),
    .io_freeReq_0(intFreeList_io_freeReq_0),
    .io_freeReq_1(intFreeList_io_freeReq_1),
    .io_freePhyReg_0(intFreeList_io_freePhyReg_0),
    .io_freePhyReg_1(intFreeList_io_freePhyReg_1),
    .io_commit_isCommit(intFreeList_io_commit_isCommit),
    .io_commit_commitValid_0(intFreeList_io_commit_commitValid_0),
    .io_commit_commitValid_1(intFreeList_io_commit_commitValid_1),
    .io_commit_info_0_ldest(intFreeList_io_commit_info_0_ldest),
    .io_commit_info_0_rfWen(intFreeList_io_commit_info_0_rfWen),
    .io_commit_info_0_isMove(intFreeList_io_commit_info_0_isMove),
    .io_commit_info_1_ldest(intFreeList_io_commit_info_1_ldest),
    .io_commit_info_1_rfWen(intFreeList_io_commit_info_1_rfWen),
    .io_commit_info_1_isMove(intFreeList_io_commit_info_1_isMove),
    .io_perf_0_value(intFreeList_io_perf_0_value),
    .io_perf_1_value(intFreeList_io_perf_1_value),
    .io_perf_2_value(intFreeList_io_perf_2_value),
    .io_perf_3_value(intFreeList_io_perf_3_value)
  );
  RefCounter intRefCounter ( // @[Rename.scala 55:29]
    .clock(intRefCounter_clock),
    .reset(intRefCounter_reset),
    .io_allocate_0_valid(intRefCounter_io_allocate_0_valid),
    .io_allocate_0_bits(intRefCounter_io_allocate_0_bits),
    .io_allocate_1_valid(intRefCounter_io_allocate_1_valid),
    .io_allocate_1_bits(intRefCounter_io_allocate_1_bits),
    .io_deallocate_0_valid(intRefCounter_io_deallocate_0_valid),
    .io_deallocate_0_bits(intRefCounter_io_deallocate_0_bits),
    .io_deallocate_1_valid(intRefCounter_io_deallocate_1_valid),
    .io_deallocate_1_bits(intRefCounter_io_deallocate_1_bits),
    .io_freeRegs_0_valid(intRefCounter_io_freeRegs_0_valid),
    .io_freeRegs_0_bits(intRefCounter_io_freeRegs_0_bits),
    .io_freeRegs_1_valid(intRefCounter_io_freeRegs_1_valid),
    .io_freeRegs_1_bits(intRefCounter_io_freeRegs_1_bits),
    .io_commit_isCommit(intRefCounter_io_commit_isCommit),
    .io_commit_commitValid_0(intRefCounter_io_commit_commitValid_0),
    .io_commit_commitValid_1(intRefCounter_io_commit_commitValid_1),
    .io_commit_info_0_rfWen(intRefCounter_io_commit_info_0_rfWen),
    .io_commit_info_0_pdest(intRefCounter_io_commit_info_0_pdest),
    .io_commit_info_0_old_pdest(intRefCounter_io_commit_info_0_old_pdest),
    .io_commit_info_1_rfWen(intRefCounter_io_commit_info_1_rfWen),
    .io_commit_info_1_pdest(intRefCounter_io_commit_info_1_pdest),
    .io_commit_info_1_old_pdest(intRefCounter_io_commit_info_1_old_pdest),
    .io_redirect(intRefCounter_io_redirect)
  );
  StdFreeList fpFreeList ( // @[Rename.scala 56:26]
    .clock(fpFreeList_clock),
    .reset(fpFreeList_reset),
    .io_redirect(fpFreeList_io_redirect),
    .io_walk(fpFreeList_io_walk),
    .io_allocateReq_0(fpFreeList_io_allocateReq_0),
    .io_allocateReq_1(fpFreeList_io_allocateReq_1),
    .io_allocatePhyReg_0(fpFreeList_io_allocatePhyReg_0),
    .io_allocatePhyReg_1(fpFreeList_io_allocatePhyReg_1),
    .io_canAllocate(fpFreeList_io_canAllocate),
    .io_doAllocate(fpFreeList_io_doAllocate),
    .io_freeReq_0(fpFreeList_io_freeReq_0),
    .io_freeReq_1(fpFreeList_io_freeReq_1),
    .io_freePhyReg_0(fpFreeList_io_freePhyReg_0),
    .io_freePhyReg_1(fpFreeList_io_freePhyReg_1),
    .io_commit_isCommit(fpFreeList_io_commit_isCommit),
    .io_commit_commitValid_0(fpFreeList_io_commit_commitValid_0),
    .io_commit_commitValid_1(fpFreeList_io_commit_commitValid_1),
    .io_commit_info_0_fpWen(fpFreeList_io_commit_info_0_fpWen),
    .io_commit_info_1_fpWen(fpFreeList_io_commit_info_1_fpWen),
    .io_perf_0_value(fpFreeList_io_perf_0_value),
    .io_perf_1_value(fpFreeList_io_perf_1_value),
    .io_perf_2_value(fpFreeList_io_perf_2_value),
    .io_perf_3_value(fpFreeList_io_perf_3_value)
  );
  assign io_in_0_ready = ~hasValid | canOut; // @[Rename.scala 159:33]
  assign io_in_1_ready = ~hasValid | canOut; // @[Rename.scala 159:33]
  assign io_intRenamePorts_0_wen = needIntDest_0 & intFreeList_io_canAllocate & intFreeList_io_doAllocate & _canOut_T_2
     & ~io_redirect_valid; // @[Rename.scala 202:121]
  assign io_intRenamePorts_0_addr = io_in_0_bits_ctrl_ldest; // @[Rename.scala 104:18 137:18]
  assign io_intRenamePorts_0_data = io_out_0_bits_pdest; // @[Rename.scala 307:21]
  assign io_intRenamePorts_1_wen = needIntDest_1 & intFreeList_io_canAllocate & intFreeList_io_doAllocate & _canOut_T_2
     & ~io_redirect_valid; // @[Rename.scala 202:121]
  assign io_intRenamePorts_1_addr = io_in_1_bits_ctrl_ldest; // @[Rename.scala 104:18 137:18]
  assign io_intRenamePorts_1_data = io_out_1_bits_pdest; // @[Rename.scala 307:21]
  assign io_fpRenamePorts_0_wen = needFpDest_0 & fpFreeList_io_canAllocate & fpFreeList_io_doAllocate & _canOut_T_2 &
    _intSpecWen_0_T_4; // @[Rename.scala 203:117]
  assign io_fpRenamePorts_0_addr = io_in_0_bits_ctrl_ldest; // @[Rename.scala 104:18 137:18]
  assign io_fpRenamePorts_0_data = fpFreeList_io_allocatePhyReg_0; // @[Rename.scala 303:21]
  assign io_fpRenamePorts_1_wen = needFpDest_1 & fpFreeList_io_canAllocate & fpFreeList_io_doAllocate & _canOut_T_2 &
    _intSpecWen_0_T_4; // @[Rename.scala 203:117]
  assign io_fpRenamePorts_1_addr = io_in_1_bits_ctrl_ldest; // @[Rename.scala 104:18 137:18]
  assign io_fpRenamePorts_1_data = fpFreeList_io_allocatePhyReg_1; // @[Rename.scala 303:21]
  assign io_out_0_valid = io_in_0_valid & intFreeList_io_canAllocate & fpFreeList_io_canAllocate & _canOut_T_2; // @[Rename.scala 186:98]
  assign io_out_0_bits_cf_foldpc = io_in_0_bits_cf_foldpc; // @[Rename.scala 104:18 136:16]
  assign io_out_0_bits_cf_exceptionVec_1 = io_in_0_bits_cf_exceptionVec_1; // @[Rename.scala 104:18 136:16]
  assign io_out_0_bits_cf_exceptionVec_2 = io_in_0_bits_cf_exceptionVec_2; // @[Rename.scala 104:18 136:16]
  assign io_out_0_bits_cf_exceptionVec_12 = io_in_0_bits_cf_exceptionVec_12; // @[Rename.scala 104:18 136:16]
  assign io_out_0_bits_cf_trigger_frontendHit_0 = io_in_0_bits_cf_trigger_frontendHit_0; // @[Rename.scala 104:18 136:16]
  assign io_out_0_bits_cf_trigger_frontendHit_1 = io_in_0_bits_cf_trigger_frontendHit_1; // @[Rename.scala 104:18 136:16]
  assign io_out_0_bits_cf_trigger_frontendHit_2 = io_in_0_bits_cf_trigger_frontendHit_2; // @[Rename.scala 104:18 136:16]
  assign io_out_0_bits_cf_trigger_frontendHit_3 = io_in_0_bits_cf_trigger_frontendHit_3; // @[Rename.scala 104:18 136:16]
  assign io_out_0_bits_cf_trigger_backendEn_0 = io_in_0_bits_cf_trigger_backendEn_0; // @[Rename.scala 104:18 136:16]
  assign io_out_0_bits_cf_trigger_backendEn_1 = io_in_0_bits_cf_trigger_backendEn_1; // @[Rename.scala 104:18 136:16]
  assign io_out_0_bits_cf_pd_isRVC = io_in_0_bits_cf_pd_isRVC; // @[Rename.scala 104:18 136:16]
  assign io_out_0_bits_cf_pd_brType = io_in_0_bits_cf_pd_brType; // @[Rename.scala 104:18 136:16]
  assign io_out_0_bits_cf_pd_isCall = io_in_0_bits_cf_pd_isCall; // @[Rename.scala 104:18 136:16]
  assign io_out_0_bits_cf_pd_isRet = io_in_0_bits_cf_pd_isRet; // @[Rename.scala 104:18 136:16]
  assign io_out_0_bits_cf_pred_taken = io_in_0_bits_cf_pred_taken; // @[Rename.scala 104:18 136:16]
  assign io_out_0_bits_cf_crossPageIPFFix = io_in_0_bits_cf_crossPageIPFFix; // @[Rename.scala 104:18 136:16]
  assign io_out_0_bits_cf_storeSetHit = io_ssit_0_valid; // @[Rename.scala 104:18 140:28]
  assign io_out_0_bits_cf_loadWaitStrict = io_ssit_0_strict & io_ssit_0_valid; // @[Rename.scala 141:52]
  assign io_out_0_bits_cf_ssid = io_ssit_0_ssid; // @[Rename.scala 104:18 142:21]
  assign io_out_0_bits_cf_ftqPtr_flag = io_in_0_bits_cf_ftqPtr_flag; // @[Rename.scala 104:18 136:16]
  assign io_out_0_bits_cf_ftqPtr_value = io_in_0_bits_cf_ftqPtr_value; // @[Rename.scala 104:18 136:16]
  assign io_out_0_bits_cf_ftqOffset = io_in_0_bits_cf_ftqOffset; // @[Rename.scala 104:18 136:16]
  assign io_out_0_bits_ctrl_srcType_0 = io_in_0_bits_ctrl_srcType_0; // @[Rename.scala 104:18 137:18]
  assign io_out_0_bits_ctrl_srcType_1 = io_in_0_bits_ctrl_srcType_1; // @[Rename.scala 104:18 137:18]
  assign io_out_0_bits_ctrl_srcType_2 = io_in_0_bits_ctrl_srcType_2; // @[Rename.scala 104:18 137:18]
  assign io_out_0_bits_ctrl_ldest = io_in_0_bits_ctrl_ldest; // @[Rename.scala 104:18 137:18]
  assign io_out_0_bits_ctrl_fuType = _T_8 ? 4'hc : io_in_0_bits_ctrl_fuType; // @[Rename.scala 187:20 193:46 194:34]
  assign io_out_0_bits_ctrl_fuOpType = _T_8 ? {{3'd0}, _io_out_0_bits_ctrl_fuOpType_T_1} : io_in_0_bits_ctrl_fuOpType; // @[Rename.scala 187:20 193:46 195:36]
  assign io_out_0_bits_ctrl_rfWen = io_in_0_bits_ctrl_rfWen; // @[Rename.scala 104:18 137:18]
  assign io_out_0_bits_ctrl_fpWen = io_in_0_bits_ctrl_fpWen; // @[Rename.scala 104:18 137:18]
  assign io_out_0_bits_ctrl_isXSTrap = io_in_0_bits_ctrl_isXSTrap; // @[Rename.scala 104:18 137:18]
  assign io_out_0_bits_ctrl_noSpecExec = io_in_0_bits_ctrl_noSpecExec; // @[Rename.scala 104:18 137:18]
  assign io_out_0_bits_ctrl_blockBackward = io_in_0_bits_ctrl_blockBackward; // @[Rename.scala 104:18 137:18]
  assign io_out_0_bits_ctrl_flushPipe = io_in_0_bits_ctrl_flushPipe; // @[Rename.scala 104:18 137:18]
  assign io_out_0_bits_ctrl_selImm = _T_8 ? 4'h0 : io_in_0_bits_ctrl_selImm; // @[Rename.scala 187:20 193:46 196:34]
  assign io_out_0_bits_ctrl_imm = _T_8 ? _io_out_0_bits_ctrl_imm_T_2 : _GEN_2; // @[Rename.scala 193:46 197:31]
  assign io_out_0_bits_ctrl_commitType = io_in_0_bits_ctrl_commitType; // @[Rename.scala 104:18 137:18]
  assign io_out_0_bits_ctrl_fpu_isAddSub = io_in_0_bits_ctrl_fpu_isAddSub; // @[Rename.scala 104:18 137:18]
  assign io_out_0_bits_ctrl_fpu_typeTagIn = io_in_0_bits_ctrl_fpu_typeTagIn; // @[Rename.scala 104:18 137:18]
  assign io_out_0_bits_ctrl_fpu_typeTagOut = io_in_0_bits_ctrl_fpu_typeTagOut; // @[Rename.scala 104:18 137:18]
  assign io_out_0_bits_ctrl_fpu_fromInt = io_in_0_bits_ctrl_fpu_fromInt; // @[Rename.scala 104:18 137:18]
  assign io_out_0_bits_ctrl_fpu_wflags = io_in_0_bits_ctrl_fpu_wflags; // @[Rename.scala 104:18 137:18]
  assign io_out_0_bits_ctrl_fpu_fpWen = io_in_0_bits_ctrl_fpu_fpWen; // @[Rename.scala 104:18 137:18]
  assign io_out_0_bits_ctrl_fpu_fmaCmd = io_in_0_bits_ctrl_fpu_fmaCmd; // @[Rename.scala 104:18 137:18]
  assign io_out_0_bits_ctrl_fpu_div = io_in_0_bits_ctrl_fpu_div; // @[Rename.scala 104:18 137:18]
  assign io_out_0_bits_ctrl_fpu_sqrt = io_in_0_bits_ctrl_fpu_sqrt; // @[Rename.scala 104:18 137:18]
  assign io_out_0_bits_ctrl_fpu_fcvt = io_in_0_bits_ctrl_fpu_fcvt; // @[Rename.scala 104:18 137:18]
  assign io_out_0_bits_ctrl_fpu_typ = io_in_0_bits_ctrl_fpu_typ; // @[Rename.scala 104:18 137:18]
  assign io_out_0_bits_ctrl_fpu_fmt = io_in_0_bits_ctrl_fpu_fmt; // @[Rename.scala 104:18 137:18]
  assign io_out_0_bits_ctrl_fpu_ren3 = io_in_0_bits_ctrl_fpu_ren3; // @[Rename.scala 104:18 137:18]
  assign io_out_0_bits_ctrl_fpu_rm = io_in_0_bits_ctrl_fpu_rm; // @[Rename.scala 104:18 137:18]
  assign io_out_0_bits_ctrl_isMove = io_in_0_bits_ctrl_isMove; // @[Rename.scala 104:18 137:18]
  assign io_out_0_bits_psrc_0 = io_in_0_bits_ctrl_srcType_0 == 2'h0 ? io_intReadPorts_0_0 : io_fpReadPorts_0_0; // @[Rename.scala 163:27]
  assign io_out_0_bits_psrc_1 = io_fusionInfo_0_rs2FromRs2 | io_fusionInfo_0_rs2FromRs1 ? _uops_0_psrc_1_T_2 : _GEN_0; // @[Rename.scala 167:73 168:25]
  assign io_out_0_bits_psrc_2 = io_fpReadPorts_0_2; // @[Rename.scala 104:18 173:21]
  assign io_out_0_bits_pdest = io_in_0_bits_ctrl_isMove ? uops_0_psrc_0 : uops_0_pdest; // @[Rename.scala 237:30]
  assign io_out_0_bits_old_pdest = io_in_0_bits_ctrl_rfWen ? io_intReadPorts_0_2 : io_fpReadPorts_0_3; // @[Rename.scala 174:29]
  assign io_out_0_bits_robIdx_flag = _uops_0_robIdx_new_ptr_T_1[5]; // @[CircularQueuePtr.scala 39:59]
  assign io_out_0_bits_robIdx_value = _uops_0_robIdx_new_ptr_T_1[4:0]; // @[CircularQueuePtr.scala 39:59]
  assign io_out_0_bits_eliminatedMove = io_in_0_bits_ctrl_isMove; // @[Rename.scala 104:18 175:28]
  assign io_out_1_valid = io_in_1_valid & intFreeList_io_canAllocate & fpFreeList_io_canAllocate & _canOut_T_2; // @[Rename.scala 186:98]
  assign io_out_1_bits_cf_foldpc = io_in_1_bits_cf_foldpc; // @[Rename.scala 104:18 136:16]
  assign io_out_1_bits_cf_exceptionVec_1 = io_in_1_bits_cf_exceptionVec_1; // @[Rename.scala 104:18 136:16]
  assign io_out_1_bits_cf_exceptionVec_2 = io_in_1_bits_cf_exceptionVec_2; // @[Rename.scala 104:18 136:16]
  assign io_out_1_bits_cf_exceptionVec_12 = io_in_1_bits_cf_exceptionVec_12; // @[Rename.scala 104:18 136:16]
  assign io_out_1_bits_cf_trigger_frontendHit_0 = io_in_1_bits_cf_trigger_frontendHit_0; // @[Rename.scala 104:18 136:16]
  assign io_out_1_bits_cf_trigger_frontendHit_1 = io_in_1_bits_cf_trigger_frontendHit_1; // @[Rename.scala 104:18 136:16]
  assign io_out_1_bits_cf_trigger_frontendHit_2 = io_in_1_bits_cf_trigger_frontendHit_2; // @[Rename.scala 104:18 136:16]
  assign io_out_1_bits_cf_trigger_frontendHit_3 = io_in_1_bits_cf_trigger_frontendHit_3; // @[Rename.scala 104:18 136:16]
  assign io_out_1_bits_cf_trigger_backendEn_0 = io_in_1_bits_cf_trigger_backendEn_0; // @[Rename.scala 104:18 136:16]
  assign io_out_1_bits_cf_trigger_backendEn_1 = io_in_1_bits_cf_trigger_backendEn_1; // @[Rename.scala 104:18 136:16]
  assign io_out_1_bits_cf_pd_isRVC = io_in_1_bits_cf_pd_isRVC; // @[Rename.scala 104:18 136:16]
  assign io_out_1_bits_cf_pd_brType = io_in_1_bits_cf_pd_brType; // @[Rename.scala 104:18 136:16]
  assign io_out_1_bits_cf_pd_isCall = io_in_1_bits_cf_pd_isCall; // @[Rename.scala 104:18 136:16]
  assign io_out_1_bits_cf_pd_isRet = io_in_1_bits_cf_pd_isRet; // @[Rename.scala 104:18 136:16]
  assign io_out_1_bits_cf_pred_taken = io_in_1_bits_cf_pred_taken; // @[Rename.scala 104:18 136:16]
  assign io_out_1_bits_cf_crossPageIPFFix = io_in_1_bits_cf_crossPageIPFFix; // @[Rename.scala 104:18 136:16]
  assign io_out_1_bits_cf_storeSetHit = io_ssit_1_valid; // @[Rename.scala 104:18 140:28]
  assign io_out_1_bits_cf_loadWaitStrict = io_ssit_1_strict & io_ssit_1_valid; // @[Rename.scala 141:52]
  assign io_out_1_bits_cf_ssid = io_ssit_1_ssid; // @[Rename.scala 104:18 142:21]
  assign io_out_1_bits_cf_ftqPtr_flag = io_in_1_bits_cf_ftqPtr_flag; // @[Rename.scala 104:18 136:16]
  assign io_out_1_bits_cf_ftqPtr_value = io_in_1_bits_cf_ftqPtr_value; // @[Rename.scala 104:18 136:16]
  assign io_out_1_bits_cf_ftqOffset = io_in_1_bits_cf_ftqOffset; // @[Rename.scala 104:18 136:16]
  assign io_out_1_bits_ctrl_srcType_0 = fused_lui_load ? 2'h1 : io_in_1_bits_ctrl_srcType_0; // @[Rename.scala 187:20 270:27 274:38]
  assign io_out_1_bits_ctrl_srcType_1 = io_in_1_bits_ctrl_srcType_1; // @[Rename.scala 104:18 137:18]
  assign io_out_1_bits_ctrl_srcType_2 = io_in_1_bits_ctrl_srcType_2; // @[Rename.scala 104:18 137:18]
  assign io_out_1_bits_ctrl_ldest = io_in_1_bits_ctrl_ldest; // @[Rename.scala 104:18 137:18]
  assign io_out_1_bits_ctrl_fuType = _T_16 ? 4'hc : io_in_1_bits_ctrl_fuType; // @[Rename.scala 187:20 193:46 194:34]
  assign io_out_1_bits_ctrl_fuOpType = _T_16 ? {{3'd0}, _io_out_1_bits_ctrl_fuOpType_T_1} : io_in_1_bits_ctrl_fuOpType; // @[Rename.scala 187:20 193:46 195:36]
  assign io_out_1_bits_ctrl_rfWen = io_in_1_bits_ctrl_rfWen; // @[Rename.scala 104:18 137:18]
  assign io_out_1_bits_ctrl_fpWen = io_in_1_bits_ctrl_fpWen; // @[Rename.scala 104:18 137:18]
  assign io_out_1_bits_ctrl_isXSTrap = io_in_1_bits_ctrl_isXSTrap; // @[Rename.scala 104:18 137:18]
  assign io_out_1_bits_ctrl_noSpecExec = io_in_1_bits_ctrl_noSpecExec; // @[Rename.scala 104:18 137:18]
  assign io_out_1_bits_ctrl_blockBackward = io_in_1_bits_ctrl_blockBackward; // @[Rename.scala 104:18 137:18]
  assign io_out_1_bits_ctrl_flushPipe = io_in_1_bits_ctrl_flushPipe; // @[Rename.scala 104:18 137:18]
  assign io_out_1_bits_ctrl_selImm = _T_16 ? 4'h0 : io_in_1_bits_ctrl_selImm; // @[Rename.scala 187:20 193:46 196:34]
  assign io_out_1_bits_ctrl_imm = fused_lui_load ? _io_out_1_bits_ctrl_imm_T_4 : _GEN_11; // @[Rename.scala 270:27 275:31]
  assign io_out_1_bits_ctrl_fpu_isAddSub = io_in_1_bits_ctrl_fpu_isAddSub; // @[Rename.scala 104:18 137:18]
  assign io_out_1_bits_ctrl_fpu_typeTagIn = io_in_1_bits_ctrl_fpu_typeTagIn; // @[Rename.scala 104:18 137:18]
  assign io_out_1_bits_ctrl_fpu_typeTagOut = io_in_1_bits_ctrl_fpu_typeTagOut; // @[Rename.scala 104:18 137:18]
  assign io_out_1_bits_ctrl_fpu_fromInt = io_in_1_bits_ctrl_fpu_fromInt; // @[Rename.scala 104:18 137:18]
  assign io_out_1_bits_ctrl_fpu_wflags = io_in_1_bits_ctrl_fpu_wflags; // @[Rename.scala 104:18 137:18]
  assign io_out_1_bits_ctrl_fpu_fpWen = io_in_1_bits_ctrl_fpu_fpWen; // @[Rename.scala 104:18 137:18]
  assign io_out_1_bits_ctrl_fpu_fmaCmd = io_in_1_bits_ctrl_fpu_fmaCmd; // @[Rename.scala 104:18 137:18]
  assign io_out_1_bits_ctrl_fpu_div = io_in_1_bits_ctrl_fpu_div; // @[Rename.scala 104:18 137:18]
  assign io_out_1_bits_ctrl_fpu_sqrt = io_in_1_bits_ctrl_fpu_sqrt; // @[Rename.scala 104:18 137:18]
  assign io_out_1_bits_ctrl_fpu_fcvt = io_in_1_bits_ctrl_fpu_fcvt; // @[Rename.scala 104:18 137:18]
  assign io_out_1_bits_ctrl_fpu_typ = io_in_1_bits_ctrl_fpu_typ; // @[Rename.scala 104:18 137:18]
  assign io_out_1_bits_ctrl_fpu_fmt = io_in_1_bits_ctrl_fpu_fmt; // @[Rename.scala 104:18 137:18]
  assign io_out_1_bits_ctrl_fpu_ren3 = io_in_1_bits_ctrl_fpu_ren3; // @[Rename.scala 104:18 137:18]
  assign io_out_1_bits_ctrl_fpu_rm = io_in_1_bits_ctrl_fpu_rm; // @[Rename.scala 104:18 137:18]
  assign io_out_1_bits_ctrl_isMove = io_in_1_bits_ctrl_isMove; // @[Rename.scala 104:18 137:18]
  assign io_out_1_bits_psrc_0 = fused_lui_load ? io_in_0_bits_ctrl_imm[13:8] : _io_out_1_bits_psrc_0_T_1; // @[Rename.scala 270:27 251:28 280:30]
  assign io_out_1_bits_psrc_1 = fused_lui_load ? io_in_0_bits_ctrl_imm[19:14] : _io_out_1_bits_psrc_1_T_1; // @[Rename.scala 270:27 254:28 281:30]
  assign io_out_1_bits_psrc_2 = destToSrc_0_2 ? io_out_0_bits_pdest : io_fpReadPorts_1_2; // @[Rename.scala 258:23]
  assign io_out_1_bits_pdest = io_in_1_bits_ctrl_isMove ? io_out_1_bits_psrc_0 : uops_1_pdest; // @[Rename.scala 263:32]
  assign io_out_1_bits_old_pdest = destToSrc_0_3 ? io_out_0_bits_pdest : uops_1_old_pdest; // @[Rename.scala 261:23]
  assign io_out_1_bits_robIdx_flag = _uops_1_robIdx_new_ptr_T_2[5]; // @[CircularQueuePtr.scala 39:59]
  assign io_out_1_bits_robIdx_value = _uops_1_robIdx_new_ptr_T_2[4:0]; // @[CircularQueuePtr.scala 39:59]
  assign io_out_1_bits_eliminatedMove = io_in_1_bits_ctrl_isMove; // @[Rename.scala 104:18 175:28]
  assign io_perf_0_value = {{4'd0}, io_perf_0_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_1_value = {{4'd0}, io_perf_1_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_2_value = {{5'd0}, io_perf_2_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_3_value = {{5'd0}, io_perf_3_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_4_value = {{5'd0}, io_perf_4_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_5_value = {{5'd0}, io_perf_5_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_6_value = io_perf_6_value_REG_1; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_7_value = io_perf_7_value_REG_1; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_8_value = io_perf_8_value_REG_1; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_9_value = io_perf_9_value_REG_1; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_10_value = io_perf_10_value_REG_1; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_11_value = io_perf_11_value_REG_1; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_12_value = io_perf_12_value_REG_1; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_13_value = io_perf_13_value_REG_1; // @[PerfCounterUtils.scala 188:17]
  assign intFreeList_clock = clock;
  assign intFreeList_reset = reset;
  assign intFreeList_io_redirect = io_redirect_valid; // @[Rename.scala 79:20]
  assign intFreeList_io_walk = io_robCommits_isWalk; // @[Rename.scala 80:16]
  assign intFreeList_io_allocateReq_0 = io_robCommits_isWalk ? walkNeedIntDest_0 & ~io_robCommits_info_0_isMove :
    needIntDest_0 & ~io_in_0_bits_ctrl_isMove; // @[Rename.scala 156:41]
  assign intFreeList_io_allocateReq_1 = io_robCommits_isWalk ? walkNeedIntDest_1 & ~io_robCommits_info_1_isMove :
    needIntDest_1 & ~io_in_1_bits_ctrl_isMove; // @[Rename.scala 156:41]
  assign intFreeList_io_doAllocate = fpFreeList_io_canAllocate & io_out_0_ready | io_robCommits_isWalk; // @[Rename.scala 84:77]
  assign intFreeList_io_freeReq_0 = intRefCounter_io_freeRegs_0_valid; // @[Rename.scala 317:35]
  assign intFreeList_io_freeReq_1 = intRefCounter_io_freeRegs_1_valid; // @[Rename.scala 317:35]
  assign intFreeList_io_freePhyReg_0 = intRefCounter_io_freeRegs_0_bits; // @[Rename.scala 318:38]
  assign intFreeList_io_freePhyReg_1 = intRefCounter_io_freeRegs_1_bits; // @[Rename.scala 318:38]
  assign intFreeList_io_commit_isCommit = io_robCommits_isCommit; // @[Rename.scala 61:28]
  assign intFreeList_io_commit_commitValid_0 = io_robCommits_commitValid_0; // @[Rename.scala 61:28]
  assign intFreeList_io_commit_commitValid_1 = io_robCommits_commitValid_1; // @[Rename.scala 61:28]
  assign intFreeList_io_commit_info_0_ldest = io_robCommits_info_0_ldest; // @[Rename.scala 61:28]
  assign intFreeList_io_commit_info_0_rfWen = io_robCommits_info_0_rfWen; // @[Rename.scala 61:28]
  assign intFreeList_io_commit_info_0_isMove = io_robCommits_info_0_isMove; // @[Rename.scala 61:28]
  assign intFreeList_io_commit_info_1_ldest = io_robCommits_info_1_ldest; // @[Rename.scala 61:28]
  assign intFreeList_io_commit_info_1_rfWen = io_robCommits_info_1_rfWen; // @[Rename.scala 61:28]
  assign intFreeList_io_commit_info_1_isMove = io_robCommits_info_1_isMove; // @[Rename.scala 61:28]
  assign intRefCounter_clock = clock;
  assign intRefCounter_reset = reset;
  assign intRefCounter_io_allocate_0_valid = io_robCommits_isWalk ? walkIntSpecWen_0 : intSpecWen_0; // @[Rename.scala 212:46]
  assign intRefCounter_io_allocate_0_bits = io_robCommits_isWalk ? io_robCommits_info_0_pdest : io_out_0_bits_pdest; // @[Rename.scala 213:45]
  assign intRefCounter_io_allocate_1_valid = io_robCommits_isWalk ? walkIntSpecWen_1 : intSpecWen_1; // @[Rename.scala 212:46]
  assign intRefCounter_io_allocate_1_bits = io_robCommits_isWalk ? io_robCommits_info_1_pdest : io_out_1_bits_pdest; // @[Rename.scala 213:45]
  assign intRefCounter_io_deallocate_0_valid = commitValid & io_robCommits_info_0_rfWen & _canOut_T_2; // @[Rename.scala 321:108]
  assign intRefCounter_io_deallocate_0_bits = io_robCommits_info_0_old_pdest; // @[Rename.scala 322:41]
  assign intRefCounter_io_deallocate_1_valid = commitValid_1 & io_robCommits_info_1_rfWen & _canOut_T_2; // @[Rename.scala 321:108]
  assign intRefCounter_io_deallocate_1_bits = io_robCommits_info_1_old_pdest; // @[Rename.scala 322:41]
  assign intRefCounter_io_commit_isCommit = io_robCommits_isCommit; // @[Rename.scala 58:34]
  assign intRefCounter_io_commit_commitValid_0 = io_robCommits_commitValid_0; // @[Rename.scala 58:34]
  assign intRefCounter_io_commit_commitValid_1 = io_robCommits_commitValid_1; // @[Rename.scala 58:34]
  assign intRefCounter_io_commit_info_0_rfWen = io_robCommits_info_0_rfWen; // @[Rename.scala 58:34]
  assign intRefCounter_io_commit_info_0_pdest = io_robCommits_info_0_pdest; // @[Rename.scala 58:34]
  assign intRefCounter_io_commit_info_0_old_pdest = io_robCommits_info_0_old_pdest; // @[Rename.scala 58:34]
  assign intRefCounter_io_commit_info_1_rfWen = io_robCommits_info_1_rfWen; // @[Rename.scala 58:34]
  assign intRefCounter_io_commit_info_1_pdest = io_robCommits_info_1_pdest; // @[Rename.scala 58:34]
  assign intRefCounter_io_commit_info_1_old_pdest = io_robCommits_info_1_old_pdest; // @[Rename.scala 58:34]
  assign intRefCounter_io_redirect = io_redirect_valid; // @[Rename.scala 59:34]
  assign fpFreeList_clock = clock;
  assign fpFreeList_reset = reset;
  assign fpFreeList_io_redirect = io_redirect_valid; // @[Rename.scala 79:20]
  assign fpFreeList_io_walk = io_robCommits_isWalk; // @[Rename.scala 80:16]
  assign fpFreeList_io_allocateReq_0 = io_robCommits_isWalk ? walkNeedFpDest_0 : needFpDest_0; // @[Rename.scala 155:40]
  assign fpFreeList_io_allocateReq_1 = io_robCommits_isWalk ? walkNeedFpDest_1 : needFpDest_1; // @[Rename.scala 155:40]
  assign fpFreeList_io_doAllocate = intFreeList_io_canAllocate & io_out_0_ready | io_robCommits_isWalk; // @[Rename.scala 85:77]
  assign fpFreeList_io_freeReq_0 = commitValid & io_robCommits_info_0_fpWen; // @[Rename.scala 314:50]
  assign fpFreeList_io_freeReq_1 = commitValid_1 & io_robCommits_info_1_fpWen; // @[Rename.scala 314:50]
  assign fpFreeList_io_freePhyReg_0 = io_robCommits_info_0_old_pdest; // @[Rename.scala 315:37]
  assign fpFreeList_io_freePhyReg_1 = io_robCommits_info_1_old_pdest; // @[Rename.scala 315:37]
  assign fpFreeList_io_commit_isCommit = io_robCommits_isCommit; // @[Rename.scala 63:28]
  assign fpFreeList_io_commit_commitValid_0 = io_robCommits_commitValid_0; // @[Rename.scala 63:28]
  assign fpFreeList_io_commit_commitValid_1 = io_robCommits_commitValid_1; // @[Rename.scala 63:28]
  assign fpFreeList_io_commit_info_0_fpWen = io_robCommits_info_0_fpWen; // @[Rename.scala 63:28]
  assign fpFreeList_io_commit_info_1_fpWen = io_robCommits_info_1_fpWen; // @[Rename.scala 63:28]
  always @(posedge clock) begin
    lastCycleMisprediction <= io_redirect_valid & ~io_redirect_bits_level; // @[Rename.scala 94:58]
    io_perf_0_value_REG <= _T_78 + _T_79; // @[Bitwise.scala 48:55]
    io_perf_0_value_REG_1 <= io_perf_0_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_1_value_REG <= _T_33 + _T_35; // @[Bitwise.scala 48:55]
    io_perf_1_value_REG_1 <= io_perf_1_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_2_value_REG <= _T_41 & _canOut_T_2; // @[Rename.scala 383:127]
    io_perf_2_value_REG_1 <= io_perf_2_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_3_value_REG <= _T_47 & _canOut_T_2; // @[Rename.scala 384:127]
    io_perf_3_value_REG_1 <= io_perf_3_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_4_value_REG <= _T_53 & _canOut_T_2; // @[Rename.scala 385:127]
    io_perf_4_value_REG_1 <= io_perf_4_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_5_value_REG <= _T_58 & io_robCommits_isWalk; // @[Rename.scala 386:127]
    io_perf_5_value_REG_1 <= io_perf_5_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_6_value_REG <= intFreeList_io_perf_0_value; // @[PerfCounterUtils.scala 188:35]
    io_perf_6_value_REG_1 <= io_perf_6_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_7_value_REG <= intFreeList_io_perf_1_value; // @[PerfCounterUtils.scala 188:35]
    io_perf_7_value_REG_1 <= io_perf_7_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_8_value_REG <= intFreeList_io_perf_2_value; // @[PerfCounterUtils.scala 188:35]
    io_perf_8_value_REG_1 <= io_perf_8_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_9_value_REG <= intFreeList_io_perf_3_value; // @[PerfCounterUtils.scala 188:35]
    io_perf_9_value_REG_1 <= io_perf_9_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_10_value_REG <= fpFreeList_io_perf_0_value; // @[PerfCounterUtils.scala 188:35]
    io_perf_10_value_REG_1 <= io_perf_10_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_11_value_REG <= fpFreeList_io_perf_1_value; // @[PerfCounterUtils.scala 188:35]
    io_perf_11_value_REG_1 <= io_perf_11_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_12_value_REG <= fpFreeList_io_perf_2_value; // @[PerfCounterUtils.scala 188:35]
    io_perf_12_value_REG_1 <= io_perf_12_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_13_value_REG <= fpFreeList_io_perf_3_value; // @[PerfCounterUtils.scala 188:35]
    io_perf_13_value_REG_1 <= io_perf_13_value_REG; // @[PerfCounterUtils.scala 188:27]
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Rename.scala 95:27]
      robIdxHead_flag <= 1'h0;
    end else if (io_redirect_valid) begin // @[Rename.scala 96:13]
      robIdxHead_flag <= io_redirect_bits_robIdx_flag;
    end else if (lastCycleMisprediction) begin // @[Rename.scala 97:29]
      robIdxHead_flag <= robIdxHeadNext_new_ptr_flag;
    end else if (canOut) begin
      robIdxHead_flag <= robIdxHeadNext_new_ptr_1_flag;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Rename.scala 95:27]
      robIdxHead_value <= 5'h0;
    end else if (io_redirect_valid) begin // @[Rename.scala 96:13]
      robIdxHead_value <= io_redirect_bits_robIdx_value;
    end else if (lastCycleMisprediction) begin // @[Rename.scala 97:29]
      robIdxHead_value <= robIdxHeadNext_new_ptr_value;
    end else if (canOut) begin
      robIdxHead_value <= robIdxHeadNext_new_ptr_1_value;
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
  robIdxHead_flag = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  robIdxHead_value = _RAND_1[4:0];
  _RAND_2 = {1{`RANDOM}};
  lastCycleMisprediction = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  io_perf_0_value_REG = _RAND_3[1:0];
  _RAND_4 = {1{`RANDOM}};
  io_perf_0_value_REG_1 = _RAND_4[1:0];
  _RAND_5 = {1{`RANDOM}};
  io_perf_1_value_REG = _RAND_5[1:0];
  _RAND_6 = {1{`RANDOM}};
  io_perf_1_value_REG_1 = _RAND_6[1:0];
  _RAND_7 = {1{`RANDOM}};
  io_perf_2_value_REG = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  io_perf_2_value_REG_1 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  io_perf_3_value_REG = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  io_perf_3_value_REG_1 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  io_perf_4_value_REG = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  io_perf_4_value_REG_1 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  io_perf_5_value_REG = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  io_perf_5_value_REG_1 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  io_perf_6_value_REG = _RAND_15[5:0];
  _RAND_16 = {1{`RANDOM}};
  io_perf_6_value_REG_1 = _RAND_16[5:0];
  _RAND_17 = {1{`RANDOM}};
  io_perf_7_value_REG = _RAND_17[5:0];
  _RAND_18 = {1{`RANDOM}};
  io_perf_7_value_REG_1 = _RAND_18[5:0];
  _RAND_19 = {1{`RANDOM}};
  io_perf_8_value_REG = _RAND_19[5:0];
  _RAND_20 = {1{`RANDOM}};
  io_perf_8_value_REG_1 = _RAND_20[5:0];
  _RAND_21 = {1{`RANDOM}};
  io_perf_9_value_REG = _RAND_21[5:0];
  _RAND_22 = {1{`RANDOM}};
  io_perf_9_value_REG_1 = _RAND_22[5:0];
  _RAND_23 = {1{`RANDOM}};
  io_perf_10_value_REG = _RAND_23[5:0];
  _RAND_24 = {1{`RANDOM}};
  io_perf_10_value_REG_1 = _RAND_24[5:0];
  _RAND_25 = {1{`RANDOM}};
  io_perf_11_value_REG = _RAND_25[5:0];
  _RAND_26 = {1{`RANDOM}};
  io_perf_11_value_REG_1 = _RAND_26[5:0];
  _RAND_27 = {1{`RANDOM}};
  io_perf_12_value_REG = _RAND_27[5:0];
  _RAND_28 = {1{`RANDOM}};
  io_perf_12_value_REG_1 = _RAND_28[5:0];
  _RAND_29 = {1{`RANDOM}};
  io_perf_13_value_REG = _RAND_29[5:0];
  _RAND_30 = {1{`RANDOM}};
  io_perf_13_value_REG_1 = _RAND_30[5:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    robIdxHead_flag = 1'h0;
  end
  if (reset) begin
    robIdxHead_value = 5'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

