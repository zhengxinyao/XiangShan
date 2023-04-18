module LoadUnit_S0(
  output        io_in_ready,
  input         io_in_valid,
  input  [9:0]  io_in_bits_uop_cf_foldpc,
  input         io_in_bits_uop_cf_trigger_backendEn_1,
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
  input  [19:0] io_in_bits_uop_ctrl_imm,
  input  [5:0]  io_in_bits_uop_pdest,
  input         io_in_bits_uop_robIdx_flag,
  input  [4:0]  io_in_bits_uop_robIdx_value,
  input         io_in_bits_uop_lqIdx_flag,
  input  [3:0]  io_in_bits_uop_lqIdx_value,
  input         io_in_bits_uop_sqIdx_flag,
  input  [3:0]  io_in_bits_uop_sqIdx_value,
  input  [63:0] io_in_bits_src_0,
  output        io_vec_in_ready,
  input         io_vec_in_valid,
  input  [38:0] io_vec_in_bits_vaddr,
  input         io_out_ready,
  output        io_out_valid,
  output [9:0]  io_out_bits_uop_cf_foldpc,
  output        io_out_bits_uop_cf_exceptionVec_4,
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
  output [15:0] io_out_bits_mask,
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
  output        io_dtlbReq_valid,
  output [38:0] io_dtlbReq_bits_vaddr,
  output [2:0]  io_dtlbReq_bits_cmd,
  output        io_dtlbReq_bits_no_translate,
  input         io_dcacheReq_ready,
  output        io_dcacheReq_valid,
  output [4:0]  io_dcacheReq_bits_cmd,
  output [35:0] io_dcacheReq_bits_addr,
  output [3:0]  io_dcacheReq_bits_instrtype,
  output [7:0]  io_dcacheReq_bits_replayCarry_real_way_en,
  output        io_dcacheReq_bits_replayCarry_valid,
  input  [63:0] io_fastpath_data,
  input         io_fastpath_valid,
  input         io_s0_kill,
  output        io_replay_ready,
  input         io_replay_valid,
  input  [9:0]  io_replay_bits_uop_cf_foldpc,
  input         io_replay_bits_uop_cf_trigger_backendEn_1,
  input         io_replay_bits_uop_cf_trigger_backendHit_0,
  input         io_replay_bits_uop_cf_trigger_backendHit_1,
  input         io_replay_bits_uop_cf_trigger_backendHit_4,
  input         io_replay_bits_uop_cf_waitForRobIdx_flag,
  input  [4:0]  io_replay_bits_uop_cf_waitForRobIdx_value,
  input         io_replay_bits_uop_cf_loadWaitBit,
  input         io_replay_bits_uop_cf_loadWaitStrict,
  input         io_replay_bits_uop_cf_ftqPtr_flag,
  input  [2:0]  io_replay_bits_uop_cf_ftqPtr_value,
  input  [2:0]  io_replay_bits_uop_cf_ftqOffset,
  input  [3:0]  io_replay_bits_uop_ctrl_fuType,
  input  [6:0]  io_replay_bits_uop_ctrl_fuOpType,
  input         io_replay_bits_uop_ctrl_rfWen,
  input         io_replay_bits_uop_ctrl_fpWen,
  input  [5:0]  io_replay_bits_uop_pdest,
  input         io_replay_bits_uop_robIdx_flag,
  input  [4:0]  io_replay_bits_uop_robIdx_value,
  input         io_replay_bits_uop_lqIdx_flag,
  input  [3:0]  io_replay_bits_uop_lqIdx_value,
  input         io_replay_bits_uop_sqIdx_flag,
  input  [3:0]  io_replay_bits_uop_sqIdx_value,
  input  [38:0] io_replay_bits_vaddr,
  input         io_replay_bits_isFirstIssue,
  input  [7:0]  io_replay_bits_replayCarry_real_way_en,
  input         io_replay_bits_replayCarry_valid,
  input  [1:0]  io_replay_bits_mshrid,
  input         io_replay_bits_forward_tlDchannel,
  input         io_replay_bits_rarAllocated,
  input  [3:0]  io_replay_bits_rarIndex,
  input         io_replay_bits_rawAllocated,
  input  [2:0]  io_replay_bits_rawIndex,
  output [3:0]  io_s0_sqIdx_value,
  output        io_l2lForward_select,
  input         io_lqReplayFull
);
  wire  s0_replayShouldWait_differentFlag = io_replay_bits_uop_robIdx_flag ^ io_in_bits_uop_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  s0_replayShouldWait_compare = io_replay_bits_uop_robIdx_value > io_in_bits_uop_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _s0_replayShouldWait_T = s0_replayShouldWait_differentFlag ^ s0_replayShouldWait_compare; // @[CircularQueuePtr.scala 88:19]
  wire  _s0_replayShouldWait_T_2 = ~io_lqReplayFull; // @[LoadUnit.scala 136:105]
  wire  s0_replayShouldWait = io_in_valid & _s0_replayShouldWait_T & ~io_lqReplayFull; // @[LoadUnit.scala 136:102]
  wire  _lfsrc0_loadReplay_valid_T = ~s0_replayShouldWait; // @[LoadUnit.scala 147:52]
  wire  lfsrc0_loadReplay_valid = io_replay_valid & ~s0_replayShouldWait; // @[LoadUnit.scala 147:49]
  wire  _lfsrc1_highconfhwPrefetch_valid_T = 1'h0; // @[LoadUnit.scala 148:96]
  wire  lfsrc1_highconfhwPrefetch_valid = 1'h0; // @[LoadUnit.scala 148:62]
  wire  _lfsrc5_lowconfhwPrefetch_valid_T = 1'h1; // @[LoadUnit.scala 152:95]
  wire  lfsrc5_lowconfhwPrefetch_valid = 1'h0; // @[LoadUnit.scala 152:61]
  wire  lfsrc_highconfhwPrefetch_ready = ~lfsrc0_loadReplay_valid; // @[LoadUnit.scala 162:40]
  wire  _lfsrc_intloadFirstIssue_ready_T_1 = ~_lfsrc1_highconfhwPrefetch_valid_T; // @[LoadUnit.scala 164:5]
  wire  lfsrc_intloadFirstIssue_ready = lfsrc_highconfhwPrefetch_ready & _lfsrc_intloadFirstIssue_ready_T_1; // @[LoadUnit.scala 163:64]
  wire  _lfsrc_vecloadFirstIssue_ready_T_3 = ~io_in_valid; // @[LoadUnit.scala 167:5]
  wire  lfsrc_vecloadFirstIssue_ready = lfsrc_intloadFirstIssue_ready & _lfsrc_vecloadFirstIssue_ready_T_3; // @[LoadUnit.scala 166:38]
  wire  _lfsrc_l2lForward_ready_T_5 = ~io_vec_in_valid; // @[LoadUnit.scala 171:5]
  wire  lfsrc_l2lForward_ready = lfsrc_vecloadFirstIssue_ready & _lfsrc_l2lForward_ready_T_5; // @[LoadUnit.scala 170:37]
  wire  _lfsrc_lowconfhwPrefetch_ready_T_7 = ~io_fastpath_valid; // @[LoadUnit.scala 176:5]
  wire  lfsrc_lowconfhwPrefetch_ready = lfsrc_l2lForward_ready & _lfsrc_lowconfhwPrefetch_ready_T_7; // @[LoadUnit.scala 175:37]
  wire  lfsrc_loadReplay_ready = 1'h1;
  wire  lfsrc_loadReplay_select = lfsrc0_loadReplay_valid & _lfsrc5_lowconfhwPrefetch_valid_T; // @[LoadUnit.scala 185:57]
  wire  _lfsrc_hwprefetch_select_T_1 = lfsrc_lowconfhwPrefetch_ready & _lfsrc1_highconfhwPrefetch_valid_T; // @[LoadUnit.scala 187:35]
  wire  isHWPrefetch = lfsrc_highconfhwPrefetch_ready & _lfsrc1_highconfhwPrefetch_valid_T |
    _lfsrc_hwprefetch_select_T_1; // @[LoadUnit.scala 186:99]
  wire  lfsrc_intloadFirstIssue_select = lfsrc_intloadFirstIssue_ready & io_in_valid; // @[LoadUnit.scala 188:70]
  wire  lfsrc_vecloadFirstIssue_select = lfsrc_vecloadFirstIssue_ready & io_vec_in_valid; // @[LoadUnit.scala 189:70]
  wire  lfsrc_l2lForward_select = lfsrc_l2lForward_ready & io_fastpath_valid; // @[LoadUnit.scala 190:56]
  wire  _s0_valid_T = lfsrc0_loadReplay_valid | _lfsrc1_highconfhwPrefetch_valid_T; // @[LoadUnit.scala 201:42]
  wire  _s0_valid_T_1 = _s0_valid_T | io_in_valid; // @[LoadUnit.scala 202:37]
  wire  _s0_valid_T_2 = _s0_valid_T_1 | io_vec_in_valid; // @[LoadUnit.scala 203:36]
  wire  _s0_valid_T_3 = _s0_valid_T_2 | io_fastpath_valid; // @[LoadUnit.scala 204:36]
  wire  s0_valid = _s0_valid_T_3 | _lfsrc1_highconfhwPrefetch_valid_T; // @[LoadUnit.scala 205:29]
  wire [6:0] _GEN_64 = lfsrc_vecloadFirstIssue_select ? 7'h0 : 7'h3; // @[LoadUnit.scala 297:46 300:12 321:28]
  wire [6:0] _GEN_187 = lfsrc_intloadFirstIssue_select ? io_in_bits_uop_ctrl_fuOpType : _GEN_64; // @[LoadUnit.scala 285:46 289:12]
  wire [6:0] s0_uop_ctrl_fuOpType = lfsrc_loadReplay_select ? io_replay_bits_uop_ctrl_fuOpType : _GEN_187; // @[LoadUnit.scala 261:33 264:12]
  wire  _isPrefetchRead_T = s0_uop_ctrl_fuOpType == 7'h9; // @[LoadUnit.scala 210:54]
  wire  _isPrefetchWrite_T = s0_uop_ctrl_fuOpType == 7'ha; // @[LoadUnit.scala 211:55]
  wire [11:0] imm12 = io_in_bits_uop_ctrl_imm[11:0]; // @[LoadUnit.scala 286:40]
  wire  s0_vaddr_signBit = imm12[11]; // @[BitUtils.scala 80:20]
  wire [26:0] _s0_vaddr_T_3 = s0_vaddr_signBit ? 27'h7ffffff : 27'h0; // @[Bitwise.scala 74:12]
  wire [38:0] _s0_vaddr_T_4 = {_s0_vaddr_T_3,imm12}; // @[Cat.scala 31:58]
  wire [63:0] _GEN_511 = {{25'd0}, _s0_vaddr_T_4}; // @[LoadUnit.scala 287:35]
  wire [63:0] _s0_vaddr_T_6 = io_in_bits_src_0 + _GEN_511; // @[LoadUnit.scala 287:35]
  wire [63:0] _GEN_6 = lfsrc_vecloadFirstIssue_select ? {{25'd0}, io_vec_in_bits_vaddr} : io_fastpath_data; // @[LoadUnit.scala 297:46 298:14 319:16]
  wire [63:0] _GEN_129 = lfsrc_intloadFirstIssue_select ? _s0_vaddr_T_6 : _GEN_6; // @[LoadUnit.scala 285:46 287:14]
  wire [63:0] _GEN_253 = isHWPrefetch ? 64'h0 : _GEN_129; // @[LoadUnit.scala 272:39 274:14]
  wire [63:0] _GEN_381 = lfsrc_loadReplay_select ? {{25'd0}, io_replay_bits_vaddr} : _GEN_253; // @[LoadUnit.scala 261:33 262:14]
  wire [38:0] s0_vaddr = _GEN_381[38:0]; // @[LoadUnit.scala 114:22]
  wire  _GEN_368 = isHWPrefetch ? 1'h0 : _isPrefetchWrite_T; // @[LoadUnit.scala 272:39 284:21]
  wire  isPrefetchWrite = lfsrc_loadReplay_select ? _isPrefetchWrite_T : _GEN_368; // @[LoadUnit.scala 261:33]
  wire  replayUopIsPrefetch = io_replay_bits_uop_ctrl_fuOpType[3]; // @[package.scala 385:40]
  wire  issueUopIsPrefetch = io_in_bits_uop_ctrl_fuOpType[3]; // @[package.scala 385:40]
  wire  _GEN_127 = lfsrc_vecloadFirstIssue_select & issueUopIsPrefetch; // @[LoadUnit.scala 297:46]
  wire  _GEN_241 = lfsrc_intloadFirstIssue_select ? issueUopIsPrefetch : _GEN_127; // @[LoadUnit.scala 285:46]
  wire  _GEN_366 = isHWPrefetch | _GEN_241; // @[LoadUnit.scala 272:39 282:16]
  wire  isPrefetch = lfsrc_loadReplay_select ? replayUopIsPrefetch : _GEN_366; // @[LoadUnit.scala 261:33]
  wire  _io_dtlbReq_bits_cmd_T_1 = isPrefetch & isPrefetchWrite; // @[LoadUnit.scala 218:29]
  wire [1:0] _GEN_0 = isPrefetchWrite ? 2'h3 : 2'h0; // @[LoadUnit.scala 237:32 238:28 240:28]
  wire  _GEN_367 = isHWPrefetch | _isPrefetchRead_T; // @[LoadUnit.scala 272:39 283:20]
  wire  isPrefetchRead = lfsrc_loadReplay_select ? _isPrefetchRead_T : _GEN_367; // @[LoadUnit.scala 261:33]
  wire [1:0] _GEN_1 = isPrefetchRead ? 2'h2 : _GEN_0; // @[LoadUnit.scala 235:25 236:28]
  wire [1:0] _GEN_2 = isPrefetch ? 2'h3 : 2'h0; // @[LoadUnit.scala 245:20 246:33 248:33]
  wire  _s0_mask_T_1 = 2'h0 == io_replay_bits_uop_ctrl_fuType[1:0]; // @[LookupTree.scala 24:34]
  wire  _s0_mask_T_2 = 2'h1 == io_replay_bits_uop_ctrl_fuType[1:0]; // @[LookupTree.scala 24:34]
  wire  _s0_mask_T_3 = 2'h2 == io_replay_bits_uop_ctrl_fuType[1:0]; // @[LookupTree.scala 24:34]
  wire  _s0_mask_T_4 = 2'h3 == io_replay_bits_uop_ctrl_fuType[1:0]; // @[LookupTree.scala 24:34]
  wire [1:0] _s0_mask_T_6 = _s0_mask_T_2 ? 2'h3 : 2'h0; // @[Mux.scala 27:73]
  wire [3:0] _s0_mask_T_7 = _s0_mask_T_3 ? 4'hf : 4'h0; // @[Mux.scala 27:73]
  wire [7:0] _s0_mask_T_8 = _s0_mask_T_4 ? 8'hff : 8'h0; // @[Mux.scala 27:73]
  wire [1:0] _GEN_512 = {{1'd0}, _s0_mask_T_1}; // @[Mux.scala 27:73]
  wire [1:0] _s0_mask_T_9 = _GEN_512 | _s0_mask_T_6; // @[Mux.scala 27:73]
  wire [3:0] _GEN_513 = {{2'd0}, _s0_mask_T_9}; // @[Mux.scala 27:73]
  wire [3:0] _s0_mask_T_10 = _GEN_513 | _s0_mask_T_7; // @[Mux.scala 27:73]
  wire [7:0] _GEN_514 = {{4'd0}, _s0_mask_T_10}; // @[Mux.scala 27:73]
  wire [7:0] _s0_mask_T_11 = _GEN_514 | _s0_mask_T_8; // @[Mux.scala 27:73]
  wire [14:0] _GEN_3 = {{7'd0}, _s0_mask_T_11}; // @[MemCommon.scala 38:8]
  wire [14:0] _s0_mask_T_13 = _GEN_3 << io_replay_bits_vaddr[2:0]; // @[MemCommon.scala 38:8]
  wire  _s0_mask_T_15 = 2'h0 == io_in_bits_uop_ctrl_fuOpType[1:0]; // @[LookupTree.scala 24:34]
  wire  _s0_mask_T_16 = 2'h1 == io_in_bits_uop_ctrl_fuOpType[1:0]; // @[LookupTree.scala 24:34]
  wire  _s0_mask_T_17 = 2'h2 == io_in_bits_uop_ctrl_fuOpType[1:0]; // @[LookupTree.scala 24:34]
  wire  _s0_mask_T_18 = 2'h3 == io_in_bits_uop_ctrl_fuOpType[1:0]; // @[LookupTree.scala 24:34]
  wire [1:0] _s0_mask_T_20 = _s0_mask_T_16 ? 2'h3 : 2'h0; // @[Mux.scala 27:73]
  wire [3:0] _s0_mask_T_21 = _s0_mask_T_17 ? 4'hf : 4'h0; // @[Mux.scala 27:73]
  wire [7:0] _s0_mask_T_22 = _s0_mask_T_18 ? 8'hff : 8'h0; // @[Mux.scala 27:73]
  wire [1:0] _GEN_515 = {{1'd0}, _s0_mask_T_15}; // @[Mux.scala 27:73]
  wire [1:0] _s0_mask_T_23 = _GEN_515 | _s0_mask_T_20; // @[Mux.scala 27:73]
  wire [3:0] _GEN_516 = {{2'd0}, _s0_mask_T_23}; // @[Mux.scala 27:73]
  wire [3:0] _s0_mask_T_24 = _GEN_516 | _s0_mask_T_21; // @[Mux.scala 27:73]
  wire [7:0] _GEN_517 = {{4'd0}, _s0_mask_T_24}; // @[Mux.scala 27:73]
  wire [7:0] _s0_mask_T_25 = _GEN_517 | _s0_mask_T_22; // @[Mux.scala 27:73]
  wire [22:0] _GEN_4 = {{15'd0}, _s0_mask_T_25}; // @[MemCommon.scala 49:8]
  wire [22:0] _s0_mask_T_27 = _GEN_4 << s0_vaddr[3:0]; // @[MemCommon.scala 49:8]
  wire [3:0] _s0_mask_T_29 = {io_fastpath_data[3],3'h0}; // @[Cat.scala 31:58]
  wire [22:0] _s0_mask_T_42 = 23'hff << _s0_mask_T_29; // @[MemCommon.scala 49:8]
  wire [22:0] _GEN_7 = lfsrc_vecloadFirstIssue_select ? 23'h0 : _s0_mask_T_42; // @[LoadUnit.scala 297:46 299:13 322:15]
  wire [22:0] _GEN_130 = lfsrc_intloadFirstIssue_select ? _s0_mask_T_27 : _GEN_7; // @[LoadUnit.scala 285:46 288:13]
  wire [9:0] _GEN_133 = lfsrc_intloadFirstIssue_select ? io_in_bits_uop_cf_foldpc : 10'h0; // @[LoadUnit.scala 285:46 289:12]
  wire  _GEN_155 = lfsrc_intloadFirstIssue_select & io_in_bits_uop_cf_trigger_backendEn_1; // @[LoadUnit.scala 285:46 289:12]
  wire  _GEN_170 = lfsrc_intloadFirstIssue_select & io_in_bits_uop_cf_waitForRobIdx_flag; // @[LoadUnit.scala 285:46 289:12]
  wire [4:0] _GEN_171 = lfsrc_intloadFirstIssue_select ? io_in_bits_uop_cf_waitForRobIdx_value : 5'h0; // @[LoadUnit.scala 285:46 289:12]
  wire  _GEN_172 = lfsrc_intloadFirstIssue_select & io_in_bits_uop_cf_loadWaitBit; // @[LoadUnit.scala 285:46 289:12]
  wire  _GEN_173 = lfsrc_intloadFirstIssue_select & io_in_bits_uop_cf_loadWaitStrict; // @[LoadUnit.scala 285:46 289:12]
  wire  _GEN_175 = lfsrc_intloadFirstIssue_select & io_in_bits_uop_cf_ftqPtr_flag; // @[LoadUnit.scala 285:46 289:12]
  wire [2:0] _GEN_176 = lfsrc_intloadFirstIssue_select ? io_in_bits_uop_cf_ftqPtr_value : 3'h0; // @[LoadUnit.scala 285:46 289:12]
  wire [2:0] _GEN_177 = lfsrc_intloadFirstIssue_select ? io_in_bits_uop_cf_ftqOffset : 3'h0; // @[LoadUnit.scala 285:46 289:12]
  wire [3:0] _GEN_186 = lfsrc_intloadFirstIssue_select ? io_in_bits_uop_ctrl_fuType : 4'h0; // @[LoadUnit.scala 285:46 289:12]
  wire  _GEN_188 = lfsrc_intloadFirstIssue_select & io_in_bits_uop_ctrl_rfWen; // @[LoadUnit.scala 285:46 289:12]
  wire  _GEN_189 = lfsrc_intloadFirstIssue_select & io_in_bits_uop_ctrl_fpWen; // @[LoadUnit.scala 285:46 289:12]
  wire [5:0] _GEN_220 = lfsrc_intloadFirstIssue_select ? io_in_bits_uop_pdest : 6'h0; // @[LoadUnit.scala 285:46 289:12]
  wire  _GEN_222 = lfsrc_intloadFirstIssue_select & io_in_bits_uop_robIdx_flag; // @[LoadUnit.scala 285:46 289:12]
  wire [4:0] _GEN_223 = lfsrc_intloadFirstIssue_select ? io_in_bits_uop_robIdx_value : 5'h0; // @[LoadUnit.scala 285:46 289:12]
  wire  _GEN_224 = lfsrc_intloadFirstIssue_select & io_in_bits_uop_lqIdx_flag; // @[LoadUnit.scala 285:46 289:12]
  wire [3:0] _GEN_225 = lfsrc_intloadFirstIssue_select ? io_in_bits_uop_lqIdx_value : 4'h0; // @[LoadUnit.scala 285:46 289:12]
  wire  _GEN_226 = lfsrc_intloadFirstIssue_select & io_in_bits_uop_sqIdx_flag; // @[LoadUnit.scala 285:46 289:12]
  wire [3:0] _GEN_227 = lfsrc_intloadFirstIssue_select ? io_in_bits_uop_sqIdx_value : 4'h0; // @[LoadUnit.scala 285:46 289:12]
  wire  _GEN_240 = lfsrc_intloadFirstIssue_select | lfsrc_vecloadFirstIssue_select; // @[LoadUnit.scala 285:46 292:15]
  wire  _GEN_242 = lfsrc_intloadFirstIssue_select ? 1'h0 : lfsrc_vecloadFirstIssue_select; // @[LoadUnit.scala 285:46]
  wire [22:0] _GEN_254 = isHWPrefetch ? 23'h0 : _GEN_130; // @[LoadUnit.scala 272:39 275:13]
  wire  _GEN_363 = isHWPrefetch ? 1'h0 : 1'h1; // @[LoadUnit.scala 272:39 277:21]
  wire  _GEN_369 = isHWPrefetch ? 1'h0 : _GEN_240; // @[LoadUnit.scala 257:13 272:39]
  wire  _GEN_370 = isHWPrefetch ? 1'h0 : _GEN_242; // @[LoadUnit.scala 272:39]
  wire [22:0] _GEN_382 = lfsrc_loadReplay_select ? {{8'd0}, _s0_mask_T_13} : _GEN_254; // @[LoadUnit.scala 261:33 263:13]
  wire  s0_fromPreFetch = lfsrc_loadReplay_select ? 1'h0 : isHWPrefetch; // @[LoadUnit.scala 258:19 261:33]
  wire  s0_fromRs = lfsrc_loadReplay_select ? 1'h0 : _GEN_369; // @[LoadUnit.scala 257:13 261:33]
  wire  _addrAligned_T_2 = ~s0_vaddr[0]; // @[LoadUnit.scala 333:34]
  wire  _addrAligned_T_4 = s0_vaddr[1:0] == 2'h0; // @[LoadUnit.scala 334:34]
  wire  _addrAligned_T_6 = s0_vaddr[2:0] == 3'h0; // @[LoadUnit.scala 335:34]
  wire  _addrAligned_T_7 = 2'h0 == s0_uop_ctrl_fuOpType[1:0]; // @[LookupTree.scala 24:34]
  wire  _addrAligned_T_8 = 2'h1 == s0_uop_ctrl_fuOpType[1:0]; // @[LookupTree.scala 24:34]
  wire  _addrAligned_T_9 = 2'h2 == s0_uop_ctrl_fuOpType[1:0]; // @[LookupTree.scala 24:34]
  wire  _addrAligned_T_10 = 2'h3 == s0_uop_ctrl_fuOpType[1:0]; // @[LookupTree.scala 24:34]
  wire  addrAligned = _addrAligned_T_7 | _addrAligned_T_8 & _addrAligned_T_2 | _addrAligned_T_9 & _addrAligned_T_4 |
    _addrAligned_T_10 & _addrAligned_T_6; // @[Mux.scala 27:73]
  assign io_in_ready = io_dcacheReq_ready & lfsrc_intloadFirstIssue_select; // @[LoadUnit.scala 392:54]
  assign io_vec_in_ready = io_dcacheReq_ready & lfsrc_vecloadFirstIssue_select & _s0_replayShouldWait_T_2; // @[LoadUnit.scala 395:92]
  assign io_out_valid = s0_valid & io_dcacheReq_ready & ~io_s0_kill & (~s0_fromRs | s0_fromPreFetch | s0_fromRs &
    _s0_replayShouldWait_T_2); // @[LoadUnit.scala 341:65]
  assign io_out_bits_uop_cf_foldpc = lfsrc_loadReplay_select ? io_replay_bits_uop_cf_foldpc : _GEN_133; // @[LoadUnit.scala 261:33 264:12]
  assign io_out_bits_uop_cf_exceptionVec_4 = ~addrAligned; // @[LoadUnit.scala 346:58]
  assign io_out_bits_uop_cf_trigger_backendEn_1 = lfsrc_loadReplay_select ? io_replay_bits_uop_cf_trigger_backendEn_1 :
    _GEN_155; // @[LoadUnit.scala 261:33 264:12]
  assign io_out_bits_uop_cf_trigger_backendHit_0 = lfsrc_loadReplay_select & io_replay_bits_uop_cf_trigger_backendHit_0; // @[LoadUnit.scala 261:33 264:12]
  assign io_out_bits_uop_cf_trigger_backendHit_1 = lfsrc_loadReplay_select & io_replay_bits_uop_cf_trigger_backendHit_1; // @[LoadUnit.scala 261:33 264:12]
  assign io_out_bits_uop_cf_trigger_backendHit_4 = lfsrc_loadReplay_select & io_replay_bits_uop_cf_trigger_backendHit_4; // @[LoadUnit.scala 261:33 264:12]
  assign io_out_bits_uop_cf_waitForRobIdx_flag = lfsrc_loadReplay_select ? io_replay_bits_uop_cf_waitForRobIdx_flag :
    _GEN_170; // @[LoadUnit.scala 261:33 264:12]
  assign io_out_bits_uop_cf_waitForRobIdx_value = lfsrc_loadReplay_select ? io_replay_bits_uop_cf_waitForRobIdx_value :
    _GEN_171; // @[LoadUnit.scala 261:33 264:12]
  assign io_out_bits_uop_cf_loadWaitBit = lfsrc_loadReplay_select ? io_replay_bits_uop_cf_loadWaitBit : _GEN_172; // @[LoadUnit.scala 261:33 264:12]
  assign io_out_bits_uop_cf_loadWaitStrict = lfsrc_loadReplay_select ? io_replay_bits_uop_cf_loadWaitStrict : _GEN_173; // @[LoadUnit.scala 261:33 264:12]
  assign io_out_bits_uop_cf_ftqPtr_flag = lfsrc_loadReplay_select ? io_replay_bits_uop_cf_ftqPtr_flag : _GEN_175; // @[LoadUnit.scala 261:33 264:12]
  assign io_out_bits_uop_cf_ftqPtr_value = lfsrc_loadReplay_select ? io_replay_bits_uop_cf_ftqPtr_value : _GEN_176; // @[LoadUnit.scala 261:33 264:12]
  assign io_out_bits_uop_cf_ftqOffset = lfsrc_loadReplay_select ? io_replay_bits_uop_cf_ftqOffset : _GEN_177; // @[LoadUnit.scala 261:33 264:12]
  assign io_out_bits_uop_ctrl_fuType = lfsrc_loadReplay_select ? io_replay_bits_uop_ctrl_fuType : _GEN_186; // @[LoadUnit.scala 261:33 264:12]
  assign io_out_bits_uop_ctrl_fuOpType = lfsrc_loadReplay_select ? io_replay_bits_uop_ctrl_fuOpType : _GEN_187; // @[LoadUnit.scala 261:33 264:12]
  assign io_out_bits_uop_ctrl_rfWen = lfsrc_loadReplay_select ? io_replay_bits_uop_ctrl_rfWen : _GEN_188; // @[LoadUnit.scala 261:33 264:12]
  assign io_out_bits_uop_ctrl_fpWen = lfsrc_loadReplay_select ? io_replay_bits_uop_ctrl_fpWen : _GEN_189; // @[LoadUnit.scala 261:33 264:12]
  assign io_out_bits_uop_pdest = lfsrc_loadReplay_select ? io_replay_bits_uop_pdest : _GEN_220; // @[LoadUnit.scala 261:33 264:12]
  assign io_out_bits_uop_robIdx_flag = lfsrc_loadReplay_select ? io_replay_bits_uop_robIdx_flag : _GEN_222; // @[LoadUnit.scala 261:33 264:12]
  assign io_out_bits_uop_robIdx_value = lfsrc_loadReplay_select ? io_replay_bits_uop_robIdx_value : _GEN_223; // @[LoadUnit.scala 261:33 264:12]
  assign io_out_bits_uop_lqIdx_flag = lfsrc_loadReplay_select ? io_replay_bits_uop_lqIdx_flag : _GEN_224; // @[LoadUnit.scala 261:33 264:12]
  assign io_out_bits_uop_lqIdx_value = lfsrc_loadReplay_select ? io_replay_bits_uop_lqIdx_value : _GEN_225; // @[LoadUnit.scala 261:33 264:12]
  assign io_out_bits_uop_sqIdx_flag = lfsrc_loadReplay_select ? io_replay_bits_uop_sqIdx_flag : _GEN_226; // @[LoadUnit.scala 261:33 264:12]
  assign io_out_bits_uop_sqIdx_value = lfsrc_loadReplay_select ? io_replay_bits_uop_sqIdx_value : _GEN_227; // @[LoadUnit.scala 261:33 264:12]
  assign io_out_bits_vaddr = _GEN_381[38:0]; // @[LoadUnit.scala 114:22]
  assign io_out_bits_mask = _GEN_382[15:0]; // @[LoadUnit.scala 115:21]
  assign io_out_bits_isPrefetch = lfsrc_loadReplay_select ? replayUopIsPrefetch : _GEN_366; // @[LoadUnit.scala 261:33]
  assign io_out_bits_isHWPrefetch = isHWPrefetch; // @[LoadUnit.scala 349:28]
  assign io_out_bits_vec128bit = lfsrc_loadReplay_select ? 1'h0 : _GEN_370; // @[LoadUnit.scala 261:33]
  assign io_out_bits_isFirstIssue = lfsrc_loadReplay_select ? io_replay_bits_isFirstIssue : _GEN_363; // @[LoadUnit.scala 261:33 265:21]
  assign io_out_bits_mshrid = io_replay_bits_mshrid; // @[LoadUnit.scala 359:22]
  assign io_out_bits_forward_tlDchannel = io_replay_valid & io_replay_bits_forward_tlDchannel; // @[LoadUnit.scala 360:53]
  assign io_out_bits_rarAllocated = lfsrc_loadReplay_select & io_replay_bits_rarAllocated; // @[LoadUnit.scala 366:55]
  assign io_out_bits_rarIndex = io_replay_bits_rarIndex; // @[LoadUnit.scala 367:24]
  assign io_out_bits_rawAllocated = lfsrc_loadReplay_select & io_replay_bits_rawAllocated; // @[LoadUnit.scala 368:55]
  assign io_out_bits_rawIndex = io_replay_bits_rawIndex; // @[LoadUnit.scala 369:24]
  assign io_dtlbReq_valid = _s0_valid_T_3 | _lfsrc1_highconfhwPrefetch_valid_T; // @[LoadUnit.scala 205:29]
  assign io_dtlbReq_bits_vaddr = isHWPrefetch ? 39'h0 : s0_vaddr; // @[LoadUnit.scala 217:31]
  assign io_dtlbReq_bits_cmd = {{2'd0}, _io_dtlbReq_bits_cmd_T_1}; // @[LoadUnit.scala 218:23]
  assign io_dtlbReq_bits_no_translate = isHWPrefetch; // @[LoadUnit.scala 229:32]
  assign io_dcacheReq_valid = _s0_valid_T_3 | _lfsrc1_highconfhwPrefetch_valid_T; // @[LoadUnit.scala 205:29]
  assign io_dcacheReq_bits_cmd = {{3'd0}, _GEN_1};
  assign io_dcacheReq_bits_addr = s0_vaddr[35:0]; // @[LoadUnit.scala 242:26]
  assign io_dcacheReq_bits_instrtype = {{2'd0}, _GEN_2};
  assign io_dcacheReq_bits_replayCarry_real_way_en = lfsrc_loadReplay_select ? io_replay_bits_replayCarry_real_way_en : 8'h0
    ; // @[LoadUnit.scala 261:33 267:20]
  assign io_dcacheReq_bits_replayCarry_valid = lfsrc_loadReplay_select & io_replay_bits_replayCarry_valid; // @[LoadUnit.scala 261:33 267:20]
  assign io_replay_ready = io_dcacheReq_ready & _lfsrc5_lowconfhwPrefetch_valid_T & _lfsrc0_loadReplay_valid_T; // @[LoadUnit.scala 374:84]
  assign io_s0_sqIdx_value = lfsrc_loadReplay_select ? io_replay_bits_uop_sqIdx_value : _GEN_227; // @[LoadUnit.scala 261:33 264:12]
  assign io_l2lForward_select = lfsrc_l2lForward_select; // @[LoadUnit.scala 198:24]
endmodule

