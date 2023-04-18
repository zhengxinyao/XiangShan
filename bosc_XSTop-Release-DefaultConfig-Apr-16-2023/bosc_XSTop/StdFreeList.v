module StdFreeList(
  input        clock,
  input        reset,
  input        io_redirect,
  input        io_walk,
  input        io_allocateReq_0,
  input        io_allocateReq_1,
  output [5:0] io_allocatePhyReg_0,
  output [5:0] io_allocatePhyReg_1,
  output       io_canAllocate,
  input        io_doAllocate,
  input        io_freeReq_0,
  input        io_freeReq_1,
  input  [5:0] io_freePhyReg_0,
  input  [5:0] io_freePhyReg_1,
  input        io_commit_isCommit,
  input        io_commit_commitValid_0,
  input        io_commit_commitValid_1,
  input        io_commit_info_0_fpWen,
  input        io_commit_info_1_fpWen,
  output [5:0] io_perf_0_value,
  output [5:0] io_perf_1_value,
  output [5:0] io_perf_2_value,
  output [5:0] io_perf_3_value
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
`endif // RANDOMIZE_REG_INIT
  reg [5:0] freeList_0; // @[StdFreeList.scala 29:25]
  reg [5:0] freeList_1; // @[StdFreeList.scala 29:25]
  reg [5:0] freeList_2; // @[StdFreeList.scala 29:25]
  reg [5:0] freeList_3; // @[StdFreeList.scala 29:25]
  reg [5:0] freeList_4; // @[StdFreeList.scala 29:25]
  reg [5:0] freeList_5; // @[StdFreeList.scala 29:25]
  reg [5:0] freeList_6; // @[StdFreeList.scala 29:25]
  reg [5:0] freeList_7; // @[StdFreeList.scala 29:25]
  reg [5:0] freeList_8; // @[StdFreeList.scala 29:25]
  reg [5:0] freeList_9; // @[StdFreeList.scala 29:25]
  reg [5:0] freeList_10; // @[StdFreeList.scala 29:25]
  reg [5:0] freeList_11; // @[StdFreeList.scala 29:25]
  reg [5:0] freeList_12; // @[StdFreeList.scala 29:25]
  reg [5:0] freeList_13; // @[StdFreeList.scala 29:25]
  reg [5:0] freeList_14; // @[StdFreeList.scala 29:25]
  reg [5:0] freeList_15; // @[StdFreeList.scala 29:25]
  reg [5:0] freeList_16; // @[StdFreeList.scala 29:25]
  reg [5:0] freeList_17; // @[StdFreeList.scala 29:25]
  reg [5:0] freeList_18; // @[StdFreeList.scala 29:25]
  reg [5:0] freeList_19; // @[StdFreeList.scala 29:25]
  reg [5:0] freeList_20; // @[StdFreeList.scala 29:25]
  reg [5:0] freeList_21; // @[StdFreeList.scala 29:25]
  reg [5:0] freeList_22; // @[StdFreeList.scala 29:25]
  reg [5:0] freeList_23; // @[StdFreeList.scala 29:25]
  reg [5:0] freeList_24; // @[StdFreeList.scala 29:25]
  reg [5:0] freeList_25; // @[StdFreeList.scala 29:25]
  reg [5:0] freeList_26; // @[StdFreeList.scala 29:25]
  reg [5:0] freeList_27; // @[StdFreeList.scala 29:25]
  reg [5:0] freeList_28; // @[StdFreeList.scala 29:25]
  reg [5:0] freeList_29; // @[StdFreeList.scala 29:25]
  reg [5:0] freeList_30; // @[StdFreeList.scala 29:25]
  reg [5:0] freeList_31; // @[StdFreeList.scala 29:25]
  reg  headPtr_flag; // @[StdFreeList.scala 30:25]
  reg [4:0] headPtr_value; // @[StdFreeList.scala 30:25]
  reg [31:0] headPtrOH; // @[StdFreeList.scala 31:26]
  wire [31:0] headPtrOHVec_1 = {headPtrOH[30:0],headPtrOH[31]}; // @[Cat.scala 31:58]
  wire [31:0] headPtrOHVec_2 = {headPtrOH[29:0],headPtrOH[31:30]}; // @[Cat.scala 31:58]
  reg  lastTailPtr_flag; // @[StdFreeList.scala 36:28]
  reg [4:0] lastTailPtr_value; // @[StdFreeList.scala 36:28]
  reg  archHeadPtr_flag; // @[StdFreeList.scala 39:28]
  reg [4:0] archHeadPtr_value; // @[StdFreeList.scala 39:28]
  reg [31:0] archHeadPtrOH; // @[StdFreeList.scala 40:30]
  wire [31:0] archHeadPtrOHVec_1 = {archHeadPtrOH[30:0],archHeadPtrOH[31]}; // @[Cat.scala 31:58]
  wire [31:0] archHeadPtrOHVec_2 = {archHeadPtrOH[29:0],archHeadPtrOH[31:30]}; // @[Cat.scala 31:58]
  reg  freeReqReg_0; // @[StdFreeList.scala 48:27]
  reg  freeReqReg_1; // @[StdFreeList.scala 48:27]
  wire [5:0] _enqPtr_new_ptr_T = {lastTailPtr_flag,lastTailPtr_value}; // @[Cat.scala 31:58]
  wire [6:0] _enqPtr_new_ptr_T_1 = {{1'd0}, _enqPtr_new_ptr_T}; // @[CircularQueuePtr.scala 39:46]
  wire [4:0] enqPtr_value = _enqPtr_new_ptr_T_1[4:0]; // @[CircularQueuePtr.scala 39:59]
  reg [5:0] freeList_REG; // @[StdFreeList.scala 57:40]
  wire [5:0] _GEN_0 = 5'h0 == enqPtr_value ? freeList_REG : freeList_0; // @[StdFreeList.scala 29:25 57:{30,30}]
  wire [5:0] _GEN_1 = 5'h1 == enqPtr_value ? freeList_REG : freeList_1; // @[StdFreeList.scala 29:25 57:{30,30}]
  wire [5:0] _GEN_2 = 5'h2 == enqPtr_value ? freeList_REG : freeList_2; // @[StdFreeList.scala 29:25 57:{30,30}]
  wire [5:0] _GEN_3 = 5'h3 == enqPtr_value ? freeList_REG : freeList_3; // @[StdFreeList.scala 29:25 57:{30,30}]
  wire [5:0] _GEN_4 = 5'h4 == enqPtr_value ? freeList_REG : freeList_4; // @[StdFreeList.scala 29:25 57:{30,30}]
  wire [5:0] _GEN_5 = 5'h5 == enqPtr_value ? freeList_REG : freeList_5; // @[StdFreeList.scala 29:25 57:{30,30}]
  wire [5:0] _GEN_6 = 5'h6 == enqPtr_value ? freeList_REG : freeList_6; // @[StdFreeList.scala 29:25 57:{30,30}]
  wire [5:0] _GEN_7 = 5'h7 == enqPtr_value ? freeList_REG : freeList_7; // @[StdFreeList.scala 29:25 57:{30,30}]
  wire [5:0] _GEN_8 = 5'h8 == enqPtr_value ? freeList_REG : freeList_8; // @[StdFreeList.scala 29:25 57:{30,30}]
  wire [5:0] _GEN_9 = 5'h9 == enqPtr_value ? freeList_REG : freeList_9; // @[StdFreeList.scala 29:25 57:{30,30}]
  wire [5:0] _GEN_10 = 5'ha == enqPtr_value ? freeList_REG : freeList_10; // @[StdFreeList.scala 29:25 57:{30,30}]
  wire [5:0] _GEN_11 = 5'hb == enqPtr_value ? freeList_REG : freeList_11; // @[StdFreeList.scala 29:25 57:{30,30}]
  wire [5:0] _GEN_12 = 5'hc == enqPtr_value ? freeList_REG : freeList_12; // @[StdFreeList.scala 29:25 57:{30,30}]
  wire [5:0] _GEN_13 = 5'hd == enqPtr_value ? freeList_REG : freeList_13; // @[StdFreeList.scala 29:25 57:{30,30}]
  wire [5:0] _GEN_14 = 5'he == enqPtr_value ? freeList_REG : freeList_14; // @[StdFreeList.scala 29:25 57:{30,30}]
  wire [5:0] _GEN_15 = 5'hf == enqPtr_value ? freeList_REG : freeList_15; // @[StdFreeList.scala 29:25 57:{30,30}]
  wire [5:0] _GEN_16 = 5'h10 == enqPtr_value ? freeList_REG : freeList_16; // @[StdFreeList.scala 29:25 57:{30,30}]
  wire [5:0] _GEN_17 = 5'h11 == enqPtr_value ? freeList_REG : freeList_17; // @[StdFreeList.scala 29:25 57:{30,30}]
  wire [5:0] _GEN_18 = 5'h12 == enqPtr_value ? freeList_REG : freeList_18; // @[StdFreeList.scala 29:25 57:{30,30}]
  wire [5:0] _GEN_19 = 5'h13 == enqPtr_value ? freeList_REG : freeList_19; // @[StdFreeList.scala 29:25 57:{30,30}]
  wire [5:0] _GEN_20 = 5'h14 == enqPtr_value ? freeList_REG : freeList_20; // @[StdFreeList.scala 29:25 57:{30,30}]
  wire [5:0] _GEN_21 = 5'h15 == enqPtr_value ? freeList_REG : freeList_21; // @[StdFreeList.scala 29:25 57:{30,30}]
  wire [5:0] _GEN_22 = 5'h16 == enqPtr_value ? freeList_REG : freeList_22; // @[StdFreeList.scala 29:25 57:{30,30}]
  wire [5:0] _GEN_23 = 5'h17 == enqPtr_value ? freeList_REG : freeList_23; // @[StdFreeList.scala 29:25 57:{30,30}]
  wire [5:0] _GEN_24 = 5'h18 == enqPtr_value ? freeList_REG : freeList_24; // @[StdFreeList.scala 29:25 57:{30,30}]
  wire [5:0] _GEN_25 = 5'h19 == enqPtr_value ? freeList_REG : freeList_25; // @[StdFreeList.scala 29:25 57:{30,30}]
  wire [5:0] _GEN_26 = 5'h1a == enqPtr_value ? freeList_REG : freeList_26; // @[StdFreeList.scala 29:25 57:{30,30}]
  wire [5:0] _GEN_27 = 5'h1b == enqPtr_value ? freeList_REG : freeList_27; // @[StdFreeList.scala 29:25 57:{30,30}]
  wire [5:0] _GEN_28 = 5'h1c == enqPtr_value ? freeList_REG : freeList_28; // @[StdFreeList.scala 29:25 57:{30,30}]
  wire [5:0] _GEN_29 = 5'h1d == enqPtr_value ? freeList_REG : freeList_29; // @[StdFreeList.scala 29:25 57:{30,30}]
  wire [5:0] _GEN_30 = 5'h1e == enqPtr_value ? freeList_REG : freeList_30; // @[StdFreeList.scala 29:25 57:{30,30}]
  wire [5:0] _GEN_31 = 5'h1f == enqPtr_value ? freeList_REG : freeList_31; // @[StdFreeList.scala 29:25 57:{30,30}]
  wire [5:0] _GEN_32 = freeReqReg_0 ? _GEN_0 : freeList_0; // @[StdFreeList.scala 29:25 56:26]
  wire [5:0] _GEN_33 = freeReqReg_0 ? _GEN_1 : freeList_1; // @[StdFreeList.scala 29:25 56:26]
  wire [5:0] _GEN_34 = freeReqReg_0 ? _GEN_2 : freeList_2; // @[StdFreeList.scala 29:25 56:26]
  wire [5:0] _GEN_35 = freeReqReg_0 ? _GEN_3 : freeList_3; // @[StdFreeList.scala 29:25 56:26]
  wire [5:0] _GEN_36 = freeReqReg_0 ? _GEN_4 : freeList_4; // @[StdFreeList.scala 29:25 56:26]
  wire [5:0] _GEN_37 = freeReqReg_0 ? _GEN_5 : freeList_5; // @[StdFreeList.scala 29:25 56:26]
  wire [5:0] _GEN_38 = freeReqReg_0 ? _GEN_6 : freeList_6; // @[StdFreeList.scala 29:25 56:26]
  wire [5:0] _GEN_39 = freeReqReg_0 ? _GEN_7 : freeList_7; // @[StdFreeList.scala 29:25 56:26]
  wire [5:0] _GEN_40 = freeReqReg_0 ? _GEN_8 : freeList_8; // @[StdFreeList.scala 29:25 56:26]
  wire [5:0] _GEN_41 = freeReqReg_0 ? _GEN_9 : freeList_9; // @[StdFreeList.scala 29:25 56:26]
  wire [5:0] _GEN_42 = freeReqReg_0 ? _GEN_10 : freeList_10; // @[StdFreeList.scala 29:25 56:26]
  wire [5:0] _GEN_43 = freeReqReg_0 ? _GEN_11 : freeList_11; // @[StdFreeList.scala 29:25 56:26]
  wire [5:0] _GEN_44 = freeReqReg_0 ? _GEN_12 : freeList_12; // @[StdFreeList.scala 29:25 56:26]
  wire [5:0] _GEN_45 = freeReqReg_0 ? _GEN_13 : freeList_13; // @[StdFreeList.scala 29:25 56:26]
  wire [5:0] _GEN_46 = freeReqReg_0 ? _GEN_14 : freeList_14; // @[StdFreeList.scala 29:25 56:26]
  wire [5:0] _GEN_47 = freeReqReg_0 ? _GEN_15 : freeList_15; // @[StdFreeList.scala 29:25 56:26]
  wire [5:0] _GEN_48 = freeReqReg_0 ? _GEN_16 : freeList_16; // @[StdFreeList.scala 29:25 56:26]
  wire [5:0] _GEN_49 = freeReqReg_0 ? _GEN_17 : freeList_17; // @[StdFreeList.scala 29:25 56:26]
  wire [5:0] _GEN_50 = freeReqReg_0 ? _GEN_18 : freeList_18; // @[StdFreeList.scala 29:25 56:26]
  wire [5:0] _GEN_51 = freeReqReg_0 ? _GEN_19 : freeList_19; // @[StdFreeList.scala 29:25 56:26]
  wire [5:0] _GEN_52 = freeReqReg_0 ? _GEN_20 : freeList_20; // @[StdFreeList.scala 29:25 56:26]
  wire [5:0] _GEN_53 = freeReqReg_0 ? _GEN_21 : freeList_21; // @[StdFreeList.scala 29:25 56:26]
  wire [5:0] _GEN_54 = freeReqReg_0 ? _GEN_22 : freeList_22; // @[StdFreeList.scala 29:25 56:26]
  wire [5:0] _GEN_55 = freeReqReg_0 ? _GEN_23 : freeList_23; // @[StdFreeList.scala 29:25 56:26]
  wire [5:0] _GEN_56 = freeReqReg_0 ? _GEN_24 : freeList_24; // @[StdFreeList.scala 29:25 56:26]
  wire [5:0] _GEN_57 = freeReqReg_0 ? _GEN_25 : freeList_25; // @[StdFreeList.scala 29:25 56:26]
  wire [5:0] _GEN_58 = freeReqReg_0 ? _GEN_26 : freeList_26; // @[StdFreeList.scala 29:25 56:26]
  wire [5:0] _GEN_59 = freeReqReg_0 ? _GEN_27 : freeList_27; // @[StdFreeList.scala 29:25 56:26]
  wire [5:0] _GEN_60 = freeReqReg_0 ? _GEN_28 : freeList_28; // @[StdFreeList.scala 29:25 56:26]
  wire [5:0] _GEN_61 = freeReqReg_0 ? _GEN_29 : freeList_29; // @[StdFreeList.scala 29:25 56:26]
  wire [5:0] _GEN_62 = freeReqReg_0 ? _GEN_30 : freeList_30; // @[StdFreeList.scala 29:25 56:26]
  wire [5:0] _GEN_63 = freeReqReg_0 ? _GEN_31 : freeList_31; // @[StdFreeList.scala 29:25 56:26]
  wire [5:0] _GEN_137 = {{5'd0}, freeReqReg_0}; // @[CircularQueuePtr.scala 39:46]
  wire [5:0] _enqPtr_new_ptr_T_7 = _enqPtr_new_ptr_T + _GEN_137; // @[CircularQueuePtr.scala 39:46]
  wire [4:0] enqPtr_1_value = _enqPtr_new_ptr_T_7[4:0]; // @[CircularQueuePtr.scala 39:59]
  reg [5:0] freeList_REG_1; // @[StdFreeList.scala 57:40]
  wire [1:0] _tailPtr_T = freeReqReg_0 + freeReqReg_1; // @[Bitwise.scala 48:55]
  wire [5:0] _GEN_138 = {{4'd0}, _tailPtr_T}; // @[CircularQueuePtr.scala 39:46]
  wire [5:0] _tailPtr_new_ptr_T_2 = _enqPtr_new_ptr_T + _GEN_138; // @[CircularQueuePtr.scala 39:46]
  wire [4:0] tailPtr_new_ptr_value = _tailPtr_new_ptr_T_2[4:0]; // @[CircularQueuePtr.scala 39:59]
  wire  tailPtr_new_ptr_flag = _tailPtr_new_ptr_T_2[5]; // @[CircularQueuePtr.scala 39:59]
  wire [5:0] _archHeadPtrNew_new_ptr_T = {archHeadPtr_flag,archHeadPtr_value}; // @[Cat.scala 31:58]
  wire  archAlloc_0 = io_commit_commitValid_0 & io_commit_info_0_fpWen; // @[StdFreeList.scala 79:94]
  wire  archAlloc_1 = io_commit_commitValid_1 & io_commit_info_1_fpWen; // @[StdFreeList.scala 79:94]
  wire [1:0] numArchAllocate = archAlloc_0 + archAlloc_1; // @[Bitwise.scala 48:55]
  wire [5:0] _GEN_139 = {{4'd0}, numArchAllocate}; // @[CircularQueuePtr.scala 39:46]
  wire [5:0] _archHeadPtrNew_new_ptr_T_2 = _archHeadPtrNew_new_ptr_T + _GEN_139; // @[CircularQueuePtr.scala 39:46]
  wire  archHeadPtrNew_flag = _archHeadPtrNew_new_ptr_T_2[5]; // @[CircularQueuePtr.scala 39:59]
  wire  archHeadPtrNext_flag = io_commit_isCommit ? archHeadPtrNew_flag : archHeadPtr_flag; // @[StdFreeList.scala 83:30]
  wire [4:0] archHeadPtrNew_value = _archHeadPtrNew_new_ptr_T_2[4:0]; // @[CircularQueuePtr.scala 39:59]
  wire [4:0] archHeadPtrNext_value = io_commit_isCommit ? archHeadPtrNew_value : archHeadPtr_value; // @[StdFreeList.scala 83:30]
  wire [4:0] _freeRegCnt_T_2 = tailPtr_new_ptr_value - archHeadPtrNext_value; // @[CircularQueuePtr.scala 81:21]
  wire [5:0] _GEN_140 = {{1'd0}, tailPtr_new_ptr_value}; // @[CircularQueuePtr.scala 82:25]
  wire [5:0] _freeRegCnt_T_4 = 6'h20 + _GEN_140; // @[CircularQueuePtr.scala 82:25]
  wire [5:0] _GEN_141 = {{1'd0}, archHeadPtrNext_value}; // @[CircularQueuePtr.scala 82:41]
  wire [5:0] _freeRegCnt_T_6 = _freeRegCnt_T_4 - _GEN_141; // @[CircularQueuePtr.scala 82:41]
  wire [5:0] _freeRegCnt_T_7 = tailPtr_new_ptr_flag == archHeadPtrNext_flag ? {{1'd0}, _freeRegCnt_T_2} :
    _freeRegCnt_T_6; // @[CircularQueuePtr.scala 80:8]
  wire  isAllocate = (io_canAllocate | io_walk) & io_doAllocate; // @[StdFreeList.scala 88:48]
  wire [5:0] _headPtrAllocate_new_ptr_T = {headPtr_flag,headPtr_value}; // @[Cat.scala 31:58]
  wire [1:0] numAllocate = io_allocateReq_0 + io_allocateReq_1; // @[Bitwise.scala 48:55]
  wire [5:0] _GEN_142 = {{4'd0}, numAllocate}; // @[CircularQueuePtr.scala 39:46]
  wire [5:0] _headPtrAllocate_new_ptr_T_2 = _headPtrAllocate_new_ptr_T + _GEN_142; // @[CircularQueuePtr.scala 39:46]
  wire  headPtrAllocate_flag = _headPtrAllocate_new_ptr_T_2[5]; // @[CircularQueuePtr.scala 39:59]
  wire  headPtrNext_flag = isAllocate ? headPtrAllocate_flag : headPtr_flag; // @[StdFreeList.scala 91:24]
  wire [4:0] headPtrAllocate_value = _headPtrAllocate_new_ptr_T_2[4:0]; // @[CircularQueuePtr.scala 39:59]
  wire [4:0] headPtrNext_value = isAllocate ? headPtrAllocate_value : headPtr_value; // @[StdFreeList.scala 91:24]
  wire [4:0] _freeRegCnt_T_10 = tailPtr_new_ptr_value - headPtrNext_value; // @[CircularQueuePtr.scala 81:21]
  wire [5:0] _GEN_144 = {{1'd0}, headPtrNext_value}; // @[CircularQueuePtr.scala 82:41]
  wire [5:0] _freeRegCnt_T_14 = _freeRegCnt_T_4 - _GEN_144; // @[CircularQueuePtr.scala 82:41]
  wire [5:0] _freeRegCnt_T_15 = tailPtr_new_ptr_flag == headPtrNext_flag ? {{1'd0}, _freeRegCnt_T_10} : _freeRegCnt_T_14
    ; // @[CircularQueuePtr.scala 80:8]
  wire [5:0] freeRegCnt = io_redirect ? _freeRegCnt_T_7 : _freeRegCnt_T_15; // @[StdFreeList.scala 92:20]
  reg  io_canAllocate_REG; // @[StdFreeList.scala 69:28]
  wire [5:0] _phyRegCandidates_T_32 = headPtrOH[0] ? freeList_0 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_33 = headPtrOH[1] ? freeList_1 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_34 = headPtrOH[2] ? freeList_2 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_35 = headPtrOH[3] ? freeList_3 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_36 = headPtrOH[4] ? freeList_4 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_37 = headPtrOH[5] ? freeList_5 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_38 = headPtrOH[6] ? freeList_6 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_39 = headPtrOH[7] ? freeList_7 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_40 = headPtrOH[8] ? freeList_8 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_41 = headPtrOH[9] ? freeList_9 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_42 = headPtrOH[10] ? freeList_10 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_43 = headPtrOH[11] ? freeList_11 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_44 = headPtrOH[12] ? freeList_12 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_45 = headPtrOH[13] ? freeList_13 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_46 = headPtrOH[14] ? freeList_14 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_47 = headPtrOH[15] ? freeList_15 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_48 = headPtrOH[16] ? freeList_16 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_49 = headPtrOH[17] ? freeList_17 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_50 = headPtrOH[18] ? freeList_18 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_51 = headPtrOH[19] ? freeList_19 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_52 = headPtrOH[20] ? freeList_20 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_53 = headPtrOH[21] ? freeList_21 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_54 = headPtrOH[22] ? freeList_22 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_55 = headPtrOH[23] ? freeList_23 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_56 = headPtrOH[24] ? freeList_24 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_57 = headPtrOH[25] ? freeList_25 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_58 = headPtrOH[26] ? freeList_26 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_59 = headPtrOH[27] ? freeList_27 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_60 = headPtrOH[28] ? freeList_28 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_61 = headPtrOH[29] ? freeList_29 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_62 = headPtrOH[30] ? freeList_30 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_63 = headPtrOH[31] ? freeList_31 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_64 = _phyRegCandidates_T_32 | _phyRegCandidates_T_33; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_65 = _phyRegCandidates_T_64 | _phyRegCandidates_T_34; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_66 = _phyRegCandidates_T_65 | _phyRegCandidates_T_35; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_67 = _phyRegCandidates_T_66 | _phyRegCandidates_T_36; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_68 = _phyRegCandidates_T_67 | _phyRegCandidates_T_37; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_69 = _phyRegCandidates_T_68 | _phyRegCandidates_T_38; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_70 = _phyRegCandidates_T_69 | _phyRegCandidates_T_39; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_71 = _phyRegCandidates_T_70 | _phyRegCandidates_T_40; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_72 = _phyRegCandidates_T_71 | _phyRegCandidates_T_41; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_73 = _phyRegCandidates_T_72 | _phyRegCandidates_T_42; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_74 = _phyRegCandidates_T_73 | _phyRegCandidates_T_43; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_75 = _phyRegCandidates_T_74 | _phyRegCandidates_T_44; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_76 = _phyRegCandidates_T_75 | _phyRegCandidates_T_45; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_77 = _phyRegCandidates_T_76 | _phyRegCandidates_T_46; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_78 = _phyRegCandidates_T_77 | _phyRegCandidates_T_47; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_79 = _phyRegCandidates_T_78 | _phyRegCandidates_T_48; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_80 = _phyRegCandidates_T_79 | _phyRegCandidates_T_49; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_81 = _phyRegCandidates_T_80 | _phyRegCandidates_T_50; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_82 = _phyRegCandidates_T_81 | _phyRegCandidates_T_51; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_83 = _phyRegCandidates_T_82 | _phyRegCandidates_T_52; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_84 = _phyRegCandidates_T_83 | _phyRegCandidates_T_53; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_85 = _phyRegCandidates_T_84 | _phyRegCandidates_T_54; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_86 = _phyRegCandidates_T_85 | _phyRegCandidates_T_55; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_87 = _phyRegCandidates_T_86 | _phyRegCandidates_T_56; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_88 = _phyRegCandidates_T_87 | _phyRegCandidates_T_57; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_89 = _phyRegCandidates_T_88 | _phyRegCandidates_T_58; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_90 = _phyRegCandidates_T_89 | _phyRegCandidates_T_59; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_91 = _phyRegCandidates_T_90 | _phyRegCandidates_T_60; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_92 = _phyRegCandidates_T_91 | _phyRegCandidates_T_61; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_93 = _phyRegCandidates_T_92 | _phyRegCandidates_T_62; // @[Mux.scala 27:73]
  wire [5:0] phyRegCandidates_0 = _phyRegCandidates_T_93 | _phyRegCandidates_T_63; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_127 = headPtrOHVec_1[0] ? freeList_0 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_128 = headPtrOHVec_1[1] ? freeList_1 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_129 = headPtrOHVec_1[2] ? freeList_2 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_130 = headPtrOHVec_1[3] ? freeList_3 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_131 = headPtrOHVec_1[4] ? freeList_4 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_132 = headPtrOHVec_1[5] ? freeList_5 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_133 = headPtrOHVec_1[6] ? freeList_6 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_134 = headPtrOHVec_1[7] ? freeList_7 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_135 = headPtrOHVec_1[8] ? freeList_8 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_136 = headPtrOHVec_1[9] ? freeList_9 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_137 = headPtrOHVec_1[10] ? freeList_10 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_138 = headPtrOHVec_1[11] ? freeList_11 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_139 = headPtrOHVec_1[12] ? freeList_12 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_140 = headPtrOHVec_1[13] ? freeList_13 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_141 = headPtrOHVec_1[14] ? freeList_14 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_142 = headPtrOHVec_1[15] ? freeList_15 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_143 = headPtrOHVec_1[16] ? freeList_16 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_144 = headPtrOHVec_1[17] ? freeList_17 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_145 = headPtrOHVec_1[18] ? freeList_18 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_146 = headPtrOHVec_1[19] ? freeList_19 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_147 = headPtrOHVec_1[20] ? freeList_20 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_148 = headPtrOHVec_1[21] ? freeList_21 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_149 = headPtrOHVec_1[22] ? freeList_22 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_150 = headPtrOHVec_1[23] ? freeList_23 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_151 = headPtrOHVec_1[24] ? freeList_24 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_152 = headPtrOHVec_1[25] ? freeList_25 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_153 = headPtrOHVec_1[26] ? freeList_26 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_154 = headPtrOHVec_1[27] ? freeList_27 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_155 = headPtrOHVec_1[28] ? freeList_28 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_156 = headPtrOHVec_1[29] ? freeList_29 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_157 = headPtrOHVec_1[30] ? freeList_30 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_158 = headPtrOHVec_1[31] ? freeList_31 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_159 = _phyRegCandidates_T_127 | _phyRegCandidates_T_128; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_160 = _phyRegCandidates_T_159 | _phyRegCandidates_T_129; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_161 = _phyRegCandidates_T_160 | _phyRegCandidates_T_130; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_162 = _phyRegCandidates_T_161 | _phyRegCandidates_T_131; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_163 = _phyRegCandidates_T_162 | _phyRegCandidates_T_132; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_164 = _phyRegCandidates_T_163 | _phyRegCandidates_T_133; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_165 = _phyRegCandidates_T_164 | _phyRegCandidates_T_134; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_166 = _phyRegCandidates_T_165 | _phyRegCandidates_T_135; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_167 = _phyRegCandidates_T_166 | _phyRegCandidates_T_136; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_168 = _phyRegCandidates_T_167 | _phyRegCandidates_T_137; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_169 = _phyRegCandidates_T_168 | _phyRegCandidates_T_138; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_170 = _phyRegCandidates_T_169 | _phyRegCandidates_T_139; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_171 = _phyRegCandidates_T_170 | _phyRegCandidates_T_140; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_172 = _phyRegCandidates_T_171 | _phyRegCandidates_T_141; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_173 = _phyRegCandidates_T_172 | _phyRegCandidates_T_142; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_174 = _phyRegCandidates_T_173 | _phyRegCandidates_T_143; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_175 = _phyRegCandidates_T_174 | _phyRegCandidates_T_144; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_176 = _phyRegCandidates_T_175 | _phyRegCandidates_T_145; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_177 = _phyRegCandidates_T_176 | _phyRegCandidates_T_146; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_178 = _phyRegCandidates_T_177 | _phyRegCandidates_T_147; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_179 = _phyRegCandidates_T_178 | _phyRegCandidates_T_148; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_180 = _phyRegCandidates_T_179 | _phyRegCandidates_T_149; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_181 = _phyRegCandidates_T_180 | _phyRegCandidates_T_150; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_182 = _phyRegCandidates_T_181 | _phyRegCandidates_T_151; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_183 = _phyRegCandidates_T_182 | _phyRegCandidates_T_152; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_184 = _phyRegCandidates_T_183 | _phyRegCandidates_T_153; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_185 = _phyRegCandidates_T_184 | _phyRegCandidates_T_154; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_186 = _phyRegCandidates_T_185 | _phyRegCandidates_T_155; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_187 = _phyRegCandidates_T_186 | _phyRegCandidates_T_156; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_188 = _phyRegCandidates_T_187 | _phyRegCandidates_T_157; // @[Mux.scala 27:73]
  wire [5:0] phyRegCandidates_1 = _phyRegCandidates_T_188 | _phyRegCandidates_T_158; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_222 = headPtrOHVec_2[0] ? freeList_0 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_223 = headPtrOHVec_2[1] ? freeList_1 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_224 = headPtrOHVec_2[2] ? freeList_2 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_225 = headPtrOHVec_2[3] ? freeList_3 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_226 = headPtrOHVec_2[4] ? freeList_4 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_227 = headPtrOHVec_2[5] ? freeList_5 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_228 = headPtrOHVec_2[6] ? freeList_6 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_229 = headPtrOHVec_2[7] ? freeList_7 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_230 = headPtrOHVec_2[8] ? freeList_8 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_231 = headPtrOHVec_2[9] ? freeList_9 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_232 = headPtrOHVec_2[10] ? freeList_10 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_233 = headPtrOHVec_2[11] ? freeList_11 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_234 = headPtrOHVec_2[12] ? freeList_12 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_235 = headPtrOHVec_2[13] ? freeList_13 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_236 = headPtrOHVec_2[14] ? freeList_14 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_237 = headPtrOHVec_2[15] ? freeList_15 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_238 = headPtrOHVec_2[16] ? freeList_16 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_239 = headPtrOHVec_2[17] ? freeList_17 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_240 = headPtrOHVec_2[18] ? freeList_18 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_241 = headPtrOHVec_2[19] ? freeList_19 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_242 = headPtrOHVec_2[20] ? freeList_20 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_243 = headPtrOHVec_2[21] ? freeList_21 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_244 = headPtrOHVec_2[22] ? freeList_22 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_245 = headPtrOHVec_2[23] ? freeList_23 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_246 = headPtrOHVec_2[24] ? freeList_24 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_247 = headPtrOHVec_2[25] ? freeList_25 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_248 = headPtrOHVec_2[26] ? freeList_26 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_249 = headPtrOHVec_2[27] ? freeList_27 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_250 = headPtrOHVec_2[28] ? freeList_28 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_251 = headPtrOHVec_2[29] ? freeList_29 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_252 = headPtrOHVec_2[30] ? freeList_30 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_253 = headPtrOHVec_2[31] ? freeList_31 : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_254 = _phyRegCandidates_T_222 | _phyRegCandidates_T_223; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_255 = _phyRegCandidates_T_254 | _phyRegCandidates_T_224; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_256 = _phyRegCandidates_T_255 | _phyRegCandidates_T_225; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_257 = _phyRegCandidates_T_256 | _phyRegCandidates_T_226; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_258 = _phyRegCandidates_T_257 | _phyRegCandidates_T_227; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_259 = _phyRegCandidates_T_258 | _phyRegCandidates_T_228; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_260 = _phyRegCandidates_T_259 | _phyRegCandidates_T_229; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_261 = _phyRegCandidates_T_260 | _phyRegCandidates_T_230; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_262 = _phyRegCandidates_T_261 | _phyRegCandidates_T_231; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_263 = _phyRegCandidates_T_262 | _phyRegCandidates_T_232; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_264 = _phyRegCandidates_T_263 | _phyRegCandidates_T_233; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_265 = _phyRegCandidates_T_264 | _phyRegCandidates_T_234; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_266 = _phyRegCandidates_T_265 | _phyRegCandidates_T_235; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_267 = _phyRegCandidates_T_266 | _phyRegCandidates_T_236; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_268 = _phyRegCandidates_T_267 | _phyRegCandidates_T_237; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_269 = _phyRegCandidates_T_268 | _phyRegCandidates_T_238; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_270 = _phyRegCandidates_T_269 | _phyRegCandidates_T_239; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_271 = _phyRegCandidates_T_270 | _phyRegCandidates_T_240; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_272 = _phyRegCandidates_T_271 | _phyRegCandidates_T_241; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_273 = _phyRegCandidates_T_272 | _phyRegCandidates_T_242; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_274 = _phyRegCandidates_T_273 | _phyRegCandidates_T_243; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_275 = _phyRegCandidates_T_274 | _phyRegCandidates_T_244; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_276 = _phyRegCandidates_T_275 | _phyRegCandidates_T_245; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_277 = _phyRegCandidates_T_276 | _phyRegCandidates_T_246; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_278 = _phyRegCandidates_T_277 | _phyRegCandidates_T_247; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_279 = _phyRegCandidates_T_278 | _phyRegCandidates_T_248; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_280 = _phyRegCandidates_T_279 | _phyRegCandidates_T_249; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_281 = _phyRegCandidates_T_280 | _phyRegCandidates_T_250; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_282 = _phyRegCandidates_T_281 | _phyRegCandidates_T_251; // @[Mux.scala 27:73]
  wire [5:0] _phyRegCandidates_T_283 = _phyRegCandidates_T_282 | _phyRegCandidates_T_252; // @[Mux.scala 27:73]
  wire [5:0] phyRegCandidates_2 = _phyRegCandidates_T_283 | _phyRegCandidates_T_253; // @[Mux.scala 27:73]
  wire [5:0] _GEN_129 = io_allocateReq_0 ? phyRegCandidates_1 : phyRegCandidates_0; // @[StdFreeList.scala 75:{26,26}]
  wire [1:0] _GEN_145 = {{1'd0}, io_allocateReq_0}; // @[StdFreeList.scala 75:{26,26}]
  wire  realDoAllocate = ~io_redirect & isAllocate; // @[StdFreeList.scala 95:37]
  reg [5:0] freeRegCntReg; // @[StdFreeList.scala 117:30]
  reg  io_perf_0_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg  io_perf_0_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg  io_perf_1_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg  io_perf_1_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg  io_perf_2_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg  io_perf_2_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg  io_perf_3_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg  io_perf_3_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  assign io_allocatePhyReg_0 = _phyRegCandidates_T_93 | _phyRegCandidates_T_63; // @[Mux.scala 27:73]
  assign io_allocatePhyReg_1 = 2'h2 == _GEN_145 ? phyRegCandidates_2 : _GEN_129; // @[StdFreeList.scala 75:{26,26}]
  assign io_canAllocate = io_canAllocate_REG; // @[StdFreeList.scala 69:18]
  assign io_perf_0_value = {{5'd0}, io_perf_0_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_1_value = {{5'd0}, io_perf_1_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_2_value = {{5'd0}, io_perf_2_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_3_value = {{5'd0}, io_perf_3_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  always @(posedge clock) begin
    freeReqReg_0 <= io_freeReq_0; // @[StdFreeList.scala 48:27]
    freeReqReg_1 <= io_freeReq_1; // @[StdFreeList.scala 48:27]
    freeList_REG <= io_freePhyReg_0; // @[StdFreeList.scala 57:40]
    freeList_REG_1 <= io_freePhyReg_1; // @[StdFreeList.scala 57:40]
    io_canAllocate_REG <= freeRegCnt >= 6'h2; // @[StdFreeList.scala 69:40]
    if (io_redirect) begin // @[StdFreeList.scala 92:20]
      if (tailPtr_new_ptr_flag == archHeadPtrNext_flag) begin // @[CircularQueuePtr.scala 80:8]
        freeRegCntReg <= {{1'd0}, _freeRegCnt_T_2};
      end else begin
        freeRegCntReg <= _freeRegCnt_T_6;
      end
    end else if (tailPtr_new_ptr_flag == headPtrNext_flag) begin // @[CircularQueuePtr.scala 80:8]
      freeRegCntReg <= {{1'd0}, _freeRegCnt_T_10};
    end else begin
      freeRegCntReg <= _freeRegCnt_T_14;
    end
    io_perf_0_value_REG <= freeRegCntReg < 6'h8; // @[StdFreeList.scala 119:46]
    io_perf_0_value_REG_1 <= io_perf_0_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_1_value_REG <= freeRegCntReg >= 6'h8 & freeRegCntReg < 6'h10; // @[StdFreeList.scala 120:62]
    io_perf_1_value_REG_1 <= io_perf_1_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_2_value_REG <= freeRegCntReg >= 6'h10 & freeRegCntReg < 6'h18; // @[StdFreeList.scala 121:62]
    io_perf_2_value_REG_1 <= io_perf_2_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_3_value_REG <= freeRegCntReg >= 6'h18; // @[StdFreeList.scala 122:46]
    io_perf_3_value_REG_1 <= io_perf_3_value_REG; // @[PerfCounterUtils.scala 188:27]
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StdFreeList.scala 56:26]
      freeList_0 <= 6'h20; // @[StdFreeList.scala 57:{30,30}]
    end else if (freeReqReg_1) begin
      if (5'h0 == enqPtr_1_value) begin
        freeList_0 <= freeList_REG_1;
      end else begin
        freeList_0 <= _GEN_32;
      end
    end else begin
      freeList_0 <= _GEN_32;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StdFreeList.scala 56:26]
      freeList_1 <= 6'h21; // @[StdFreeList.scala 57:{30,30}]
    end else if (freeReqReg_1) begin
      if (5'h1 == enqPtr_1_value) begin
        freeList_1 <= freeList_REG_1;
      end else begin
        freeList_1 <= _GEN_33;
      end
    end else begin
      freeList_1 <= _GEN_33;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StdFreeList.scala 56:26]
      freeList_2 <= 6'h22; // @[StdFreeList.scala 57:{30,30}]
    end else if (freeReqReg_1) begin
      if (5'h2 == enqPtr_1_value) begin
        freeList_2 <= freeList_REG_1;
      end else begin
        freeList_2 <= _GEN_34;
      end
    end else begin
      freeList_2 <= _GEN_34;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StdFreeList.scala 56:26]
      freeList_3 <= 6'h23; // @[StdFreeList.scala 57:{30,30}]
    end else if (freeReqReg_1) begin
      if (5'h3 == enqPtr_1_value) begin
        freeList_3 <= freeList_REG_1;
      end else begin
        freeList_3 <= _GEN_35;
      end
    end else begin
      freeList_3 <= _GEN_35;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StdFreeList.scala 56:26]
      freeList_4 <= 6'h24; // @[StdFreeList.scala 57:{30,30}]
    end else if (freeReqReg_1) begin
      if (5'h4 == enqPtr_1_value) begin
        freeList_4 <= freeList_REG_1;
      end else begin
        freeList_4 <= _GEN_36;
      end
    end else begin
      freeList_4 <= _GEN_36;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StdFreeList.scala 56:26]
      freeList_5 <= 6'h25; // @[StdFreeList.scala 57:{30,30}]
    end else if (freeReqReg_1) begin
      if (5'h5 == enqPtr_1_value) begin
        freeList_5 <= freeList_REG_1;
      end else begin
        freeList_5 <= _GEN_37;
      end
    end else begin
      freeList_5 <= _GEN_37;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StdFreeList.scala 56:26]
      freeList_6 <= 6'h26; // @[StdFreeList.scala 57:{30,30}]
    end else if (freeReqReg_1) begin
      if (5'h6 == enqPtr_1_value) begin
        freeList_6 <= freeList_REG_1;
      end else begin
        freeList_6 <= _GEN_38;
      end
    end else begin
      freeList_6 <= _GEN_38;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StdFreeList.scala 56:26]
      freeList_7 <= 6'h27; // @[StdFreeList.scala 57:{30,30}]
    end else if (freeReqReg_1) begin
      if (5'h7 == enqPtr_1_value) begin
        freeList_7 <= freeList_REG_1;
      end else begin
        freeList_7 <= _GEN_39;
      end
    end else begin
      freeList_7 <= _GEN_39;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StdFreeList.scala 56:26]
      freeList_8 <= 6'h28; // @[StdFreeList.scala 57:{30,30}]
    end else if (freeReqReg_1) begin
      if (5'h8 == enqPtr_1_value) begin
        freeList_8 <= freeList_REG_1;
      end else begin
        freeList_8 <= _GEN_40;
      end
    end else begin
      freeList_8 <= _GEN_40;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StdFreeList.scala 56:26]
      freeList_9 <= 6'h29; // @[StdFreeList.scala 57:{30,30}]
    end else if (freeReqReg_1) begin
      if (5'h9 == enqPtr_1_value) begin
        freeList_9 <= freeList_REG_1;
      end else begin
        freeList_9 <= _GEN_41;
      end
    end else begin
      freeList_9 <= _GEN_41;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StdFreeList.scala 56:26]
      freeList_10 <= 6'h2a; // @[StdFreeList.scala 57:{30,30}]
    end else if (freeReqReg_1) begin
      if (5'ha == enqPtr_1_value) begin
        freeList_10 <= freeList_REG_1;
      end else begin
        freeList_10 <= _GEN_42;
      end
    end else begin
      freeList_10 <= _GEN_42;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StdFreeList.scala 56:26]
      freeList_11 <= 6'h2b; // @[StdFreeList.scala 57:{30,30}]
    end else if (freeReqReg_1) begin
      if (5'hb == enqPtr_1_value) begin
        freeList_11 <= freeList_REG_1;
      end else begin
        freeList_11 <= _GEN_43;
      end
    end else begin
      freeList_11 <= _GEN_43;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StdFreeList.scala 56:26]
      freeList_12 <= 6'h2c; // @[StdFreeList.scala 57:{30,30}]
    end else if (freeReqReg_1) begin
      if (5'hc == enqPtr_1_value) begin
        freeList_12 <= freeList_REG_1;
      end else begin
        freeList_12 <= _GEN_44;
      end
    end else begin
      freeList_12 <= _GEN_44;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StdFreeList.scala 56:26]
      freeList_13 <= 6'h2d; // @[StdFreeList.scala 57:{30,30}]
    end else if (freeReqReg_1) begin
      if (5'hd == enqPtr_1_value) begin
        freeList_13 <= freeList_REG_1;
      end else begin
        freeList_13 <= _GEN_45;
      end
    end else begin
      freeList_13 <= _GEN_45;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StdFreeList.scala 56:26]
      freeList_14 <= 6'h2e; // @[StdFreeList.scala 57:{30,30}]
    end else if (freeReqReg_1) begin
      if (5'he == enqPtr_1_value) begin
        freeList_14 <= freeList_REG_1;
      end else begin
        freeList_14 <= _GEN_46;
      end
    end else begin
      freeList_14 <= _GEN_46;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StdFreeList.scala 56:26]
      freeList_15 <= 6'h2f; // @[StdFreeList.scala 57:{30,30}]
    end else if (freeReqReg_1) begin
      if (5'hf == enqPtr_1_value) begin
        freeList_15 <= freeList_REG_1;
      end else begin
        freeList_15 <= _GEN_47;
      end
    end else begin
      freeList_15 <= _GEN_47;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StdFreeList.scala 56:26]
      freeList_16 <= 6'h30; // @[StdFreeList.scala 57:{30,30}]
    end else if (freeReqReg_1) begin
      if (5'h10 == enqPtr_1_value) begin
        freeList_16 <= freeList_REG_1;
      end else begin
        freeList_16 <= _GEN_48;
      end
    end else begin
      freeList_16 <= _GEN_48;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StdFreeList.scala 56:26]
      freeList_17 <= 6'h31; // @[StdFreeList.scala 57:{30,30}]
    end else if (freeReqReg_1) begin
      if (5'h11 == enqPtr_1_value) begin
        freeList_17 <= freeList_REG_1;
      end else begin
        freeList_17 <= _GEN_49;
      end
    end else begin
      freeList_17 <= _GEN_49;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StdFreeList.scala 56:26]
      freeList_18 <= 6'h32; // @[StdFreeList.scala 57:{30,30}]
    end else if (freeReqReg_1) begin
      if (5'h12 == enqPtr_1_value) begin
        freeList_18 <= freeList_REG_1;
      end else begin
        freeList_18 <= _GEN_50;
      end
    end else begin
      freeList_18 <= _GEN_50;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StdFreeList.scala 56:26]
      freeList_19 <= 6'h33; // @[StdFreeList.scala 57:{30,30}]
    end else if (freeReqReg_1) begin
      if (5'h13 == enqPtr_1_value) begin
        freeList_19 <= freeList_REG_1;
      end else begin
        freeList_19 <= _GEN_51;
      end
    end else begin
      freeList_19 <= _GEN_51;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StdFreeList.scala 56:26]
      freeList_20 <= 6'h34; // @[StdFreeList.scala 57:{30,30}]
    end else if (freeReqReg_1) begin
      if (5'h14 == enqPtr_1_value) begin
        freeList_20 <= freeList_REG_1;
      end else begin
        freeList_20 <= _GEN_52;
      end
    end else begin
      freeList_20 <= _GEN_52;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StdFreeList.scala 56:26]
      freeList_21 <= 6'h35; // @[StdFreeList.scala 57:{30,30}]
    end else if (freeReqReg_1) begin
      if (5'h15 == enqPtr_1_value) begin
        freeList_21 <= freeList_REG_1;
      end else begin
        freeList_21 <= _GEN_53;
      end
    end else begin
      freeList_21 <= _GEN_53;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StdFreeList.scala 56:26]
      freeList_22 <= 6'h36; // @[StdFreeList.scala 57:{30,30}]
    end else if (freeReqReg_1) begin
      if (5'h16 == enqPtr_1_value) begin
        freeList_22 <= freeList_REG_1;
      end else begin
        freeList_22 <= _GEN_54;
      end
    end else begin
      freeList_22 <= _GEN_54;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StdFreeList.scala 56:26]
      freeList_23 <= 6'h37; // @[StdFreeList.scala 57:{30,30}]
    end else if (freeReqReg_1) begin
      if (5'h17 == enqPtr_1_value) begin
        freeList_23 <= freeList_REG_1;
      end else begin
        freeList_23 <= _GEN_55;
      end
    end else begin
      freeList_23 <= _GEN_55;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StdFreeList.scala 56:26]
      freeList_24 <= 6'h38; // @[StdFreeList.scala 57:{30,30}]
    end else if (freeReqReg_1) begin
      if (5'h18 == enqPtr_1_value) begin
        freeList_24 <= freeList_REG_1;
      end else begin
        freeList_24 <= _GEN_56;
      end
    end else begin
      freeList_24 <= _GEN_56;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StdFreeList.scala 56:26]
      freeList_25 <= 6'h39; // @[StdFreeList.scala 57:{30,30}]
    end else if (freeReqReg_1) begin
      if (5'h19 == enqPtr_1_value) begin
        freeList_25 <= freeList_REG_1;
      end else begin
        freeList_25 <= _GEN_57;
      end
    end else begin
      freeList_25 <= _GEN_57;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StdFreeList.scala 56:26]
      freeList_26 <= 6'h3a; // @[StdFreeList.scala 57:{30,30}]
    end else if (freeReqReg_1) begin
      if (5'h1a == enqPtr_1_value) begin
        freeList_26 <= freeList_REG_1;
      end else begin
        freeList_26 <= _GEN_58;
      end
    end else begin
      freeList_26 <= _GEN_58;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StdFreeList.scala 56:26]
      freeList_27 <= 6'h3b; // @[StdFreeList.scala 57:{30,30}]
    end else if (freeReqReg_1) begin
      if (5'h1b == enqPtr_1_value) begin
        freeList_27 <= freeList_REG_1;
      end else begin
        freeList_27 <= _GEN_59;
      end
    end else begin
      freeList_27 <= _GEN_59;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StdFreeList.scala 56:26]
      freeList_28 <= 6'h3c; // @[StdFreeList.scala 57:{30,30}]
    end else if (freeReqReg_1) begin
      if (5'h1c == enqPtr_1_value) begin
        freeList_28 <= freeList_REG_1;
      end else begin
        freeList_28 <= _GEN_60;
      end
    end else begin
      freeList_28 <= _GEN_60;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StdFreeList.scala 56:26]
      freeList_29 <= 6'h3d; // @[StdFreeList.scala 57:{30,30}]
    end else if (freeReqReg_1) begin
      if (5'h1d == enqPtr_1_value) begin
        freeList_29 <= freeList_REG_1;
      end else begin
        freeList_29 <= _GEN_61;
      end
    end else begin
      freeList_29 <= _GEN_61;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StdFreeList.scala 56:26]
      freeList_30 <= 6'h3e; // @[StdFreeList.scala 57:{30,30}]
    end else if (freeReqReg_1) begin
      if (5'h1e == enqPtr_1_value) begin
        freeList_30 <= freeList_REG_1;
      end else begin
        freeList_30 <= _GEN_62;
      end
    end else begin
      freeList_30 <= _GEN_62;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StdFreeList.scala 56:26]
      freeList_31 <= 6'h3f; // @[StdFreeList.scala 57:{30,30}]
    end else if (freeReqReg_1) begin
      if (5'h1f == enqPtr_1_value) begin
        freeList_31 <= freeList_REG_1;
      end else begin
        freeList_31 <= _GEN_63;
      end
    end else begin
      freeList_31 <= _GEN_63;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StdFreeList.scala 96:17]
      headPtr_flag <= 1'h0; // @[StdFreeList.scala 83:30]
    end else if (io_redirect) begin // @[StdFreeList.scala 96:51]
      if (io_commit_isCommit) begin
        headPtr_flag <= archHeadPtrNew_flag;
      end else begin
        headPtr_flag <= archHeadPtr_flag;
      end
    end else if (realDoAllocate) begin
      headPtr_flag <= headPtrAllocate_flag;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StdFreeList.scala 96:17]
      headPtr_value <= 5'h0; // @[StdFreeList.scala 83:30]
    end else if (io_redirect) begin // @[StdFreeList.scala 96:51]
      if (io_commit_isCommit) begin
        headPtr_value <= archHeadPtrNew_value;
      end else begin
        headPtr_value <= archHeadPtr_value;
      end
    end else if (realDoAllocate) begin
      headPtr_value <= headPtrAllocate_value;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StdFreeList.scala 97:19]
      headPtrOH <= 32'h1; // @[StdFreeList.scala 84:{30,30,30,30,30}]
    end else if (io_redirect) begin // @[StdFreeList.scala 97:55]
      if (io_commit_isCommit) begin // @[StdFreeList.scala 97:55]
        if (2'h2 == numArchAllocate) begin // @[StdFreeList.scala 97:55]
          headPtrOH <= archHeadPtrOHVec_2;
        end else if (2'h1 == numArchAllocate) begin
          headPtrOH <= archHeadPtrOHVec_1;
        end else begin
          headPtrOH <= archHeadPtrOH;
        end
      end else begin
        headPtrOH <= archHeadPtrOH; // @[StdFreeList.scala 97:{55,55}]
      end
    end else if (realDoAllocate) begin
      if (2'h2 == numAllocate) begin
        headPtrOH <= headPtrOHVec_2;
      end else if (2'h1 == numAllocate) begin
        headPtrOH <= headPtrOHVec_1;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[CircularQueuePtr.scala 39:59]
      lastTailPtr_flag <= 1'h1;
    end else begin
      lastTailPtr_flag <= _tailPtr_new_ptr_T_2[5];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[CircularQueuePtr.scala 39:59]
      lastTailPtr_value <= 5'h0;
    end else begin
      lastTailPtr_value <= _tailPtr_new_ptr_T_2[4:0];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StdFreeList.scala 83:30]
      archHeadPtr_flag <= 1'h0;
    end else if (io_commit_isCommit) begin
      archHeadPtr_flag <= archHeadPtrNew_flag;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StdFreeList.scala 83:30]
      archHeadPtr_value <= 5'h0;
    end else if (io_commit_isCommit) begin
      archHeadPtr_value <= archHeadPtrNew_value;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StdFreeList.scala 84:30]
      archHeadPtrOH <= 32'h1; // @[StdFreeList.scala 84:{30,30,30,30}]
    end else if (io_commit_isCommit) begin
      if (2'h2 == numArchAllocate) begin
        archHeadPtrOH <= archHeadPtrOHVec_2;
      end else if (2'h1 == numArchAllocate) begin
        archHeadPtrOH <= archHeadPtrOHVec_1;
      end
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
  freeList_0 = _RAND_0[5:0];
  _RAND_1 = {1{`RANDOM}};
  freeList_1 = _RAND_1[5:0];
  _RAND_2 = {1{`RANDOM}};
  freeList_2 = _RAND_2[5:0];
  _RAND_3 = {1{`RANDOM}};
  freeList_3 = _RAND_3[5:0];
  _RAND_4 = {1{`RANDOM}};
  freeList_4 = _RAND_4[5:0];
  _RAND_5 = {1{`RANDOM}};
  freeList_5 = _RAND_5[5:0];
  _RAND_6 = {1{`RANDOM}};
  freeList_6 = _RAND_6[5:0];
  _RAND_7 = {1{`RANDOM}};
  freeList_7 = _RAND_7[5:0];
  _RAND_8 = {1{`RANDOM}};
  freeList_8 = _RAND_8[5:0];
  _RAND_9 = {1{`RANDOM}};
  freeList_9 = _RAND_9[5:0];
  _RAND_10 = {1{`RANDOM}};
  freeList_10 = _RAND_10[5:0];
  _RAND_11 = {1{`RANDOM}};
  freeList_11 = _RAND_11[5:0];
  _RAND_12 = {1{`RANDOM}};
  freeList_12 = _RAND_12[5:0];
  _RAND_13 = {1{`RANDOM}};
  freeList_13 = _RAND_13[5:0];
  _RAND_14 = {1{`RANDOM}};
  freeList_14 = _RAND_14[5:0];
  _RAND_15 = {1{`RANDOM}};
  freeList_15 = _RAND_15[5:0];
  _RAND_16 = {1{`RANDOM}};
  freeList_16 = _RAND_16[5:0];
  _RAND_17 = {1{`RANDOM}};
  freeList_17 = _RAND_17[5:0];
  _RAND_18 = {1{`RANDOM}};
  freeList_18 = _RAND_18[5:0];
  _RAND_19 = {1{`RANDOM}};
  freeList_19 = _RAND_19[5:0];
  _RAND_20 = {1{`RANDOM}};
  freeList_20 = _RAND_20[5:0];
  _RAND_21 = {1{`RANDOM}};
  freeList_21 = _RAND_21[5:0];
  _RAND_22 = {1{`RANDOM}};
  freeList_22 = _RAND_22[5:0];
  _RAND_23 = {1{`RANDOM}};
  freeList_23 = _RAND_23[5:0];
  _RAND_24 = {1{`RANDOM}};
  freeList_24 = _RAND_24[5:0];
  _RAND_25 = {1{`RANDOM}};
  freeList_25 = _RAND_25[5:0];
  _RAND_26 = {1{`RANDOM}};
  freeList_26 = _RAND_26[5:0];
  _RAND_27 = {1{`RANDOM}};
  freeList_27 = _RAND_27[5:0];
  _RAND_28 = {1{`RANDOM}};
  freeList_28 = _RAND_28[5:0];
  _RAND_29 = {1{`RANDOM}};
  freeList_29 = _RAND_29[5:0];
  _RAND_30 = {1{`RANDOM}};
  freeList_30 = _RAND_30[5:0];
  _RAND_31 = {1{`RANDOM}};
  freeList_31 = _RAND_31[5:0];
  _RAND_32 = {1{`RANDOM}};
  headPtr_flag = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  headPtr_value = _RAND_33[4:0];
  _RAND_34 = {1{`RANDOM}};
  headPtrOH = _RAND_34[31:0];
  _RAND_35 = {1{`RANDOM}};
  lastTailPtr_flag = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  lastTailPtr_value = _RAND_36[4:0];
  _RAND_37 = {1{`RANDOM}};
  archHeadPtr_flag = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  archHeadPtr_value = _RAND_38[4:0];
  _RAND_39 = {1{`RANDOM}};
  archHeadPtrOH = _RAND_39[31:0];
  _RAND_40 = {1{`RANDOM}};
  freeReqReg_0 = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  freeReqReg_1 = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  freeList_REG = _RAND_42[5:0];
  _RAND_43 = {1{`RANDOM}};
  freeList_REG_1 = _RAND_43[5:0];
  _RAND_44 = {1{`RANDOM}};
  io_canAllocate_REG = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  freeRegCntReg = _RAND_45[5:0];
  _RAND_46 = {1{`RANDOM}};
  io_perf_0_value_REG = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  io_perf_0_value_REG_1 = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  io_perf_1_value_REG = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  io_perf_1_value_REG_1 = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  io_perf_2_value_REG = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  io_perf_2_value_REG_1 = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  io_perf_3_value_REG = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  io_perf_3_value_REG_1 = _RAND_53[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    freeList_0 = 6'h20;
  end
  if (reset) begin
    freeList_1 = 6'h21;
  end
  if (reset) begin
    freeList_2 = 6'h22;
  end
  if (reset) begin
    freeList_3 = 6'h23;
  end
  if (reset) begin
    freeList_4 = 6'h24;
  end
  if (reset) begin
    freeList_5 = 6'h25;
  end
  if (reset) begin
    freeList_6 = 6'h26;
  end
  if (reset) begin
    freeList_7 = 6'h27;
  end
  if (reset) begin
    freeList_8 = 6'h28;
  end
  if (reset) begin
    freeList_9 = 6'h29;
  end
  if (reset) begin
    freeList_10 = 6'h2a;
  end
  if (reset) begin
    freeList_11 = 6'h2b;
  end
  if (reset) begin
    freeList_12 = 6'h2c;
  end
  if (reset) begin
    freeList_13 = 6'h2d;
  end
  if (reset) begin
    freeList_14 = 6'h2e;
  end
  if (reset) begin
    freeList_15 = 6'h2f;
  end
  if (reset) begin
    freeList_16 = 6'h30;
  end
  if (reset) begin
    freeList_17 = 6'h31;
  end
  if (reset) begin
    freeList_18 = 6'h32;
  end
  if (reset) begin
    freeList_19 = 6'h33;
  end
  if (reset) begin
    freeList_20 = 6'h34;
  end
  if (reset) begin
    freeList_21 = 6'h35;
  end
  if (reset) begin
    freeList_22 = 6'h36;
  end
  if (reset) begin
    freeList_23 = 6'h37;
  end
  if (reset) begin
    freeList_24 = 6'h38;
  end
  if (reset) begin
    freeList_25 = 6'h39;
  end
  if (reset) begin
    freeList_26 = 6'h3a;
  end
  if (reset) begin
    freeList_27 = 6'h3b;
  end
  if (reset) begin
    freeList_28 = 6'h3c;
  end
  if (reset) begin
    freeList_29 = 6'h3d;
  end
  if (reset) begin
    freeList_30 = 6'h3e;
  end
  if (reset) begin
    freeList_31 = 6'h3f;
  end
  if (reset) begin
    headPtr_flag = 1'h0;
  end
  if (reset) begin
    headPtr_value = 5'h0;
  end
  if (reset) begin
    headPtrOH = 32'h1;
  end
  if (reset) begin
    lastTailPtr_flag = 1'h1;
  end
  if (reset) begin
    lastTailPtr_value = 5'h0;
  end
  if (reset) begin
    archHeadPtr_flag = 1'h0;
  end
  if (reset) begin
    archHeadPtr_value = 5'h0;
  end
  if (reset) begin
    archHeadPtrOH = 32'h1;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

