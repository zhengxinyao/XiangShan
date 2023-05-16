module RenameTableWrapper(
  input        clock,
  input        reset,
  input        io_redirect,
  input        io_robCommits_isCommit,
  input        io_robCommits_commitValid_0,
  input        io_robCommits_commitValid_1,
  input        io_robCommits_isWalk,
  input        io_robCommits_walkValid_0,
  input        io_robCommits_walkValid_1,
  input  [4:0] io_robCommits_info_0_ldest,
  input        io_robCommits_info_0_rfWen,
  input        io_robCommits_info_0_fpWen,
  input  [5:0] io_robCommits_info_0_pdest,
  input  [4:0] io_robCommits_info_1_ldest,
  input        io_robCommits_info_1_rfWen,
  input        io_robCommits_info_1_fpWen,
  input  [5:0] io_robCommits_info_1_pdest,
  input        io_intReadPorts_0_0_hold,
  input  [4:0] io_intReadPorts_0_0_addr,
  output [5:0] io_intReadPorts_0_0_data,
  input        io_intReadPorts_0_1_hold,
  input  [4:0] io_intReadPorts_0_1_addr,
  output [5:0] io_intReadPorts_0_1_data,
  input        io_intReadPorts_0_2_hold,
  input  [4:0] io_intReadPorts_0_2_addr,
  output [5:0] io_intReadPorts_0_2_data,
  input        io_intReadPorts_1_0_hold,
  input  [4:0] io_intReadPorts_1_0_addr,
  output [5:0] io_intReadPorts_1_0_data,
  input        io_intReadPorts_1_1_hold,
  input  [4:0] io_intReadPorts_1_1_addr,
  output [5:0] io_intReadPorts_1_1_data,
  input        io_intReadPorts_1_2_hold,
  input  [4:0] io_intReadPorts_1_2_addr,
  output [5:0] io_intReadPorts_1_2_data,
  input        io_intRenamePorts_0_wen,
  input  [4:0] io_intRenamePorts_0_addr,
  input  [5:0] io_intRenamePorts_0_data,
  input        io_intRenamePorts_1_wen,
  input  [4:0] io_intRenamePorts_1_addr,
  input  [5:0] io_intRenamePorts_1_data,
  input        io_fpReadPorts_0_0_hold,
  input  [4:0] io_fpReadPorts_0_0_addr,
  output [5:0] io_fpReadPorts_0_0_data,
  input        io_fpReadPorts_0_1_hold,
  input  [4:0] io_fpReadPorts_0_1_addr,
  output [5:0] io_fpReadPorts_0_1_data,
  input        io_fpReadPorts_0_2_hold,
  input  [4:0] io_fpReadPorts_0_2_addr,
  output [5:0] io_fpReadPorts_0_2_data,
  input        io_fpReadPorts_0_3_hold,
  input  [4:0] io_fpReadPorts_0_3_addr,
  output [5:0] io_fpReadPorts_0_3_data,
  input        io_fpReadPorts_1_0_hold,
  input  [4:0] io_fpReadPorts_1_0_addr,
  output [5:0] io_fpReadPorts_1_0_data,
  input        io_fpReadPorts_1_1_hold,
  input  [4:0] io_fpReadPorts_1_1_addr,
  output [5:0] io_fpReadPorts_1_1_data,
  input        io_fpReadPorts_1_2_hold,
  input  [4:0] io_fpReadPorts_1_2_addr,
  output [5:0] io_fpReadPorts_1_2_data,
  input        io_fpReadPorts_1_3_hold,
  input  [4:0] io_fpReadPorts_1_3_addr,
  output [5:0] io_fpReadPorts_1_3_data,
  input        io_fpRenamePorts_0_wen,
  input  [4:0] io_fpRenamePorts_0_addr,
  input  [5:0] io_fpRenamePorts_0_data,
  input        io_fpRenamePorts_1_wen,
  input  [4:0] io_fpRenamePorts_1_addr,
  input  [5:0] io_fpRenamePorts_1_data,
  output [5:0] io_debug_int_rat_0,
  output [5:0] io_debug_int_rat_1,
  output [5:0] io_debug_int_rat_2,
  output [5:0] io_debug_int_rat_3,
  output [5:0] io_debug_int_rat_4,
  output [5:0] io_debug_int_rat_5,
  output [5:0] io_debug_int_rat_6,
  output [5:0] io_debug_int_rat_7,
  output [5:0] io_debug_int_rat_8,
  output [5:0] io_debug_int_rat_9,
  output [5:0] io_debug_int_rat_10,
  output [5:0] io_debug_int_rat_11,
  output [5:0] io_debug_int_rat_12,
  output [5:0] io_debug_int_rat_13,
  output [5:0] io_debug_int_rat_14,
  output [5:0] io_debug_int_rat_15,
  output [5:0] io_debug_int_rat_16,
  output [5:0] io_debug_int_rat_17,
  output [5:0] io_debug_int_rat_18,
  output [5:0] io_debug_int_rat_19,
  output [5:0] io_debug_int_rat_20,
  output [5:0] io_debug_int_rat_21,
  output [5:0] io_debug_int_rat_22,
  output [5:0] io_debug_int_rat_23,
  output [5:0] io_debug_int_rat_24,
  output [5:0] io_debug_int_rat_25,
  output [5:0] io_debug_int_rat_26,
  output [5:0] io_debug_int_rat_27,
  output [5:0] io_debug_int_rat_28,
  output [5:0] io_debug_int_rat_29,
  output [5:0] io_debug_int_rat_30,
  output [5:0] io_debug_int_rat_31,
  output [5:0] io_debug_fp_rat_0,
  output [5:0] io_debug_fp_rat_1,
  output [5:0] io_debug_fp_rat_2,
  output [5:0] io_debug_fp_rat_3,
  output [5:0] io_debug_fp_rat_4,
  output [5:0] io_debug_fp_rat_5,
  output [5:0] io_debug_fp_rat_6,
  output [5:0] io_debug_fp_rat_7,
  output [5:0] io_debug_fp_rat_8,
  output [5:0] io_debug_fp_rat_9,
  output [5:0] io_debug_fp_rat_10,
  output [5:0] io_debug_fp_rat_11,
  output [5:0] io_debug_fp_rat_12,
  output [5:0] io_debug_fp_rat_13,
  output [5:0] io_debug_fp_rat_14,
  output [5:0] io_debug_fp_rat_15,
  output [5:0] io_debug_fp_rat_16,
  output [5:0] io_debug_fp_rat_17,
  output [5:0] io_debug_fp_rat_18,
  output [5:0] io_debug_fp_rat_19,
  output [5:0] io_debug_fp_rat_20,
  output [5:0] io_debug_fp_rat_21,
  output [5:0] io_debug_fp_rat_22,
  output [5:0] io_debug_fp_rat_23,
  output [5:0] io_debug_fp_rat_24,
  output [5:0] io_debug_fp_rat_25,
  output [5:0] io_debug_fp_rat_26,
  output [5:0] io_debug_fp_rat_27,
  output [5:0] io_debug_fp_rat_28,
  output [5:0] io_debug_fp_rat_29,
  output [5:0] io_debug_fp_rat_30,
  output [5:0] io_debug_fp_rat_31
);
  wire  intRat_clock; // @[RenameTable.scala 107:22]
  wire  intRat_reset; // @[RenameTable.scala 107:22]
  wire  intRat_io_redirect; // @[RenameTable.scala 107:22]
  wire  intRat_io_readPorts_0_hold; // @[RenameTable.scala 107:22]
  wire [4:0] intRat_io_readPorts_0_addr; // @[RenameTable.scala 107:22]
  wire [5:0] intRat_io_readPorts_0_data; // @[RenameTable.scala 107:22]
  wire  intRat_io_readPorts_1_hold; // @[RenameTable.scala 107:22]
  wire [4:0] intRat_io_readPorts_1_addr; // @[RenameTable.scala 107:22]
  wire [5:0] intRat_io_readPorts_1_data; // @[RenameTable.scala 107:22]
  wire  intRat_io_readPorts_2_hold; // @[RenameTable.scala 107:22]
  wire [4:0] intRat_io_readPorts_2_addr; // @[RenameTable.scala 107:22]
  wire [5:0] intRat_io_readPorts_2_data; // @[RenameTable.scala 107:22]
  wire  intRat_io_readPorts_3_hold; // @[RenameTable.scala 107:22]
  wire [4:0] intRat_io_readPorts_3_addr; // @[RenameTable.scala 107:22]
  wire [5:0] intRat_io_readPorts_3_data; // @[RenameTable.scala 107:22]
  wire  intRat_io_readPorts_4_hold; // @[RenameTable.scala 107:22]
  wire [4:0] intRat_io_readPorts_4_addr; // @[RenameTable.scala 107:22]
  wire [5:0] intRat_io_readPorts_4_data; // @[RenameTable.scala 107:22]
  wire  intRat_io_readPorts_5_hold; // @[RenameTable.scala 107:22]
  wire [4:0] intRat_io_readPorts_5_addr; // @[RenameTable.scala 107:22]
  wire [5:0] intRat_io_readPorts_5_data; // @[RenameTable.scala 107:22]
  wire  intRat_io_specWritePorts_0_wen; // @[RenameTable.scala 107:22]
  wire [4:0] intRat_io_specWritePorts_0_addr; // @[RenameTable.scala 107:22]
  wire [5:0] intRat_io_specWritePorts_0_data; // @[RenameTable.scala 107:22]
  wire  intRat_io_specWritePorts_1_wen; // @[RenameTable.scala 107:22]
  wire [4:0] intRat_io_specWritePorts_1_addr; // @[RenameTable.scala 107:22]
  wire [5:0] intRat_io_specWritePorts_1_data; // @[RenameTable.scala 107:22]
  wire  intRat_io_archWritePorts_0_wen; // @[RenameTable.scala 107:22]
  wire [4:0] intRat_io_archWritePorts_0_addr; // @[RenameTable.scala 107:22]
  wire [5:0] intRat_io_archWritePorts_0_data; // @[RenameTable.scala 107:22]
  wire  intRat_io_archWritePorts_1_wen; // @[RenameTable.scala 107:22]
  wire [4:0] intRat_io_archWritePorts_1_addr; // @[RenameTable.scala 107:22]
  wire [5:0] intRat_io_archWritePorts_1_data; // @[RenameTable.scala 107:22]
  wire [5:0] intRat_io_debug_rdata_0; // @[RenameTable.scala 107:22]
  wire [5:0] intRat_io_debug_rdata_1; // @[RenameTable.scala 107:22]
  wire [5:0] intRat_io_debug_rdata_2; // @[RenameTable.scala 107:22]
  wire [5:0] intRat_io_debug_rdata_3; // @[RenameTable.scala 107:22]
  wire [5:0] intRat_io_debug_rdata_4; // @[RenameTable.scala 107:22]
  wire [5:0] intRat_io_debug_rdata_5; // @[RenameTable.scala 107:22]
  wire [5:0] intRat_io_debug_rdata_6; // @[RenameTable.scala 107:22]
  wire [5:0] intRat_io_debug_rdata_7; // @[RenameTable.scala 107:22]
  wire [5:0] intRat_io_debug_rdata_8; // @[RenameTable.scala 107:22]
  wire [5:0] intRat_io_debug_rdata_9; // @[RenameTable.scala 107:22]
  wire [5:0] intRat_io_debug_rdata_10; // @[RenameTable.scala 107:22]
  wire [5:0] intRat_io_debug_rdata_11; // @[RenameTable.scala 107:22]
  wire [5:0] intRat_io_debug_rdata_12; // @[RenameTable.scala 107:22]
  wire [5:0] intRat_io_debug_rdata_13; // @[RenameTable.scala 107:22]
  wire [5:0] intRat_io_debug_rdata_14; // @[RenameTable.scala 107:22]
  wire [5:0] intRat_io_debug_rdata_15; // @[RenameTable.scala 107:22]
  wire [5:0] intRat_io_debug_rdata_16; // @[RenameTable.scala 107:22]
  wire [5:0] intRat_io_debug_rdata_17; // @[RenameTable.scala 107:22]
  wire [5:0] intRat_io_debug_rdata_18; // @[RenameTable.scala 107:22]
  wire [5:0] intRat_io_debug_rdata_19; // @[RenameTable.scala 107:22]
  wire [5:0] intRat_io_debug_rdata_20; // @[RenameTable.scala 107:22]
  wire [5:0] intRat_io_debug_rdata_21; // @[RenameTable.scala 107:22]
  wire [5:0] intRat_io_debug_rdata_22; // @[RenameTable.scala 107:22]
  wire [5:0] intRat_io_debug_rdata_23; // @[RenameTable.scala 107:22]
  wire [5:0] intRat_io_debug_rdata_24; // @[RenameTable.scala 107:22]
  wire [5:0] intRat_io_debug_rdata_25; // @[RenameTable.scala 107:22]
  wire [5:0] intRat_io_debug_rdata_26; // @[RenameTable.scala 107:22]
  wire [5:0] intRat_io_debug_rdata_27; // @[RenameTable.scala 107:22]
  wire [5:0] intRat_io_debug_rdata_28; // @[RenameTable.scala 107:22]
  wire [5:0] intRat_io_debug_rdata_29; // @[RenameTable.scala 107:22]
  wire [5:0] intRat_io_debug_rdata_30; // @[RenameTable.scala 107:22]
  wire [5:0] intRat_io_debug_rdata_31; // @[RenameTable.scala 107:22]
  wire  fpRat_clock; // @[RenameTable.scala 108:21]
  wire  fpRat_reset; // @[RenameTable.scala 108:21]
  wire  fpRat_io_redirect; // @[RenameTable.scala 108:21]
  wire  fpRat_io_readPorts_0_hold; // @[RenameTable.scala 108:21]
  wire [4:0] fpRat_io_readPorts_0_addr; // @[RenameTable.scala 108:21]
  wire [5:0] fpRat_io_readPorts_0_data; // @[RenameTable.scala 108:21]
  wire  fpRat_io_readPorts_1_hold; // @[RenameTable.scala 108:21]
  wire [4:0] fpRat_io_readPorts_1_addr; // @[RenameTable.scala 108:21]
  wire [5:0] fpRat_io_readPorts_1_data; // @[RenameTable.scala 108:21]
  wire  fpRat_io_readPorts_2_hold; // @[RenameTable.scala 108:21]
  wire [4:0] fpRat_io_readPorts_2_addr; // @[RenameTable.scala 108:21]
  wire [5:0] fpRat_io_readPorts_2_data; // @[RenameTable.scala 108:21]
  wire  fpRat_io_readPorts_3_hold; // @[RenameTable.scala 108:21]
  wire [4:0] fpRat_io_readPorts_3_addr; // @[RenameTable.scala 108:21]
  wire [5:0] fpRat_io_readPorts_3_data; // @[RenameTable.scala 108:21]
  wire  fpRat_io_readPorts_4_hold; // @[RenameTable.scala 108:21]
  wire [4:0] fpRat_io_readPorts_4_addr; // @[RenameTable.scala 108:21]
  wire [5:0] fpRat_io_readPorts_4_data; // @[RenameTable.scala 108:21]
  wire  fpRat_io_readPorts_5_hold; // @[RenameTable.scala 108:21]
  wire [4:0] fpRat_io_readPorts_5_addr; // @[RenameTable.scala 108:21]
  wire [5:0] fpRat_io_readPorts_5_data; // @[RenameTable.scala 108:21]
  wire  fpRat_io_readPorts_6_hold; // @[RenameTable.scala 108:21]
  wire [4:0] fpRat_io_readPorts_6_addr; // @[RenameTable.scala 108:21]
  wire [5:0] fpRat_io_readPorts_6_data; // @[RenameTable.scala 108:21]
  wire  fpRat_io_readPorts_7_hold; // @[RenameTable.scala 108:21]
  wire [4:0] fpRat_io_readPorts_7_addr; // @[RenameTable.scala 108:21]
  wire [5:0] fpRat_io_readPorts_7_data; // @[RenameTable.scala 108:21]
  wire  fpRat_io_specWritePorts_0_wen; // @[RenameTable.scala 108:21]
  wire [4:0] fpRat_io_specWritePorts_0_addr; // @[RenameTable.scala 108:21]
  wire [5:0] fpRat_io_specWritePorts_0_data; // @[RenameTable.scala 108:21]
  wire  fpRat_io_specWritePorts_1_wen; // @[RenameTable.scala 108:21]
  wire [4:0] fpRat_io_specWritePorts_1_addr; // @[RenameTable.scala 108:21]
  wire [5:0] fpRat_io_specWritePorts_1_data; // @[RenameTable.scala 108:21]
  wire  fpRat_io_archWritePorts_0_wen; // @[RenameTable.scala 108:21]
  wire [4:0] fpRat_io_archWritePorts_0_addr; // @[RenameTable.scala 108:21]
  wire [5:0] fpRat_io_archWritePorts_0_data; // @[RenameTable.scala 108:21]
  wire  fpRat_io_archWritePorts_1_wen; // @[RenameTable.scala 108:21]
  wire [4:0] fpRat_io_archWritePorts_1_addr; // @[RenameTable.scala 108:21]
  wire [5:0] fpRat_io_archWritePorts_1_data; // @[RenameTable.scala 108:21]
  wire [5:0] fpRat_io_debug_rdata_0; // @[RenameTable.scala 108:21]
  wire [5:0] fpRat_io_debug_rdata_1; // @[RenameTable.scala 108:21]
  wire [5:0] fpRat_io_debug_rdata_2; // @[RenameTable.scala 108:21]
  wire [5:0] fpRat_io_debug_rdata_3; // @[RenameTable.scala 108:21]
  wire [5:0] fpRat_io_debug_rdata_4; // @[RenameTable.scala 108:21]
  wire [5:0] fpRat_io_debug_rdata_5; // @[RenameTable.scala 108:21]
  wire [5:0] fpRat_io_debug_rdata_6; // @[RenameTable.scala 108:21]
  wire [5:0] fpRat_io_debug_rdata_7; // @[RenameTable.scala 108:21]
  wire [5:0] fpRat_io_debug_rdata_8; // @[RenameTable.scala 108:21]
  wire [5:0] fpRat_io_debug_rdata_9; // @[RenameTable.scala 108:21]
  wire [5:0] fpRat_io_debug_rdata_10; // @[RenameTable.scala 108:21]
  wire [5:0] fpRat_io_debug_rdata_11; // @[RenameTable.scala 108:21]
  wire [5:0] fpRat_io_debug_rdata_12; // @[RenameTable.scala 108:21]
  wire [5:0] fpRat_io_debug_rdata_13; // @[RenameTable.scala 108:21]
  wire [5:0] fpRat_io_debug_rdata_14; // @[RenameTable.scala 108:21]
  wire [5:0] fpRat_io_debug_rdata_15; // @[RenameTable.scala 108:21]
  wire [5:0] fpRat_io_debug_rdata_16; // @[RenameTable.scala 108:21]
  wire [5:0] fpRat_io_debug_rdata_17; // @[RenameTable.scala 108:21]
  wire [5:0] fpRat_io_debug_rdata_18; // @[RenameTable.scala 108:21]
  wire [5:0] fpRat_io_debug_rdata_19; // @[RenameTable.scala 108:21]
  wire [5:0] fpRat_io_debug_rdata_20; // @[RenameTable.scala 108:21]
  wire [5:0] fpRat_io_debug_rdata_21; // @[RenameTable.scala 108:21]
  wire [5:0] fpRat_io_debug_rdata_22; // @[RenameTable.scala 108:21]
  wire [5:0] fpRat_io_debug_rdata_23; // @[RenameTable.scala 108:21]
  wire [5:0] fpRat_io_debug_rdata_24; // @[RenameTable.scala 108:21]
  wire [5:0] fpRat_io_debug_rdata_25; // @[RenameTable.scala 108:21]
  wire [5:0] fpRat_io_debug_rdata_26; // @[RenameTable.scala 108:21]
  wire [5:0] fpRat_io_debug_rdata_27; // @[RenameTable.scala 108:21]
  wire [5:0] fpRat_io_debug_rdata_28; // @[RenameTable.scala 108:21]
  wire [5:0] fpRat_io_debug_rdata_29; // @[RenameTable.scala 108:21]
  wire [5:0] fpRat_io_debug_rdata_30; // @[RenameTable.scala 108:21]
  wire [5:0] fpRat_io_debug_rdata_31; // @[RenameTable.scala 108:21]
  wire  _intRat_io_archWritePorts_0_wen_T = io_robCommits_isCommit & io_robCommits_commitValid_0; // @[RenameTable.scala 116:41]
  wire  _intRat_io_archWritePorts_1_wen_T = io_robCommits_isCommit & io_robCommits_commitValid_1; // @[RenameTable.scala 116:41]
  wire  _intRat_io_specWritePorts_0_wen_T = io_robCommits_isWalk & io_robCommits_walkValid_0; // @[RenameTable.scala 122:39]
  wire  _intRat_io_specWritePorts_1_wen_T = io_robCommits_isWalk & io_robCommits_walkValid_1; // @[RenameTable.scala 122:39]
  RenameTable intRat ( // @[RenameTable.scala 107:22]
    .clock(intRat_clock),
    .reset(intRat_reset),
    .io_redirect(intRat_io_redirect),
    .io_readPorts_0_hold(intRat_io_readPorts_0_hold),
    .io_readPorts_0_addr(intRat_io_readPorts_0_addr),
    .io_readPorts_0_data(intRat_io_readPorts_0_data),
    .io_readPorts_1_hold(intRat_io_readPorts_1_hold),
    .io_readPorts_1_addr(intRat_io_readPorts_1_addr),
    .io_readPorts_1_data(intRat_io_readPorts_1_data),
    .io_readPorts_2_hold(intRat_io_readPorts_2_hold),
    .io_readPorts_2_addr(intRat_io_readPorts_2_addr),
    .io_readPorts_2_data(intRat_io_readPorts_2_data),
    .io_readPorts_3_hold(intRat_io_readPorts_3_hold),
    .io_readPorts_3_addr(intRat_io_readPorts_3_addr),
    .io_readPorts_3_data(intRat_io_readPorts_3_data),
    .io_readPorts_4_hold(intRat_io_readPorts_4_hold),
    .io_readPorts_4_addr(intRat_io_readPorts_4_addr),
    .io_readPorts_4_data(intRat_io_readPorts_4_data),
    .io_readPorts_5_hold(intRat_io_readPorts_5_hold),
    .io_readPorts_5_addr(intRat_io_readPorts_5_addr),
    .io_readPorts_5_data(intRat_io_readPorts_5_data),
    .io_specWritePorts_0_wen(intRat_io_specWritePorts_0_wen),
    .io_specWritePorts_0_addr(intRat_io_specWritePorts_0_addr),
    .io_specWritePorts_0_data(intRat_io_specWritePorts_0_data),
    .io_specWritePorts_1_wen(intRat_io_specWritePorts_1_wen),
    .io_specWritePorts_1_addr(intRat_io_specWritePorts_1_addr),
    .io_specWritePorts_1_data(intRat_io_specWritePorts_1_data),
    .io_archWritePorts_0_wen(intRat_io_archWritePorts_0_wen),
    .io_archWritePorts_0_addr(intRat_io_archWritePorts_0_addr),
    .io_archWritePorts_0_data(intRat_io_archWritePorts_0_data),
    .io_archWritePorts_1_wen(intRat_io_archWritePorts_1_wen),
    .io_archWritePorts_1_addr(intRat_io_archWritePorts_1_addr),
    .io_archWritePorts_1_data(intRat_io_archWritePorts_1_data),
    .io_debug_rdata_0(intRat_io_debug_rdata_0),
    .io_debug_rdata_1(intRat_io_debug_rdata_1),
    .io_debug_rdata_2(intRat_io_debug_rdata_2),
    .io_debug_rdata_3(intRat_io_debug_rdata_3),
    .io_debug_rdata_4(intRat_io_debug_rdata_4),
    .io_debug_rdata_5(intRat_io_debug_rdata_5),
    .io_debug_rdata_6(intRat_io_debug_rdata_6),
    .io_debug_rdata_7(intRat_io_debug_rdata_7),
    .io_debug_rdata_8(intRat_io_debug_rdata_8),
    .io_debug_rdata_9(intRat_io_debug_rdata_9),
    .io_debug_rdata_10(intRat_io_debug_rdata_10),
    .io_debug_rdata_11(intRat_io_debug_rdata_11),
    .io_debug_rdata_12(intRat_io_debug_rdata_12),
    .io_debug_rdata_13(intRat_io_debug_rdata_13),
    .io_debug_rdata_14(intRat_io_debug_rdata_14),
    .io_debug_rdata_15(intRat_io_debug_rdata_15),
    .io_debug_rdata_16(intRat_io_debug_rdata_16),
    .io_debug_rdata_17(intRat_io_debug_rdata_17),
    .io_debug_rdata_18(intRat_io_debug_rdata_18),
    .io_debug_rdata_19(intRat_io_debug_rdata_19),
    .io_debug_rdata_20(intRat_io_debug_rdata_20),
    .io_debug_rdata_21(intRat_io_debug_rdata_21),
    .io_debug_rdata_22(intRat_io_debug_rdata_22),
    .io_debug_rdata_23(intRat_io_debug_rdata_23),
    .io_debug_rdata_24(intRat_io_debug_rdata_24),
    .io_debug_rdata_25(intRat_io_debug_rdata_25),
    .io_debug_rdata_26(intRat_io_debug_rdata_26),
    .io_debug_rdata_27(intRat_io_debug_rdata_27),
    .io_debug_rdata_28(intRat_io_debug_rdata_28),
    .io_debug_rdata_29(intRat_io_debug_rdata_29),
    .io_debug_rdata_30(intRat_io_debug_rdata_30),
    .io_debug_rdata_31(intRat_io_debug_rdata_31)
  );
  RenameTable_1 fpRat ( // @[RenameTable.scala 108:21]
    .clock(fpRat_clock),
    .reset(fpRat_reset),
    .io_redirect(fpRat_io_redirect),
    .io_readPorts_0_hold(fpRat_io_readPorts_0_hold),
    .io_readPorts_0_addr(fpRat_io_readPorts_0_addr),
    .io_readPorts_0_data(fpRat_io_readPorts_0_data),
    .io_readPorts_1_hold(fpRat_io_readPorts_1_hold),
    .io_readPorts_1_addr(fpRat_io_readPorts_1_addr),
    .io_readPorts_1_data(fpRat_io_readPorts_1_data),
    .io_readPorts_2_hold(fpRat_io_readPorts_2_hold),
    .io_readPorts_2_addr(fpRat_io_readPorts_2_addr),
    .io_readPorts_2_data(fpRat_io_readPorts_2_data),
    .io_readPorts_3_hold(fpRat_io_readPorts_3_hold),
    .io_readPorts_3_addr(fpRat_io_readPorts_3_addr),
    .io_readPorts_3_data(fpRat_io_readPorts_3_data),
    .io_readPorts_4_hold(fpRat_io_readPorts_4_hold),
    .io_readPorts_4_addr(fpRat_io_readPorts_4_addr),
    .io_readPorts_4_data(fpRat_io_readPorts_4_data),
    .io_readPorts_5_hold(fpRat_io_readPorts_5_hold),
    .io_readPorts_5_addr(fpRat_io_readPorts_5_addr),
    .io_readPorts_5_data(fpRat_io_readPorts_5_data),
    .io_readPorts_6_hold(fpRat_io_readPorts_6_hold),
    .io_readPorts_6_addr(fpRat_io_readPorts_6_addr),
    .io_readPorts_6_data(fpRat_io_readPorts_6_data),
    .io_readPorts_7_hold(fpRat_io_readPorts_7_hold),
    .io_readPorts_7_addr(fpRat_io_readPorts_7_addr),
    .io_readPorts_7_data(fpRat_io_readPorts_7_data),
    .io_specWritePorts_0_wen(fpRat_io_specWritePorts_0_wen),
    .io_specWritePorts_0_addr(fpRat_io_specWritePorts_0_addr),
    .io_specWritePorts_0_data(fpRat_io_specWritePorts_0_data),
    .io_specWritePorts_1_wen(fpRat_io_specWritePorts_1_wen),
    .io_specWritePorts_1_addr(fpRat_io_specWritePorts_1_addr),
    .io_specWritePorts_1_data(fpRat_io_specWritePorts_1_data),
    .io_archWritePorts_0_wen(fpRat_io_archWritePorts_0_wen),
    .io_archWritePorts_0_addr(fpRat_io_archWritePorts_0_addr),
    .io_archWritePorts_0_data(fpRat_io_archWritePorts_0_data),
    .io_archWritePorts_1_wen(fpRat_io_archWritePorts_1_wen),
    .io_archWritePorts_1_addr(fpRat_io_archWritePorts_1_addr),
    .io_archWritePorts_1_data(fpRat_io_archWritePorts_1_data),
    .io_debug_rdata_0(fpRat_io_debug_rdata_0),
    .io_debug_rdata_1(fpRat_io_debug_rdata_1),
    .io_debug_rdata_2(fpRat_io_debug_rdata_2),
    .io_debug_rdata_3(fpRat_io_debug_rdata_3),
    .io_debug_rdata_4(fpRat_io_debug_rdata_4),
    .io_debug_rdata_5(fpRat_io_debug_rdata_5),
    .io_debug_rdata_6(fpRat_io_debug_rdata_6),
    .io_debug_rdata_7(fpRat_io_debug_rdata_7),
    .io_debug_rdata_8(fpRat_io_debug_rdata_8),
    .io_debug_rdata_9(fpRat_io_debug_rdata_9),
    .io_debug_rdata_10(fpRat_io_debug_rdata_10),
    .io_debug_rdata_11(fpRat_io_debug_rdata_11),
    .io_debug_rdata_12(fpRat_io_debug_rdata_12),
    .io_debug_rdata_13(fpRat_io_debug_rdata_13),
    .io_debug_rdata_14(fpRat_io_debug_rdata_14),
    .io_debug_rdata_15(fpRat_io_debug_rdata_15),
    .io_debug_rdata_16(fpRat_io_debug_rdata_16),
    .io_debug_rdata_17(fpRat_io_debug_rdata_17),
    .io_debug_rdata_18(fpRat_io_debug_rdata_18),
    .io_debug_rdata_19(fpRat_io_debug_rdata_19),
    .io_debug_rdata_20(fpRat_io_debug_rdata_20),
    .io_debug_rdata_21(fpRat_io_debug_rdata_21),
    .io_debug_rdata_22(fpRat_io_debug_rdata_22),
    .io_debug_rdata_23(fpRat_io_debug_rdata_23),
    .io_debug_rdata_24(fpRat_io_debug_rdata_24),
    .io_debug_rdata_25(fpRat_io_debug_rdata_25),
    .io_debug_rdata_26(fpRat_io_debug_rdata_26),
    .io_debug_rdata_27(fpRat_io_debug_rdata_27),
    .io_debug_rdata_28(fpRat_io_debug_rdata_28),
    .io_debug_rdata_29(fpRat_io_debug_rdata_29),
    .io_debug_rdata_30(fpRat_io_debug_rdata_30),
    .io_debug_rdata_31(fpRat_io_debug_rdata_31)
  );
  assign io_intReadPorts_0_0_data = intRat_io_readPorts_0_data; // @[RenameTable.scala 111:23]
  assign io_intReadPorts_0_1_data = intRat_io_readPorts_1_data; // @[RenameTable.scala 111:23]
  assign io_intReadPorts_0_2_data = intRat_io_readPorts_2_data; // @[RenameTable.scala 111:23]
  assign io_intReadPorts_1_0_data = intRat_io_readPorts_3_data; // @[RenameTable.scala 111:23]
  assign io_intReadPorts_1_1_data = intRat_io_readPorts_4_data; // @[RenameTable.scala 111:23]
  assign io_intReadPorts_1_2_data = intRat_io_readPorts_5_data; // @[RenameTable.scala 111:23]
  assign io_fpReadPorts_0_0_data = fpRat_io_readPorts_0_data; // @[RenameTable.scala 137:22]
  assign io_fpReadPorts_0_1_data = fpRat_io_readPorts_1_data; // @[RenameTable.scala 137:22]
  assign io_fpReadPorts_0_2_data = fpRat_io_readPorts_2_data; // @[RenameTable.scala 137:22]
  assign io_fpReadPorts_0_3_data = fpRat_io_readPorts_3_data; // @[RenameTable.scala 137:22]
  assign io_fpReadPorts_1_0_data = fpRat_io_readPorts_4_data; // @[RenameTable.scala 137:22]
  assign io_fpReadPorts_1_1_data = fpRat_io_readPorts_5_data; // @[RenameTable.scala 137:22]
  assign io_fpReadPorts_1_2_data = fpRat_io_readPorts_6_data; // @[RenameTable.scala 137:22]
  assign io_fpReadPorts_1_3_data = fpRat_io_readPorts_7_data; // @[RenameTable.scala 137:22]
  assign io_debug_int_rat_0 = intRat_io_debug_rdata_0; // @[RenameTable.scala 110:25]
  assign io_debug_int_rat_1 = intRat_io_debug_rdata_1; // @[RenameTable.scala 110:25]
  assign io_debug_int_rat_2 = intRat_io_debug_rdata_2; // @[RenameTable.scala 110:25]
  assign io_debug_int_rat_3 = intRat_io_debug_rdata_3; // @[RenameTable.scala 110:25]
  assign io_debug_int_rat_4 = intRat_io_debug_rdata_4; // @[RenameTable.scala 110:25]
  assign io_debug_int_rat_5 = intRat_io_debug_rdata_5; // @[RenameTable.scala 110:25]
  assign io_debug_int_rat_6 = intRat_io_debug_rdata_6; // @[RenameTable.scala 110:25]
  assign io_debug_int_rat_7 = intRat_io_debug_rdata_7; // @[RenameTable.scala 110:25]
  assign io_debug_int_rat_8 = intRat_io_debug_rdata_8; // @[RenameTable.scala 110:25]
  assign io_debug_int_rat_9 = intRat_io_debug_rdata_9; // @[RenameTable.scala 110:25]
  assign io_debug_int_rat_10 = intRat_io_debug_rdata_10; // @[RenameTable.scala 110:25]
  assign io_debug_int_rat_11 = intRat_io_debug_rdata_11; // @[RenameTable.scala 110:25]
  assign io_debug_int_rat_12 = intRat_io_debug_rdata_12; // @[RenameTable.scala 110:25]
  assign io_debug_int_rat_13 = intRat_io_debug_rdata_13; // @[RenameTable.scala 110:25]
  assign io_debug_int_rat_14 = intRat_io_debug_rdata_14; // @[RenameTable.scala 110:25]
  assign io_debug_int_rat_15 = intRat_io_debug_rdata_15; // @[RenameTable.scala 110:25]
  assign io_debug_int_rat_16 = intRat_io_debug_rdata_16; // @[RenameTable.scala 110:25]
  assign io_debug_int_rat_17 = intRat_io_debug_rdata_17; // @[RenameTable.scala 110:25]
  assign io_debug_int_rat_18 = intRat_io_debug_rdata_18; // @[RenameTable.scala 110:25]
  assign io_debug_int_rat_19 = intRat_io_debug_rdata_19; // @[RenameTable.scala 110:25]
  assign io_debug_int_rat_20 = intRat_io_debug_rdata_20; // @[RenameTable.scala 110:25]
  assign io_debug_int_rat_21 = intRat_io_debug_rdata_21; // @[RenameTable.scala 110:25]
  assign io_debug_int_rat_22 = intRat_io_debug_rdata_22; // @[RenameTable.scala 110:25]
  assign io_debug_int_rat_23 = intRat_io_debug_rdata_23; // @[RenameTable.scala 110:25]
  assign io_debug_int_rat_24 = intRat_io_debug_rdata_24; // @[RenameTable.scala 110:25]
  assign io_debug_int_rat_25 = intRat_io_debug_rdata_25; // @[RenameTable.scala 110:25]
  assign io_debug_int_rat_26 = intRat_io_debug_rdata_26; // @[RenameTable.scala 110:25]
  assign io_debug_int_rat_27 = intRat_io_debug_rdata_27; // @[RenameTable.scala 110:25]
  assign io_debug_int_rat_28 = intRat_io_debug_rdata_28; // @[RenameTable.scala 110:25]
  assign io_debug_int_rat_29 = intRat_io_debug_rdata_29; // @[RenameTable.scala 110:25]
  assign io_debug_int_rat_30 = intRat_io_debug_rdata_30; // @[RenameTable.scala 110:25]
  assign io_debug_int_rat_31 = intRat_io_debug_rdata_31; // @[RenameTable.scala 110:25]
  assign io_debug_fp_rat_0 = fpRat_io_debug_rdata_0; // @[RenameTable.scala 136:24]
  assign io_debug_fp_rat_1 = fpRat_io_debug_rdata_1; // @[RenameTable.scala 136:24]
  assign io_debug_fp_rat_2 = fpRat_io_debug_rdata_2; // @[RenameTable.scala 136:24]
  assign io_debug_fp_rat_3 = fpRat_io_debug_rdata_3; // @[RenameTable.scala 136:24]
  assign io_debug_fp_rat_4 = fpRat_io_debug_rdata_4; // @[RenameTable.scala 136:24]
  assign io_debug_fp_rat_5 = fpRat_io_debug_rdata_5; // @[RenameTable.scala 136:24]
  assign io_debug_fp_rat_6 = fpRat_io_debug_rdata_6; // @[RenameTable.scala 136:24]
  assign io_debug_fp_rat_7 = fpRat_io_debug_rdata_7; // @[RenameTable.scala 136:24]
  assign io_debug_fp_rat_8 = fpRat_io_debug_rdata_8; // @[RenameTable.scala 136:24]
  assign io_debug_fp_rat_9 = fpRat_io_debug_rdata_9; // @[RenameTable.scala 136:24]
  assign io_debug_fp_rat_10 = fpRat_io_debug_rdata_10; // @[RenameTable.scala 136:24]
  assign io_debug_fp_rat_11 = fpRat_io_debug_rdata_11; // @[RenameTable.scala 136:24]
  assign io_debug_fp_rat_12 = fpRat_io_debug_rdata_12; // @[RenameTable.scala 136:24]
  assign io_debug_fp_rat_13 = fpRat_io_debug_rdata_13; // @[RenameTable.scala 136:24]
  assign io_debug_fp_rat_14 = fpRat_io_debug_rdata_14; // @[RenameTable.scala 136:24]
  assign io_debug_fp_rat_15 = fpRat_io_debug_rdata_15; // @[RenameTable.scala 136:24]
  assign io_debug_fp_rat_16 = fpRat_io_debug_rdata_16; // @[RenameTable.scala 136:24]
  assign io_debug_fp_rat_17 = fpRat_io_debug_rdata_17; // @[RenameTable.scala 136:24]
  assign io_debug_fp_rat_18 = fpRat_io_debug_rdata_18; // @[RenameTable.scala 136:24]
  assign io_debug_fp_rat_19 = fpRat_io_debug_rdata_19; // @[RenameTable.scala 136:24]
  assign io_debug_fp_rat_20 = fpRat_io_debug_rdata_20; // @[RenameTable.scala 136:24]
  assign io_debug_fp_rat_21 = fpRat_io_debug_rdata_21; // @[RenameTable.scala 136:24]
  assign io_debug_fp_rat_22 = fpRat_io_debug_rdata_22; // @[RenameTable.scala 136:24]
  assign io_debug_fp_rat_23 = fpRat_io_debug_rdata_23; // @[RenameTable.scala 136:24]
  assign io_debug_fp_rat_24 = fpRat_io_debug_rdata_24; // @[RenameTable.scala 136:24]
  assign io_debug_fp_rat_25 = fpRat_io_debug_rdata_25; // @[RenameTable.scala 136:24]
  assign io_debug_fp_rat_26 = fpRat_io_debug_rdata_26; // @[RenameTable.scala 136:24]
  assign io_debug_fp_rat_27 = fpRat_io_debug_rdata_27; // @[RenameTable.scala 136:24]
  assign io_debug_fp_rat_28 = fpRat_io_debug_rdata_28; // @[RenameTable.scala 136:24]
  assign io_debug_fp_rat_29 = fpRat_io_debug_rdata_29; // @[RenameTable.scala 136:24]
  assign io_debug_fp_rat_30 = fpRat_io_debug_rdata_30; // @[RenameTable.scala 136:24]
  assign io_debug_fp_rat_31 = fpRat_io_debug_rdata_31; // @[RenameTable.scala 136:24]
  assign intRat_clock = clock;
  assign intRat_reset = reset;
  assign intRat_io_redirect = io_redirect; // @[RenameTable.scala 112:22]
  assign intRat_io_readPorts_0_hold = io_intReadPorts_0_0_hold; // @[RenameTable.scala 111:23]
  assign intRat_io_readPorts_0_addr = io_intReadPorts_0_0_addr; // @[RenameTable.scala 111:23]
  assign intRat_io_readPorts_1_hold = io_intReadPorts_0_1_hold; // @[RenameTable.scala 111:23]
  assign intRat_io_readPorts_1_addr = io_intReadPorts_0_1_addr; // @[RenameTable.scala 111:23]
  assign intRat_io_readPorts_2_hold = io_intReadPorts_0_2_hold; // @[RenameTable.scala 111:23]
  assign intRat_io_readPorts_2_addr = io_intReadPorts_0_2_addr; // @[RenameTable.scala 111:23]
  assign intRat_io_readPorts_3_hold = io_intReadPorts_1_0_hold; // @[RenameTable.scala 111:23]
  assign intRat_io_readPorts_3_addr = io_intReadPorts_1_0_addr; // @[RenameTable.scala 111:23]
  assign intRat_io_readPorts_4_hold = io_intReadPorts_1_1_hold; // @[RenameTable.scala 111:23]
  assign intRat_io_readPorts_4_addr = io_intReadPorts_1_1_addr; // @[RenameTable.scala 111:23]
  assign intRat_io_readPorts_5_hold = io_intReadPorts_1_2_hold; // @[RenameTable.scala 111:23]
  assign intRat_io_readPorts_5_addr = io_intReadPorts_1_2_addr; // @[RenameTable.scala 111:23]
  assign intRat_io_specWritePorts_0_wen = io_intRenamePorts_0_wen | io_robCommits_isWalk & io_robCommits_walkValid_0 &
    io_robCommits_info_0_rfWen; // @[RenameTable.scala 122:15 128:23 129:17]
  assign intRat_io_specWritePorts_0_addr = io_intRenamePorts_0_wen ? io_intRenamePorts_0_addr :
    io_robCommits_info_0_ldest; // @[RenameTable.scala 123:15 128:23 130:17]
  assign intRat_io_specWritePorts_0_data = io_intRenamePorts_0_wen ? io_intRenamePorts_0_data :
    io_robCommits_info_0_pdest; // @[RenameTable.scala 124:15 128:23 131:17]
  assign intRat_io_specWritePorts_1_wen = io_intRenamePorts_1_wen | io_robCommits_isWalk & io_robCommits_walkValid_1 &
    io_robCommits_info_1_rfWen; // @[RenameTable.scala 122:15 128:23 129:17]
  assign intRat_io_specWritePorts_1_addr = io_intRenamePorts_1_wen ? io_intRenamePorts_1_addr :
    io_robCommits_info_1_ldest; // @[RenameTable.scala 123:15 128:23 130:17]
  assign intRat_io_specWritePorts_1_data = io_intRenamePorts_1_wen ? io_intRenamePorts_1_data :
    io_robCommits_info_1_pdest; // @[RenameTable.scala 124:15 128:23 131:17]
  assign intRat_io_archWritePorts_0_wen = io_robCommits_isCommit & io_robCommits_commitValid_0 &
    io_robCommits_info_0_rfWen; // @[RenameTable.scala 116:73]
  assign intRat_io_archWritePorts_0_addr = io_robCommits_info_0_ldest; // @[RenameTable.scala 117:15]
  assign intRat_io_archWritePorts_0_data = io_robCommits_info_0_pdest; // @[RenameTable.scala 118:15]
  assign intRat_io_archWritePorts_1_wen = io_robCommits_isCommit & io_robCommits_commitValid_1 &
    io_robCommits_info_1_rfWen; // @[RenameTable.scala 116:73]
  assign intRat_io_archWritePorts_1_addr = io_robCommits_info_1_ldest; // @[RenameTable.scala 117:15]
  assign intRat_io_archWritePorts_1_data = io_robCommits_info_1_pdest; // @[RenameTable.scala 118:15]
  assign fpRat_clock = clock;
  assign fpRat_reset = reset;
  assign fpRat_io_redirect = io_redirect; // @[RenameTable.scala 113:21]
  assign fpRat_io_readPorts_0_hold = io_fpReadPorts_0_0_hold; // @[RenameTable.scala 137:22]
  assign fpRat_io_readPorts_0_addr = io_fpReadPorts_0_0_addr; // @[RenameTable.scala 137:22]
  assign fpRat_io_readPorts_1_hold = io_fpReadPorts_0_1_hold; // @[RenameTable.scala 137:22]
  assign fpRat_io_readPorts_1_addr = io_fpReadPorts_0_1_addr; // @[RenameTable.scala 137:22]
  assign fpRat_io_readPorts_2_hold = io_fpReadPorts_0_2_hold; // @[RenameTable.scala 137:22]
  assign fpRat_io_readPorts_2_addr = io_fpReadPorts_0_2_addr; // @[RenameTable.scala 137:22]
  assign fpRat_io_readPorts_3_hold = io_fpReadPorts_0_3_hold; // @[RenameTable.scala 137:22]
  assign fpRat_io_readPorts_3_addr = io_fpReadPorts_0_3_addr; // @[RenameTable.scala 137:22]
  assign fpRat_io_readPorts_4_hold = io_fpReadPorts_1_0_hold; // @[RenameTable.scala 137:22]
  assign fpRat_io_readPorts_4_addr = io_fpReadPorts_1_0_addr; // @[RenameTable.scala 137:22]
  assign fpRat_io_readPorts_5_hold = io_fpReadPorts_1_1_hold; // @[RenameTable.scala 137:22]
  assign fpRat_io_readPorts_5_addr = io_fpReadPorts_1_1_addr; // @[RenameTable.scala 137:22]
  assign fpRat_io_readPorts_6_hold = io_fpReadPorts_1_2_hold; // @[RenameTable.scala 137:22]
  assign fpRat_io_readPorts_6_addr = io_fpReadPorts_1_2_addr; // @[RenameTable.scala 137:22]
  assign fpRat_io_readPorts_7_hold = io_fpReadPorts_1_3_hold; // @[RenameTable.scala 137:22]
  assign fpRat_io_readPorts_7_addr = io_fpReadPorts_1_3_addr; // @[RenameTable.scala 137:22]
  assign fpRat_io_specWritePorts_0_wen = io_fpRenamePorts_0_wen | _intRat_io_specWritePorts_0_wen_T &
    io_robCommits_info_0_fpWen; // @[RenameTable.scala 144:15 149:23 150:17]
  assign fpRat_io_specWritePorts_0_addr = io_fpRenamePorts_0_wen ? io_fpRenamePorts_0_addr : io_robCommits_info_0_ldest; // @[RenameTable.scala 145:15 149:23 151:17]
  assign fpRat_io_specWritePorts_0_data = io_fpRenamePorts_0_wen ? io_fpRenamePorts_0_data : io_robCommits_info_0_pdest; // @[RenameTable.scala 146:15 149:23 152:17]
  assign fpRat_io_specWritePorts_1_wen = io_fpRenamePorts_1_wen | _intRat_io_specWritePorts_1_wen_T &
    io_robCommits_info_1_fpWen; // @[RenameTable.scala 144:15 149:23 150:17]
  assign fpRat_io_specWritePorts_1_addr = io_fpRenamePorts_1_wen ? io_fpRenamePorts_1_addr : io_robCommits_info_1_ldest; // @[RenameTable.scala 145:15 149:23 151:17]
  assign fpRat_io_specWritePorts_1_data = io_fpRenamePorts_1_wen ? io_fpRenamePorts_1_data : io_robCommits_info_1_pdest; // @[RenameTable.scala 146:15 149:23 152:17]
  assign fpRat_io_archWritePorts_0_wen = _intRat_io_archWritePorts_0_wen_T & io_robCommits_info_0_fpWen; // @[RenameTable.scala 139:73]
  assign fpRat_io_archWritePorts_0_addr = io_robCommits_info_0_ldest; // @[RenameTable.scala 140:15]
  assign fpRat_io_archWritePorts_0_data = io_robCommits_info_0_pdest; // @[RenameTable.scala 141:15]
  assign fpRat_io_archWritePorts_1_wen = _intRat_io_archWritePorts_1_wen_T & io_robCommits_info_1_fpWen; // @[RenameTable.scala 139:73]
  assign fpRat_io_archWritePorts_1_addr = io_robCommits_info_1_ldest; // @[RenameTable.scala 140:15]
  assign fpRat_io_archWritePorts_1_data = io_robCommits_info_1_pdest; // @[RenameTable.scala 141:15]
endmodule

