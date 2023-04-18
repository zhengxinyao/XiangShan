module RenameTable(
  input        clock,
  input        reset,
  input        io_redirect,
  input        io_readPorts_0_hold,
  input  [4:0] io_readPorts_0_addr,
  output [5:0] io_readPorts_0_data,
  input        io_readPorts_1_hold,
  input  [4:0] io_readPorts_1_addr,
  output [5:0] io_readPorts_1_data,
  input        io_readPorts_2_hold,
  input  [4:0] io_readPorts_2_addr,
  output [5:0] io_readPorts_2_data,
  input        io_readPorts_3_hold,
  input  [4:0] io_readPorts_3_addr,
  output [5:0] io_readPorts_3_data,
  input        io_readPorts_4_hold,
  input  [4:0] io_readPorts_4_addr,
  output [5:0] io_readPorts_4_data,
  input        io_readPorts_5_hold,
  input  [4:0] io_readPorts_5_addr,
  output [5:0] io_readPorts_5_data,
  input        io_specWritePorts_0_wen,
  input  [4:0] io_specWritePorts_0_addr,
  input  [5:0] io_specWritePorts_0_data,
  input        io_specWritePorts_1_wen,
  input  [4:0] io_specWritePorts_1_addr,
  input  [5:0] io_specWritePorts_1_data,
  input        io_archWritePorts_0_wen,
  input  [4:0] io_archWritePorts_0_addr,
  input  [5:0] io_archWritePorts_0_data,
  input        io_archWritePorts_1_wen,
  input  [4:0] io_archWritePorts_1_addr,
  input  [5:0] io_archWritePorts_1_data,
  output [5:0] io_debug_rdata_0,
  output [5:0] io_debug_rdata_1,
  output [5:0] io_debug_rdata_2,
  output [5:0] io_debug_rdata_3,
  output [5:0] io_debug_rdata_4,
  output [5:0] io_debug_rdata_5,
  output [5:0] io_debug_rdata_6,
  output [5:0] io_debug_rdata_7,
  output [5:0] io_debug_rdata_8,
  output [5:0] io_debug_rdata_9,
  output [5:0] io_debug_rdata_10,
  output [5:0] io_debug_rdata_11,
  output [5:0] io_debug_rdata_12,
  output [5:0] io_debug_rdata_13,
  output [5:0] io_debug_rdata_14,
  output [5:0] io_debug_rdata_15,
  output [5:0] io_debug_rdata_16,
  output [5:0] io_debug_rdata_17,
  output [5:0] io_debug_rdata_18,
  output [5:0] io_debug_rdata_19,
  output [5:0] io_debug_rdata_20,
  output [5:0] io_debug_rdata_21,
  output [5:0] io_debug_rdata_22,
  output [5:0] io_debug_rdata_23,
  output [5:0] io_debug_rdata_24,
  output [5:0] io_debug_rdata_25,
  output [5:0] io_debug_rdata_26,
  output [5:0] io_debug_rdata_27,
  output [5:0] io_debug_rdata_28,
  output [5:0] io_debug_rdata_29,
  output [5:0] io_debug_rdata_30,
  output [5:0] io_debug_rdata_31
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
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [31:0] _RAND_66;
  reg [31:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_69;
  reg [31:0] _RAND_70;
  reg [31:0] _RAND_71;
  reg [31:0] _RAND_72;
  reg [31:0] _RAND_73;
  reg [31:0] _RAND_74;
  reg [31:0] _RAND_75;
  reg [31:0] _RAND_76;
  reg [31:0] _RAND_77;
  reg [31:0] _RAND_78;
  reg [31:0] _RAND_79;
  reg [31:0] _RAND_80;
  reg [31:0] _RAND_81;
  reg [31:0] _RAND_82;
  reg [31:0] _RAND_83;
  reg [31:0] _RAND_84;
  reg [31:0] _RAND_85;
  reg [31:0] _RAND_86;
  reg [31:0] _RAND_87;
  reg [31:0] _RAND_88;
  reg [31:0] _RAND_89;
  reg [31:0] _RAND_90;
  reg [31:0] _RAND_91;
  reg [31:0] _RAND_92;
  reg [31:0] _RAND_93;
  reg [31:0] _RAND_94;
`endif // RANDOMIZE_REG_INIT
  reg [5:0] spec_table_0; // @[RenameTable.scala 49:27]
  reg [5:0] spec_table_1; // @[RenameTable.scala 49:27]
  reg [5:0] spec_table_2; // @[RenameTable.scala 49:27]
  reg [5:0] spec_table_3; // @[RenameTable.scala 49:27]
  reg [5:0] spec_table_4; // @[RenameTable.scala 49:27]
  reg [5:0] spec_table_5; // @[RenameTable.scala 49:27]
  reg [5:0] spec_table_6; // @[RenameTable.scala 49:27]
  reg [5:0] spec_table_7; // @[RenameTable.scala 49:27]
  reg [5:0] spec_table_8; // @[RenameTable.scala 49:27]
  reg [5:0] spec_table_9; // @[RenameTable.scala 49:27]
  reg [5:0] spec_table_10; // @[RenameTable.scala 49:27]
  reg [5:0] spec_table_11; // @[RenameTable.scala 49:27]
  reg [5:0] spec_table_12; // @[RenameTable.scala 49:27]
  reg [5:0] spec_table_13; // @[RenameTable.scala 49:27]
  reg [5:0] spec_table_14; // @[RenameTable.scala 49:27]
  reg [5:0] spec_table_15; // @[RenameTable.scala 49:27]
  reg [5:0] spec_table_16; // @[RenameTable.scala 49:27]
  reg [5:0] spec_table_17; // @[RenameTable.scala 49:27]
  reg [5:0] spec_table_18; // @[RenameTable.scala 49:27]
  reg [5:0] spec_table_19; // @[RenameTable.scala 49:27]
  reg [5:0] spec_table_20; // @[RenameTable.scala 49:27]
  reg [5:0] spec_table_21; // @[RenameTable.scala 49:27]
  reg [5:0] spec_table_22; // @[RenameTable.scala 49:27]
  reg [5:0] spec_table_23; // @[RenameTable.scala 49:27]
  reg [5:0] spec_table_24; // @[RenameTable.scala 49:27]
  reg [5:0] spec_table_25; // @[RenameTable.scala 49:27]
  reg [5:0] spec_table_26; // @[RenameTable.scala 49:27]
  reg [5:0] spec_table_27; // @[RenameTable.scala 49:27]
  reg [5:0] spec_table_28; // @[RenameTable.scala 49:27]
  reg [5:0] spec_table_29; // @[RenameTable.scala 49:27]
  reg [5:0] spec_table_30; // @[RenameTable.scala 49:27]
  reg [5:0] spec_table_31; // @[RenameTable.scala 49:27]
  reg [5:0] arch_table_0; // @[RenameTable.scala 52:27]
  reg [5:0] arch_table_1; // @[RenameTable.scala 52:27]
  reg [5:0] arch_table_2; // @[RenameTable.scala 52:27]
  reg [5:0] arch_table_3; // @[RenameTable.scala 52:27]
  reg [5:0] arch_table_4; // @[RenameTable.scala 52:27]
  reg [5:0] arch_table_5; // @[RenameTable.scala 52:27]
  reg [5:0] arch_table_6; // @[RenameTable.scala 52:27]
  reg [5:0] arch_table_7; // @[RenameTable.scala 52:27]
  reg [5:0] arch_table_8; // @[RenameTable.scala 52:27]
  reg [5:0] arch_table_9; // @[RenameTable.scala 52:27]
  reg [5:0] arch_table_10; // @[RenameTable.scala 52:27]
  reg [5:0] arch_table_11; // @[RenameTable.scala 52:27]
  reg [5:0] arch_table_12; // @[RenameTable.scala 52:27]
  reg [5:0] arch_table_13; // @[RenameTable.scala 52:27]
  reg [5:0] arch_table_14; // @[RenameTable.scala 52:27]
  reg [5:0] arch_table_15; // @[RenameTable.scala 52:27]
  reg [5:0] arch_table_16; // @[RenameTable.scala 52:27]
  reg [5:0] arch_table_17; // @[RenameTable.scala 52:27]
  reg [5:0] arch_table_18; // @[RenameTable.scala 52:27]
  reg [5:0] arch_table_19; // @[RenameTable.scala 52:27]
  reg [5:0] arch_table_20; // @[RenameTable.scala 52:27]
  reg [5:0] arch_table_21; // @[RenameTable.scala 52:27]
  reg [5:0] arch_table_22; // @[RenameTable.scala 52:27]
  reg [5:0] arch_table_23; // @[RenameTable.scala 52:27]
  reg [5:0] arch_table_24; // @[RenameTable.scala 52:27]
  reg [5:0] arch_table_25; // @[RenameTable.scala 52:27]
  reg [5:0] arch_table_26; // @[RenameTable.scala 52:27]
  reg [5:0] arch_table_27; // @[RenameTable.scala 52:27]
  reg [5:0] arch_table_28; // @[RenameTable.scala 52:27]
  reg [5:0] arch_table_29; // @[RenameTable.scala 52:27]
  reg [5:0] arch_table_30; // @[RenameTable.scala 52:27]
  reg [5:0] arch_table_31; // @[RenameTable.scala 52:27]
  reg  t1_redirect; // @[RenameTable.scala 60:28]
  reg  t1_wSpec_1_wen; // @[RenameTable.scala 63:25]
  reg [4:0] t1_wSpec_1_addr; // @[RenameTable.scala 63:25]
  wire [31:0] _t1_wSpec_addr_T_1 = 32'h1 << t1_wSpec_1_addr; // @[OneHot.scala 57:35]
  wire [31:0] t1_wSpec_addr_1 = t1_wSpec_1_wen ? _t1_wSpec_addr_T_1 : 32'h0; // @[RenameTable.scala 66:44]
  wire  matchVec_1 = t1_wSpec_addr_1[0]; // @[RenameTable.scala 68:44]
  reg  t1_wSpec_0_wen; // @[RenameTable.scala 63:25]
  reg [4:0] t1_wSpec_0_addr; // @[RenameTable.scala 63:25]
  wire [31:0] _t1_wSpec_addr_T = 32'h1 << t1_wSpec_0_addr; // @[OneHot.scala 57:35]
  wire [31:0] t1_wSpec_addr_0 = t1_wSpec_0_wen ? _t1_wSpec_addr_T : 32'h0; // @[RenameTable.scala 66:44]
  wire  matchVec_0 = t1_wSpec_addr_0[0]; // @[RenameTable.scala 68:44]
  wire [1:0] _spec_table_next_0_T = {matchVec_1,matchVec_0}; // @[RenameTable.scala 71:67]
  reg [5:0] t1_wSpec_1_data; // @[RenameTable.scala 63:25]
  reg [5:0] t1_wSpec_0_data; // @[RenameTable.scala 63:25]
  wire [5:0] wMatch = matchVec_1 ? t1_wSpec_1_data : t1_wSpec_0_data; // @[ParallelMux.scala 90:77]
  wire [5:0] _spec_table_next_0_T_2 = |_spec_table_next_0_T ? wMatch : spec_table_0; // @[RenameTable.scala 71:48]
  wire [5:0] spec_table_next_0 = t1_redirect ? arch_table_0 : _spec_table_next_0_T_2; // @[RenameTable.scala 71:16]
  wire  matchVec_1_1 = t1_wSpec_addr_1[1]; // @[RenameTable.scala 68:44]
  wire  matchVec_0_1 = t1_wSpec_addr_0[1]; // @[RenameTable.scala 68:44]
  wire [1:0] _spec_table_next_1_T = {matchVec_1_1,matchVec_0_1}; // @[RenameTable.scala 71:67]
  wire [5:0] wMatch_1 = matchVec_1_1 ? t1_wSpec_1_data : t1_wSpec_0_data; // @[ParallelMux.scala 90:77]
  wire [5:0] _spec_table_next_1_T_2 = |_spec_table_next_1_T ? wMatch_1 : spec_table_1; // @[RenameTable.scala 71:48]
  wire [5:0] spec_table_next_1 = t1_redirect ? arch_table_1 : _spec_table_next_1_T_2; // @[RenameTable.scala 71:16]
  wire [5:0] _GEN_1 = 5'h1 == io_readPorts_0_addr ? spec_table_next_1 : spec_table_next_0; // @[RenameTable.scala 61:{51,51}]
  wire  matchVec_1_2 = t1_wSpec_addr_1[2]; // @[RenameTable.scala 68:44]
  wire  matchVec_0_2 = t1_wSpec_addr_0[2]; // @[RenameTable.scala 68:44]
  wire [1:0] _spec_table_next_2_T = {matchVec_1_2,matchVec_0_2}; // @[RenameTable.scala 71:67]
  wire [5:0] wMatch_2 = matchVec_1_2 ? t1_wSpec_1_data : t1_wSpec_0_data; // @[ParallelMux.scala 90:77]
  wire [5:0] _spec_table_next_2_T_2 = |_spec_table_next_2_T ? wMatch_2 : spec_table_2; // @[RenameTable.scala 71:48]
  wire [5:0] spec_table_next_2 = t1_redirect ? arch_table_2 : _spec_table_next_2_T_2; // @[RenameTable.scala 71:16]
  wire [5:0] _GEN_2 = 5'h2 == io_readPorts_0_addr ? spec_table_next_2 : _GEN_1; // @[RenameTable.scala 61:{51,51}]
  wire  matchVec_1_3 = t1_wSpec_addr_1[3]; // @[RenameTable.scala 68:44]
  wire  matchVec_0_3 = t1_wSpec_addr_0[3]; // @[RenameTable.scala 68:44]
  wire [1:0] _spec_table_next_3_T = {matchVec_1_3,matchVec_0_3}; // @[RenameTable.scala 71:67]
  wire [5:0] wMatch_3 = matchVec_1_3 ? t1_wSpec_1_data : t1_wSpec_0_data; // @[ParallelMux.scala 90:77]
  wire [5:0] _spec_table_next_3_T_2 = |_spec_table_next_3_T ? wMatch_3 : spec_table_3; // @[RenameTable.scala 71:48]
  wire [5:0] spec_table_next_3 = t1_redirect ? arch_table_3 : _spec_table_next_3_T_2; // @[RenameTable.scala 71:16]
  wire [5:0] _GEN_3 = 5'h3 == io_readPorts_0_addr ? spec_table_next_3 : _GEN_2; // @[RenameTable.scala 61:{51,51}]
  wire  matchVec_1_4 = t1_wSpec_addr_1[4]; // @[RenameTable.scala 68:44]
  wire  matchVec_0_4 = t1_wSpec_addr_0[4]; // @[RenameTable.scala 68:44]
  wire [1:0] _spec_table_next_4_T = {matchVec_1_4,matchVec_0_4}; // @[RenameTable.scala 71:67]
  wire [5:0] wMatch_4 = matchVec_1_4 ? t1_wSpec_1_data : t1_wSpec_0_data; // @[ParallelMux.scala 90:77]
  wire [5:0] _spec_table_next_4_T_2 = |_spec_table_next_4_T ? wMatch_4 : spec_table_4; // @[RenameTable.scala 71:48]
  wire [5:0] spec_table_next_4 = t1_redirect ? arch_table_4 : _spec_table_next_4_T_2; // @[RenameTable.scala 71:16]
  wire [5:0] _GEN_4 = 5'h4 == io_readPorts_0_addr ? spec_table_next_4 : _GEN_3; // @[RenameTable.scala 61:{51,51}]
  wire  matchVec_1_5 = t1_wSpec_addr_1[5]; // @[RenameTable.scala 68:44]
  wire  matchVec_0_5 = t1_wSpec_addr_0[5]; // @[RenameTable.scala 68:44]
  wire [1:0] _spec_table_next_5_T = {matchVec_1_5,matchVec_0_5}; // @[RenameTable.scala 71:67]
  wire [5:0] wMatch_5 = matchVec_1_5 ? t1_wSpec_1_data : t1_wSpec_0_data; // @[ParallelMux.scala 90:77]
  wire [5:0] _spec_table_next_5_T_2 = |_spec_table_next_5_T ? wMatch_5 : spec_table_5; // @[RenameTable.scala 71:48]
  wire [5:0] spec_table_next_5 = t1_redirect ? arch_table_5 : _spec_table_next_5_T_2; // @[RenameTable.scala 71:16]
  wire [5:0] _GEN_5 = 5'h5 == io_readPorts_0_addr ? spec_table_next_5 : _GEN_4; // @[RenameTable.scala 61:{51,51}]
  wire  matchVec_1_6 = t1_wSpec_addr_1[6]; // @[RenameTable.scala 68:44]
  wire  matchVec_0_6 = t1_wSpec_addr_0[6]; // @[RenameTable.scala 68:44]
  wire [1:0] _spec_table_next_6_T = {matchVec_1_6,matchVec_0_6}; // @[RenameTable.scala 71:67]
  wire [5:0] wMatch_6 = matchVec_1_6 ? t1_wSpec_1_data : t1_wSpec_0_data; // @[ParallelMux.scala 90:77]
  wire [5:0] _spec_table_next_6_T_2 = |_spec_table_next_6_T ? wMatch_6 : spec_table_6; // @[RenameTable.scala 71:48]
  wire [5:0] spec_table_next_6 = t1_redirect ? arch_table_6 : _spec_table_next_6_T_2; // @[RenameTable.scala 71:16]
  wire [5:0] _GEN_6 = 5'h6 == io_readPorts_0_addr ? spec_table_next_6 : _GEN_5; // @[RenameTable.scala 61:{51,51}]
  wire  matchVec_1_7 = t1_wSpec_addr_1[7]; // @[RenameTable.scala 68:44]
  wire  matchVec_0_7 = t1_wSpec_addr_0[7]; // @[RenameTable.scala 68:44]
  wire [1:0] _spec_table_next_7_T = {matchVec_1_7,matchVec_0_7}; // @[RenameTable.scala 71:67]
  wire [5:0] wMatch_7 = matchVec_1_7 ? t1_wSpec_1_data : t1_wSpec_0_data; // @[ParallelMux.scala 90:77]
  wire [5:0] _spec_table_next_7_T_2 = |_spec_table_next_7_T ? wMatch_7 : spec_table_7; // @[RenameTable.scala 71:48]
  wire [5:0] spec_table_next_7 = t1_redirect ? arch_table_7 : _spec_table_next_7_T_2; // @[RenameTable.scala 71:16]
  wire [5:0] _GEN_7 = 5'h7 == io_readPorts_0_addr ? spec_table_next_7 : _GEN_6; // @[RenameTable.scala 61:{51,51}]
  wire  matchVec_1_8 = t1_wSpec_addr_1[8]; // @[RenameTable.scala 68:44]
  wire  matchVec_0_8 = t1_wSpec_addr_0[8]; // @[RenameTable.scala 68:44]
  wire [1:0] _spec_table_next_8_T = {matchVec_1_8,matchVec_0_8}; // @[RenameTable.scala 71:67]
  wire [5:0] wMatch_8 = matchVec_1_8 ? t1_wSpec_1_data : t1_wSpec_0_data; // @[ParallelMux.scala 90:77]
  wire [5:0] _spec_table_next_8_T_2 = |_spec_table_next_8_T ? wMatch_8 : spec_table_8; // @[RenameTable.scala 71:48]
  wire [5:0] spec_table_next_8 = t1_redirect ? arch_table_8 : _spec_table_next_8_T_2; // @[RenameTable.scala 71:16]
  wire [5:0] _GEN_8 = 5'h8 == io_readPorts_0_addr ? spec_table_next_8 : _GEN_7; // @[RenameTable.scala 61:{51,51}]
  wire  matchVec_1_9 = t1_wSpec_addr_1[9]; // @[RenameTable.scala 68:44]
  wire  matchVec_0_9 = t1_wSpec_addr_0[9]; // @[RenameTable.scala 68:44]
  wire [1:0] _spec_table_next_9_T = {matchVec_1_9,matchVec_0_9}; // @[RenameTable.scala 71:67]
  wire [5:0] wMatch_9 = matchVec_1_9 ? t1_wSpec_1_data : t1_wSpec_0_data; // @[ParallelMux.scala 90:77]
  wire [5:0] _spec_table_next_9_T_2 = |_spec_table_next_9_T ? wMatch_9 : spec_table_9; // @[RenameTable.scala 71:48]
  wire [5:0] spec_table_next_9 = t1_redirect ? arch_table_9 : _spec_table_next_9_T_2; // @[RenameTable.scala 71:16]
  wire [5:0] _GEN_9 = 5'h9 == io_readPorts_0_addr ? spec_table_next_9 : _GEN_8; // @[RenameTable.scala 61:{51,51}]
  wire  matchVec_1_10 = t1_wSpec_addr_1[10]; // @[RenameTable.scala 68:44]
  wire  matchVec_0_10 = t1_wSpec_addr_0[10]; // @[RenameTable.scala 68:44]
  wire [1:0] _spec_table_next_10_T = {matchVec_1_10,matchVec_0_10}; // @[RenameTable.scala 71:67]
  wire [5:0] wMatch_10 = matchVec_1_10 ? t1_wSpec_1_data : t1_wSpec_0_data; // @[ParallelMux.scala 90:77]
  wire [5:0] _spec_table_next_10_T_2 = |_spec_table_next_10_T ? wMatch_10 : spec_table_10; // @[RenameTable.scala 71:48]
  wire [5:0] spec_table_next_10 = t1_redirect ? arch_table_10 : _spec_table_next_10_T_2; // @[RenameTable.scala 71:16]
  wire [5:0] _GEN_10 = 5'ha == io_readPorts_0_addr ? spec_table_next_10 : _GEN_9; // @[RenameTable.scala 61:{51,51}]
  wire  matchVec_1_11 = t1_wSpec_addr_1[11]; // @[RenameTable.scala 68:44]
  wire  matchVec_0_11 = t1_wSpec_addr_0[11]; // @[RenameTable.scala 68:44]
  wire [1:0] _spec_table_next_11_T = {matchVec_1_11,matchVec_0_11}; // @[RenameTable.scala 71:67]
  wire [5:0] wMatch_11 = matchVec_1_11 ? t1_wSpec_1_data : t1_wSpec_0_data; // @[ParallelMux.scala 90:77]
  wire [5:0] _spec_table_next_11_T_2 = |_spec_table_next_11_T ? wMatch_11 : spec_table_11; // @[RenameTable.scala 71:48]
  wire [5:0] spec_table_next_11 = t1_redirect ? arch_table_11 : _spec_table_next_11_T_2; // @[RenameTable.scala 71:16]
  wire [5:0] _GEN_11 = 5'hb == io_readPorts_0_addr ? spec_table_next_11 : _GEN_10; // @[RenameTable.scala 61:{51,51}]
  wire  matchVec_1_12 = t1_wSpec_addr_1[12]; // @[RenameTable.scala 68:44]
  wire  matchVec_0_12 = t1_wSpec_addr_0[12]; // @[RenameTable.scala 68:44]
  wire [1:0] _spec_table_next_12_T = {matchVec_1_12,matchVec_0_12}; // @[RenameTable.scala 71:67]
  wire [5:0] wMatch_12 = matchVec_1_12 ? t1_wSpec_1_data : t1_wSpec_0_data; // @[ParallelMux.scala 90:77]
  wire [5:0] _spec_table_next_12_T_2 = |_spec_table_next_12_T ? wMatch_12 : spec_table_12; // @[RenameTable.scala 71:48]
  wire [5:0] spec_table_next_12 = t1_redirect ? arch_table_12 : _spec_table_next_12_T_2; // @[RenameTable.scala 71:16]
  wire [5:0] _GEN_12 = 5'hc == io_readPorts_0_addr ? spec_table_next_12 : _GEN_11; // @[RenameTable.scala 61:{51,51}]
  wire  matchVec_1_13 = t1_wSpec_addr_1[13]; // @[RenameTable.scala 68:44]
  wire  matchVec_0_13 = t1_wSpec_addr_0[13]; // @[RenameTable.scala 68:44]
  wire [1:0] _spec_table_next_13_T = {matchVec_1_13,matchVec_0_13}; // @[RenameTable.scala 71:67]
  wire [5:0] wMatch_13 = matchVec_1_13 ? t1_wSpec_1_data : t1_wSpec_0_data; // @[ParallelMux.scala 90:77]
  wire [5:0] _spec_table_next_13_T_2 = |_spec_table_next_13_T ? wMatch_13 : spec_table_13; // @[RenameTable.scala 71:48]
  wire [5:0] spec_table_next_13 = t1_redirect ? arch_table_13 : _spec_table_next_13_T_2; // @[RenameTable.scala 71:16]
  wire [5:0] _GEN_13 = 5'hd == io_readPorts_0_addr ? spec_table_next_13 : _GEN_12; // @[RenameTable.scala 61:{51,51}]
  wire  matchVec_1_14 = t1_wSpec_addr_1[14]; // @[RenameTable.scala 68:44]
  wire  matchVec_0_14 = t1_wSpec_addr_0[14]; // @[RenameTable.scala 68:44]
  wire [1:0] _spec_table_next_14_T = {matchVec_1_14,matchVec_0_14}; // @[RenameTable.scala 71:67]
  wire [5:0] wMatch_14 = matchVec_1_14 ? t1_wSpec_1_data : t1_wSpec_0_data; // @[ParallelMux.scala 90:77]
  wire [5:0] _spec_table_next_14_T_2 = |_spec_table_next_14_T ? wMatch_14 : spec_table_14; // @[RenameTable.scala 71:48]
  wire [5:0] spec_table_next_14 = t1_redirect ? arch_table_14 : _spec_table_next_14_T_2; // @[RenameTable.scala 71:16]
  wire [5:0] _GEN_14 = 5'he == io_readPorts_0_addr ? spec_table_next_14 : _GEN_13; // @[RenameTable.scala 61:{51,51}]
  wire  matchVec_1_15 = t1_wSpec_addr_1[15]; // @[RenameTable.scala 68:44]
  wire  matchVec_0_15 = t1_wSpec_addr_0[15]; // @[RenameTable.scala 68:44]
  wire [1:0] _spec_table_next_15_T = {matchVec_1_15,matchVec_0_15}; // @[RenameTable.scala 71:67]
  wire [5:0] wMatch_15 = matchVec_1_15 ? t1_wSpec_1_data : t1_wSpec_0_data; // @[ParallelMux.scala 90:77]
  wire [5:0] _spec_table_next_15_T_2 = |_spec_table_next_15_T ? wMatch_15 : spec_table_15; // @[RenameTable.scala 71:48]
  wire [5:0] spec_table_next_15 = t1_redirect ? arch_table_15 : _spec_table_next_15_T_2; // @[RenameTable.scala 71:16]
  wire [5:0] _GEN_15 = 5'hf == io_readPorts_0_addr ? spec_table_next_15 : _GEN_14; // @[RenameTable.scala 61:{51,51}]
  wire  matchVec_1_16 = t1_wSpec_addr_1[16]; // @[RenameTable.scala 68:44]
  wire  matchVec_0_16 = t1_wSpec_addr_0[16]; // @[RenameTable.scala 68:44]
  wire [1:0] _spec_table_next_16_T = {matchVec_1_16,matchVec_0_16}; // @[RenameTable.scala 71:67]
  wire [5:0] wMatch_16 = matchVec_1_16 ? t1_wSpec_1_data : t1_wSpec_0_data; // @[ParallelMux.scala 90:77]
  wire [5:0] _spec_table_next_16_T_2 = |_spec_table_next_16_T ? wMatch_16 : spec_table_16; // @[RenameTable.scala 71:48]
  wire [5:0] spec_table_next_16 = t1_redirect ? arch_table_16 : _spec_table_next_16_T_2; // @[RenameTable.scala 71:16]
  wire [5:0] _GEN_16 = 5'h10 == io_readPorts_0_addr ? spec_table_next_16 : _GEN_15; // @[RenameTable.scala 61:{51,51}]
  wire  matchVec_1_17 = t1_wSpec_addr_1[17]; // @[RenameTable.scala 68:44]
  wire  matchVec_0_17 = t1_wSpec_addr_0[17]; // @[RenameTable.scala 68:44]
  wire [1:0] _spec_table_next_17_T = {matchVec_1_17,matchVec_0_17}; // @[RenameTable.scala 71:67]
  wire [5:0] wMatch_17 = matchVec_1_17 ? t1_wSpec_1_data : t1_wSpec_0_data; // @[ParallelMux.scala 90:77]
  wire [5:0] _spec_table_next_17_T_2 = |_spec_table_next_17_T ? wMatch_17 : spec_table_17; // @[RenameTable.scala 71:48]
  wire [5:0] spec_table_next_17 = t1_redirect ? arch_table_17 : _spec_table_next_17_T_2; // @[RenameTable.scala 71:16]
  wire [5:0] _GEN_17 = 5'h11 == io_readPorts_0_addr ? spec_table_next_17 : _GEN_16; // @[RenameTable.scala 61:{51,51}]
  wire  matchVec_1_18 = t1_wSpec_addr_1[18]; // @[RenameTable.scala 68:44]
  wire  matchVec_0_18 = t1_wSpec_addr_0[18]; // @[RenameTable.scala 68:44]
  wire [1:0] _spec_table_next_18_T = {matchVec_1_18,matchVec_0_18}; // @[RenameTable.scala 71:67]
  wire [5:0] wMatch_18 = matchVec_1_18 ? t1_wSpec_1_data : t1_wSpec_0_data; // @[ParallelMux.scala 90:77]
  wire [5:0] _spec_table_next_18_T_2 = |_spec_table_next_18_T ? wMatch_18 : spec_table_18; // @[RenameTable.scala 71:48]
  wire [5:0] spec_table_next_18 = t1_redirect ? arch_table_18 : _spec_table_next_18_T_2; // @[RenameTable.scala 71:16]
  wire [5:0] _GEN_18 = 5'h12 == io_readPorts_0_addr ? spec_table_next_18 : _GEN_17; // @[RenameTable.scala 61:{51,51}]
  wire  matchVec_1_19 = t1_wSpec_addr_1[19]; // @[RenameTable.scala 68:44]
  wire  matchVec_0_19 = t1_wSpec_addr_0[19]; // @[RenameTable.scala 68:44]
  wire [1:0] _spec_table_next_19_T = {matchVec_1_19,matchVec_0_19}; // @[RenameTable.scala 71:67]
  wire [5:0] wMatch_19 = matchVec_1_19 ? t1_wSpec_1_data : t1_wSpec_0_data; // @[ParallelMux.scala 90:77]
  wire [5:0] _spec_table_next_19_T_2 = |_spec_table_next_19_T ? wMatch_19 : spec_table_19; // @[RenameTable.scala 71:48]
  wire [5:0] spec_table_next_19 = t1_redirect ? arch_table_19 : _spec_table_next_19_T_2; // @[RenameTable.scala 71:16]
  wire [5:0] _GEN_19 = 5'h13 == io_readPorts_0_addr ? spec_table_next_19 : _GEN_18; // @[RenameTable.scala 61:{51,51}]
  wire  matchVec_1_20 = t1_wSpec_addr_1[20]; // @[RenameTable.scala 68:44]
  wire  matchVec_0_20 = t1_wSpec_addr_0[20]; // @[RenameTable.scala 68:44]
  wire [1:0] _spec_table_next_20_T = {matchVec_1_20,matchVec_0_20}; // @[RenameTable.scala 71:67]
  wire [5:0] wMatch_20 = matchVec_1_20 ? t1_wSpec_1_data : t1_wSpec_0_data; // @[ParallelMux.scala 90:77]
  wire [5:0] _spec_table_next_20_T_2 = |_spec_table_next_20_T ? wMatch_20 : spec_table_20; // @[RenameTable.scala 71:48]
  wire [5:0] spec_table_next_20 = t1_redirect ? arch_table_20 : _spec_table_next_20_T_2; // @[RenameTable.scala 71:16]
  wire [5:0] _GEN_20 = 5'h14 == io_readPorts_0_addr ? spec_table_next_20 : _GEN_19; // @[RenameTable.scala 61:{51,51}]
  wire  matchVec_1_21 = t1_wSpec_addr_1[21]; // @[RenameTable.scala 68:44]
  wire  matchVec_0_21 = t1_wSpec_addr_0[21]; // @[RenameTable.scala 68:44]
  wire [1:0] _spec_table_next_21_T = {matchVec_1_21,matchVec_0_21}; // @[RenameTable.scala 71:67]
  wire [5:0] wMatch_21 = matchVec_1_21 ? t1_wSpec_1_data : t1_wSpec_0_data; // @[ParallelMux.scala 90:77]
  wire [5:0] _spec_table_next_21_T_2 = |_spec_table_next_21_T ? wMatch_21 : spec_table_21; // @[RenameTable.scala 71:48]
  wire [5:0] spec_table_next_21 = t1_redirect ? arch_table_21 : _spec_table_next_21_T_2; // @[RenameTable.scala 71:16]
  wire [5:0] _GEN_21 = 5'h15 == io_readPorts_0_addr ? spec_table_next_21 : _GEN_20; // @[RenameTable.scala 61:{51,51}]
  wire  matchVec_1_22 = t1_wSpec_addr_1[22]; // @[RenameTable.scala 68:44]
  wire  matchVec_0_22 = t1_wSpec_addr_0[22]; // @[RenameTable.scala 68:44]
  wire [1:0] _spec_table_next_22_T = {matchVec_1_22,matchVec_0_22}; // @[RenameTable.scala 71:67]
  wire [5:0] wMatch_22 = matchVec_1_22 ? t1_wSpec_1_data : t1_wSpec_0_data; // @[ParallelMux.scala 90:77]
  wire [5:0] _spec_table_next_22_T_2 = |_spec_table_next_22_T ? wMatch_22 : spec_table_22; // @[RenameTable.scala 71:48]
  wire [5:0] spec_table_next_22 = t1_redirect ? arch_table_22 : _spec_table_next_22_T_2; // @[RenameTable.scala 71:16]
  wire [5:0] _GEN_22 = 5'h16 == io_readPorts_0_addr ? spec_table_next_22 : _GEN_21; // @[RenameTable.scala 61:{51,51}]
  wire  matchVec_1_23 = t1_wSpec_addr_1[23]; // @[RenameTable.scala 68:44]
  wire  matchVec_0_23 = t1_wSpec_addr_0[23]; // @[RenameTable.scala 68:44]
  wire [1:0] _spec_table_next_23_T = {matchVec_1_23,matchVec_0_23}; // @[RenameTable.scala 71:67]
  wire [5:0] wMatch_23 = matchVec_1_23 ? t1_wSpec_1_data : t1_wSpec_0_data; // @[ParallelMux.scala 90:77]
  wire [5:0] _spec_table_next_23_T_2 = |_spec_table_next_23_T ? wMatch_23 : spec_table_23; // @[RenameTable.scala 71:48]
  wire [5:0] spec_table_next_23 = t1_redirect ? arch_table_23 : _spec_table_next_23_T_2; // @[RenameTable.scala 71:16]
  wire [5:0] _GEN_23 = 5'h17 == io_readPorts_0_addr ? spec_table_next_23 : _GEN_22; // @[RenameTable.scala 61:{51,51}]
  wire  matchVec_1_24 = t1_wSpec_addr_1[24]; // @[RenameTable.scala 68:44]
  wire  matchVec_0_24 = t1_wSpec_addr_0[24]; // @[RenameTable.scala 68:44]
  wire [1:0] _spec_table_next_24_T = {matchVec_1_24,matchVec_0_24}; // @[RenameTable.scala 71:67]
  wire [5:0] wMatch_24 = matchVec_1_24 ? t1_wSpec_1_data : t1_wSpec_0_data; // @[ParallelMux.scala 90:77]
  wire [5:0] _spec_table_next_24_T_2 = |_spec_table_next_24_T ? wMatch_24 : spec_table_24; // @[RenameTable.scala 71:48]
  wire [5:0] spec_table_next_24 = t1_redirect ? arch_table_24 : _spec_table_next_24_T_2; // @[RenameTable.scala 71:16]
  wire [5:0] _GEN_24 = 5'h18 == io_readPorts_0_addr ? spec_table_next_24 : _GEN_23; // @[RenameTable.scala 61:{51,51}]
  wire  matchVec_1_25 = t1_wSpec_addr_1[25]; // @[RenameTable.scala 68:44]
  wire  matchVec_0_25 = t1_wSpec_addr_0[25]; // @[RenameTable.scala 68:44]
  wire [1:0] _spec_table_next_25_T = {matchVec_1_25,matchVec_0_25}; // @[RenameTable.scala 71:67]
  wire [5:0] wMatch_25 = matchVec_1_25 ? t1_wSpec_1_data : t1_wSpec_0_data; // @[ParallelMux.scala 90:77]
  wire [5:0] _spec_table_next_25_T_2 = |_spec_table_next_25_T ? wMatch_25 : spec_table_25; // @[RenameTable.scala 71:48]
  wire [5:0] spec_table_next_25 = t1_redirect ? arch_table_25 : _spec_table_next_25_T_2; // @[RenameTable.scala 71:16]
  wire [5:0] _GEN_25 = 5'h19 == io_readPorts_0_addr ? spec_table_next_25 : _GEN_24; // @[RenameTable.scala 61:{51,51}]
  wire  matchVec_1_26 = t1_wSpec_addr_1[26]; // @[RenameTable.scala 68:44]
  wire  matchVec_0_26 = t1_wSpec_addr_0[26]; // @[RenameTable.scala 68:44]
  wire [1:0] _spec_table_next_26_T = {matchVec_1_26,matchVec_0_26}; // @[RenameTable.scala 71:67]
  wire [5:0] wMatch_26 = matchVec_1_26 ? t1_wSpec_1_data : t1_wSpec_0_data; // @[ParallelMux.scala 90:77]
  wire [5:0] _spec_table_next_26_T_2 = |_spec_table_next_26_T ? wMatch_26 : spec_table_26; // @[RenameTable.scala 71:48]
  wire [5:0] spec_table_next_26 = t1_redirect ? arch_table_26 : _spec_table_next_26_T_2; // @[RenameTable.scala 71:16]
  wire [5:0] _GEN_26 = 5'h1a == io_readPorts_0_addr ? spec_table_next_26 : _GEN_25; // @[RenameTable.scala 61:{51,51}]
  wire  matchVec_1_27 = t1_wSpec_addr_1[27]; // @[RenameTable.scala 68:44]
  wire  matchVec_0_27 = t1_wSpec_addr_0[27]; // @[RenameTable.scala 68:44]
  wire [1:0] _spec_table_next_27_T = {matchVec_1_27,matchVec_0_27}; // @[RenameTable.scala 71:67]
  wire [5:0] wMatch_27 = matchVec_1_27 ? t1_wSpec_1_data : t1_wSpec_0_data; // @[ParallelMux.scala 90:77]
  wire [5:0] _spec_table_next_27_T_2 = |_spec_table_next_27_T ? wMatch_27 : spec_table_27; // @[RenameTable.scala 71:48]
  wire [5:0] spec_table_next_27 = t1_redirect ? arch_table_27 : _spec_table_next_27_T_2; // @[RenameTable.scala 71:16]
  wire [5:0] _GEN_27 = 5'h1b == io_readPorts_0_addr ? spec_table_next_27 : _GEN_26; // @[RenameTable.scala 61:{51,51}]
  wire  matchVec_1_28 = t1_wSpec_addr_1[28]; // @[RenameTable.scala 68:44]
  wire  matchVec_0_28 = t1_wSpec_addr_0[28]; // @[RenameTable.scala 68:44]
  wire [1:0] _spec_table_next_28_T = {matchVec_1_28,matchVec_0_28}; // @[RenameTable.scala 71:67]
  wire [5:0] wMatch_28 = matchVec_1_28 ? t1_wSpec_1_data : t1_wSpec_0_data; // @[ParallelMux.scala 90:77]
  wire [5:0] _spec_table_next_28_T_2 = |_spec_table_next_28_T ? wMatch_28 : spec_table_28; // @[RenameTable.scala 71:48]
  wire [5:0] spec_table_next_28 = t1_redirect ? arch_table_28 : _spec_table_next_28_T_2; // @[RenameTable.scala 71:16]
  wire [5:0] _GEN_28 = 5'h1c == io_readPorts_0_addr ? spec_table_next_28 : _GEN_27; // @[RenameTable.scala 61:{51,51}]
  wire  matchVec_1_29 = t1_wSpec_addr_1[29]; // @[RenameTable.scala 68:44]
  wire  matchVec_0_29 = t1_wSpec_addr_0[29]; // @[RenameTable.scala 68:44]
  wire [1:0] _spec_table_next_29_T = {matchVec_1_29,matchVec_0_29}; // @[RenameTable.scala 71:67]
  wire [5:0] wMatch_29 = matchVec_1_29 ? t1_wSpec_1_data : t1_wSpec_0_data; // @[ParallelMux.scala 90:77]
  wire [5:0] _spec_table_next_29_T_2 = |_spec_table_next_29_T ? wMatch_29 : spec_table_29; // @[RenameTable.scala 71:48]
  wire [5:0] spec_table_next_29 = t1_redirect ? arch_table_29 : _spec_table_next_29_T_2; // @[RenameTable.scala 71:16]
  wire  matchVec_1_30 = t1_wSpec_addr_1[30]; // @[RenameTable.scala 68:44]
  wire  matchVec_0_30 = t1_wSpec_addr_0[30]; // @[RenameTable.scala 68:44]
  wire [1:0] _spec_table_next_30_T = {matchVec_1_30,matchVec_0_30}; // @[RenameTable.scala 71:67]
  wire [5:0] wMatch_30 = matchVec_1_30 ? t1_wSpec_1_data : t1_wSpec_0_data; // @[ParallelMux.scala 90:77]
  wire [5:0] _spec_table_next_30_T_2 = |_spec_table_next_30_T ? wMatch_30 : spec_table_30; // @[RenameTable.scala 71:48]
  wire  matchVec_1_31 = t1_wSpec_addr_1[31]; // @[RenameTable.scala 68:44]
  wire  matchVec_0_31 = t1_wSpec_addr_0[31]; // @[RenameTable.scala 68:44]
  wire [1:0] _spec_table_next_31_T = {matchVec_1_31,matchVec_0_31}; // @[RenameTable.scala 71:67]
  wire [5:0] wMatch_31 = matchVec_1_31 ? t1_wSpec_1_data : t1_wSpec_0_data; // @[ParallelMux.scala 90:77]
  reg [5:0] t1_rdata_0; // @[RenameTable.scala 61:47]
  wire [5:0] _GEN_33 = 5'h1 == io_readPorts_1_addr ? spec_table_next_1 : spec_table_next_0; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_34 = 5'h2 == io_readPorts_1_addr ? spec_table_next_2 : _GEN_33; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_35 = 5'h3 == io_readPorts_1_addr ? spec_table_next_3 : _GEN_34; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_36 = 5'h4 == io_readPorts_1_addr ? spec_table_next_4 : _GEN_35; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_37 = 5'h5 == io_readPorts_1_addr ? spec_table_next_5 : _GEN_36; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_38 = 5'h6 == io_readPorts_1_addr ? spec_table_next_6 : _GEN_37; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_39 = 5'h7 == io_readPorts_1_addr ? spec_table_next_7 : _GEN_38; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_40 = 5'h8 == io_readPorts_1_addr ? spec_table_next_8 : _GEN_39; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_41 = 5'h9 == io_readPorts_1_addr ? spec_table_next_9 : _GEN_40; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_42 = 5'ha == io_readPorts_1_addr ? spec_table_next_10 : _GEN_41; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_43 = 5'hb == io_readPorts_1_addr ? spec_table_next_11 : _GEN_42; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_44 = 5'hc == io_readPorts_1_addr ? spec_table_next_12 : _GEN_43; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_45 = 5'hd == io_readPorts_1_addr ? spec_table_next_13 : _GEN_44; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_46 = 5'he == io_readPorts_1_addr ? spec_table_next_14 : _GEN_45; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_47 = 5'hf == io_readPorts_1_addr ? spec_table_next_15 : _GEN_46; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_48 = 5'h10 == io_readPorts_1_addr ? spec_table_next_16 : _GEN_47; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_49 = 5'h11 == io_readPorts_1_addr ? spec_table_next_17 : _GEN_48; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_50 = 5'h12 == io_readPorts_1_addr ? spec_table_next_18 : _GEN_49; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_51 = 5'h13 == io_readPorts_1_addr ? spec_table_next_19 : _GEN_50; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_52 = 5'h14 == io_readPorts_1_addr ? spec_table_next_20 : _GEN_51; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_53 = 5'h15 == io_readPorts_1_addr ? spec_table_next_21 : _GEN_52; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_54 = 5'h16 == io_readPorts_1_addr ? spec_table_next_22 : _GEN_53; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_55 = 5'h17 == io_readPorts_1_addr ? spec_table_next_23 : _GEN_54; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_56 = 5'h18 == io_readPorts_1_addr ? spec_table_next_24 : _GEN_55; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_57 = 5'h19 == io_readPorts_1_addr ? spec_table_next_25 : _GEN_56; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_58 = 5'h1a == io_readPorts_1_addr ? spec_table_next_26 : _GEN_57; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_59 = 5'h1b == io_readPorts_1_addr ? spec_table_next_27 : _GEN_58; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_60 = 5'h1c == io_readPorts_1_addr ? spec_table_next_28 : _GEN_59; // @[RenameTable.scala 61:{51,51}]
  reg [5:0] t1_rdata_1; // @[RenameTable.scala 61:47]
  wire [5:0] _GEN_65 = 5'h1 == io_readPorts_2_addr ? spec_table_next_1 : spec_table_next_0; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_66 = 5'h2 == io_readPorts_2_addr ? spec_table_next_2 : _GEN_65; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_67 = 5'h3 == io_readPorts_2_addr ? spec_table_next_3 : _GEN_66; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_68 = 5'h4 == io_readPorts_2_addr ? spec_table_next_4 : _GEN_67; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_69 = 5'h5 == io_readPorts_2_addr ? spec_table_next_5 : _GEN_68; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_70 = 5'h6 == io_readPorts_2_addr ? spec_table_next_6 : _GEN_69; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_71 = 5'h7 == io_readPorts_2_addr ? spec_table_next_7 : _GEN_70; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_72 = 5'h8 == io_readPorts_2_addr ? spec_table_next_8 : _GEN_71; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_73 = 5'h9 == io_readPorts_2_addr ? spec_table_next_9 : _GEN_72; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_74 = 5'ha == io_readPorts_2_addr ? spec_table_next_10 : _GEN_73; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_75 = 5'hb == io_readPorts_2_addr ? spec_table_next_11 : _GEN_74; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_76 = 5'hc == io_readPorts_2_addr ? spec_table_next_12 : _GEN_75; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_77 = 5'hd == io_readPorts_2_addr ? spec_table_next_13 : _GEN_76; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_78 = 5'he == io_readPorts_2_addr ? spec_table_next_14 : _GEN_77; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_79 = 5'hf == io_readPorts_2_addr ? spec_table_next_15 : _GEN_78; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_80 = 5'h10 == io_readPorts_2_addr ? spec_table_next_16 : _GEN_79; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_81 = 5'h11 == io_readPorts_2_addr ? spec_table_next_17 : _GEN_80; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_82 = 5'h12 == io_readPorts_2_addr ? spec_table_next_18 : _GEN_81; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_83 = 5'h13 == io_readPorts_2_addr ? spec_table_next_19 : _GEN_82; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_84 = 5'h14 == io_readPorts_2_addr ? spec_table_next_20 : _GEN_83; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_85 = 5'h15 == io_readPorts_2_addr ? spec_table_next_21 : _GEN_84; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_86 = 5'h16 == io_readPorts_2_addr ? spec_table_next_22 : _GEN_85; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_87 = 5'h17 == io_readPorts_2_addr ? spec_table_next_23 : _GEN_86; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_88 = 5'h18 == io_readPorts_2_addr ? spec_table_next_24 : _GEN_87; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_89 = 5'h19 == io_readPorts_2_addr ? spec_table_next_25 : _GEN_88; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_90 = 5'h1a == io_readPorts_2_addr ? spec_table_next_26 : _GEN_89; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_91 = 5'h1b == io_readPorts_2_addr ? spec_table_next_27 : _GEN_90; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_92 = 5'h1c == io_readPorts_2_addr ? spec_table_next_28 : _GEN_91; // @[RenameTable.scala 61:{51,51}]
  reg [5:0] t1_rdata_2; // @[RenameTable.scala 61:47]
  wire [5:0] _GEN_97 = 5'h1 == io_readPorts_3_addr ? spec_table_next_1 : spec_table_next_0; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_98 = 5'h2 == io_readPorts_3_addr ? spec_table_next_2 : _GEN_97; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_99 = 5'h3 == io_readPorts_3_addr ? spec_table_next_3 : _GEN_98; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_100 = 5'h4 == io_readPorts_3_addr ? spec_table_next_4 : _GEN_99; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_101 = 5'h5 == io_readPorts_3_addr ? spec_table_next_5 : _GEN_100; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_102 = 5'h6 == io_readPorts_3_addr ? spec_table_next_6 : _GEN_101; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_103 = 5'h7 == io_readPorts_3_addr ? spec_table_next_7 : _GEN_102; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_104 = 5'h8 == io_readPorts_3_addr ? spec_table_next_8 : _GEN_103; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_105 = 5'h9 == io_readPorts_3_addr ? spec_table_next_9 : _GEN_104; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_106 = 5'ha == io_readPorts_3_addr ? spec_table_next_10 : _GEN_105; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_107 = 5'hb == io_readPorts_3_addr ? spec_table_next_11 : _GEN_106; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_108 = 5'hc == io_readPorts_3_addr ? spec_table_next_12 : _GEN_107; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_109 = 5'hd == io_readPorts_3_addr ? spec_table_next_13 : _GEN_108; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_110 = 5'he == io_readPorts_3_addr ? spec_table_next_14 : _GEN_109; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_111 = 5'hf == io_readPorts_3_addr ? spec_table_next_15 : _GEN_110; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_112 = 5'h10 == io_readPorts_3_addr ? spec_table_next_16 : _GEN_111; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_113 = 5'h11 == io_readPorts_3_addr ? spec_table_next_17 : _GEN_112; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_114 = 5'h12 == io_readPorts_3_addr ? spec_table_next_18 : _GEN_113; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_115 = 5'h13 == io_readPorts_3_addr ? spec_table_next_19 : _GEN_114; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_116 = 5'h14 == io_readPorts_3_addr ? spec_table_next_20 : _GEN_115; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_117 = 5'h15 == io_readPorts_3_addr ? spec_table_next_21 : _GEN_116; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_118 = 5'h16 == io_readPorts_3_addr ? spec_table_next_22 : _GEN_117; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_119 = 5'h17 == io_readPorts_3_addr ? spec_table_next_23 : _GEN_118; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_120 = 5'h18 == io_readPorts_3_addr ? spec_table_next_24 : _GEN_119; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_121 = 5'h19 == io_readPorts_3_addr ? spec_table_next_25 : _GEN_120; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_122 = 5'h1a == io_readPorts_3_addr ? spec_table_next_26 : _GEN_121; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_123 = 5'h1b == io_readPorts_3_addr ? spec_table_next_27 : _GEN_122; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_124 = 5'h1c == io_readPorts_3_addr ? spec_table_next_28 : _GEN_123; // @[RenameTable.scala 61:{51,51}]
  reg [5:0] t1_rdata_3; // @[RenameTable.scala 61:47]
  wire [5:0] _GEN_129 = 5'h1 == io_readPorts_4_addr ? spec_table_next_1 : spec_table_next_0; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_130 = 5'h2 == io_readPorts_4_addr ? spec_table_next_2 : _GEN_129; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_131 = 5'h3 == io_readPorts_4_addr ? spec_table_next_3 : _GEN_130; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_132 = 5'h4 == io_readPorts_4_addr ? spec_table_next_4 : _GEN_131; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_133 = 5'h5 == io_readPorts_4_addr ? spec_table_next_5 : _GEN_132; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_134 = 5'h6 == io_readPorts_4_addr ? spec_table_next_6 : _GEN_133; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_135 = 5'h7 == io_readPorts_4_addr ? spec_table_next_7 : _GEN_134; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_136 = 5'h8 == io_readPorts_4_addr ? spec_table_next_8 : _GEN_135; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_137 = 5'h9 == io_readPorts_4_addr ? spec_table_next_9 : _GEN_136; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_138 = 5'ha == io_readPorts_4_addr ? spec_table_next_10 : _GEN_137; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_139 = 5'hb == io_readPorts_4_addr ? spec_table_next_11 : _GEN_138; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_140 = 5'hc == io_readPorts_4_addr ? spec_table_next_12 : _GEN_139; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_141 = 5'hd == io_readPorts_4_addr ? spec_table_next_13 : _GEN_140; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_142 = 5'he == io_readPorts_4_addr ? spec_table_next_14 : _GEN_141; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_143 = 5'hf == io_readPorts_4_addr ? spec_table_next_15 : _GEN_142; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_144 = 5'h10 == io_readPorts_4_addr ? spec_table_next_16 : _GEN_143; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_145 = 5'h11 == io_readPorts_4_addr ? spec_table_next_17 : _GEN_144; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_146 = 5'h12 == io_readPorts_4_addr ? spec_table_next_18 : _GEN_145; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_147 = 5'h13 == io_readPorts_4_addr ? spec_table_next_19 : _GEN_146; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_148 = 5'h14 == io_readPorts_4_addr ? spec_table_next_20 : _GEN_147; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_149 = 5'h15 == io_readPorts_4_addr ? spec_table_next_21 : _GEN_148; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_150 = 5'h16 == io_readPorts_4_addr ? spec_table_next_22 : _GEN_149; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_151 = 5'h17 == io_readPorts_4_addr ? spec_table_next_23 : _GEN_150; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_152 = 5'h18 == io_readPorts_4_addr ? spec_table_next_24 : _GEN_151; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_153 = 5'h19 == io_readPorts_4_addr ? spec_table_next_25 : _GEN_152; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_154 = 5'h1a == io_readPorts_4_addr ? spec_table_next_26 : _GEN_153; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_155 = 5'h1b == io_readPorts_4_addr ? spec_table_next_27 : _GEN_154; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_156 = 5'h1c == io_readPorts_4_addr ? spec_table_next_28 : _GEN_155; // @[RenameTable.scala 61:{51,51}]
  reg [5:0] t1_rdata_4; // @[RenameTable.scala 61:47]
  wire [5:0] _GEN_161 = 5'h1 == io_readPorts_5_addr ? spec_table_next_1 : spec_table_next_0; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_162 = 5'h2 == io_readPorts_5_addr ? spec_table_next_2 : _GEN_161; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_163 = 5'h3 == io_readPorts_5_addr ? spec_table_next_3 : _GEN_162; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_164 = 5'h4 == io_readPorts_5_addr ? spec_table_next_4 : _GEN_163; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_165 = 5'h5 == io_readPorts_5_addr ? spec_table_next_5 : _GEN_164; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_166 = 5'h6 == io_readPorts_5_addr ? spec_table_next_6 : _GEN_165; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_167 = 5'h7 == io_readPorts_5_addr ? spec_table_next_7 : _GEN_166; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_168 = 5'h8 == io_readPorts_5_addr ? spec_table_next_8 : _GEN_167; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_169 = 5'h9 == io_readPorts_5_addr ? spec_table_next_9 : _GEN_168; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_170 = 5'ha == io_readPorts_5_addr ? spec_table_next_10 : _GEN_169; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_171 = 5'hb == io_readPorts_5_addr ? spec_table_next_11 : _GEN_170; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_172 = 5'hc == io_readPorts_5_addr ? spec_table_next_12 : _GEN_171; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_173 = 5'hd == io_readPorts_5_addr ? spec_table_next_13 : _GEN_172; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_174 = 5'he == io_readPorts_5_addr ? spec_table_next_14 : _GEN_173; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_175 = 5'hf == io_readPorts_5_addr ? spec_table_next_15 : _GEN_174; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_176 = 5'h10 == io_readPorts_5_addr ? spec_table_next_16 : _GEN_175; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_177 = 5'h11 == io_readPorts_5_addr ? spec_table_next_17 : _GEN_176; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_178 = 5'h12 == io_readPorts_5_addr ? spec_table_next_18 : _GEN_177; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_179 = 5'h13 == io_readPorts_5_addr ? spec_table_next_19 : _GEN_178; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_180 = 5'h14 == io_readPorts_5_addr ? spec_table_next_20 : _GEN_179; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_181 = 5'h15 == io_readPorts_5_addr ? spec_table_next_21 : _GEN_180; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_182 = 5'h16 == io_readPorts_5_addr ? spec_table_next_22 : _GEN_181; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_183 = 5'h17 == io_readPorts_5_addr ? spec_table_next_23 : _GEN_182; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_184 = 5'h18 == io_readPorts_5_addr ? spec_table_next_24 : _GEN_183; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_185 = 5'h19 == io_readPorts_5_addr ? spec_table_next_25 : _GEN_184; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_186 = 5'h1a == io_readPorts_5_addr ? spec_table_next_26 : _GEN_185; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_187 = 5'h1b == io_readPorts_5_addr ? spec_table_next_27 : _GEN_186; // @[RenameTable.scala 61:{51,51}]
  wire [5:0] _GEN_188 = 5'h1c == io_readPorts_5_addr ? spec_table_next_28 : _GEN_187; // @[RenameTable.scala 61:{51,51}]
  reg [5:0] t1_rdata_5; // @[RenameTable.scala 61:47]
  wire  _t1_raddr_T = ~io_readPorts_0_hold; // @[RenameTable.scala 62:58]
  reg [4:0] t1_raddr_0; // @[Reg.scala 16:16]
  wire  _t1_raddr_T_1 = ~io_readPorts_1_hold; // @[RenameTable.scala 62:58]
  reg [4:0] t1_raddr_1; // @[Reg.scala 16:16]
  wire  _t1_raddr_T_2 = ~io_readPorts_2_hold; // @[RenameTable.scala 62:58]
  reg [4:0] t1_raddr_2; // @[Reg.scala 16:16]
  wire  _t1_raddr_T_3 = ~io_readPorts_3_hold; // @[RenameTable.scala 62:58]
  reg [4:0] t1_raddr_3; // @[Reg.scala 16:16]
  wire  _t1_raddr_T_4 = ~io_readPorts_4_hold; // @[RenameTable.scala 62:58]
  reg [4:0] t1_raddr_4; // @[Reg.scala 16:16]
  wire  _t1_raddr_T_5 = ~io_readPorts_5_hold; // @[RenameTable.scala 62:58]
  reg [4:0] t1_raddr_5; // @[Reg.scala 16:16]
  wire  _t0_bypass_T_2 = io_readPorts_0_hold ? io_specWritePorts_0_addr == t1_raddr_0 : io_specWritePorts_0_addr ==
    io_readPorts_0_addr; // @[RenameTable.scala 78:60]
  wire  t0_bypass_0 = io_specWritePorts_0_wen & _t0_bypass_T_2; // @[RenameTable.scala 78:54]
  wire  _t0_bypass_T_5 = io_readPorts_0_hold ? io_specWritePorts_1_addr == t1_raddr_0 : io_specWritePorts_1_addr ==
    io_readPorts_0_addr; // @[RenameTable.scala 78:60]
  wire  t0_bypass_1 = io_specWritePorts_1_wen & _t0_bypass_T_5; // @[RenameTable.scala 78:54]
  reg  t1_bypass__0; // @[RenameTable.scala 79:28]
  reg  t1_bypass__1; // @[RenameTable.scala 79:28]
  wire [5:0] bypass_data = t1_bypass__1 ? t1_wSpec_1_data : t1_wSpec_0_data; // @[ParallelMux.scala 90:77]
  wire [1:0] _io_readPorts_0_data_T = {t1_bypass__1,t1_bypass__0}; // @[RenameTable.scala 81:29]
  wire  _t0_bypass_T_8 = io_readPorts_1_hold ? io_specWritePorts_0_addr == t1_raddr_1 : io_specWritePorts_0_addr ==
    io_readPorts_1_addr; // @[RenameTable.scala 78:60]
  wire  t0_bypass_0_1 = io_specWritePorts_0_wen & _t0_bypass_T_8; // @[RenameTable.scala 78:54]
  wire  _t0_bypass_T_11 = io_readPorts_1_hold ? io_specWritePorts_1_addr == t1_raddr_1 : io_specWritePorts_1_addr ==
    io_readPorts_1_addr; // @[RenameTable.scala 78:60]
  wire  t0_bypass_1_1 = io_specWritePorts_1_wen & _t0_bypass_T_11; // @[RenameTable.scala 78:54]
  reg  t1_bypass_1_0; // @[RenameTable.scala 79:28]
  reg  t1_bypass_1_1; // @[RenameTable.scala 79:28]
  wire [5:0] bypass_data_1 = t1_bypass_1_1 ? t1_wSpec_1_data : t1_wSpec_0_data; // @[ParallelMux.scala 90:77]
  wire [1:0] _io_readPorts_1_data_T = {t1_bypass_1_1,t1_bypass_1_0}; // @[RenameTable.scala 81:29]
  wire  _t0_bypass_T_14 = io_readPorts_2_hold ? io_specWritePorts_0_addr == t1_raddr_2 : io_specWritePorts_0_addr ==
    io_readPorts_2_addr; // @[RenameTable.scala 78:60]
  wire  t0_bypass_0_2 = io_specWritePorts_0_wen & _t0_bypass_T_14; // @[RenameTable.scala 78:54]
  wire  _t0_bypass_T_17 = io_readPorts_2_hold ? io_specWritePorts_1_addr == t1_raddr_2 : io_specWritePorts_1_addr ==
    io_readPorts_2_addr; // @[RenameTable.scala 78:60]
  wire  t0_bypass_1_2 = io_specWritePorts_1_wen & _t0_bypass_T_17; // @[RenameTable.scala 78:54]
  reg  t1_bypass_2_0; // @[RenameTable.scala 79:28]
  reg  t1_bypass_2_1; // @[RenameTable.scala 79:28]
  wire [5:0] bypass_data_2 = t1_bypass_2_1 ? t1_wSpec_1_data : t1_wSpec_0_data; // @[ParallelMux.scala 90:77]
  wire [1:0] _io_readPorts_2_data_T = {t1_bypass_2_1,t1_bypass_2_0}; // @[RenameTable.scala 81:29]
  wire  _t0_bypass_T_20 = io_readPorts_3_hold ? io_specWritePorts_0_addr == t1_raddr_3 : io_specWritePorts_0_addr ==
    io_readPorts_3_addr; // @[RenameTable.scala 78:60]
  wire  t0_bypass_0_3 = io_specWritePorts_0_wen & _t0_bypass_T_20; // @[RenameTable.scala 78:54]
  wire  _t0_bypass_T_23 = io_readPorts_3_hold ? io_specWritePorts_1_addr == t1_raddr_3 : io_specWritePorts_1_addr ==
    io_readPorts_3_addr; // @[RenameTable.scala 78:60]
  wire  t0_bypass_1_3 = io_specWritePorts_1_wen & _t0_bypass_T_23; // @[RenameTable.scala 78:54]
  reg  t1_bypass_3_0; // @[RenameTable.scala 79:28]
  reg  t1_bypass_3_1; // @[RenameTable.scala 79:28]
  wire [5:0] bypass_data_3 = t1_bypass_3_1 ? t1_wSpec_1_data : t1_wSpec_0_data; // @[ParallelMux.scala 90:77]
  wire [1:0] _io_readPorts_3_data_T = {t1_bypass_3_1,t1_bypass_3_0}; // @[RenameTable.scala 81:29]
  wire  _t0_bypass_T_26 = io_readPorts_4_hold ? io_specWritePorts_0_addr == t1_raddr_4 : io_specWritePorts_0_addr ==
    io_readPorts_4_addr; // @[RenameTable.scala 78:60]
  wire  t0_bypass_0_4 = io_specWritePorts_0_wen & _t0_bypass_T_26; // @[RenameTable.scala 78:54]
  wire  _t0_bypass_T_29 = io_readPorts_4_hold ? io_specWritePorts_1_addr == t1_raddr_4 : io_specWritePorts_1_addr ==
    io_readPorts_4_addr; // @[RenameTable.scala 78:60]
  wire  t0_bypass_1_4 = io_specWritePorts_1_wen & _t0_bypass_T_29; // @[RenameTable.scala 78:54]
  reg  t1_bypass_4_0; // @[RenameTable.scala 79:28]
  reg  t1_bypass_4_1; // @[RenameTable.scala 79:28]
  wire [5:0] bypass_data_4 = t1_bypass_4_1 ? t1_wSpec_1_data : t1_wSpec_0_data; // @[ParallelMux.scala 90:77]
  wire [1:0] _io_readPorts_4_data_T = {t1_bypass_4_1,t1_bypass_4_0}; // @[RenameTable.scala 81:29]
  wire  _t0_bypass_T_32 = io_readPorts_5_hold ? io_specWritePorts_0_addr == t1_raddr_5 : io_specWritePorts_0_addr ==
    io_readPorts_5_addr; // @[RenameTable.scala 78:60]
  wire  t0_bypass_0_5 = io_specWritePorts_0_wen & _t0_bypass_T_32; // @[RenameTable.scala 78:54]
  wire  _t0_bypass_T_35 = io_readPorts_5_hold ? io_specWritePorts_1_addr == t1_raddr_5 : io_specWritePorts_1_addr ==
    io_readPorts_5_addr; // @[RenameTable.scala 78:60]
  wire  t0_bypass_1_5 = io_specWritePorts_1_wen & _t0_bypass_T_35; // @[RenameTable.scala 78:54]
  reg  t1_bypass_5_0; // @[RenameTable.scala 79:28]
  reg  t1_bypass_5_1; // @[RenameTable.scala 79:28]
  wire [5:0] bypass_data_5 = t1_bypass_5_1 ? t1_wSpec_1_data : t1_wSpec_0_data; // @[ParallelMux.scala 90:77]
  wire [1:0] _io_readPorts_5_data_T = {t1_bypass_5_1,t1_bypass_5_0}; // @[RenameTable.scala 81:29]
  wire [5:0] _GEN_198 = 5'h0 == io_archWritePorts_0_addr ? io_archWritePorts_0_data : arch_table_0; // @[RenameTable.scala 86:{31,31}]
  wire [5:0] _GEN_199 = 5'h1 == io_archWritePorts_0_addr ? io_archWritePorts_0_data : arch_table_1; // @[RenameTable.scala 86:{31,31}]
  wire [5:0] _GEN_200 = 5'h2 == io_archWritePorts_0_addr ? io_archWritePorts_0_data : arch_table_2; // @[RenameTable.scala 86:{31,31}]
  wire [5:0] _GEN_201 = 5'h3 == io_archWritePorts_0_addr ? io_archWritePorts_0_data : arch_table_3; // @[RenameTable.scala 86:{31,31}]
  wire [5:0] _GEN_202 = 5'h4 == io_archWritePorts_0_addr ? io_archWritePorts_0_data : arch_table_4; // @[RenameTable.scala 86:{31,31}]
  wire [5:0] _GEN_203 = 5'h5 == io_archWritePorts_0_addr ? io_archWritePorts_0_data : arch_table_5; // @[RenameTable.scala 86:{31,31}]
  wire [5:0] _GEN_204 = 5'h6 == io_archWritePorts_0_addr ? io_archWritePorts_0_data : arch_table_6; // @[RenameTable.scala 86:{31,31}]
  wire [5:0] _GEN_205 = 5'h7 == io_archWritePorts_0_addr ? io_archWritePorts_0_data : arch_table_7; // @[RenameTable.scala 86:{31,31}]
  wire [5:0] _GEN_206 = 5'h8 == io_archWritePorts_0_addr ? io_archWritePorts_0_data : arch_table_8; // @[RenameTable.scala 86:{31,31}]
  wire [5:0] _GEN_207 = 5'h9 == io_archWritePorts_0_addr ? io_archWritePorts_0_data : arch_table_9; // @[RenameTable.scala 86:{31,31}]
  wire [5:0] _GEN_208 = 5'ha == io_archWritePorts_0_addr ? io_archWritePorts_0_data : arch_table_10; // @[RenameTable.scala 86:{31,31}]
  wire [5:0] _GEN_209 = 5'hb == io_archWritePorts_0_addr ? io_archWritePorts_0_data : arch_table_11; // @[RenameTable.scala 86:{31,31}]
  wire [5:0] _GEN_210 = 5'hc == io_archWritePorts_0_addr ? io_archWritePorts_0_data : arch_table_12; // @[RenameTable.scala 86:{31,31}]
  wire [5:0] _GEN_211 = 5'hd == io_archWritePorts_0_addr ? io_archWritePorts_0_data : arch_table_13; // @[RenameTable.scala 86:{31,31}]
  wire [5:0] _GEN_212 = 5'he == io_archWritePorts_0_addr ? io_archWritePorts_0_data : arch_table_14; // @[RenameTable.scala 86:{31,31}]
  wire [5:0] _GEN_213 = 5'hf == io_archWritePorts_0_addr ? io_archWritePorts_0_data : arch_table_15; // @[RenameTable.scala 86:{31,31}]
  wire [5:0] _GEN_214 = 5'h10 == io_archWritePorts_0_addr ? io_archWritePorts_0_data : arch_table_16; // @[RenameTable.scala 86:{31,31}]
  wire [5:0] _GEN_215 = 5'h11 == io_archWritePorts_0_addr ? io_archWritePorts_0_data : arch_table_17; // @[RenameTable.scala 86:{31,31}]
  wire [5:0] _GEN_216 = 5'h12 == io_archWritePorts_0_addr ? io_archWritePorts_0_data : arch_table_18; // @[RenameTable.scala 86:{31,31}]
  wire [5:0] _GEN_217 = 5'h13 == io_archWritePorts_0_addr ? io_archWritePorts_0_data : arch_table_19; // @[RenameTable.scala 86:{31,31}]
  wire [5:0] _GEN_218 = 5'h14 == io_archWritePorts_0_addr ? io_archWritePorts_0_data : arch_table_20; // @[RenameTable.scala 86:{31,31}]
  wire [5:0] _GEN_219 = 5'h15 == io_archWritePorts_0_addr ? io_archWritePorts_0_data : arch_table_21; // @[RenameTable.scala 86:{31,31}]
  wire [5:0] _GEN_220 = 5'h16 == io_archWritePorts_0_addr ? io_archWritePorts_0_data : arch_table_22; // @[RenameTable.scala 86:{31,31}]
  wire [5:0] _GEN_221 = 5'h17 == io_archWritePorts_0_addr ? io_archWritePorts_0_data : arch_table_23; // @[RenameTable.scala 86:{31,31}]
  wire [5:0] _GEN_222 = 5'h18 == io_archWritePorts_0_addr ? io_archWritePorts_0_data : arch_table_24; // @[RenameTable.scala 86:{31,31}]
  wire [5:0] _GEN_223 = 5'h19 == io_archWritePorts_0_addr ? io_archWritePorts_0_data : arch_table_25; // @[RenameTable.scala 86:{31,31}]
  wire [5:0] _GEN_224 = 5'h1a == io_archWritePorts_0_addr ? io_archWritePorts_0_data : arch_table_26; // @[RenameTable.scala 86:{31,31}]
  wire [5:0] _GEN_225 = 5'h1b == io_archWritePorts_0_addr ? io_archWritePorts_0_data : arch_table_27; // @[RenameTable.scala 86:{31,31}]
  wire [5:0] _GEN_226 = 5'h1c == io_archWritePorts_0_addr ? io_archWritePorts_0_data : arch_table_28; // @[RenameTable.scala 86:{31,31}]
  wire [5:0] _GEN_227 = 5'h1d == io_archWritePorts_0_addr ? io_archWritePorts_0_data : arch_table_29; // @[RenameTable.scala 86:{31,31}]
  wire [5:0] _GEN_228 = 5'h1e == io_archWritePorts_0_addr ? io_archWritePorts_0_data : arch_table_30; // @[RenameTable.scala 86:{31,31}]
  wire [5:0] _GEN_229 = 5'h1f == io_archWritePorts_0_addr ? io_archWritePorts_0_data : arch_table_31; // @[RenameTable.scala 86:{31,31}]
  wire [5:0] _GEN_230 = io_archWritePorts_0_wen ? _GEN_198 : arch_table_0; // @[RenameTable.scala 85:18]
  wire [5:0] _GEN_231 = io_archWritePorts_0_wen ? _GEN_199 : arch_table_1; // @[RenameTable.scala 85:18]
  wire [5:0] _GEN_232 = io_archWritePorts_0_wen ? _GEN_200 : arch_table_2; // @[RenameTable.scala 85:18]
  wire [5:0] _GEN_233 = io_archWritePorts_0_wen ? _GEN_201 : arch_table_3; // @[RenameTable.scala 85:18]
  wire [5:0] _GEN_234 = io_archWritePorts_0_wen ? _GEN_202 : arch_table_4; // @[RenameTable.scala 85:18]
  wire [5:0] _GEN_235 = io_archWritePorts_0_wen ? _GEN_203 : arch_table_5; // @[RenameTable.scala 85:18]
  wire [5:0] _GEN_236 = io_archWritePorts_0_wen ? _GEN_204 : arch_table_6; // @[RenameTable.scala 85:18]
  wire [5:0] _GEN_237 = io_archWritePorts_0_wen ? _GEN_205 : arch_table_7; // @[RenameTable.scala 85:18]
  wire [5:0] _GEN_238 = io_archWritePorts_0_wen ? _GEN_206 : arch_table_8; // @[RenameTable.scala 85:18]
  wire [5:0] _GEN_239 = io_archWritePorts_0_wen ? _GEN_207 : arch_table_9; // @[RenameTable.scala 85:18]
  wire [5:0] _GEN_240 = io_archWritePorts_0_wen ? _GEN_208 : arch_table_10; // @[RenameTable.scala 85:18]
  wire [5:0] _GEN_241 = io_archWritePorts_0_wen ? _GEN_209 : arch_table_11; // @[RenameTable.scala 85:18]
  wire [5:0] _GEN_242 = io_archWritePorts_0_wen ? _GEN_210 : arch_table_12; // @[RenameTable.scala 85:18]
  wire [5:0] _GEN_243 = io_archWritePorts_0_wen ? _GEN_211 : arch_table_13; // @[RenameTable.scala 85:18]
  wire [5:0] _GEN_244 = io_archWritePorts_0_wen ? _GEN_212 : arch_table_14; // @[RenameTable.scala 85:18]
  wire [5:0] _GEN_245 = io_archWritePorts_0_wen ? _GEN_213 : arch_table_15; // @[RenameTable.scala 85:18]
  wire [5:0] _GEN_246 = io_archWritePorts_0_wen ? _GEN_214 : arch_table_16; // @[RenameTable.scala 85:18]
  wire [5:0] _GEN_247 = io_archWritePorts_0_wen ? _GEN_215 : arch_table_17; // @[RenameTable.scala 85:18]
  wire [5:0] _GEN_248 = io_archWritePorts_0_wen ? _GEN_216 : arch_table_18; // @[RenameTable.scala 85:18]
  wire [5:0] _GEN_249 = io_archWritePorts_0_wen ? _GEN_217 : arch_table_19; // @[RenameTable.scala 85:18]
  wire [5:0] _GEN_250 = io_archWritePorts_0_wen ? _GEN_218 : arch_table_20; // @[RenameTable.scala 85:18]
  wire [5:0] _GEN_251 = io_archWritePorts_0_wen ? _GEN_219 : arch_table_21; // @[RenameTable.scala 85:18]
  wire [5:0] _GEN_252 = io_archWritePorts_0_wen ? _GEN_220 : arch_table_22; // @[RenameTable.scala 85:18]
  wire [5:0] _GEN_253 = io_archWritePorts_0_wen ? _GEN_221 : arch_table_23; // @[RenameTable.scala 85:18]
  wire [5:0] _GEN_254 = io_archWritePorts_0_wen ? _GEN_222 : arch_table_24; // @[RenameTable.scala 85:18]
  wire [5:0] _GEN_255 = io_archWritePorts_0_wen ? _GEN_223 : arch_table_25; // @[RenameTable.scala 85:18]
  wire [5:0] _GEN_256 = io_archWritePorts_0_wen ? _GEN_224 : arch_table_26; // @[RenameTable.scala 85:18]
  wire [5:0] _GEN_257 = io_archWritePorts_0_wen ? _GEN_225 : arch_table_27; // @[RenameTable.scala 85:18]
  wire [5:0] _GEN_258 = io_archWritePorts_0_wen ? _GEN_226 : arch_table_28; // @[RenameTable.scala 85:18]
  wire [5:0] _GEN_259 = io_archWritePorts_0_wen ? _GEN_227 : arch_table_29; // @[RenameTable.scala 85:18]
  wire [5:0] _GEN_260 = io_archWritePorts_0_wen ? _GEN_228 : arch_table_30; // @[RenameTable.scala 85:18]
  wire [5:0] _GEN_261 = io_archWritePorts_0_wen ? _GEN_229 : arch_table_31; // @[RenameTable.scala 85:18]
  assign io_readPorts_0_data = |_io_readPorts_0_data_T ? bypass_data : t1_rdata_0; // @[RenameTable.scala 81:18]
  assign io_readPorts_1_data = |_io_readPorts_1_data_T ? bypass_data_1 : t1_rdata_1; // @[RenameTable.scala 81:18]
  assign io_readPorts_2_data = |_io_readPorts_2_data_T ? bypass_data_2 : t1_rdata_2; // @[RenameTable.scala 81:18]
  assign io_readPorts_3_data = |_io_readPorts_3_data_T ? bypass_data_3 : t1_rdata_3; // @[RenameTable.scala 81:18]
  assign io_readPorts_4_data = |_io_readPorts_4_data_T ? bypass_data_4 : t1_rdata_4; // @[RenameTable.scala 81:18]
  assign io_readPorts_5_data = |_io_readPorts_5_data_T ? bypass_data_5 : t1_rdata_5; // @[RenameTable.scala 81:18]
`ifndef SYNTHESIS
  assign io_debug_rdata_0 = arch_table_0; // @[RenameTable.scala 91:18]
`else
  assign io_debug_rdata_0 = 0;
`endif
`ifndef SYNTHESIS
  assign io_debug_rdata_1 = arch_table_1; // @[RenameTable.scala 91:18]
`else
  assign io_debug_rdata_1 = 0;
`endif
`ifndef SYNTHESIS
  assign io_debug_rdata_2 = arch_table_2; // @[RenameTable.scala 91:18]
`else
  assign io_debug_rdata_2 = 0;
`endif
`ifndef SYNTHESIS
  assign io_debug_rdata_3 = arch_table_3; // @[RenameTable.scala 91:18]
`else
  assign io_debug_rdata_3 = 0;
`endif
`ifndef SYNTHESIS
  assign io_debug_rdata_4 = arch_table_4; // @[RenameTable.scala 91:18]
`else
  assign io_debug_rdata_4 = 0;
`endif
`ifndef SYNTHESIS
  assign io_debug_rdata_5 = arch_table_5; // @[RenameTable.scala 91:18]
`else
  assign io_debug_rdata_5 = 0;
`endif
`ifndef SYNTHESIS
  assign io_debug_rdata_6 = arch_table_6; // @[RenameTable.scala 91:18]
`else
  assign io_debug_rdata_6 = 0;
`endif
`ifndef SYNTHESIS
  assign io_debug_rdata_7 = arch_table_7; // @[RenameTable.scala 91:18]
`else
  assign io_debug_rdata_7 = 0;
`endif
`ifndef SYNTHESIS
  assign io_debug_rdata_8 = arch_table_8; // @[RenameTable.scala 91:18]
`else
  assign io_debug_rdata_8 = 0;
`endif
`ifndef SYNTHESIS
  assign io_debug_rdata_9 = arch_table_9; // @[RenameTable.scala 91:18]
`else
  assign io_debug_rdata_9 = 0;
`endif
`ifndef SYNTHESIS
  assign io_debug_rdata_10 = arch_table_10; // @[RenameTable.scala 91:18]
`else
  assign io_debug_rdata_10 = 0;
`endif
`ifndef SYNTHESIS
  assign io_debug_rdata_11 = arch_table_11; // @[RenameTable.scala 91:18]
`else
  assign io_debug_rdata_11 = 0;
`endif
`ifndef SYNTHESIS
  assign io_debug_rdata_12 = arch_table_12; // @[RenameTable.scala 91:18]
`else
  assign io_debug_rdata_12 = 0;
`endif
`ifndef SYNTHESIS
  assign io_debug_rdata_13 = arch_table_13; // @[RenameTable.scala 91:18]
`else
  assign io_debug_rdata_13 = 0;
`endif
`ifndef SYNTHESIS
  assign io_debug_rdata_14 = arch_table_14; // @[RenameTable.scala 91:18]
`else
  assign io_debug_rdata_14 = 0;
`endif
`ifndef SYNTHESIS
  assign io_debug_rdata_15 = arch_table_15; // @[RenameTable.scala 91:18]
`else
  assign io_debug_rdata_15 = 0;
`endif
`ifndef SYNTHESIS
  assign io_debug_rdata_16 = arch_table_16; // @[RenameTable.scala 91:18]
`else
  assign io_debug_rdata_16 = 0;
`endif
`ifndef SYNTHESIS
  assign io_debug_rdata_17 = arch_table_17; // @[RenameTable.scala 91:18]
`else
  assign io_debug_rdata_17 = 0;
`endif
`ifndef SYNTHESIS
  assign io_debug_rdata_18 = arch_table_18; // @[RenameTable.scala 91:18]
`else
  assign io_debug_rdata_18 = 0;
`endif
`ifndef SYNTHESIS
  assign io_debug_rdata_19 = arch_table_19; // @[RenameTable.scala 91:18]
`else
  assign io_debug_rdata_19 = 0;
`endif
`ifndef SYNTHESIS
  assign io_debug_rdata_20 = arch_table_20; // @[RenameTable.scala 91:18]
`else
  assign io_debug_rdata_20 = 0;
`endif
`ifndef SYNTHESIS
  assign io_debug_rdata_21 = arch_table_21; // @[RenameTable.scala 91:18]
`else
  assign io_debug_rdata_21 = 0;
`endif
`ifndef SYNTHESIS
  assign io_debug_rdata_22 = arch_table_22; // @[RenameTable.scala 91:18]
`else
  assign io_debug_rdata_22 = 0;
`endif
`ifndef SYNTHESIS
  assign io_debug_rdata_23 = arch_table_23; // @[RenameTable.scala 91:18]
`else
  assign io_debug_rdata_23 = 0;
`endif
`ifndef SYNTHESIS
  assign io_debug_rdata_24 = arch_table_24; // @[RenameTable.scala 91:18]
`else
  assign io_debug_rdata_24 = 0;
`endif
`ifndef SYNTHESIS
  assign io_debug_rdata_25 = arch_table_25; // @[RenameTable.scala 91:18]
`else
  assign io_debug_rdata_25 = 0;
`endif
`ifndef SYNTHESIS
  assign io_debug_rdata_26 = arch_table_26; // @[RenameTable.scala 91:18]
`else
  assign io_debug_rdata_26 = 0;
`endif
`ifndef SYNTHESIS
  assign io_debug_rdata_27 = arch_table_27; // @[RenameTable.scala 91:18]
`else
  assign io_debug_rdata_27 = 0;
`endif
`ifndef SYNTHESIS
  assign io_debug_rdata_28 = arch_table_28; // @[RenameTable.scala 91:18]
`else
  assign io_debug_rdata_28 = 0;
`endif
`ifndef SYNTHESIS
  assign io_debug_rdata_29 = arch_table_29; // @[RenameTable.scala 91:18]
`else
  assign io_debug_rdata_29 = 0;
`endif
`ifndef SYNTHESIS
  assign io_debug_rdata_30 = arch_table_30; // @[RenameTable.scala 91:18]
`else
  assign io_debug_rdata_30 = 0;
`endif
`ifndef SYNTHESIS
  assign io_debug_rdata_31 = arch_table_31; // @[RenameTable.scala 91:18]
`else
  assign io_debug_rdata_31 = 0;
`endif
  always @(posedge clock) begin
    if (io_redirect) begin // @[RenameTable.scala 63:29]
      t1_wSpec_1_wen <= 1'h0;
    end else begin
      t1_wSpec_1_wen <= io_specWritePorts_1_wen;
    end
    if (io_redirect) begin // @[RenameTable.scala 63:29]
      t1_wSpec_1_addr <= 5'h0;
    end else begin
      t1_wSpec_1_addr <= io_specWritePorts_1_addr;
    end
    if (io_redirect) begin // @[RenameTable.scala 63:29]
      t1_wSpec_0_wen <= 1'h0;
    end else begin
      t1_wSpec_0_wen <= io_specWritePorts_0_wen;
    end
    if (io_redirect) begin // @[RenameTable.scala 63:29]
      t1_wSpec_0_addr <= 5'h0;
    end else begin
      t1_wSpec_0_addr <= io_specWritePorts_0_addr;
    end
    if (io_redirect) begin // @[RenameTable.scala 63:29]
      t1_wSpec_1_data <= 6'h0;
    end else begin
      t1_wSpec_1_data <= io_specWritePorts_1_data;
    end
    if (io_redirect) begin // @[RenameTable.scala 63:29]
      t1_wSpec_0_data <= 6'h0;
    end else begin
      t1_wSpec_0_data <= io_specWritePorts_0_data;
    end
    if (io_readPorts_0_hold) begin // @[RenameTable.scala 61:51]
      t1_rdata_0 <= io_readPorts_0_data;
    end else if (5'h1f == io_readPorts_0_addr) begin // @[RenameTable.scala 61:51]
      if (t1_redirect) begin // @[RenameTable.scala 71:16]
        t1_rdata_0 <= arch_table_31;
      end else if (|_spec_table_next_31_T) begin // @[RenameTable.scala 71:48]
        t1_rdata_0 <= wMatch_31;
      end else begin
        t1_rdata_0 <= spec_table_31;
      end
    end else if (5'h1e == io_readPorts_0_addr) begin // @[RenameTable.scala 61:51]
      if (t1_redirect) begin // @[RenameTable.scala 71:16]
        t1_rdata_0 <= arch_table_30;
      end else begin
        t1_rdata_0 <= _spec_table_next_30_T_2;
      end
    end else if (5'h1d == io_readPorts_0_addr) begin // @[RenameTable.scala 61:51]
      t1_rdata_0 <= spec_table_next_29; // @[RenameTable.scala 61:51]
    end else begin
      t1_rdata_0 <= _GEN_28;
    end
    if (io_readPorts_1_hold) begin // @[RenameTable.scala 61:51]
      t1_rdata_1 <= io_readPorts_1_data;
    end else if (5'h1f == io_readPorts_1_addr) begin // @[RenameTable.scala 61:51]
      if (t1_redirect) begin // @[RenameTable.scala 71:16]
        t1_rdata_1 <= arch_table_31;
      end else if (|_spec_table_next_31_T) begin // @[RenameTable.scala 71:48]
        t1_rdata_1 <= wMatch_31;
      end else begin
        t1_rdata_1 <= spec_table_31;
      end
    end else if (5'h1e == io_readPorts_1_addr) begin // @[RenameTable.scala 61:51]
      if (t1_redirect) begin // @[RenameTable.scala 71:16]
        t1_rdata_1 <= arch_table_30;
      end else begin
        t1_rdata_1 <= _spec_table_next_30_T_2;
      end
    end else if (5'h1d == io_readPorts_1_addr) begin // @[RenameTable.scala 61:51]
      t1_rdata_1 <= spec_table_next_29; // @[RenameTable.scala 61:51]
    end else begin
      t1_rdata_1 <= _GEN_60;
    end
    if (io_readPorts_2_hold) begin // @[RenameTable.scala 61:51]
      t1_rdata_2 <= io_readPorts_2_data;
    end else if (5'h1f == io_readPorts_2_addr) begin // @[RenameTable.scala 61:51]
      if (t1_redirect) begin // @[RenameTable.scala 71:16]
        t1_rdata_2 <= arch_table_31;
      end else if (|_spec_table_next_31_T) begin // @[RenameTable.scala 71:48]
        t1_rdata_2 <= wMatch_31;
      end else begin
        t1_rdata_2 <= spec_table_31;
      end
    end else if (5'h1e == io_readPorts_2_addr) begin // @[RenameTable.scala 61:51]
      if (t1_redirect) begin // @[RenameTable.scala 71:16]
        t1_rdata_2 <= arch_table_30;
      end else begin
        t1_rdata_2 <= _spec_table_next_30_T_2;
      end
    end else if (5'h1d == io_readPorts_2_addr) begin // @[RenameTable.scala 61:51]
      t1_rdata_2 <= spec_table_next_29; // @[RenameTable.scala 61:51]
    end else begin
      t1_rdata_2 <= _GEN_92;
    end
    if (io_readPorts_3_hold) begin // @[RenameTable.scala 61:51]
      t1_rdata_3 <= io_readPorts_3_data;
    end else if (5'h1f == io_readPorts_3_addr) begin // @[RenameTable.scala 61:51]
      if (t1_redirect) begin // @[RenameTable.scala 71:16]
        t1_rdata_3 <= arch_table_31;
      end else if (|_spec_table_next_31_T) begin // @[RenameTable.scala 71:48]
        t1_rdata_3 <= wMatch_31;
      end else begin
        t1_rdata_3 <= spec_table_31;
      end
    end else if (5'h1e == io_readPorts_3_addr) begin // @[RenameTable.scala 61:51]
      if (t1_redirect) begin // @[RenameTable.scala 71:16]
        t1_rdata_3 <= arch_table_30;
      end else begin
        t1_rdata_3 <= _spec_table_next_30_T_2;
      end
    end else if (5'h1d == io_readPorts_3_addr) begin // @[RenameTable.scala 61:51]
      t1_rdata_3 <= spec_table_next_29; // @[RenameTable.scala 61:51]
    end else begin
      t1_rdata_3 <= _GEN_124;
    end
    if (io_readPorts_4_hold) begin // @[RenameTable.scala 61:51]
      t1_rdata_4 <= io_readPorts_4_data;
    end else if (5'h1f == io_readPorts_4_addr) begin // @[RenameTable.scala 61:51]
      if (t1_redirect) begin // @[RenameTable.scala 71:16]
        t1_rdata_4 <= arch_table_31;
      end else if (|_spec_table_next_31_T) begin // @[RenameTable.scala 71:48]
        t1_rdata_4 <= wMatch_31;
      end else begin
        t1_rdata_4 <= spec_table_31;
      end
    end else if (5'h1e == io_readPorts_4_addr) begin // @[RenameTable.scala 61:51]
      if (t1_redirect) begin // @[RenameTable.scala 71:16]
        t1_rdata_4 <= arch_table_30;
      end else begin
        t1_rdata_4 <= _spec_table_next_30_T_2;
      end
    end else if (5'h1d == io_readPorts_4_addr) begin // @[RenameTable.scala 61:51]
      t1_rdata_4 <= spec_table_next_29; // @[RenameTable.scala 61:51]
    end else begin
      t1_rdata_4 <= _GEN_156;
    end
    if (io_readPorts_5_hold) begin // @[RenameTable.scala 61:51]
      t1_rdata_5 <= io_readPorts_5_data;
    end else if (5'h1f == io_readPorts_5_addr) begin // @[RenameTable.scala 61:51]
      if (t1_redirect) begin // @[RenameTable.scala 71:16]
        t1_rdata_5 <= arch_table_31;
      end else if (|_spec_table_next_31_T) begin // @[RenameTable.scala 71:48]
        t1_rdata_5 <= wMatch_31;
      end else begin
        t1_rdata_5 <= spec_table_31;
      end
    end else if (5'h1e == io_readPorts_5_addr) begin // @[RenameTable.scala 61:51]
      if (t1_redirect) begin // @[RenameTable.scala 71:16]
        t1_rdata_5 <= arch_table_30;
      end else begin
        t1_rdata_5 <= _spec_table_next_30_T_2;
      end
    end else if (5'h1d == io_readPorts_5_addr) begin // @[RenameTable.scala 61:51]
      t1_rdata_5 <= spec_table_next_29; // @[RenameTable.scala 61:51]
    end else begin
      t1_rdata_5 <= _GEN_188;
    end
    if (_t1_raddr_T) begin // @[Reg.scala 17:18]
      t1_raddr_0 <= io_readPorts_0_addr; // @[Reg.scala 17:22]
    end
    if (_t1_raddr_T_1) begin // @[Reg.scala 17:18]
      t1_raddr_1 <= io_readPorts_1_addr; // @[Reg.scala 17:22]
    end
    if (_t1_raddr_T_2) begin // @[Reg.scala 17:18]
      t1_raddr_2 <= io_readPorts_2_addr; // @[Reg.scala 17:22]
    end
    if (_t1_raddr_T_3) begin // @[Reg.scala 17:18]
      t1_raddr_3 <= io_readPorts_3_addr; // @[Reg.scala 17:22]
    end
    if (_t1_raddr_T_4) begin // @[Reg.scala 17:18]
      t1_raddr_4 <= io_readPorts_4_addr; // @[Reg.scala 17:22]
    end
    if (_t1_raddr_T_5) begin // @[Reg.scala 17:18]
      t1_raddr_5 <= io_readPorts_5_addr; // @[Reg.scala 17:22]
    end
    if (io_redirect) begin // @[RenameTable.scala 79:32]
      t1_bypass__0 <= 1'h0;
    end else begin
      t1_bypass__0 <= t0_bypass_0;
    end
    if (io_redirect) begin // @[RenameTable.scala 79:32]
      t1_bypass__1 <= 1'h0;
    end else begin
      t1_bypass__1 <= t0_bypass_1;
    end
    if (io_redirect) begin // @[RenameTable.scala 79:32]
      t1_bypass_1_0 <= 1'h0;
    end else begin
      t1_bypass_1_0 <= t0_bypass_0_1;
    end
    if (io_redirect) begin // @[RenameTable.scala 79:32]
      t1_bypass_1_1 <= 1'h0;
    end else begin
      t1_bypass_1_1 <= t0_bypass_1_1;
    end
    if (io_redirect) begin // @[RenameTable.scala 79:32]
      t1_bypass_2_0 <= 1'h0;
    end else begin
      t1_bypass_2_0 <= t0_bypass_0_2;
    end
    if (io_redirect) begin // @[RenameTable.scala 79:32]
      t1_bypass_2_1 <= 1'h0;
    end else begin
      t1_bypass_2_1 <= t0_bypass_1_2;
    end
    if (io_redirect) begin // @[RenameTable.scala 79:32]
      t1_bypass_3_0 <= 1'h0;
    end else begin
      t1_bypass_3_0 <= t0_bypass_0_3;
    end
    if (io_redirect) begin // @[RenameTable.scala 79:32]
      t1_bypass_3_1 <= 1'h0;
    end else begin
      t1_bypass_3_1 <= t0_bypass_1_3;
    end
    if (io_redirect) begin // @[RenameTable.scala 79:32]
      t1_bypass_4_0 <= 1'h0;
    end else begin
      t1_bypass_4_0 <= t0_bypass_0_4;
    end
    if (io_redirect) begin // @[RenameTable.scala 79:32]
      t1_bypass_4_1 <= 1'h0;
    end else begin
      t1_bypass_4_1 <= t0_bypass_1_4;
    end
    if (io_redirect) begin // @[RenameTable.scala 79:32]
      t1_bypass_5_0 <= 1'h0;
    end else begin
      t1_bypass_5_0 <= t0_bypass_0_5;
    end
    if (io_redirect) begin // @[RenameTable.scala 79:32]
      t1_bypass_5_1 <= 1'h0;
    end else begin
      t1_bypass_5_1 <= t0_bypass_1_5;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 71:16]
      spec_table_0 <= 6'h0;
    end else if (t1_redirect) begin // @[RenameTable.scala 71:48]
      spec_table_0 <= arch_table_0; // @[ParallelMux.scala 90:77]
    end else if (|_spec_table_next_0_T) begin
      if (matchVec_1) begin
        spec_table_0 <= t1_wSpec_1_data;
      end else begin
        spec_table_0 <= t1_wSpec_0_data;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 71:16]
      spec_table_1 <= 6'h0;
    end else if (t1_redirect) begin // @[RenameTable.scala 71:48]
      spec_table_1 <= arch_table_1; // @[ParallelMux.scala 90:77]
    end else if (|_spec_table_next_1_T) begin
      if (matchVec_1_1) begin
        spec_table_1 <= t1_wSpec_1_data;
      end else begin
        spec_table_1 <= t1_wSpec_0_data;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 71:16]
      spec_table_2 <= 6'h0;
    end else if (t1_redirect) begin // @[RenameTable.scala 71:48]
      spec_table_2 <= arch_table_2; // @[ParallelMux.scala 90:77]
    end else if (|_spec_table_next_2_T) begin
      if (matchVec_1_2) begin
        spec_table_2 <= t1_wSpec_1_data;
      end else begin
        spec_table_2 <= t1_wSpec_0_data;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 71:16]
      spec_table_3 <= 6'h0;
    end else if (t1_redirect) begin // @[RenameTable.scala 71:48]
      spec_table_3 <= arch_table_3; // @[ParallelMux.scala 90:77]
    end else if (|_spec_table_next_3_T) begin
      if (matchVec_1_3) begin
        spec_table_3 <= t1_wSpec_1_data;
      end else begin
        spec_table_3 <= t1_wSpec_0_data;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 71:16]
      spec_table_4 <= 6'h0;
    end else if (t1_redirect) begin // @[RenameTable.scala 71:48]
      spec_table_4 <= arch_table_4; // @[ParallelMux.scala 90:77]
    end else if (|_spec_table_next_4_T) begin
      if (matchVec_1_4) begin
        spec_table_4 <= t1_wSpec_1_data;
      end else begin
        spec_table_4 <= t1_wSpec_0_data;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 71:16]
      spec_table_5 <= 6'h0;
    end else if (t1_redirect) begin // @[RenameTable.scala 71:48]
      spec_table_5 <= arch_table_5; // @[ParallelMux.scala 90:77]
    end else if (|_spec_table_next_5_T) begin
      if (matchVec_1_5) begin
        spec_table_5 <= t1_wSpec_1_data;
      end else begin
        spec_table_5 <= t1_wSpec_0_data;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 71:16]
      spec_table_6 <= 6'h0;
    end else if (t1_redirect) begin // @[RenameTable.scala 71:48]
      spec_table_6 <= arch_table_6; // @[ParallelMux.scala 90:77]
    end else if (|_spec_table_next_6_T) begin
      if (matchVec_1_6) begin
        spec_table_6 <= t1_wSpec_1_data;
      end else begin
        spec_table_6 <= t1_wSpec_0_data;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 71:16]
      spec_table_7 <= 6'h0;
    end else if (t1_redirect) begin // @[RenameTable.scala 71:48]
      spec_table_7 <= arch_table_7; // @[ParallelMux.scala 90:77]
    end else if (|_spec_table_next_7_T) begin
      if (matchVec_1_7) begin
        spec_table_7 <= t1_wSpec_1_data;
      end else begin
        spec_table_7 <= t1_wSpec_0_data;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 71:16]
      spec_table_8 <= 6'h0;
    end else if (t1_redirect) begin // @[RenameTable.scala 71:48]
      spec_table_8 <= arch_table_8; // @[ParallelMux.scala 90:77]
    end else if (|_spec_table_next_8_T) begin
      if (matchVec_1_8) begin
        spec_table_8 <= t1_wSpec_1_data;
      end else begin
        spec_table_8 <= t1_wSpec_0_data;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 71:16]
      spec_table_9 <= 6'h0;
    end else if (t1_redirect) begin // @[RenameTable.scala 71:48]
      spec_table_9 <= arch_table_9; // @[ParallelMux.scala 90:77]
    end else if (|_spec_table_next_9_T) begin
      if (matchVec_1_9) begin
        spec_table_9 <= t1_wSpec_1_data;
      end else begin
        spec_table_9 <= t1_wSpec_0_data;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 71:16]
      spec_table_10 <= 6'h0;
    end else if (t1_redirect) begin // @[RenameTable.scala 71:48]
      spec_table_10 <= arch_table_10; // @[ParallelMux.scala 90:77]
    end else if (|_spec_table_next_10_T) begin
      if (matchVec_1_10) begin
        spec_table_10 <= t1_wSpec_1_data;
      end else begin
        spec_table_10 <= t1_wSpec_0_data;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 71:16]
      spec_table_11 <= 6'h0;
    end else if (t1_redirect) begin // @[RenameTable.scala 71:48]
      spec_table_11 <= arch_table_11; // @[ParallelMux.scala 90:77]
    end else if (|_spec_table_next_11_T) begin
      if (matchVec_1_11) begin
        spec_table_11 <= t1_wSpec_1_data;
      end else begin
        spec_table_11 <= t1_wSpec_0_data;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 71:16]
      spec_table_12 <= 6'h0;
    end else if (t1_redirect) begin // @[RenameTable.scala 71:48]
      spec_table_12 <= arch_table_12; // @[ParallelMux.scala 90:77]
    end else if (|_spec_table_next_12_T) begin
      if (matchVec_1_12) begin
        spec_table_12 <= t1_wSpec_1_data;
      end else begin
        spec_table_12 <= t1_wSpec_0_data;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 71:16]
      spec_table_13 <= 6'h0;
    end else if (t1_redirect) begin // @[RenameTable.scala 71:48]
      spec_table_13 <= arch_table_13; // @[ParallelMux.scala 90:77]
    end else if (|_spec_table_next_13_T) begin
      if (matchVec_1_13) begin
        spec_table_13 <= t1_wSpec_1_data;
      end else begin
        spec_table_13 <= t1_wSpec_0_data;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 71:16]
      spec_table_14 <= 6'h0;
    end else if (t1_redirect) begin // @[RenameTable.scala 71:48]
      spec_table_14 <= arch_table_14; // @[ParallelMux.scala 90:77]
    end else if (|_spec_table_next_14_T) begin
      if (matchVec_1_14) begin
        spec_table_14 <= t1_wSpec_1_data;
      end else begin
        spec_table_14 <= t1_wSpec_0_data;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 71:16]
      spec_table_15 <= 6'h0;
    end else if (t1_redirect) begin // @[RenameTable.scala 71:48]
      spec_table_15 <= arch_table_15; // @[ParallelMux.scala 90:77]
    end else if (|_spec_table_next_15_T) begin
      if (matchVec_1_15) begin
        spec_table_15 <= t1_wSpec_1_data;
      end else begin
        spec_table_15 <= t1_wSpec_0_data;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 71:16]
      spec_table_16 <= 6'h0;
    end else if (t1_redirect) begin // @[RenameTable.scala 71:48]
      spec_table_16 <= arch_table_16; // @[ParallelMux.scala 90:77]
    end else if (|_spec_table_next_16_T) begin
      if (matchVec_1_16) begin
        spec_table_16 <= t1_wSpec_1_data;
      end else begin
        spec_table_16 <= t1_wSpec_0_data;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 71:16]
      spec_table_17 <= 6'h0;
    end else if (t1_redirect) begin // @[RenameTable.scala 71:48]
      spec_table_17 <= arch_table_17; // @[ParallelMux.scala 90:77]
    end else if (|_spec_table_next_17_T) begin
      if (matchVec_1_17) begin
        spec_table_17 <= t1_wSpec_1_data;
      end else begin
        spec_table_17 <= t1_wSpec_0_data;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 71:16]
      spec_table_18 <= 6'h0;
    end else if (t1_redirect) begin // @[RenameTable.scala 71:48]
      spec_table_18 <= arch_table_18; // @[ParallelMux.scala 90:77]
    end else if (|_spec_table_next_18_T) begin
      if (matchVec_1_18) begin
        spec_table_18 <= t1_wSpec_1_data;
      end else begin
        spec_table_18 <= t1_wSpec_0_data;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 71:16]
      spec_table_19 <= 6'h0;
    end else if (t1_redirect) begin // @[RenameTable.scala 71:48]
      spec_table_19 <= arch_table_19; // @[ParallelMux.scala 90:77]
    end else if (|_spec_table_next_19_T) begin
      if (matchVec_1_19) begin
        spec_table_19 <= t1_wSpec_1_data;
      end else begin
        spec_table_19 <= t1_wSpec_0_data;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 71:16]
      spec_table_20 <= 6'h0;
    end else if (t1_redirect) begin // @[RenameTable.scala 71:48]
      spec_table_20 <= arch_table_20; // @[ParallelMux.scala 90:77]
    end else if (|_spec_table_next_20_T) begin
      if (matchVec_1_20) begin
        spec_table_20 <= t1_wSpec_1_data;
      end else begin
        spec_table_20 <= t1_wSpec_0_data;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 71:16]
      spec_table_21 <= 6'h0;
    end else if (t1_redirect) begin // @[RenameTable.scala 71:48]
      spec_table_21 <= arch_table_21; // @[ParallelMux.scala 90:77]
    end else if (|_spec_table_next_21_T) begin
      if (matchVec_1_21) begin
        spec_table_21 <= t1_wSpec_1_data;
      end else begin
        spec_table_21 <= t1_wSpec_0_data;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 71:16]
      spec_table_22 <= 6'h0;
    end else if (t1_redirect) begin // @[RenameTable.scala 71:48]
      spec_table_22 <= arch_table_22; // @[ParallelMux.scala 90:77]
    end else if (|_spec_table_next_22_T) begin
      if (matchVec_1_22) begin
        spec_table_22 <= t1_wSpec_1_data;
      end else begin
        spec_table_22 <= t1_wSpec_0_data;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 71:16]
      spec_table_23 <= 6'h0;
    end else if (t1_redirect) begin // @[RenameTable.scala 71:48]
      spec_table_23 <= arch_table_23; // @[ParallelMux.scala 90:77]
    end else if (|_spec_table_next_23_T) begin
      if (matchVec_1_23) begin
        spec_table_23 <= t1_wSpec_1_data;
      end else begin
        spec_table_23 <= t1_wSpec_0_data;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 71:16]
      spec_table_24 <= 6'h0;
    end else if (t1_redirect) begin // @[RenameTable.scala 71:48]
      spec_table_24 <= arch_table_24; // @[ParallelMux.scala 90:77]
    end else if (|_spec_table_next_24_T) begin
      if (matchVec_1_24) begin
        spec_table_24 <= t1_wSpec_1_data;
      end else begin
        spec_table_24 <= t1_wSpec_0_data;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 71:16]
      spec_table_25 <= 6'h0;
    end else if (t1_redirect) begin // @[RenameTable.scala 71:48]
      spec_table_25 <= arch_table_25; // @[ParallelMux.scala 90:77]
    end else if (|_spec_table_next_25_T) begin
      if (matchVec_1_25) begin
        spec_table_25 <= t1_wSpec_1_data;
      end else begin
        spec_table_25 <= t1_wSpec_0_data;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 71:16]
      spec_table_26 <= 6'h0;
    end else if (t1_redirect) begin // @[RenameTable.scala 71:48]
      spec_table_26 <= arch_table_26; // @[ParallelMux.scala 90:77]
    end else if (|_spec_table_next_26_T) begin
      if (matchVec_1_26) begin
        spec_table_26 <= t1_wSpec_1_data;
      end else begin
        spec_table_26 <= t1_wSpec_0_data;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 71:16]
      spec_table_27 <= 6'h0;
    end else if (t1_redirect) begin // @[RenameTable.scala 71:48]
      spec_table_27 <= arch_table_27; // @[ParallelMux.scala 90:77]
    end else if (|_spec_table_next_27_T) begin
      if (matchVec_1_27) begin
        spec_table_27 <= t1_wSpec_1_data;
      end else begin
        spec_table_27 <= t1_wSpec_0_data;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 71:16]
      spec_table_28 <= 6'h0;
    end else if (t1_redirect) begin // @[RenameTable.scala 71:48]
      spec_table_28 <= arch_table_28; // @[ParallelMux.scala 90:77]
    end else if (|_spec_table_next_28_T) begin
      if (matchVec_1_28) begin
        spec_table_28 <= t1_wSpec_1_data;
      end else begin
        spec_table_28 <= t1_wSpec_0_data;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 71:16]
      spec_table_29 <= 6'h0;
    end else if (t1_redirect) begin // @[RenameTable.scala 71:48]
      spec_table_29 <= arch_table_29; // @[ParallelMux.scala 90:77]
    end else if (|_spec_table_next_29_T) begin
      if (matchVec_1_29) begin
        spec_table_29 <= t1_wSpec_1_data;
      end else begin
        spec_table_29 <= t1_wSpec_0_data;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 71:16]
      spec_table_30 <= 6'h0;
    end else if (t1_redirect) begin // @[RenameTable.scala 71:48]
      spec_table_30 <= arch_table_30; // @[ParallelMux.scala 90:77]
    end else if (|_spec_table_next_30_T) begin
      if (matchVec_1_30) begin
        spec_table_30 <= t1_wSpec_1_data;
      end else begin
        spec_table_30 <= t1_wSpec_0_data;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 71:16]
      spec_table_31 <= 6'h0;
    end else if (t1_redirect) begin // @[RenameTable.scala 71:48]
      spec_table_31 <= arch_table_31; // @[ParallelMux.scala 90:77]
    end else if (|_spec_table_next_31_T) begin
      if (matchVec_1_31) begin
        spec_table_31 <= t1_wSpec_1_data;
      end else begin
        spec_table_31 <= t1_wSpec_0_data;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 85:18]
      arch_table_0 <= 6'h0; // @[RenameTable.scala 86:{31,31}]
    end else if (io_archWritePorts_1_wen) begin
      if (5'h0 == io_archWritePorts_1_addr) begin
        arch_table_0 <= io_archWritePorts_1_data;
      end else begin
        arch_table_0 <= _GEN_230;
      end
    end else begin
      arch_table_0 <= _GEN_230;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 85:18]
      arch_table_1 <= 6'h0; // @[RenameTable.scala 86:{31,31}]
    end else if (io_archWritePorts_1_wen) begin
      if (5'h1 == io_archWritePorts_1_addr) begin
        arch_table_1 <= io_archWritePorts_1_data;
      end else begin
        arch_table_1 <= _GEN_231;
      end
    end else begin
      arch_table_1 <= _GEN_231;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 85:18]
      arch_table_2 <= 6'h0; // @[RenameTable.scala 86:{31,31}]
    end else if (io_archWritePorts_1_wen) begin
      if (5'h2 == io_archWritePorts_1_addr) begin
        arch_table_2 <= io_archWritePorts_1_data;
      end else begin
        arch_table_2 <= _GEN_232;
      end
    end else begin
      arch_table_2 <= _GEN_232;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 85:18]
      arch_table_3 <= 6'h0; // @[RenameTable.scala 86:{31,31}]
    end else if (io_archWritePorts_1_wen) begin
      if (5'h3 == io_archWritePorts_1_addr) begin
        arch_table_3 <= io_archWritePorts_1_data;
      end else begin
        arch_table_3 <= _GEN_233;
      end
    end else begin
      arch_table_3 <= _GEN_233;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 85:18]
      arch_table_4 <= 6'h0; // @[RenameTable.scala 86:{31,31}]
    end else if (io_archWritePorts_1_wen) begin
      if (5'h4 == io_archWritePorts_1_addr) begin
        arch_table_4 <= io_archWritePorts_1_data;
      end else begin
        arch_table_4 <= _GEN_234;
      end
    end else begin
      arch_table_4 <= _GEN_234;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 85:18]
      arch_table_5 <= 6'h0; // @[RenameTable.scala 86:{31,31}]
    end else if (io_archWritePorts_1_wen) begin
      if (5'h5 == io_archWritePorts_1_addr) begin
        arch_table_5 <= io_archWritePorts_1_data;
      end else begin
        arch_table_5 <= _GEN_235;
      end
    end else begin
      arch_table_5 <= _GEN_235;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 85:18]
      arch_table_6 <= 6'h0; // @[RenameTable.scala 86:{31,31}]
    end else if (io_archWritePorts_1_wen) begin
      if (5'h6 == io_archWritePorts_1_addr) begin
        arch_table_6 <= io_archWritePorts_1_data;
      end else begin
        arch_table_6 <= _GEN_236;
      end
    end else begin
      arch_table_6 <= _GEN_236;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 85:18]
      arch_table_7 <= 6'h0; // @[RenameTable.scala 86:{31,31}]
    end else if (io_archWritePorts_1_wen) begin
      if (5'h7 == io_archWritePorts_1_addr) begin
        arch_table_7 <= io_archWritePorts_1_data;
      end else begin
        arch_table_7 <= _GEN_237;
      end
    end else begin
      arch_table_7 <= _GEN_237;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 85:18]
      arch_table_8 <= 6'h0; // @[RenameTable.scala 86:{31,31}]
    end else if (io_archWritePorts_1_wen) begin
      if (5'h8 == io_archWritePorts_1_addr) begin
        arch_table_8 <= io_archWritePorts_1_data;
      end else begin
        arch_table_8 <= _GEN_238;
      end
    end else begin
      arch_table_8 <= _GEN_238;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 85:18]
      arch_table_9 <= 6'h0; // @[RenameTable.scala 86:{31,31}]
    end else if (io_archWritePorts_1_wen) begin
      if (5'h9 == io_archWritePorts_1_addr) begin
        arch_table_9 <= io_archWritePorts_1_data;
      end else begin
        arch_table_9 <= _GEN_239;
      end
    end else begin
      arch_table_9 <= _GEN_239;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 85:18]
      arch_table_10 <= 6'h0; // @[RenameTable.scala 86:{31,31}]
    end else if (io_archWritePorts_1_wen) begin
      if (5'ha == io_archWritePorts_1_addr) begin
        arch_table_10 <= io_archWritePorts_1_data;
      end else begin
        arch_table_10 <= _GEN_240;
      end
    end else begin
      arch_table_10 <= _GEN_240;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 85:18]
      arch_table_11 <= 6'h0; // @[RenameTable.scala 86:{31,31}]
    end else if (io_archWritePorts_1_wen) begin
      if (5'hb == io_archWritePorts_1_addr) begin
        arch_table_11 <= io_archWritePorts_1_data;
      end else begin
        arch_table_11 <= _GEN_241;
      end
    end else begin
      arch_table_11 <= _GEN_241;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 85:18]
      arch_table_12 <= 6'h0; // @[RenameTable.scala 86:{31,31}]
    end else if (io_archWritePorts_1_wen) begin
      if (5'hc == io_archWritePorts_1_addr) begin
        arch_table_12 <= io_archWritePorts_1_data;
      end else begin
        arch_table_12 <= _GEN_242;
      end
    end else begin
      arch_table_12 <= _GEN_242;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 85:18]
      arch_table_13 <= 6'h0; // @[RenameTable.scala 86:{31,31}]
    end else if (io_archWritePorts_1_wen) begin
      if (5'hd == io_archWritePorts_1_addr) begin
        arch_table_13 <= io_archWritePorts_1_data;
      end else begin
        arch_table_13 <= _GEN_243;
      end
    end else begin
      arch_table_13 <= _GEN_243;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 85:18]
      arch_table_14 <= 6'h0; // @[RenameTable.scala 86:{31,31}]
    end else if (io_archWritePorts_1_wen) begin
      if (5'he == io_archWritePorts_1_addr) begin
        arch_table_14 <= io_archWritePorts_1_data;
      end else begin
        arch_table_14 <= _GEN_244;
      end
    end else begin
      arch_table_14 <= _GEN_244;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 85:18]
      arch_table_15 <= 6'h0; // @[RenameTable.scala 86:{31,31}]
    end else if (io_archWritePorts_1_wen) begin
      if (5'hf == io_archWritePorts_1_addr) begin
        arch_table_15 <= io_archWritePorts_1_data;
      end else begin
        arch_table_15 <= _GEN_245;
      end
    end else begin
      arch_table_15 <= _GEN_245;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 85:18]
      arch_table_16 <= 6'h0; // @[RenameTable.scala 86:{31,31}]
    end else if (io_archWritePorts_1_wen) begin
      if (5'h10 == io_archWritePorts_1_addr) begin
        arch_table_16 <= io_archWritePorts_1_data;
      end else begin
        arch_table_16 <= _GEN_246;
      end
    end else begin
      arch_table_16 <= _GEN_246;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 85:18]
      arch_table_17 <= 6'h0; // @[RenameTable.scala 86:{31,31}]
    end else if (io_archWritePorts_1_wen) begin
      if (5'h11 == io_archWritePorts_1_addr) begin
        arch_table_17 <= io_archWritePorts_1_data;
      end else begin
        arch_table_17 <= _GEN_247;
      end
    end else begin
      arch_table_17 <= _GEN_247;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 85:18]
      arch_table_18 <= 6'h0; // @[RenameTable.scala 86:{31,31}]
    end else if (io_archWritePorts_1_wen) begin
      if (5'h12 == io_archWritePorts_1_addr) begin
        arch_table_18 <= io_archWritePorts_1_data;
      end else begin
        arch_table_18 <= _GEN_248;
      end
    end else begin
      arch_table_18 <= _GEN_248;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 85:18]
      arch_table_19 <= 6'h0; // @[RenameTable.scala 86:{31,31}]
    end else if (io_archWritePorts_1_wen) begin
      if (5'h13 == io_archWritePorts_1_addr) begin
        arch_table_19 <= io_archWritePorts_1_data;
      end else begin
        arch_table_19 <= _GEN_249;
      end
    end else begin
      arch_table_19 <= _GEN_249;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 85:18]
      arch_table_20 <= 6'h0; // @[RenameTable.scala 86:{31,31}]
    end else if (io_archWritePorts_1_wen) begin
      if (5'h14 == io_archWritePorts_1_addr) begin
        arch_table_20 <= io_archWritePorts_1_data;
      end else begin
        arch_table_20 <= _GEN_250;
      end
    end else begin
      arch_table_20 <= _GEN_250;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 85:18]
      arch_table_21 <= 6'h0; // @[RenameTable.scala 86:{31,31}]
    end else if (io_archWritePorts_1_wen) begin
      if (5'h15 == io_archWritePorts_1_addr) begin
        arch_table_21 <= io_archWritePorts_1_data;
      end else begin
        arch_table_21 <= _GEN_251;
      end
    end else begin
      arch_table_21 <= _GEN_251;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 85:18]
      arch_table_22 <= 6'h0; // @[RenameTable.scala 86:{31,31}]
    end else if (io_archWritePorts_1_wen) begin
      if (5'h16 == io_archWritePorts_1_addr) begin
        arch_table_22 <= io_archWritePorts_1_data;
      end else begin
        arch_table_22 <= _GEN_252;
      end
    end else begin
      arch_table_22 <= _GEN_252;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 85:18]
      arch_table_23 <= 6'h0; // @[RenameTable.scala 86:{31,31}]
    end else if (io_archWritePorts_1_wen) begin
      if (5'h17 == io_archWritePorts_1_addr) begin
        arch_table_23 <= io_archWritePorts_1_data;
      end else begin
        arch_table_23 <= _GEN_253;
      end
    end else begin
      arch_table_23 <= _GEN_253;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 85:18]
      arch_table_24 <= 6'h0; // @[RenameTable.scala 86:{31,31}]
    end else if (io_archWritePorts_1_wen) begin
      if (5'h18 == io_archWritePorts_1_addr) begin
        arch_table_24 <= io_archWritePorts_1_data;
      end else begin
        arch_table_24 <= _GEN_254;
      end
    end else begin
      arch_table_24 <= _GEN_254;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 85:18]
      arch_table_25 <= 6'h0; // @[RenameTable.scala 86:{31,31}]
    end else if (io_archWritePorts_1_wen) begin
      if (5'h19 == io_archWritePorts_1_addr) begin
        arch_table_25 <= io_archWritePorts_1_data;
      end else begin
        arch_table_25 <= _GEN_255;
      end
    end else begin
      arch_table_25 <= _GEN_255;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 85:18]
      arch_table_26 <= 6'h0; // @[RenameTable.scala 86:{31,31}]
    end else if (io_archWritePorts_1_wen) begin
      if (5'h1a == io_archWritePorts_1_addr) begin
        arch_table_26 <= io_archWritePorts_1_data;
      end else begin
        arch_table_26 <= _GEN_256;
      end
    end else begin
      arch_table_26 <= _GEN_256;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 85:18]
      arch_table_27 <= 6'h0; // @[RenameTable.scala 86:{31,31}]
    end else if (io_archWritePorts_1_wen) begin
      if (5'h1b == io_archWritePorts_1_addr) begin
        arch_table_27 <= io_archWritePorts_1_data;
      end else begin
        arch_table_27 <= _GEN_257;
      end
    end else begin
      arch_table_27 <= _GEN_257;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 85:18]
      arch_table_28 <= 6'h0; // @[RenameTable.scala 86:{31,31}]
    end else if (io_archWritePorts_1_wen) begin
      if (5'h1c == io_archWritePorts_1_addr) begin
        arch_table_28 <= io_archWritePorts_1_data;
      end else begin
        arch_table_28 <= _GEN_258;
      end
    end else begin
      arch_table_28 <= _GEN_258;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 85:18]
      arch_table_29 <= 6'h0; // @[RenameTable.scala 86:{31,31}]
    end else if (io_archWritePorts_1_wen) begin
      if (5'h1d == io_archWritePorts_1_addr) begin
        arch_table_29 <= io_archWritePorts_1_data;
      end else begin
        arch_table_29 <= _GEN_259;
      end
    end else begin
      arch_table_29 <= _GEN_259;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 85:18]
      arch_table_30 <= 6'h0; // @[RenameTable.scala 86:{31,31}]
    end else if (io_archWritePorts_1_wen) begin
      if (5'h1e == io_archWritePorts_1_addr) begin
        arch_table_30 <= io_archWritePorts_1_data;
      end else begin
        arch_table_30 <= _GEN_260;
      end
    end else begin
      arch_table_30 <= _GEN_260;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 85:18]
      arch_table_31 <= 6'h0; // @[RenameTable.scala 86:{31,31}]
    end else if (io_archWritePorts_1_wen) begin
      if (5'h1f == io_archWritePorts_1_addr) begin
        arch_table_31 <= io_archWritePorts_1_data;
      end else begin
        arch_table_31 <= _GEN_261;
      end
    end else begin
      arch_table_31 <= _GEN_261;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RenameTable.scala 60:28]
      t1_redirect <= 1'h0; // @[RenameTable.scala 60:28]
    end else begin
      t1_redirect <= io_redirect; // @[RenameTable.scala 60:28]
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
  spec_table_0 = _RAND_0[5:0];
  _RAND_1 = {1{`RANDOM}};
  spec_table_1 = _RAND_1[5:0];
  _RAND_2 = {1{`RANDOM}};
  spec_table_2 = _RAND_2[5:0];
  _RAND_3 = {1{`RANDOM}};
  spec_table_3 = _RAND_3[5:0];
  _RAND_4 = {1{`RANDOM}};
  spec_table_4 = _RAND_4[5:0];
  _RAND_5 = {1{`RANDOM}};
  spec_table_5 = _RAND_5[5:0];
  _RAND_6 = {1{`RANDOM}};
  spec_table_6 = _RAND_6[5:0];
  _RAND_7 = {1{`RANDOM}};
  spec_table_7 = _RAND_7[5:0];
  _RAND_8 = {1{`RANDOM}};
  spec_table_8 = _RAND_8[5:0];
  _RAND_9 = {1{`RANDOM}};
  spec_table_9 = _RAND_9[5:0];
  _RAND_10 = {1{`RANDOM}};
  spec_table_10 = _RAND_10[5:0];
  _RAND_11 = {1{`RANDOM}};
  spec_table_11 = _RAND_11[5:0];
  _RAND_12 = {1{`RANDOM}};
  spec_table_12 = _RAND_12[5:0];
  _RAND_13 = {1{`RANDOM}};
  spec_table_13 = _RAND_13[5:0];
  _RAND_14 = {1{`RANDOM}};
  spec_table_14 = _RAND_14[5:0];
  _RAND_15 = {1{`RANDOM}};
  spec_table_15 = _RAND_15[5:0];
  _RAND_16 = {1{`RANDOM}};
  spec_table_16 = _RAND_16[5:0];
  _RAND_17 = {1{`RANDOM}};
  spec_table_17 = _RAND_17[5:0];
  _RAND_18 = {1{`RANDOM}};
  spec_table_18 = _RAND_18[5:0];
  _RAND_19 = {1{`RANDOM}};
  spec_table_19 = _RAND_19[5:0];
  _RAND_20 = {1{`RANDOM}};
  spec_table_20 = _RAND_20[5:0];
  _RAND_21 = {1{`RANDOM}};
  spec_table_21 = _RAND_21[5:0];
  _RAND_22 = {1{`RANDOM}};
  spec_table_22 = _RAND_22[5:0];
  _RAND_23 = {1{`RANDOM}};
  spec_table_23 = _RAND_23[5:0];
  _RAND_24 = {1{`RANDOM}};
  spec_table_24 = _RAND_24[5:0];
  _RAND_25 = {1{`RANDOM}};
  spec_table_25 = _RAND_25[5:0];
  _RAND_26 = {1{`RANDOM}};
  spec_table_26 = _RAND_26[5:0];
  _RAND_27 = {1{`RANDOM}};
  spec_table_27 = _RAND_27[5:0];
  _RAND_28 = {1{`RANDOM}};
  spec_table_28 = _RAND_28[5:0];
  _RAND_29 = {1{`RANDOM}};
  spec_table_29 = _RAND_29[5:0];
  _RAND_30 = {1{`RANDOM}};
  spec_table_30 = _RAND_30[5:0];
  _RAND_31 = {1{`RANDOM}};
  spec_table_31 = _RAND_31[5:0];
  _RAND_32 = {1{`RANDOM}};
  arch_table_0 = _RAND_32[5:0];
  _RAND_33 = {1{`RANDOM}};
  arch_table_1 = _RAND_33[5:0];
  _RAND_34 = {1{`RANDOM}};
  arch_table_2 = _RAND_34[5:0];
  _RAND_35 = {1{`RANDOM}};
  arch_table_3 = _RAND_35[5:0];
  _RAND_36 = {1{`RANDOM}};
  arch_table_4 = _RAND_36[5:0];
  _RAND_37 = {1{`RANDOM}};
  arch_table_5 = _RAND_37[5:0];
  _RAND_38 = {1{`RANDOM}};
  arch_table_6 = _RAND_38[5:0];
  _RAND_39 = {1{`RANDOM}};
  arch_table_7 = _RAND_39[5:0];
  _RAND_40 = {1{`RANDOM}};
  arch_table_8 = _RAND_40[5:0];
  _RAND_41 = {1{`RANDOM}};
  arch_table_9 = _RAND_41[5:0];
  _RAND_42 = {1{`RANDOM}};
  arch_table_10 = _RAND_42[5:0];
  _RAND_43 = {1{`RANDOM}};
  arch_table_11 = _RAND_43[5:0];
  _RAND_44 = {1{`RANDOM}};
  arch_table_12 = _RAND_44[5:0];
  _RAND_45 = {1{`RANDOM}};
  arch_table_13 = _RAND_45[5:0];
  _RAND_46 = {1{`RANDOM}};
  arch_table_14 = _RAND_46[5:0];
  _RAND_47 = {1{`RANDOM}};
  arch_table_15 = _RAND_47[5:0];
  _RAND_48 = {1{`RANDOM}};
  arch_table_16 = _RAND_48[5:0];
  _RAND_49 = {1{`RANDOM}};
  arch_table_17 = _RAND_49[5:0];
  _RAND_50 = {1{`RANDOM}};
  arch_table_18 = _RAND_50[5:0];
  _RAND_51 = {1{`RANDOM}};
  arch_table_19 = _RAND_51[5:0];
  _RAND_52 = {1{`RANDOM}};
  arch_table_20 = _RAND_52[5:0];
  _RAND_53 = {1{`RANDOM}};
  arch_table_21 = _RAND_53[5:0];
  _RAND_54 = {1{`RANDOM}};
  arch_table_22 = _RAND_54[5:0];
  _RAND_55 = {1{`RANDOM}};
  arch_table_23 = _RAND_55[5:0];
  _RAND_56 = {1{`RANDOM}};
  arch_table_24 = _RAND_56[5:0];
  _RAND_57 = {1{`RANDOM}};
  arch_table_25 = _RAND_57[5:0];
  _RAND_58 = {1{`RANDOM}};
  arch_table_26 = _RAND_58[5:0];
  _RAND_59 = {1{`RANDOM}};
  arch_table_27 = _RAND_59[5:0];
  _RAND_60 = {1{`RANDOM}};
  arch_table_28 = _RAND_60[5:0];
  _RAND_61 = {1{`RANDOM}};
  arch_table_29 = _RAND_61[5:0];
  _RAND_62 = {1{`RANDOM}};
  arch_table_30 = _RAND_62[5:0];
  _RAND_63 = {1{`RANDOM}};
  arch_table_31 = _RAND_63[5:0];
  _RAND_64 = {1{`RANDOM}};
  t1_redirect = _RAND_64[0:0];
  _RAND_65 = {1{`RANDOM}};
  t1_wSpec_1_wen = _RAND_65[0:0];
  _RAND_66 = {1{`RANDOM}};
  t1_wSpec_1_addr = _RAND_66[4:0];
  _RAND_67 = {1{`RANDOM}};
  t1_wSpec_0_wen = _RAND_67[0:0];
  _RAND_68 = {1{`RANDOM}};
  t1_wSpec_0_addr = _RAND_68[4:0];
  _RAND_69 = {1{`RANDOM}};
  t1_wSpec_1_data = _RAND_69[5:0];
  _RAND_70 = {1{`RANDOM}};
  t1_wSpec_0_data = _RAND_70[5:0];
  _RAND_71 = {1{`RANDOM}};
  t1_rdata_0 = _RAND_71[5:0];
  _RAND_72 = {1{`RANDOM}};
  t1_rdata_1 = _RAND_72[5:0];
  _RAND_73 = {1{`RANDOM}};
  t1_rdata_2 = _RAND_73[5:0];
  _RAND_74 = {1{`RANDOM}};
  t1_rdata_3 = _RAND_74[5:0];
  _RAND_75 = {1{`RANDOM}};
  t1_rdata_4 = _RAND_75[5:0];
  _RAND_76 = {1{`RANDOM}};
  t1_rdata_5 = _RAND_76[5:0];
  _RAND_77 = {1{`RANDOM}};
  t1_raddr_0 = _RAND_77[4:0];
  _RAND_78 = {1{`RANDOM}};
  t1_raddr_1 = _RAND_78[4:0];
  _RAND_79 = {1{`RANDOM}};
  t1_raddr_2 = _RAND_79[4:0];
  _RAND_80 = {1{`RANDOM}};
  t1_raddr_3 = _RAND_80[4:0];
  _RAND_81 = {1{`RANDOM}};
  t1_raddr_4 = _RAND_81[4:0];
  _RAND_82 = {1{`RANDOM}};
  t1_raddr_5 = _RAND_82[4:0];
  _RAND_83 = {1{`RANDOM}};
  t1_bypass__0 = _RAND_83[0:0];
  _RAND_84 = {1{`RANDOM}};
  t1_bypass__1 = _RAND_84[0:0];
  _RAND_85 = {1{`RANDOM}};
  t1_bypass_1_0 = _RAND_85[0:0];
  _RAND_86 = {1{`RANDOM}};
  t1_bypass_1_1 = _RAND_86[0:0];
  _RAND_87 = {1{`RANDOM}};
  t1_bypass_2_0 = _RAND_87[0:0];
  _RAND_88 = {1{`RANDOM}};
  t1_bypass_2_1 = _RAND_88[0:0];
  _RAND_89 = {1{`RANDOM}};
  t1_bypass_3_0 = _RAND_89[0:0];
  _RAND_90 = {1{`RANDOM}};
  t1_bypass_3_1 = _RAND_90[0:0];
  _RAND_91 = {1{`RANDOM}};
  t1_bypass_4_0 = _RAND_91[0:0];
  _RAND_92 = {1{`RANDOM}};
  t1_bypass_4_1 = _RAND_92[0:0];
  _RAND_93 = {1{`RANDOM}};
  t1_bypass_5_0 = _RAND_93[0:0];
  _RAND_94 = {1{`RANDOM}};
  t1_bypass_5_1 = _RAND_94[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    spec_table_0 = 6'h0;
  end
  if (reset) begin
    spec_table_1 = 6'h0;
  end
  if (reset) begin
    spec_table_2 = 6'h0;
  end
  if (reset) begin
    spec_table_3 = 6'h0;
  end
  if (reset) begin
    spec_table_4 = 6'h0;
  end
  if (reset) begin
    spec_table_5 = 6'h0;
  end
  if (reset) begin
    spec_table_6 = 6'h0;
  end
  if (reset) begin
    spec_table_7 = 6'h0;
  end
  if (reset) begin
    spec_table_8 = 6'h0;
  end
  if (reset) begin
    spec_table_9 = 6'h0;
  end
  if (reset) begin
    spec_table_10 = 6'h0;
  end
  if (reset) begin
    spec_table_11 = 6'h0;
  end
  if (reset) begin
    spec_table_12 = 6'h0;
  end
  if (reset) begin
    spec_table_13 = 6'h0;
  end
  if (reset) begin
    spec_table_14 = 6'h0;
  end
  if (reset) begin
    spec_table_15 = 6'h0;
  end
  if (reset) begin
    spec_table_16 = 6'h0;
  end
  if (reset) begin
    spec_table_17 = 6'h0;
  end
  if (reset) begin
    spec_table_18 = 6'h0;
  end
  if (reset) begin
    spec_table_19 = 6'h0;
  end
  if (reset) begin
    spec_table_20 = 6'h0;
  end
  if (reset) begin
    spec_table_21 = 6'h0;
  end
  if (reset) begin
    spec_table_22 = 6'h0;
  end
  if (reset) begin
    spec_table_23 = 6'h0;
  end
  if (reset) begin
    spec_table_24 = 6'h0;
  end
  if (reset) begin
    spec_table_25 = 6'h0;
  end
  if (reset) begin
    spec_table_26 = 6'h0;
  end
  if (reset) begin
    spec_table_27 = 6'h0;
  end
  if (reset) begin
    spec_table_28 = 6'h0;
  end
  if (reset) begin
    spec_table_29 = 6'h0;
  end
  if (reset) begin
    spec_table_30 = 6'h0;
  end
  if (reset) begin
    spec_table_31 = 6'h0;
  end
  if (reset) begin
    arch_table_0 = 6'h0;
  end
  if (reset) begin
    arch_table_1 = 6'h0;
  end
  if (reset) begin
    arch_table_2 = 6'h0;
  end
  if (reset) begin
    arch_table_3 = 6'h0;
  end
  if (reset) begin
    arch_table_4 = 6'h0;
  end
  if (reset) begin
    arch_table_5 = 6'h0;
  end
  if (reset) begin
    arch_table_6 = 6'h0;
  end
  if (reset) begin
    arch_table_7 = 6'h0;
  end
  if (reset) begin
    arch_table_8 = 6'h0;
  end
  if (reset) begin
    arch_table_9 = 6'h0;
  end
  if (reset) begin
    arch_table_10 = 6'h0;
  end
  if (reset) begin
    arch_table_11 = 6'h0;
  end
  if (reset) begin
    arch_table_12 = 6'h0;
  end
  if (reset) begin
    arch_table_13 = 6'h0;
  end
  if (reset) begin
    arch_table_14 = 6'h0;
  end
  if (reset) begin
    arch_table_15 = 6'h0;
  end
  if (reset) begin
    arch_table_16 = 6'h0;
  end
  if (reset) begin
    arch_table_17 = 6'h0;
  end
  if (reset) begin
    arch_table_18 = 6'h0;
  end
  if (reset) begin
    arch_table_19 = 6'h0;
  end
  if (reset) begin
    arch_table_20 = 6'h0;
  end
  if (reset) begin
    arch_table_21 = 6'h0;
  end
  if (reset) begin
    arch_table_22 = 6'h0;
  end
  if (reset) begin
    arch_table_23 = 6'h0;
  end
  if (reset) begin
    arch_table_24 = 6'h0;
  end
  if (reset) begin
    arch_table_25 = 6'h0;
  end
  if (reset) begin
    arch_table_26 = 6'h0;
  end
  if (reset) begin
    arch_table_27 = 6'h0;
  end
  if (reset) begin
    arch_table_28 = 6'h0;
  end
  if (reset) begin
    arch_table_29 = 6'h0;
  end
  if (reset) begin
    arch_table_30 = 6'h0;
  end
  if (reset) begin
    arch_table_31 = 6'h0;
  end
  if (reset) begin
    t1_redirect = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

