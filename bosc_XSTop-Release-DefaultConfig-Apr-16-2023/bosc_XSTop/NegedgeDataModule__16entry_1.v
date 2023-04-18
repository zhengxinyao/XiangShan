module NegedgeDataModule__16entry_1(
  input        clock,
  input  [3:0] io_raddr_0,
  input  [3:0] io_raddr_1,
  output [4:0] io_rdata_0_ldest,
  output       io_rdata_0_rfWen,
  output       io_rdata_0_fpWen,
  output       io_rdata_0_wflags,
  output [2:0] io_rdata_0_commitType,
  output [5:0] io_rdata_0_pdest,
  output [5:0] io_rdata_0_old_pdest,
  output       io_rdata_0_ftqIdx_flag,
  output [2:0] io_rdata_0_ftqIdx_value,
  output [2:0] io_rdata_0_ftqOffset,
  output       io_rdata_0_isMove,
  output [4:0] io_rdata_1_ldest,
  output       io_rdata_1_rfWen,
  output       io_rdata_1_fpWen,
  output       io_rdata_1_wflags,
  output [2:0] io_rdata_1_commitType,
  output [5:0] io_rdata_1_pdest,
  output [5:0] io_rdata_1_old_pdest,
  output       io_rdata_1_ftqIdx_flag,
  output [2:0] io_rdata_1_ftqIdx_value,
  output [2:0] io_rdata_1_ftqOffset,
  output       io_rdata_1_isMove,
  input        io_wen_0,
  input        io_wen_1,
  input  [3:0] io_waddr_0,
  input  [3:0] io_waddr_1,
  input  [4:0] io_wdata_0_ldest,
  input        io_wdata_0_rfWen,
  input        io_wdata_0_fpWen,
  input        io_wdata_0_wflags,
  input  [2:0] io_wdata_0_commitType,
  input  [5:0] io_wdata_0_pdest,
  input  [5:0] io_wdata_0_old_pdest,
  input        io_wdata_0_ftqIdx_flag,
  input  [2:0] io_wdata_0_ftqIdx_value,
  input  [2:0] io_wdata_0_ftqOffset,
  input        io_wdata_0_isMove,
  input  [4:0] io_wdata_1_ldest,
  input        io_wdata_1_rfWen,
  input        io_wdata_1_fpWen,
  input        io_wdata_1_wflags,
  input  [2:0] io_wdata_1_commitType,
  input  [5:0] io_wdata_1_pdest,
  input  [5:0] io_wdata_1_old_pdest,
  input        io_wdata_1_ftqIdx_flag,
  input  [2:0] io_wdata_1_ftqIdx_value,
  input  [2:0] io_wdata_1_ftqOffset,
  input        io_wdata_1_isMove
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
  reg [31:0] _RAND_95;
  reg [31:0] _RAND_96;
  reg [31:0] _RAND_97;
  reg [31:0] _RAND_98;
  reg [31:0] _RAND_99;
  reg [31:0] _RAND_100;
  reg [31:0] _RAND_101;
  reg [31:0] _RAND_102;
  reg [31:0] _RAND_103;
  reg [31:0] _RAND_104;
  reg [31:0] _RAND_105;
  reg [31:0] _RAND_106;
  reg [31:0] _RAND_107;
  reg [31:0] _RAND_108;
  reg [31:0] _RAND_109;
  reg [31:0] _RAND_110;
  reg [31:0] _RAND_111;
  reg [31:0] _RAND_112;
  reg [31:0] _RAND_113;
  reg [31:0] _RAND_114;
  reg [31:0] _RAND_115;
  reg [31:0] _RAND_116;
  reg [31:0] _RAND_117;
  reg [31:0] _RAND_118;
  reg [31:0] _RAND_119;
  reg [31:0] _RAND_120;
  reg [31:0] _RAND_121;
  reg [31:0] _RAND_122;
  reg [31:0] _RAND_123;
  reg [31:0] _RAND_124;
  reg [31:0] _RAND_125;
  reg [31:0] _RAND_126;
  reg [31:0] _RAND_127;
  reg [31:0] _RAND_128;
  reg [31:0] _RAND_129;
  reg [31:0] _RAND_130;
  reg [31:0] _RAND_131;
  reg [31:0] _RAND_132;
  reg [31:0] _RAND_133;
  reg [31:0] _RAND_134;
  reg [31:0] _RAND_135;
  reg [31:0] _RAND_136;
  reg [31:0] _RAND_137;
  reg [31:0] _RAND_138;
  reg [31:0] _RAND_139;
  reg [31:0] _RAND_140;
  reg [31:0] _RAND_141;
  reg [31:0] _RAND_142;
  reg [31:0] _RAND_143;
  reg [31:0] _RAND_144;
  reg [31:0] _RAND_145;
  reg [31:0] _RAND_146;
  reg [31:0] _RAND_147;
  reg [31:0] _RAND_148;
  reg [31:0] _RAND_149;
  reg [31:0] _RAND_150;
  reg [31:0] _RAND_151;
  reg [31:0] _RAND_152;
  reg [31:0] _RAND_153;
  reg [31:0] _RAND_154;
  reg [31:0] _RAND_155;
  reg [31:0] _RAND_156;
  reg [31:0] _RAND_157;
  reg [31:0] _RAND_158;
  reg [31:0] _RAND_159;
  reg [31:0] _RAND_160;
  reg [31:0] _RAND_161;
  reg [31:0] _RAND_162;
  reg [31:0] _RAND_163;
  reg [31:0] _RAND_164;
  reg [31:0] _RAND_165;
  reg [31:0] _RAND_166;
  reg [31:0] _RAND_167;
  reg [31:0] _RAND_168;
  reg [31:0] _RAND_169;
  reg [31:0] _RAND_170;
  reg [31:0] _RAND_171;
  reg [31:0] _RAND_172;
  reg [31:0] _RAND_173;
  reg [31:0] _RAND_174;
  reg [31:0] _RAND_175;
`endif // RANDOMIZE_REG_INIT
  reg [4:0] data_0_ldest; // @[DataModuleTemplate.scala 168:17]
  reg  data_0_rfWen; // @[DataModuleTemplate.scala 168:17]
  reg  data_0_fpWen; // @[DataModuleTemplate.scala 168:17]
  reg  data_0_wflags; // @[DataModuleTemplate.scala 168:17]
  reg [2:0] data_0_commitType; // @[DataModuleTemplate.scala 168:17]
  reg [5:0] data_0_pdest; // @[DataModuleTemplate.scala 168:17]
  reg [5:0] data_0_old_pdest; // @[DataModuleTemplate.scala 168:17]
  reg  data_0_ftqIdx_flag; // @[DataModuleTemplate.scala 168:17]
  reg [2:0] data_0_ftqIdx_value; // @[DataModuleTemplate.scala 168:17]
  reg [2:0] data_0_ftqOffset; // @[DataModuleTemplate.scala 168:17]
  reg  data_0_isMove; // @[DataModuleTemplate.scala 168:17]
  reg [4:0] data_1_ldest; // @[DataModuleTemplate.scala 168:17]
  reg  data_1_rfWen; // @[DataModuleTemplate.scala 168:17]
  reg  data_1_fpWen; // @[DataModuleTemplate.scala 168:17]
  reg  data_1_wflags; // @[DataModuleTemplate.scala 168:17]
  reg [2:0] data_1_commitType; // @[DataModuleTemplate.scala 168:17]
  reg [5:0] data_1_pdest; // @[DataModuleTemplate.scala 168:17]
  reg [5:0] data_1_old_pdest; // @[DataModuleTemplate.scala 168:17]
  reg  data_1_ftqIdx_flag; // @[DataModuleTemplate.scala 168:17]
  reg [2:0] data_1_ftqIdx_value; // @[DataModuleTemplate.scala 168:17]
  reg [2:0] data_1_ftqOffset; // @[DataModuleTemplate.scala 168:17]
  reg  data_1_isMove; // @[DataModuleTemplate.scala 168:17]
  reg [4:0] data_2_ldest; // @[DataModuleTemplate.scala 168:17]
  reg  data_2_rfWen; // @[DataModuleTemplate.scala 168:17]
  reg  data_2_fpWen; // @[DataModuleTemplate.scala 168:17]
  reg  data_2_wflags; // @[DataModuleTemplate.scala 168:17]
  reg [2:0] data_2_commitType; // @[DataModuleTemplate.scala 168:17]
  reg [5:0] data_2_pdest; // @[DataModuleTemplate.scala 168:17]
  reg [5:0] data_2_old_pdest; // @[DataModuleTemplate.scala 168:17]
  reg  data_2_ftqIdx_flag; // @[DataModuleTemplate.scala 168:17]
  reg [2:0] data_2_ftqIdx_value; // @[DataModuleTemplate.scala 168:17]
  reg [2:0] data_2_ftqOffset; // @[DataModuleTemplate.scala 168:17]
  reg  data_2_isMove; // @[DataModuleTemplate.scala 168:17]
  reg [4:0] data_3_ldest; // @[DataModuleTemplate.scala 168:17]
  reg  data_3_rfWen; // @[DataModuleTemplate.scala 168:17]
  reg  data_3_fpWen; // @[DataModuleTemplate.scala 168:17]
  reg  data_3_wflags; // @[DataModuleTemplate.scala 168:17]
  reg [2:0] data_3_commitType; // @[DataModuleTemplate.scala 168:17]
  reg [5:0] data_3_pdest; // @[DataModuleTemplate.scala 168:17]
  reg [5:0] data_3_old_pdest; // @[DataModuleTemplate.scala 168:17]
  reg  data_3_ftqIdx_flag; // @[DataModuleTemplate.scala 168:17]
  reg [2:0] data_3_ftqIdx_value; // @[DataModuleTemplate.scala 168:17]
  reg [2:0] data_3_ftqOffset; // @[DataModuleTemplate.scala 168:17]
  reg  data_3_isMove; // @[DataModuleTemplate.scala 168:17]
  reg [4:0] data_4_ldest; // @[DataModuleTemplate.scala 168:17]
  reg  data_4_rfWen; // @[DataModuleTemplate.scala 168:17]
  reg  data_4_fpWen; // @[DataModuleTemplate.scala 168:17]
  reg  data_4_wflags; // @[DataModuleTemplate.scala 168:17]
  reg [2:0] data_4_commitType; // @[DataModuleTemplate.scala 168:17]
  reg [5:0] data_4_pdest; // @[DataModuleTemplate.scala 168:17]
  reg [5:0] data_4_old_pdest; // @[DataModuleTemplate.scala 168:17]
  reg  data_4_ftqIdx_flag; // @[DataModuleTemplate.scala 168:17]
  reg [2:0] data_4_ftqIdx_value; // @[DataModuleTemplate.scala 168:17]
  reg [2:0] data_4_ftqOffset; // @[DataModuleTemplate.scala 168:17]
  reg  data_4_isMove; // @[DataModuleTemplate.scala 168:17]
  reg [4:0] data_5_ldest; // @[DataModuleTemplate.scala 168:17]
  reg  data_5_rfWen; // @[DataModuleTemplate.scala 168:17]
  reg  data_5_fpWen; // @[DataModuleTemplate.scala 168:17]
  reg  data_5_wflags; // @[DataModuleTemplate.scala 168:17]
  reg [2:0] data_5_commitType; // @[DataModuleTemplate.scala 168:17]
  reg [5:0] data_5_pdest; // @[DataModuleTemplate.scala 168:17]
  reg [5:0] data_5_old_pdest; // @[DataModuleTemplate.scala 168:17]
  reg  data_5_ftqIdx_flag; // @[DataModuleTemplate.scala 168:17]
  reg [2:0] data_5_ftqIdx_value; // @[DataModuleTemplate.scala 168:17]
  reg [2:0] data_5_ftqOffset; // @[DataModuleTemplate.scala 168:17]
  reg  data_5_isMove; // @[DataModuleTemplate.scala 168:17]
  reg [4:0] data_6_ldest; // @[DataModuleTemplate.scala 168:17]
  reg  data_6_rfWen; // @[DataModuleTemplate.scala 168:17]
  reg  data_6_fpWen; // @[DataModuleTemplate.scala 168:17]
  reg  data_6_wflags; // @[DataModuleTemplate.scala 168:17]
  reg [2:0] data_6_commitType; // @[DataModuleTemplate.scala 168:17]
  reg [5:0] data_6_pdest; // @[DataModuleTemplate.scala 168:17]
  reg [5:0] data_6_old_pdest; // @[DataModuleTemplate.scala 168:17]
  reg  data_6_ftqIdx_flag; // @[DataModuleTemplate.scala 168:17]
  reg [2:0] data_6_ftqIdx_value; // @[DataModuleTemplate.scala 168:17]
  reg [2:0] data_6_ftqOffset; // @[DataModuleTemplate.scala 168:17]
  reg  data_6_isMove; // @[DataModuleTemplate.scala 168:17]
  reg [4:0] data_7_ldest; // @[DataModuleTemplate.scala 168:17]
  reg  data_7_rfWen; // @[DataModuleTemplate.scala 168:17]
  reg  data_7_fpWen; // @[DataModuleTemplate.scala 168:17]
  reg  data_7_wflags; // @[DataModuleTemplate.scala 168:17]
  reg [2:0] data_7_commitType; // @[DataModuleTemplate.scala 168:17]
  reg [5:0] data_7_pdest; // @[DataModuleTemplate.scala 168:17]
  reg [5:0] data_7_old_pdest; // @[DataModuleTemplate.scala 168:17]
  reg  data_7_ftqIdx_flag; // @[DataModuleTemplate.scala 168:17]
  reg [2:0] data_7_ftqIdx_value; // @[DataModuleTemplate.scala 168:17]
  reg [2:0] data_7_ftqOffset; // @[DataModuleTemplate.scala 168:17]
  reg  data_7_isMove; // @[DataModuleTemplate.scala 168:17]
  reg [4:0] data_8_ldest; // @[DataModuleTemplate.scala 168:17]
  reg  data_8_rfWen; // @[DataModuleTemplate.scala 168:17]
  reg  data_8_fpWen; // @[DataModuleTemplate.scala 168:17]
  reg  data_8_wflags; // @[DataModuleTemplate.scala 168:17]
  reg [2:0] data_8_commitType; // @[DataModuleTemplate.scala 168:17]
  reg [5:0] data_8_pdest; // @[DataModuleTemplate.scala 168:17]
  reg [5:0] data_8_old_pdest; // @[DataModuleTemplate.scala 168:17]
  reg  data_8_ftqIdx_flag; // @[DataModuleTemplate.scala 168:17]
  reg [2:0] data_8_ftqIdx_value; // @[DataModuleTemplate.scala 168:17]
  reg [2:0] data_8_ftqOffset; // @[DataModuleTemplate.scala 168:17]
  reg  data_8_isMove; // @[DataModuleTemplate.scala 168:17]
  reg [4:0] data_9_ldest; // @[DataModuleTemplate.scala 168:17]
  reg  data_9_rfWen; // @[DataModuleTemplate.scala 168:17]
  reg  data_9_fpWen; // @[DataModuleTemplate.scala 168:17]
  reg  data_9_wflags; // @[DataModuleTemplate.scala 168:17]
  reg [2:0] data_9_commitType; // @[DataModuleTemplate.scala 168:17]
  reg [5:0] data_9_pdest; // @[DataModuleTemplate.scala 168:17]
  reg [5:0] data_9_old_pdest; // @[DataModuleTemplate.scala 168:17]
  reg  data_9_ftqIdx_flag; // @[DataModuleTemplate.scala 168:17]
  reg [2:0] data_9_ftqIdx_value; // @[DataModuleTemplate.scala 168:17]
  reg [2:0] data_9_ftqOffset; // @[DataModuleTemplate.scala 168:17]
  reg  data_9_isMove; // @[DataModuleTemplate.scala 168:17]
  reg [4:0] data_10_ldest; // @[DataModuleTemplate.scala 168:17]
  reg  data_10_rfWen; // @[DataModuleTemplate.scala 168:17]
  reg  data_10_fpWen; // @[DataModuleTemplate.scala 168:17]
  reg  data_10_wflags; // @[DataModuleTemplate.scala 168:17]
  reg [2:0] data_10_commitType; // @[DataModuleTemplate.scala 168:17]
  reg [5:0] data_10_pdest; // @[DataModuleTemplate.scala 168:17]
  reg [5:0] data_10_old_pdest; // @[DataModuleTemplate.scala 168:17]
  reg  data_10_ftqIdx_flag; // @[DataModuleTemplate.scala 168:17]
  reg [2:0] data_10_ftqIdx_value; // @[DataModuleTemplate.scala 168:17]
  reg [2:0] data_10_ftqOffset; // @[DataModuleTemplate.scala 168:17]
  reg  data_10_isMove; // @[DataModuleTemplate.scala 168:17]
  reg [4:0] data_11_ldest; // @[DataModuleTemplate.scala 168:17]
  reg  data_11_rfWen; // @[DataModuleTemplate.scala 168:17]
  reg  data_11_fpWen; // @[DataModuleTemplate.scala 168:17]
  reg  data_11_wflags; // @[DataModuleTemplate.scala 168:17]
  reg [2:0] data_11_commitType; // @[DataModuleTemplate.scala 168:17]
  reg [5:0] data_11_pdest; // @[DataModuleTemplate.scala 168:17]
  reg [5:0] data_11_old_pdest; // @[DataModuleTemplate.scala 168:17]
  reg  data_11_ftqIdx_flag; // @[DataModuleTemplate.scala 168:17]
  reg [2:0] data_11_ftqIdx_value; // @[DataModuleTemplate.scala 168:17]
  reg [2:0] data_11_ftqOffset; // @[DataModuleTemplate.scala 168:17]
  reg  data_11_isMove; // @[DataModuleTemplate.scala 168:17]
  reg [4:0] data_12_ldest; // @[DataModuleTemplate.scala 168:17]
  reg  data_12_rfWen; // @[DataModuleTemplate.scala 168:17]
  reg  data_12_fpWen; // @[DataModuleTemplate.scala 168:17]
  reg  data_12_wflags; // @[DataModuleTemplate.scala 168:17]
  reg [2:0] data_12_commitType; // @[DataModuleTemplate.scala 168:17]
  reg [5:0] data_12_pdest; // @[DataModuleTemplate.scala 168:17]
  reg [5:0] data_12_old_pdest; // @[DataModuleTemplate.scala 168:17]
  reg  data_12_ftqIdx_flag; // @[DataModuleTemplate.scala 168:17]
  reg [2:0] data_12_ftqIdx_value; // @[DataModuleTemplate.scala 168:17]
  reg [2:0] data_12_ftqOffset; // @[DataModuleTemplate.scala 168:17]
  reg  data_12_isMove; // @[DataModuleTemplate.scala 168:17]
  reg [4:0] data_13_ldest; // @[DataModuleTemplate.scala 168:17]
  reg  data_13_rfWen; // @[DataModuleTemplate.scala 168:17]
  reg  data_13_fpWen; // @[DataModuleTemplate.scala 168:17]
  reg  data_13_wflags; // @[DataModuleTemplate.scala 168:17]
  reg [2:0] data_13_commitType; // @[DataModuleTemplate.scala 168:17]
  reg [5:0] data_13_pdest; // @[DataModuleTemplate.scala 168:17]
  reg [5:0] data_13_old_pdest; // @[DataModuleTemplate.scala 168:17]
  reg  data_13_ftqIdx_flag; // @[DataModuleTemplate.scala 168:17]
  reg [2:0] data_13_ftqIdx_value; // @[DataModuleTemplate.scala 168:17]
  reg [2:0] data_13_ftqOffset; // @[DataModuleTemplate.scala 168:17]
  reg  data_13_isMove; // @[DataModuleTemplate.scala 168:17]
  reg [4:0] data_14_ldest; // @[DataModuleTemplate.scala 168:17]
  reg  data_14_rfWen; // @[DataModuleTemplate.scala 168:17]
  reg  data_14_fpWen; // @[DataModuleTemplate.scala 168:17]
  reg  data_14_wflags; // @[DataModuleTemplate.scala 168:17]
  reg [2:0] data_14_commitType; // @[DataModuleTemplate.scala 168:17]
  reg [5:0] data_14_pdest; // @[DataModuleTemplate.scala 168:17]
  reg [5:0] data_14_old_pdest; // @[DataModuleTemplate.scala 168:17]
  reg  data_14_ftqIdx_flag; // @[DataModuleTemplate.scala 168:17]
  reg [2:0] data_14_ftqIdx_value; // @[DataModuleTemplate.scala 168:17]
  reg [2:0] data_14_ftqOffset; // @[DataModuleTemplate.scala 168:17]
  reg  data_14_isMove; // @[DataModuleTemplate.scala 168:17]
  reg [4:0] data_15_ldest; // @[DataModuleTemplate.scala 168:17]
  reg  data_15_rfWen; // @[DataModuleTemplate.scala 168:17]
  reg  data_15_fpWen; // @[DataModuleTemplate.scala 168:17]
  reg  data_15_wflags; // @[DataModuleTemplate.scala 168:17]
  reg [2:0] data_15_commitType; // @[DataModuleTemplate.scala 168:17]
  reg [5:0] data_15_pdest; // @[DataModuleTemplate.scala 168:17]
  reg [5:0] data_15_old_pdest; // @[DataModuleTemplate.scala 168:17]
  reg  data_15_ftqIdx_flag; // @[DataModuleTemplate.scala 168:17]
  reg [2:0] data_15_ftqIdx_value; // @[DataModuleTemplate.scala 168:17]
  reg [2:0] data_15_ftqOffset; // @[DataModuleTemplate.scala 168:17]
  reg  data_15_isMove; // @[DataModuleTemplate.scala 168:17]
  wire  read_by_0 = io_wen_0 & io_waddr_0 == io_raddr_0; // @[DataModuleTemplate.scala 176:54]
  wire  read_by_1 = io_wen_1 & io_waddr_1 == io_raddr_0; // @[DataModuleTemplate.scala 176:54]
  wire [15:0] addr_dec = 16'h1 << io_raddr_0; // @[OneHot.scala 64:12]
  wire [1:0] _T = {read_by_1,read_by_0}; // @[DataModuleTemplate.scala 178:28]
  wire  _io_rdata_0_T_5 = read_by_0 & io_wdata_0_isMove | read_by_1 & io_wdata_1_isMove; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_6 = read_by_0 ? io_wdata_0_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_7 = read_by_1 ? io_wdata_1_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_8 = _io_rdata_0_T_6 | _io_rdata_0_T_7; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_9 = read_by_0 ? io_wdata_0_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_10 = read_by_1 ? io_wdata_1_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_11 = _io_rdata_0_T_9 | _io_rdata_0_T_10; // @[Mux.scala 27:73]
  wire  _io_rdata_0_T_14 = read_by_0 & io_wdata_0_ftqIdx_flag | read_by_1 & io_wdata_1_ftqIdx_flag; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_15 = read_by_0 ? io_wdata_0_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_16 = read_by_1 ? io_wdata_1_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_17 = _io_rdata_0_T_15 | _io_rdata_0_T_16; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_18 = read_by_0 ? io_wdata_0_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_19 = read_by_1 ? io_wdata_1_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_20 = _io_rdata_0_T_18 | _io_rdata_0_T_19; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_21 = read_by_0 ? io_wdata_0_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_22 = read_by_1 ? io_wdata_1_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_23 = _io_rdata_0_T_21 | _io_rdata_0_T_22; // @[Mux.scala 27:73]
  wire  _io_rdata_0_T_26 = read_by_0 & io_wdata_0_wflags | read_by_1 & io_wdata_1_wflags; // @[Mux.scala 27:73]
  wire  _io_rdata_0_T_29 = read_by_0 & io_wdata_0_fpWen | read_by_1 & io_wdata_1_fpWen; // @[Mux.scala 27:73]
  wire  _io_rdata_0_T_32 = read_by_0 & io_wdata_0_rfWen | read_by_1 & io_wdata_1_rfWen; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_0_T_33 = read_by_0 ? io_wdata_0_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_0_T_34 = read_by_1 ? io_wdata_1_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_0_T_35 = _io_rdata_0_T_33 | _io_rdata_0_T_34; // @[Mux.scala 27:73]
  wire  _io_rdata_0_T_98 = addr_dec[15] & data_15_isMove; // @[Mux.scala 27:73]
  wire  _io_rdata_0_T_113 = addr_dec[0] & data_0_isMove | addr_dec[1] & data_1_isMove | addr_dec[2] & data_2_isMove |
    addr_dec[3] & data_3_isMove | addr_dec[4] & data_4_isMove | addr_dec[5] & data_5_isMove | addr_dec[6] &
    data_6_isMove | addr_dec[7] & data_7_isMove | addr_dec[8] & data_8_isMove | addr_dec[9] & data_9_isMove | addr_dec[
    10] & data_10_isMove | addr_dec[11] & data_11_isMove | addr_dec[12] & data_12_isMove | addr_dec[13] & data_13_isMove
     | addr_dec[14] & data_14_isMove | _io_rdata_0_T_98; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_114 = addr_dec[0] ? data_0_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_115 = addr_dec[1] ? data_1_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_116 = addr_dec[2] ? data_2_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_117 = addr_dec[3] ? data_3_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_118 = addr_dec[4] ? data_4_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_119 = addr_dec[5] ? data_5_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_120 = addr_dec[6] ? data_6_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_121 = addr_dec[7] ? data_7_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_122 = addr_dec[8] ? data_8_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_123 = addr_dec[9] ? data_9_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_124 = addr_dec[10] ? data_10_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_125 = addr_dec[11] ? data_11_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_126 = addr_dec[12] ? data_12_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_127 = addr_dec[13] ? data_13_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_128 = addr_dec[14] ? data_14_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_129 = addr_dec[15] ? data_15_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_130 = _io_rdata_0_T_114 | _io_rdata_0_T_115; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_131 = _io_rdata_0_T_130 | _io_rdata_0_T_116; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_132 = _io_rdata_0_T_131 | _io_rdata_0_T_117; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_133 = _io_rdata_0_T_132 | _io_rdata_0_T_118; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_134 = _io_rdata_0_T_133 | _io_rdata_0_T_119; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_135 = _io_rdata_0_T_134 | _io_rdata_0_T_120; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_136 = _io_rdata_0_T_135 | _io_rdata_0_T_121; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_137 = _io_rdata_0_T_136 | _io_rdata_0_T_122; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_138 = _io_rdata_0_T_137 | _io_rdata_0_T_123; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_139 = _io_rdata_0_T_138 | _io_rdata_0_T_124; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_140 = _io_rdata_0_T_139 | _io_rdata_0_T_125; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_141 = _io_rdata_0_T_140 | _io_rdata_0_T_126; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_142 = _io_rdata_0_T_141 | _io_rdata_0_T_127; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_143 = _io_rdata_0_T_142 | _io_rdata_0_T_128; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_144 = _io_rdata_0_T_143 | _io_rdata_0_T_129; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_145 = addr_dec[0] ? data_0_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_146 = addr_dec[1] ? data_1_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_147 = addr_dec[2] ? data_2_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_148 = addr_dec[3] ? data_3_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_149 = addr_dec[4] ? data_4_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_150 = addr_dec[5] ? data_5_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_151 = addr_dec[6] ? data_6_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_152 = addr_dec[7] ? data_7_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_153 = addr_dec[8] ? data_8_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_154 = addr_dec[9] ? data_9_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_155 = addr_dec[10] ? data_10_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_156 = addr_dec[11] ? data_11_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_157 = addr_dec[12] ? data_12_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_158 = addr_dec[13] ? data_13_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_159 = addr_dec[14] ? data_14_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_160 = addr_dec[15] ? data_15_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_161 = _io_rdata_0_T_145 | _io_rdata_0_T_146; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_162 = _io_rdata_0_T_161 | _io_rdata_0_T_147; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_163 = _io_rdata_0_T_162 | _io_rdata_0_T_148; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_164 = _io_rdata_0_T_163 | _io_rdata_0_T_149; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_165 = _io_rdata_0_T_164 | _io_rdata_0_T_150; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_166 = _io_rdata_0_T_165 | _io_rdata_0_T_151; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_167 = _io_rdata_0_T_166 | _io_rdata_0_T_152; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_168 = _io_rdata_0_T_167 | _io_rdata_0_T_153; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_169 = _io_rdata_0_T_168 | _io_rdata_0_T_154; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_170 = _io_rdata_0_T_169 | _io_rdata_0_T_155; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_171 = _io_rdata_0_T_170 | _io_rdata_0_T_156; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_172 = _io_rdata_0_T_171 | _io_rdata_0_T_157; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_173 = _io_rdata_0_T_172 | _io_rdata_0_T_158; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_174 = _io_rdata_0_T_173 | _io_rdata_0_T_159; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_175 = _io_rdata_0_T_174 | _io_rdata_0_T_160; // @[Mux.scala 27:73]
  wire  _io_rdata_0_T_191 = addr_dec[15] & data_15_ftqIdx_flag; // @[Mux.scala 27:73]
  wire  _io_rdata_0_T_206 = addr_dec[0] & data_0_ftqIdx_flag | addr_dec[1] & data_1_ftqIdx_flag | addr_dec[2] &
    data_2_ftqIdx_flag | addr_dec[3] & data_3_ftqIdx_flag | addr_dec[4] & data_4_ftqIdx_flag | addr_dec[5] &
    data_5_ftqIdx_flag | addr_dec[6] & data_6_ftqIdx_flag | addr_dec[7] & data_7_ftqIdx_flag | addr_dec[8] &
    data_8_ftqIdx_flag | addr_dec[9] & data_9_ftqIdx_flag | addr_dec[10] & data_10_ftqIdx_flag | addr_dec[11] &
    data_11_ftqIdx_flag | addr_dec[12] & data_12_ftqIdx_flag | addr_dec[13] & data_13_ftqIdx_flag | addr_dec[14] &
    data_14_ftqIdx_flag | _io_rdata_0_T_191; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_207 = addr_dec[0] ? data_0_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_208 = addr_dec[1] ? data_1_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_209 = addr_dec[2] ? data_2_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_210 = addr_dec[3] ? data_3_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_211 = addr_dec[4] ? data_4_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_212 = addr_dec[5] ? data_5_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_213 = addr_dec[6] ? data_6_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_214 = addr_dec[7] ? data_7_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_215 = addr_dec[8] ? data_8_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_216 = addr_dec[9] ? data_9_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_217 = addr_dec[10] ? data_10_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_218 = addr_dec[11] ? data_11_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_219 = addr_dec[12] ? data_12_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_220 = addr_dec[13] ? data_13_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_221 = addr_dec[14] ? data_14_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_222 = addr_dec[15] ? data_15_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_223 = _io_rdata_0_T_207 | _io_rdata_0_T_208; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_224 = _io_rdata_0_T_223 | _io_rdata_0_T_209; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_225 = _io_rdata_0_T_224 | _io_rdata_0_T_210; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_226 = _io_rdata_0_T_225 | _io_rdata_0_T_211; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_227 = _io_rdata_0_T_226 | _io_rdata_0_T_212; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_228 = _io_rdata_0_T_227 | _io_rdata_0_T_213; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_229 = _io_rdata_0_T_228 | _io_rdata_0_T_214; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_230 = _io_rdata_0_T_229 | _io_rdata_0_T_215; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_231 = _io_rdata_0_T_230 | _io_rdata_0_T_216; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_232 = _io_rdata_0_T_231 | _io_rdata_0_T_217; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_233 = _io_rdata_0_T_232 | _io_rdata_0_T_218; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_234 = _io_rdata_0_T_233 | _io_rdata_0_T_219; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_235 = _io_rdata_0_T_234 | _io_rdata_0_T_220; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_236 = _io_rdata_0_T_235 | _io_rdata_0_T_221; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_237 = _io_rdata_0_T_236 | _io_rdata_0_T_222; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_238 = addr_dec[0] ? data_0_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_239 = addr_dec[1] ? data_1_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_240 = addr_dec[2] ? data_2_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_241 = addr_dec[3] ? data_3_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_242 = addr_dec[4] ? data_4_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_243 = addr_dec[5] ? data_5_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_244 = addr_dec[6] ? data_6_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_245 = addr_dec[7] ? data_7_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_246 = addr_dec[8] ? data_8_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_247 = addr_dec[9] ? data_9_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_248 = addr_dec[10] ? data_10_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_249 = addr_dec[11] ? data_11_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_250 = addr_dec[12] ? data_12_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_251 = addr_dec[13] ? data_13_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_252 = addr_dec[14] ? data_14_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_253 = addr_dec[15] ? data_15_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_254 = _io_rdata_0_T_238 | _io_rdata_0_T_239; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_255 = _io_rdata_0_T_254 | _io_rdata_0_T_240; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_256 = _io_rdata_0_T_255 | _io_rdata_0_T_241; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_257 = _io_rdata_0_T_256 | _io_rdata_0_T_242; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_258 = _io_rdata_0_T_257 | _io_rdata_0_T_243; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_259 = _io_rdata_0_T_258 | _io_rdata_0_T_244; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_260 = _io_rdata_0_T_259 | _io_rdata_0_T_245; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_261 = _io_rdata_0_T_260 | _io_rdata_0_T_246; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_262 = _io_rdata_0_T_261 | _io_rdata_0_T_247; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_263 = _io_rdata_0_T_262 | _io_rdata_0_T_248; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_264 = _io_rdata_0_T_263 | _io_rdata_0_T_249; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_265 = _io_rdata_0_T_264 | _io_rdata_0_T_250; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_266 = _io_rdata_0_T_265 | _io_rdata_0_T_251; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_267 = _io_rdata_0_T_266 | _io_rdata_0_T_252; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_0_T_268 = _io_rdata_0_T_267 | _io_rdata_0_T_253; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_269 = addr_dec[0] ? data_0_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_270 = addr_dec[1] ? data_1_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_271 = addr_dec[2] ? data_2_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_272 = addr_dec[3] ? data_3_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_273 = addr_dec[4] ? data_4_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_274 = addr_dec[5] ? data_5_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_275 = addr_dec[6] ? data_6_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_276 = addr_dec[7] ? data_7_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_277 = addr_dec[8] ? data_8_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_278 = addr_dec[9] ? data_9_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_279 = addr_dec[10] ? data_10_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_280 = addr_dec[11] ? data_11_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_281 = addr_dec[12] ? data_12_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_282 = addr_dec[13] ? data_13_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_283 = addr_dec[14] ? data_14_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_284 = addr_dec[15] ? data_15_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_285 = _io_rdata_0_T_269 | _io_rdata_0_T_270; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_286 = _io_rdata_0_T_285 | _io_rdata_0_T_271; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_287 = _io_rdata_0_T_286 | _io_rdata_0_T_272; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_288 = _io_rdata_0_T_287 | _io_rdata_0_T_273; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_289 = _io_rdata_0_T_288 | _io_rdata_0_T_274; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_290 = _io_rdata_0_T_289 | _io_rdata_0_T_275; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_291 = _io_rdata_0_T_290 | _io_rdata_0_T_276; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_292 = _io_rdata_0_T_291 | _io_rdata_0_T_277; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_293 = _io_rdata_0_T_292 | _io_rdata_0_T_278; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_294 = _io_rdata_0_T_293 | _io_rdata_0_T_279; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_295 = _io_rdata_0_T_294 | _io_rdata_0_T_280; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_296 = _io_rdata_0_T_295 | _io_rdata_0_T_281; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_297 = _io_rdata_0_T_296 | _io_rdata_0_T_282; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_298 = _io_rdata_0_T_297 | _io_rdata_0_T_283; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_0_T_299 = _io_rdata_0_T_298 | _io_rdata_0_T_284; // @[Mux.scala 27:73]
  wire  _io_rdata_0_T_315 = addr_dec[15] & data_15_wflags; // @[Mux.scala 27:73]
  wire  _io_rdata_0_T_330 = addr_dec[0] & data_0_wflags | addr_dec[1] & data_1_wflags | addr_dec[2] & data_2_wflags |
    addr_dec[3] & data_3_wflags | addr_dec[4] & data_4_wflags | addr_dec[5] & data_5_wflags | addr_dec[6] &
    data_6_wflags | addr_dec[7] & data_7_wflags | addr_dec[8] & data_8_wflags | addr_dec[9] & data_9_wflags | addr_dec[
    10] & data_10_wflags | addr_dec[11] & data_11_wflags | addr_dec[12] & data_12_wflags | addr_dec[13] & data_13_wflags
     | addr_dec[14] & data_14_wflags | _io_rdata_0_T_315; // @[Mux.scala 27:73]
  wire  _io_rdata_0_T_346 = addr_dec[15] & data_15_fpWen; // @[Mux.scala 27:73]
  wire  _io_rdata_0_T_361 = addr_dec[0] & data_0_fpWen | addr_dec[1] & data_1_fpWen | addr_dec[2] & data_2_fpWen |
    addr_dec[3] & data_3_fpWen | addr_dec[4] & data_4_fpWen | addr_dec[5] & data_5_fpWen | addr_dec[6] & data_6_fpWen |
    addr_dec[7] & data_7_fpWen | addr_dec[8] & data_8_fpWen | addr_dec[9] & data_9_fpWen | addr_dec[10] & data_10_fpWen
     | addr_dec[11] & data_11_fpWen | addr_dec[12] & data_12_fpWen | addr_dec[13] & data_13_fpWen | addr_dec[14] &
    data_14_fpWen | _io_rdata_0_T_346; // @[Mux.scala 27:73]
  wire  _io_rdata_0_T_377 = addr_dec[15] & data_15_rfWen; // @[Mux.scala 27:73]
  wire  _io_rdata_0_T_392 = addr_dec[0] & data_0_rfWen | addr_dec[1] & data_1_rfWen | addr_dec[2] & data_2_rfWen |
    addr_dec[3] & data_3_rfWen | addr_dec[4] & data_4_rfWen | addr_dec[5] & data_5_rfWen | addr_dec[6] & data_6_rfWen |
    addr_dec[7] & data_7_rfWen | addr_dec[8] & data_8_rfWen | addr_dec[9] & data_9_rfWen | addr_dec[10] & data_10_rfWen
     | addr_dec[11] & data_11_rfWen | addr_dec[12] & data_12_rfWen | addr_dec[13] & data_13_rfWen | addr_dec[14] &
    data_14_rfWen | _io_rdata_0_T_377; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_0_T_393 = addr_dec[0] ? data_0_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_0_T_394 = addr_dec[1] ? data_1_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_0_T_395 = addr_dec[2] ? data_2_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_0_T_396 = addr_dec[3] ? data_3_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_0_T_397 = addr_dec[4] ? data_4_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_0_T_398 = addr_dec[5] ? data_5_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_0_T_399 = addr_dec[6] ? data_6_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_0_T_400 = addr_dec[7] ? data_7_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_0_T_401 = addr_dec[8] ? data_8_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_0_T_402 = addr_dec[9] ? data_9_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_0_T_403 = addr_dec[10] ? data_10_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_0_T_404 = addr_dec[11] ? data_11_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_0_T_405 = addr_dec[12] ? data_12_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_0_T_406 = addr_dec[13] ? data_13_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_0_T_407 = addr_dec[14] ? data_14_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_0_T_408 = addr_dec[15] ? data_15_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_0_T_409 = _io_rdata_0_T_393 | _io_rdata_0_T_394; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_0_T_410 = _io_rdata_0_T_409 | _io_rdata_0_T_395; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_0_T_411 = _io_rdata_0_T_410 | _io_rdata_0_T_396; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_0_T_412 = _io_rdata_0_T_411 | _io_rdata_0_T_397; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_0_T_413 = _io_rdata_0_T_412 | _io_rdata_0_T_398; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_0_T_414 = _io_rdata_0_T_413 | _io_rdata_0_T_399; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_0_T_415 = _io_rdata_0_T_414 | _io_rdata_0_T_400; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_0_T_416 = _io_rdata_0_T_415 | _io_rdata_0_T_401; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_0_T_417 = _io_rdata_0_T_416 | _io_rdata_0_T_402; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_0_T_418 = _io_rdata_0_T_417 | _io_rdata_0_T_403; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_0_T_419 = _io_rdata_0_T_418 | _io_rdata_0_T_404; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_0_T_420 = _io_rdata_0_T_419 | _io_rdata_0_T_405; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_0_T_421 = _io_rdata_0_T_420 | _io_rdata_0_T_406; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_0_T_422 = _io_rdata_0_T_421 | _io_rdata_0_T_407; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_0_T_423 = _io_rdata_0_T_422 | _io_rdata_0_T_408; // @[Mux.scala 27:73]
  wire  read_by_0_1 = io_wen_0 & io_waddr_0 == io_raddr_1; // @[DataModuleTemplate.scala 176:54]
  wire  read_by_1_1 = io_wen_1 & io_waddr_1 == io_raddr_1; // @[DataModuleTemplate.scala 176:54]
  wire [15:0] addr_dec_1 = 16'h1 << io_raddr_1; // @[OneHot.scala 64:12]
  wire [1:0] _T_2 = {read_by_1_1,read_by_0_1}; // @[DataModuleTemplate.scala 178:28]
  wire  _io_rdata_1_T_5 = read_by_0_1 & io_wdata_0_isMove | read_by_1_1 & io_wdata_1_isMove; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_6 = read_by_0_1 ? io_wdata_0_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_7 = read_by_1_1 ? io_wdata_1_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_8 = _io_rdata_1_T_6 | _io_rdata_1_T_7; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_9 = read_by_0_1 ? io_wdata_0_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_10 = read_by_1_1 ? io_wdata_1_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_11 = _io_rdata_1_T_9 | _io_rdata_1_T_10; // @[Mux.scala 27:73]
  wire  _io_rdata_1_T_14 = read_by_0_1 & io_wdata_0_ftqIdx_flag | read_by_1_1 & io_wdata_1_ftqIdx_flag; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_15 = read_by_0_1 ? io_wdata_0_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_16 = read_by_1_1 ? io_wdata_1_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_17 = _io_rdata_1_T_15 | _io_rdata_1_T_16; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_18 = read_by_0_1 ? io_wdata_0_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_19 = read_by_1_1 ? io_wdata_1_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_20 = _io_rdata_1_T_18 | _io_rdata_1_T_19; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_21 = read_by_0_1 ? io_wdata_0_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_22 = read_by_1_1 ? io_wdata_1_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_23 = _io_rdata_1_T_21 | _io_rdata_1_T_22; // @[Mux.scala 27:73]
  wire  _io_rdata_1_T_26 = read_by_0_1 & io_wdata_0_wflags | read_by_1_1 & io_wdata_1_wflags; // @[Mux.scala 27:73]
  wire  _io_rdata_1_T_29 = read_by_0_1 & io_wdata_0_fpWen | read_by_1_1 & io_wdata_1_fpWen; // @[Mux.scala 27:73]
  wire  _io_rdata_1_T_32 = read_by_0_1 & io_wdata_0_rfWen | read_by_1_1 & io_wdata_1_rfWen; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_1_T_33 = read_by_0_1 ? io_wdata_0_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_1_T_34 = read_by_1_1 ? io_wdata_1_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_1_T_35 = _io_rdata_1_T_33 | _io_rdata_1_T_34; // @[Mux.scala 27:73]
  wire  _io_rdata_1_T_98 = addr_dec_1[15] & data_15_isMove; // @[Mux.scala 27:73]
  wire  _io_rdata_1_T_113 = addr_dec_1[0] & data_0_isMove | addr_dec_1[1] & data_1_isMove | addr_dec_1[2] &
    data_2_isMove | addr_dec_1[3] & data_3_isMove | addr_dec_1[4] & data_4_isMove | addr_dec_1[5] & data_5_isMove |
    addr_dec_1[6] & data_6_isMove | addr_dec_1[7] & data_7_isMove | addr_dec_1[8] & data_8_isMove | addr_dec_1[9] &
    data_9_isMove | addr_dec_1[10] & data_10_isMove | addr_dec_1[11] & data_11_isMove | addr_dec_1[12] & data_12_isMove
     | addr_dec_1[13] & data_13_isMove | addr_dec_1[14] & data_14_isMove | _io_rdata_1_T_98; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_114 = addr_dec_1[0] ? data_0_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_115 = addr_dec_1[1] ? data_1_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_116 = addr_dec_1[2] ? data_2_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_117 = addr_dec_1[3] ? data_3_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_118 = addr_dec_1[4] ? data_4_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_119 = addr_dec_1[5] ? data_5_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_120 = addr_dec_1[6] ? data_6_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_121 = addr_dec_1[7] ? data_7_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_122 = addr_dec_1[8] ? data_8_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_123 = addr_dec_1[9] ? data_9_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_124 = addr_dec_1[10] ? data_10_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_125 = addr_dec_1[11] ? data_11_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_126 = addr_dec_1[12] ? data_12_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_127 = addr_dec_1[13] ? data_13_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_128 = addr_dec_1[14] ? data_14_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_129 = addr_dec_1[15] ? data_15_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_130 = _io_rdata_1_T_114 | _io_rdata_1_T_115; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_131 = _io_rdata_1_T_130 | _io_rdata_1_T_116; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_132 = _io_rdata_1_T_131 | _io_rdata_1_T_117; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_133 = _io_rdata_1_T_132 | _io_rdata_1_T_118; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_134 = _io_rdata_1_T_133 | _io_rdata_1_T_119; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_135 = _io_rdata_1_T_134 | _io_rdata_1_T_120; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_136 = _io_rdata_1_T_135 | _io_rdata_1_T_121; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_137 = _io_rdata_1_T_136 | _io_rdata_1_T_122; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_138 = _io_rdata_1_T_137 | _io_rdata_1_T_123; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_139 = _io_rdata_1_T_138 | _io_rdata_1_T_124; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_140 = _io_rdata_1_T_139 | _io_rdata_1_T_125; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_141 = _io_rdata_1_T_140 | _io_rdata_1_T_126; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_142 = _io_rdata_1_T_141 | _io_rdata_1_T_127; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_143 = _io_rdata_1_T_142 | _io_rdata_1_T_128; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_144 = _io_rdata_1_T_143 | _io_rdata_1_T_129; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_145 = addr_dec_1[0] ? data_0_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_146 = addr_dec_1[1] ? data_1_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_147 = addr_dec_1[2] ? data_2_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_148 = addr_dec_1[3] ? data_3_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_149 = addr_dec_1[4] ? data_4_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_150 = addr_dec_1[5] ? data_5_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_151 = addr_dec_1[6] ? data_6_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_152 = addr_dec_1[7] ? data_7_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_153 = addr_dec_1[8] ? data_8_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_154 = addr_dec_1[9] ? data_9_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_155 = addr_dec_1[10] ? data_10_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_156 = addr_dec_1[11] ? data_11_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_157 = addr_dec_1[12] ? data_12_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_158 = addr_dec_1[13] ? data_13_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_159 = addr_dec_1[14] ? data_14_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_160 = addr_dec_1[15] ? data_15_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_161 = _io_rdata_1_T_145 | _io_rdata_1_T_146; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_162 = _io_rdata_1_T_161 | _io_rdata_1_T_147; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_163 = _io_rdata_1_T_162 | _io_rdata_1_T_148; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_164 = _io_rdata_1_T_163 | _io_rdata_1_T_149; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_165 = _io_rdata_1_T_164 | _io_rdata_1_T_150; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_166 = _io_rdata_1_T_165 | _io_rdata_1_T_151; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_167 = _io_rdata_1_T_166 | _io_rdata_1_T_152; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_168 = _io_rdata_1_T_167 | _io_rdata_1_T_153; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_169 = _io_rdata_1_T_168 | _io_rdata_1_T_154; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_170 = _io_rdata_1_T_169 | _io_rdata_1_T_155; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_171 = _io_rdata_1_T_170 | _io_rdata_1_T_156; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_172 = _io_rdata_1_T_171 | _io_rdata_1_T_157; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_173 = _io_rdata_1_T_172 | _io_rdata_1_T_158; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_174 = _io_rdata_1_T_173 | _io_rdata_1_T_159; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_175 = _io_rdata_1_T_174 | _io_rdata_1_T_160; // @[Mux.scala 27:73]
  wire  _io_rdata_1_T_191 = addr_dec_1[15] & data_15_ftqIdx_flag; // @[Mux.scala 27:73]
  wire  _io_rdata_1_T_206 = addr_dec_1[0] & data_0_ftqIdx_flag | addr_dec_1[1] & data_1_ftqIdx_flag | addr_dec_1[2] &
    data_2_ftqIdx_flag | addr_dec_1[3] & data_3_ftqIdx_flag | addr_dec_1[4] & data_4_ftqIdx_flag | addr_dec_1[5] &
    data_5_ftqIdx_flag | addr_dec_1[6] & data_6_ftqIdx_flag | addr_dec_1[7] & data_7_ftqIdx_flag | addr_dec_1[8] &
    data_8_ftqIdx_flag | addr_dec_1[9] & data_9_ftqIdx_flag | addr_dec_1[10] & data_10_ftqIdx_flag | addr_dec_1[11] &
    data_11_ftqIdx_flag | addr_dec_1[12] & data_12_ftqIdx_flag | addr_dec_1[13] & data_13_ftqIdx_flag | addr_dec_1[14]
     & data_14_ftqIdx_flag | _io_rdata_1_T_191; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_207 = addr_dec_1[0] ? data_0_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_208 = addr_dec_1[1] ? data_1_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_209 = addr_dec_1[2] ? data_2_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_210 = addr_dec_1[3] ? data_3_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_211 = addr_dec_1[4] ? data_4_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_212 = addr_dec_1[5] ? data_5_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_213 = addr_dec_1[6] ? data_6_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_214 = addr_dec_1[7] ? data_7_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_215 = addr_dec_1[8] ? data_8_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_216 = addr_dec_1[9] ? data_9_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_217 = addr_dec_1[10] ? data_10_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_218 = addr_dec_1[11] ? data_11_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_219 = addr_dec_1[12] ? data_12_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_220 = addr_dec_1[13] ? data_13_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_221 = addr_dec_1[14] ? data_14_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_222 = addr_dec_1[15] ? data_15_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_223 = _io_rdata_1_T_207 | _io_rdata_1_T_208; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_224 = _io_rdata_1_T_223 | _io_rdata_1_T_209; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_225 = _io_rdata_1_T_224 | _io_rdata_1_T_210; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_226 = _io_rdata_1_T_225 | _io_rdata_1_T_211; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_227 = _io_rdata_1_T_226 | _io_rdata_1_T_212; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_228 = _io_rdata_1_T_227 | _io_rdata_1_T_213; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_229 = _io_rdata_1_T_228 | _io_rdata_1_T_214; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_230 = _io_rdata_1_T_229 | _io_rdata_1_T_215; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_231 = _io_rdata_1_T_230 | _io_rdata_1_T_216; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_232 = _io_rdata_1_T_231 | _io_rdata_1_T_217; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_233 = _io_rdata_1_T_232 | _io_rdata_1_T_218; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_234 = _io_rdata_1_T_233 | _io_rdata_1_T_219; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_235 = _io_rdata_1_T_234 | _io_rdata_1_T_220; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_236 = _io_rdata_1_T_235 | _io_rdata_1_T_221; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_237 = _io_rdata_1_T_236 | _io_rdata_1_T_222; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_238 = addr_dec_1[0] ? data_0_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_239 = addr_dec_1[1] ? data_1_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_240 = addr_dec_1[2] ? data_2_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_241 = addr_dec_1[3] ? data_3_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_242 = addr_dec_1[4] ? data_4_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_243 = addr_dec_1[5] ? data_5_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_244 = addr_dec_1[6] ? data_6_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_245 = addr_dec_1[7] ? data_7_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_246 = addr_dec_1[8] ? data_8_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_247 = addr_dec_1[9] ? data_9_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_248 = addr_dec_1[10] ? data_10_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_249 = addr_dec_1[11] ? data_11_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_250 = addr_dec_1[12] ? data_12_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_251 = addr_dec_1[13] ? data_13_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_252 = addr_dec_1[14] ? data_14_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_253 = addr_dec_1[15] ? data_15_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_254 = _io_rdata_1_T_238 | _io_rdata_1_T_239; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_255 = _io_rdata_1_T_254 | _io_rdata_1_T_240; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_256 = _io_rdata_1_T_255 | _io_rdata_1_T_241; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_257 = _io_rdata_1_T_256 | _io_rdata_1_T_242; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_258 = _io_rdata_1_T_257 | _io_rdata_1_T_243; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_259 = _io_rdata_1_T_258 | _io_rdata_1_T_244; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_260 = _io_rdata_1_T_259 | _io_rdata_1_T_245; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_261 = _io_rdata_1_T_260 | _io_rdata_1_T_246; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_262 = _io_rdata_1_T_261 | _io_rdata_1_T_247; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_263 = _io_rdata_1_T_262 | _io_rdata_1_T_248; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_264 = _io_rdata_1_T_263 | _io_rdata_1_T_249; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_265 = _io_rdata_1_T_264 | _io_rdata_1_T_250; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_266 = _io_rdata_1_T_265 | _io_rdata_1_T_251; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_267 = _io_rdata_1_T_266 | _io_rdata_1_T_252; // @[Mux.scala 27:73]
  wire [5:0] _io_rdata_1_T_268 = _io_rdata_1_T_267 | _io_rdata_1_T_253; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_269 = addr_dec_1[0] ? data_0_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_270 = addr_dec_1[1] ? data_1_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_271 = addr_dec_1[2] ? data_2_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_272 = addr_dec_1[3] ? data_3_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_273 = addr_dec_1[4] ? data_4_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_274 = addr_dec_1[5] ? data_5_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_275 = addr_dec_1[6] ? data_6_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_276 = addr_dec_1[7] ? data_7_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_277 = addr_dec_1[8] ? data_8_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_278 = addr_dec_1[9] ? data_9_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_279 = addr_dec_1[10] ? data_10_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_280 = addr_dec_1[11] ? data_11_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_281 = addr_dec_1[12] ? data_12_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_282 = addr_dec_1[13] ? data_13_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_283 = addr_dec_1[14] ? data_14_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_284 = addr_dec_1[15] ? data_15_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_285 = _io_rdata_1_T_269 | _io_rdata_1_T_270; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_286 = _io_rdata_1_T_285 | _io_rdata_1_T_271; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_287 = _io_rdata_1_T_286 | _io_rdata_1_T_272; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_288 = _io_rdata_1_T_287 | _io_rdata_1_T_273; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_289 = _io_rdata_1_T_288 | _io_rdata_1_T_274; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_290 = _io_rdata_1_T_289 | _io_rdata_1_T_275; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_291 = _io_rdata_1_T_290 | _io_rdata_1_T_276; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_292 = _io_rdata_1_T_291 | _io_rdata_1_T_277; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_293 = _io_rdata_1_T_292 | _io_rdata_1_T_278; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_294 = _io_rdata_1_T_293 | _io_rdata_1_T_279; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_295 = _io_rdata_1_T_294 | _io_rdata_1_T_280; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_296 = _io_rdata_1_T_295 | _io_rdata_1_T_281; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_297 = _io_rdata_1_T_296 | _io_rdata_1_T_282; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_298 = _io_rdata_1_T_297 | _io_rdata_1_T_283; // @[Mux.scala 27:73]
  wire [2:0] _io_rdata_1_T_299 = _io_rdata_1_T_298 | _io_rdata_1_T_284; // @[Mux.scala 27:73]
  wire  _io_rdata_1_T_315 = addr_dec_1[15] & data_15_wflags; // @[Mux.scala 27:73]
  wire  _io_rdata_1_T_330 = addr_dec_1[0] & data_0_wflags | addr_dec_1[1] & data_1_wflags | addr_dec_1[2] &
    data_2_wflags | addr_dec_1[3] & data_3_wflags | addr_dec_1[4] & data_4_wflags | addr_dec_1[5] & data_5_wflags |
    addr_dec_1[6] & data_6_wflags | addr_dec_1[7] & data_7_wflags | addr_dec_1[8] & data_8_wflags | addr_dec_1[9] &
    data_9_wflags | addr_dec_1[10] & data_10_wflags | addr_dec_1[11] & data_11_wflags | addr_dec_1[12] & data_12_wflags
     | addr_dec_1[13] & data_13_wflags | addr_dec_1[14] & data_14_wflags | _io_rdata_1_T_315; // @[Mux.scala 27:73]
  wire  _io_rdata_1_T_346 = addr_dec_1[15] & data_15_fpWen; // @[Mux.scala 27:73]
  wire  _io_rdata_1_T_361 = addr_dec_1[0] & data_0_fpWen | addr_dec_1[1] & data_1_fpWen | addr_dec_1[2] & data_2_fpWen
     | addr_dec_1[3] & data_3_fpWen | addr_dec_1[4] & data_4_fpWen | addr_dec_1[5] & data_5_fpWen | addr_dec_1[6] &
    data_6_fpWen | addr_dec_1[7] & data_7_fpWen | addr_dec_1[8] & data_8_fpWen | addr_dec_1[9] & data_9_fpWen |
    addr_dec_1[10] & data_10_fpWen | addr_dec_1[11] & data_11_fpWen | addr_dec_1[12] & data_12_fpWen | addr_dec_1[13] &
    data_13_fpWen | addr_dec_1[14] & data_14_fpWen | _io_rdata_1_T_346; // @[Mux.scala 27:73]
  wire  _io_rdata_1_T_377 = addr_dec_1[15] & data_15_rfWen; // @[Mux.scala 27:73]
  wire  _io_rdata_1_T_392 = addr_dec_1[0] & data_0_rfWen | addr_dec_1[1] & data_1_rfWen | addr_dec_1[2] & data_2_rfWen
     | addr_dec_1[3] & data_3_rfWen | addr_dec_1[4] & data_4_rfWen | addr_dec_1[5] & data_5_rfWen | addr_dec_1[6] &
    data_6_rfWen | addr_dec_1[7] & data_7_rfWen | addr_dec_1[8] & data_8_rfWen | addr_dec_1[9] & data_9_rfWen |
    addr_dec_1[10] & data_10_rfWen | addr_dec_1[11] & data_11_rfWen | addr_dec_1[12] & data_12_rfWen | addr_dec_1[13] &
    data_13_rfWen | addr_dec_1[14] & data_14_rfWen | _io_rdata_1_T_377; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_1_T_393 = addr_dec_1[0] ? data_0_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_1_T_394 = addr_dec_1[1] ? data_1_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_1_T_395 = addr_dec_1[2] ? data_2_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_1_T_396 = addr_dec_1[3] ? data_3_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_1_T_397 = addr_dec_1[4] ? data_4_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_1_T_398 = addr_dec_1[5] ? data_5_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_1_T_399 = addr_dec_1[6] ? data_6_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_1_T_400 = addr_dec_1[7] ? data_7_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_1_T_401 = addr_dec_1[8] ? data_8_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_1_T_402 = addr_dec_1[9] ? data_9_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_1_T_403 = addr_dec_1[10] ? data_10_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_1_T_404 = addr_dec_1[11] ? data_11_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_1_T_405 = addr_dec_1[12] ? data_12_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_1_T_406 = addr_dec_1[13] ? data_13_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_1_T_407 = addr_dec_1[14] ? data_14_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_1_T_408 = addr_dec_1[15] ? data_15_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_1_T_409 = _io_rdata_1_T_393 | _io_rdata_1_T_394; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_1_T_410 = _io_rdata_1_T_409 | _io_rdata_1_T_395; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_1_T_411 = _io_rdata_1_T_410 | _io_rdata_1_T_396; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_1_T_412 = _io_rdata_1_T_411 | _io_rdata_1_T_397; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_1_T_413 = _io_rdata_1_T_412 | _io_rdata_1_T_398; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_1_T_414 = _io_rdata_1_T_413 | _io_rdata_1_T_399; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_1_T_415 = _io_rdata_1_T_414 | _io_rdata_1_T_400; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_1_T_416 = _io_rdata_1_T_415 | _io_rdata_1_T_401; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_1_T_417 = _io_rdata_1_T_416 | _io_rdata_1_T_402; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_1_T_418 = _io_rdata_1_T_417 | _io_rdata_1_T_403; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_1_T_419 = _io_rdata_1_T_418 | _io_rdata_1_T_404; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_1_T_420 = _io_rdata_1_T_419 | _io_rdata_1_T_405; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_1_T_421 = _io_rdata_1_T_420 | _io_rdata_1_T_406; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_1_T_422 = _io_rdata_1_T_421 | _io_rdata_1_T_407; // @[Mux.scala 27:73]
  wire [4:0] _io_rdata_1_T_423 = _io_rdata_1_T_422 | _io_rdata_1_T_408; // @[Mux.scala 27:73]
  wire [15:0] waddr_dec_0 = 16'h1 << io_waddr_0; // @[OneHot.scala 57:35]
  wire [15:0] waddr_dec_1 = 16'h1 << io_waddr_1; // @[OneHot.scala 57:35]
  wire  write_wen_0 = io_wen_0 & waddr_dec_0[0]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1 = io_wen_1 & waddr_dec_1[0]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_4 = {write_wen_1,write_wen_0}; // @[DataModuleTemplate.scala 189:30]
  wire  _data_0_T_5 = write_wen_0 & io_wdata_0_isMove | write_wen_1 & io_wdata_1_isMove; // @[Mux.scala 27:73]
  wire [2:0] _data_0_T_6 = write_wen_0 ? io_wdata_0_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_0_T_7 = write_wen_1 ? io_wdata_1_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_0_T_8 = _data_0_T_6 | _data_0_T_7; // @[Mux.scala 27:73]
  wire [2:0] _data_0_T_9 = write_wen_0 ? io_wdata_0_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_0_T_10 = write_wen_1 ? io_wdata_1_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_0_T_11 = _data_0_T_9 | _data_0_T_10; // @[Mux.scala 27:73]
  wire  _data_0_T_14 = write_wen_0 & io_wdata_0_ftqIdx_flag | write_wen_1 & io_wdata_1_ftqIdx_flag; // @[Mux.scala 27:73]
  wire [5:0] _data_0_T_15 = write_wen_0 ? io_wdata_0_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _data_0_T_16 = write_wen_1 ? io_wdata_1_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _data_0_T_17 = _data_0_T_15 | _data_0_T_16; // @[Mux.scala 27:73]
  wire [5:0] _data_0_T_18 = write_wen_0 ? io_wdata_0_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _data_0_T_19 = write_wen_1 ? io_wdata_1_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _data_0_T_20 = _data_0_T_18 | _data_0_T_19; // @[Mux.scala 27:73]
  wire [2:0] _data_0_T_21 = write_wen_0 ? io_wdata_0_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_0_T_22 = write_wen_1 ? io_wdata_1_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_0_T_23 = _data_0_T_21 | _data_0_T_22; // @[Mux.scala 27:73]
  wire  _data_0_T_26 = write_wen_0 & io_wdata_0_wflags | write_wen_1 & io_wdata_1_wflags; // @[Mux.scala 27:73]
  wire  _data_0_T_29 = write_wen_0 & io_wdata_0_fpWen | write_wen_1 & io_wdata_1_fpWen; // @[Mux.scala 27:73]
  wire  _data_0_T_32 = write_wen_0 & io_wdata_0_rfWen | write_wen_1 & io_wdata_1_rfWen; // @[Mux.scala 27:73]
  wire [4:0] _data_0_T_33 = write_wen_0 ? io_wdata_0_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _data_0_T_34 = write_wen_1 ? io_wdata_1_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _data_0_T_35 = _data_0_T_33 | _data_0_T_34; // @[Mux.scala 27:73]
  wire  write_wen_0_1 = io_wen_0 & waddr_dec_0[1]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_1 = io_wen_1 & waddr_dec_1[1]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_6 = {write_wen_1_1,write_wen_0_1}; // @[DataModuleTemplate.scala 189:30]
  wire  _data_1_T_5 = write_wen_0_1 & io_wdata_0_isMove | write_wen_1_1 & io_wdata_1_isMove; // @[Mux.scala 27:73]
  wire [2:0] _data_1_T_6 = write_wen_0_1 ? io_wdata_0_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_1_T_7 = write_wen_1_1 ? io_wdata_1_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_1_T_8 = _data_1_T_6 | _data_1_T_7; // @[Mux.scala 27:73]
  wire [2:0] _data_1_T_9 = write_wen_0_1 ? io_wdata_0_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_1_T_10 = write_wen_1_1 ? io_wdata_1_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_1_T_11 = _data_1_T_9 | _data_1_T_10; // @[Mux.scala 27:73]
  wire  _data_1_T_14 = write_wen_0_1 & io_wdata_0_ftqIdx_flag | write_wen_1_1 & io_wdata_1_ftqIdx_flag; // @[Mux.scala 27:73]
  wire [5:0] _data_1_T_15 = write_wen_0_1 ? io_wdata_0_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _data_1_T_16 = write_wen_1_1 ? io_wdata_1_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _data_1_T_17 = _data_1_T_15 | _data_1_T_16; // @[Mux.scala 27:73]
  wire [5:0] _data_1_T_18 = write_wen_0_1 ? io_wdata_0_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _data_1_T_19 = write_wen_1_1 ? io_wdata_1_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _data_1_T_20 = _data_1_T_18 | _data_1_T_19; // @[Mux.scala 27:73]
  wire [2:0] _data_1_T_21 = write_wen_0_1 ? io_wdata_0_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_1_T_22 = write_wen_1_1 ? io_wdata_1_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_1_T_23 = _data_1_T_21 | _data_1_T_22; // @[Mux.scala 27:73]
  wire  _data_1_T_26 = write_wen_0_1 & io_wdata_0_wflags | write_wen_1_1 & io_wdata_1_wflags; // @[Mux.scala 27:73]
  wire  _data_1_T_29 = write_wen_0_1 & io_wdata_0_fpWen | write_wen_1_1 & io_wdata_1_fpWen; // @[Mux.scala 27:73]
  wire  _data_1_T_32 = write_wen_0_1 & io_wdata_0_rfWen | write_wen_1_1 & io_wdata_1_rfWen; // @[Mux.scala 27:73]
  wire [4:0] _data_1_T_33 = write_wen_0_1 ? io_wdata_0_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _data_1_T_34 = write_wen_1_1 ? io_wdata_1_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _data_1_T_35 = _data_1_T_33 | _data_1_T_34; // @[Mux.scala 27:73]
  wire  write_wen_0_2 = io_wen_0 & waddr_dec_0[2]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_2 = io_wen_1 & waddr_dec_1[2]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_8 = {write_wen_1_2,write_wen_0_2}; // @[DataModuleTemplate.scala 189:30]
  wire  _data_2_T_5 = write_wen_0_2 & io_wdata_0_isMove | write_wen_1_2 & io_wdata_1_isMove; // @[Mux.scala 27:73]
  wire [2:0] _data_2_T_6 = write_wen_0_2 ? io_wdata_0_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_2_T_7 = write_wen_1_2 ? io_wdata_1_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_2_T_8 = _data_2_T_6 | _data_2_T_7; // @[Mux.scala 27:73]
  wire [2:0] _data_2_T_9 = write_wen_0_2 ? io_wdata_0_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_2_T_10 = write_wen_1_2 ? io_wdata_1_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_2_T_11 = _data_2_T_9 | _data_2_T_10; // @[Mux.scala 27:73]
  wire  _data_2_T_14 = write_wen_0_2 & io_wdata_0_ftqIdx_flag | write_wen_1_2 & io_wdata_1_ftqIdx_flag; // @[Mux.scala 27:73]
  wire [5:0] _data_2_T_15 = write_wen_0_2 ? io_wdata_0_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _data_2_T_16 = write_wen_1_2 ? io_wdata_1_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _data_2_T_17 = _data_2_T_15 | _data_2_T_16; // @[Mux.scala 27:73]
  wire [5:0] _data_2_T_18 = write_wen_0_2 ? io_wdata_0_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _data_2_T_19 = write_wen_1_2 ? io_wdata_1_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _data_2_T_20 = _data_2_T_18 | _data_2_T_19; // @[Mux.scala 27:73]
  wire [2:0] _data_2_T_21 = write_wen_0_2 ? io_wdata_0_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_2_T_22 = write_wen_1_2 ? io_wdata_1_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_2_T_23 = _data_2_T_21 | _data_2_T_22; // @[Mux.scala 27:73]
  wire  _data_2_T_26 = write_wen_0_2 & io_wdata_0_wflags | write_wen_1_2 & io_wdata_1_wflags; // @[Mux.scala 27:73]
  wire  _data_2_T_29 = write_wen_0_2 & io_wdata_0_fpWen | write_wen_1_2 & io_wdata_1_fpWen; // @[Mux.scala 27:73]
  wire  _data_2_T_32 = write_wen_0_2 & io_wdata_0_rfWen | write_wen_1_2 & io_wdata_1_rfWen; // @[Mux.scala 27:73]
  wire [4:0] _data_2_T_33 = write_wen_0_2 ? io_wdata_0_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _data_2_T_34 = write_wen_1_2 ? io_wdata_1_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _data_2_T_35 = _data_2_T_33 | _data_2_T_34; // @[Mux.scala 27:73]
  wire  write_wen_0_3 = io_wen_0 & waddr_dec_0[3]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_3 = io_wen_1 & waddr_dec_1[3]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_10 = {write_wen_1_3,write_wen_0_3}; // @[DataModuleTemplate.scala 189:30]
  wire  _data_3_T_5 = write_wen_0_3 & io_wdata_0_isMove | write_wen_1_3 & io_wdata_1_isMove; // @[Mux.scala 27:73]
  wire [2:0] _data_3_T_6 = write_wen_0_3 ? io_wdata_0_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_3_T_7 = write_wen_1_3 ? io_wdata_1_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_3_T_8 = _data_3_T_6 | _data_3_T_7; // @[Mux.scala 27:73]
  wire [2:0] _data_3_T_9 = write_wen_0_3 ? io_wdata_0_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_3_T_10 = write_wen_1_3 ? io_wdata_1_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_3_T_11 = _data_3_T_9 | _data_3_T_10; // @[Mux.scala 27:73]
  wire  _data_3_T_14 = write_wen_0_3 & io_wdata_0_ftqIdx_flag | write_wen_1_3 & io_wdata_1_ftqIdx_flag; // @[Mux.scala 27:73]
  wire [5:0] _data_3_T_15 = write_wen_0_3 ? io_wdata_0_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _data_3_T_16 = write_wen_1_3 ? io_wdata_1_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _data_3_T_17 = _data_3_T_15 | _data_3_T_16; // @[Mux.scala 27:73]
  wire [5:0] _data_3_T_18 = write_wen_0_3 ? io_wdata_0_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _data_3_T_19 = write_wen_1_3 ? io_wdata_1_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _data_3_T_20 = _data_3_T_18 | _data_3_T_19; // @[Mux.scala 27:73]
  wire [2:0] _data_3_T_21 = write_wen_0_3 ? io_wdata_0_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_3_T_22 = write_wen_1_3 ? io_wdata_1_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_3_T_23 = _data_3_T_21 | _data_3_T_22; // @[Mux.scala 27:73]
  wire  _data_3_T_26 = write_wen_0_3 & io_wdata_0_wflags | write_wen_1_3 & io_wdata_1_wflags; // @[Mux.scala 27:73]
  wire  _data_3_T_29 = write_wen_0_3 & io_wdata_0_fpWen | write_wen_1_3 & io_wdata_1_fpWen; // @[Mux.scala 27:73]
  wire  _data_3_T_32 = write_wen_0_3 & io_wdata_0_rfWen | write_wen_1_3 & io_wdata_1_rfWen; // @[Mux.scala 27:73]
  wire [4:0] _data_3_T_33 = write_wen_0_3 ? io_wdata_0_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _data_3_T_34 = write_wen_1_3 ? io_wdata_1_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _data_3_T_35 = _data_3_T_33 | _data_3_T_34; // @[Mux.scala 27:73]
  wire  write_wen_0_4 = io_wen_0 & waddr_dec_0[4]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_4 = io_wen_1 & waddr_dec_1[4]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_12 = {write_wen_1_4,write_wen_0_4}; // @[DataModuleTemplate.scala 189:30]
  wire  _data_4_T_5 = write_wen_0_4 & io_wdata_0_isMove | write_wen_1_4 & io_wdata_1_isMove; // @[Mux.scala 27:73]
  wire [2:0] _data_4_T_6 = write_wen_0_4 ? io_wdata_0_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_4_T_7 = write_wen_1_4 ? io_wdata_1_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_4_T_8 = _data_4_T_6 | _data_4_T_7; // @[Mux.scala 27:73]
  wire [2:0] _data_4_T_9 = write_wen_0_4 ? io_wdata_0_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_4_T_10 = write_wen_1_4 ? io_wdata_1_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_4_T_11 = _data_4_T_9 | _data_4_T_10; // @[Mux.scala 27:73]
  wire  _data_4_T_14 = write_wen_0_4 & io_wdata_0_ftqIdx_flag | write_wen_1_4 & io_wdata_1_ftqIdx_flag; // @[Mux.scala 27:73]
  wire [5:0] _data_4_T_15 = write_wen_0_4 ? io_wdata_0_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _data_4_T_16 = write_wen_1_4 ? io_wdata_1_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _data_4_T_17 = _data_4_T_15 | _data_4_T_16; // @[Mux.scala 27:73]
  wire [5:0] _data_4_T_18 = write_wen_0_4 ? io_wdata_0_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _data_4_T_19 = write_wen_1_4 ? io_wdata_1_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _data_4_T_20 = _data_4_T_18 | _data_4_T_19; // @[Mux.scala 27:73]
  wire [2:0] _data_4_T_21 = write_wen_0_4 ? io_wdata_0_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_4_T_22 = write_wen_1_4 ? io_wdata_1_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_4_T_23 = _data_4_T_21 | _data_4_T_22; // @[Mux.scala 27:73]
  wire  _data_4_T_26 = write_wen_0_4 & io_wdata_0_wflags | write_wen_1_4 & io_wdata_1_wflags; // @[Mux.scala 27:73]
  wire  _data_4_T_29 = write_wen_0_4 & io_wdata_0_fpWen | write_wen_1_4 & io_wdata_1_fpWen; // @[Mux.scala 27:73]
  wire  _data_4_T_32 = write_wen_0_4 & io_wdata_0_rfWen | write_wen_1_4 & io_wdata_1_rfWen; // @[Mux.scala 27:73]
  wire [4:0] _data_4_T_33 = write_wen_0_4 ? io_wdata_0_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _data_4_T_34 = write_wen_1_4 ? io_wdata_1_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _data_4_T_35 = _data_4_T_33 | _data_4_T_34; // @[Mux.scala 27:73]
  wire  write_wen_0_5 = io_wen_0 & waddr_dec_0[5]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_5 = io_wen_1 & waddr_dec_1[5]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_14 = {write_wen_1_5,write_wen_0_5}; // @[DataModuleTemplate.scala 189:30]
  wire  _data_5_T_5 = write_wen_0_5 & io_wdata_0_isMove | write_wen_1_5 & io_wdata_1_isMove; // @[Mux.scala 27:73]
  wire [2:0] _data_5_T_6 = write_wen_0_5 ? io_wdata_0_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_5_T_7 = write_wen_1_5 ? io_wdata_1_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_5_T_8 = _data_5_T_6 | _data_5_T_7; // @[Mux.scala 27:73]
  wire [2:0] _data_5_T_9 = write_wen_0_5 ? io_wdata_0_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_5_T_10 = write_wen_1_5 ? io_wdata_1_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_5_T_11 = _data_5_T_9 | _data_5_T_10; // @[Mux.scala 27:73]
  wire  _data_5_T_14 = write_wen_0_5 & io_wdata_0_ftqIdx_flag | write_wen_1_5 & io_wdata_1_ftqIdx_flag; // @[Mux.scala 27:73]
  wire [5:0] _data_5_T_15 = write_wen_0_5 ? io_wdata_0_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _data_5_T_16 = write_wen_1_5 ? io_wdata_1_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _data_5_T_17 = _data_5_T_15 | _data_5_T_16; // @[Mux.scala 27:73]
  wire [5:0] _data_5_T_18 = write_wen_0_5 ? io_wdata_0_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _data_5_T_19 = write_wen_1_5 ? io_wdata_1_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _data_5_T_20 = _data_5_T_18 | _data_5_T_19; // @[Mux.scala 27:73]
  wire [2:0] _data_5_T_21 = write_wen_0_5 ? io_wdata_0_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_5_T_22 = write_wen_1_5 ? io_wdata_1_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_5_T_23 = _data_5_T_21 | _data_5_T_22; // @[Mux.scala 27:73]
  wire  _data_5_T_26 = write_wen_0_5 & io_wdata_0_wflags | write_wen_1_5 & io_wdata_1_wflags; // @[Mux.scala 27:73]
  wire  _data_5_T_29 = write_wen_0_5 & io_wdata_0_fpWen | write_wen_1_5 & io_wdata_1_fpWen; // @[Mux.scala 27:73]
  wire  _data_5_T_32 = write_wen_0_5 & io_wdata_0_rfWen | write_wen_1_5 & io_wdata_1_rfWen; // @[Mux.scala 27:73]
  wire [4:0] _data_5_T_33 = write_wen_0_5 ? io_wdata_0_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _data_5_T_34 = write_wen_1_5 ? io_wdata_1_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _data_5_T_35 = _data_5_T_33 | _data_5_T_34; // @[Mux.scala 27:73]
  wire  write_wen_0_6 = io_wen_0 & waddr_dec_0[6]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_6 = io_wen_1 & waddr_dec_1[6]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_16 = {write_wen_1_6,write_wen_0_6}; // @[DataModuleTemplate.scala 189:30]
  wire  _data_6_T_5 = write_wen_0_6 & io_wdata_0_isMove | write_wen_1_6 & io_wdata_1_isMove; // @[Mux.scala 27:73]
  wire [2:0] _data_6_T_6 = write_wen_0_6 ? io_wdata_0_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_6_T_7 = write_wen_1_6 ? io_wdata_1_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_6_T_8 = _data_6_T_6 | _data_6_T_7; // @[Mux.scala 27:73]
  wire [2:0] _data_6_T_9 = write_wen_0_6 ? io_wdata_0_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_6_T_10 = write_wen_1_6 ? io_wdata_1_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_6_T_11 = _data_6_T_9 | _data_6_T_10; // @[Mux.scala 27:73]
  wire  _data_6_T_14 = write_wen_0_6 & io_wdata_0_ftqIdx_flag | write_wen_1_6 & io_wdata_1_ftqIdx_flag; // @[Mux.scala 27:73]
  wire [5:0] _data_6_T_15 = write_wen_0_6 ? io_wdata_0_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _data_6_T_16 = write_wen_1_6 ? io_wdata_1_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _data_6_T_17 = _data_6_T_15 | _data_6_T_16; // @[Mux.scala 27:73]
  wire [5:0] _data_6_T_18 = write_wen_0_6 ? io_wdata_0_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _data_6_T_19 = write_wen_1_6 ? io_wdata_1_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _data_6_T_20 = _data_6_T_18 | _data_6_T_19; // @[Mux.scala 27:73]
  wire [2:0] _data_6_T_21 = write_wen_0_6 ? io_wdata_0_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_6_T_22 = write_wen_1_6 ? io_wdata_1_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_6_T_23 = _data_6_T_21 | _data_6_T_22; // @[Mux.scala 27:73]
  wire  _data_6_T_26 = write_wen_0_6 & io_wdata_0_wflags | write_wen_1_6 & io_wdata_1_wflags; // @[Mux.scala 27:73]
  wire  _data_6_T_29 = write_wen_0_6 & io_wdata_0_fpWen | write_wen_1_6 & io_wdata_1_fpWen; // @[Mux.scala 27:73]
  wire  _data_6_T_32 = write_wen_0_6 & io_wdata_0_rfWen | write_wen_1_6 & io_wdata_1_rfWen; // @[Mux.scala 27:73]
  wire [4:0] _data_6_T_33 = write_wen_0_6 ? io_wdata_0_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _data_6_T_34 = write_wen_1_6 ? io_wdata_1_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _data_6_T_35 = _data_6_T_33 | _data_6_T_34; // @[Mux.scala 27:73]
  wire  write_wen_0_7 = io_wen_0 & waddr_dec_0[7]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_7 = io_wen_1 & waddr_dec_1[7]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_18 = {write_wen_1_7,write_wen_0_7}; // @[DataModuleTemplate.scala 189:30]
  wire  _data_7_T_5 = write_wen_0_7 & io_wdata_0_isMove | write_wen_1_7 & io_wdata_1_isMove; // @[Mux.scala 27:73]
  wire [2:0] _data_7_T_6 = write_wen_0_7 ? io_wdata_0_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_7_T_7 = write_wen_1_7 ? io_wdata_1_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_7_T_8 = _data_7_T_6 | _data_7_T_7; // @[Mux.scala 27:73]
  wire [2:0] _data_7_T_9 = write_wen_0_7 ? io_wdata_0_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_7_T_10 = write_wen_1_7 ? io_wdata_1_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_7_T_11 = _data_7_T_9 | _data_7_T_10; // @[Mux.scala 27:73]
  wire  _data_7_T_14 = write_wen_0_7 & io_wdata_0_ftqIdx_flag | write_wen_1_7 & io_wdata_1_ftqIdx_flag; // @[Mux.scala 27:73]
  wire [5:0] _data_7_T_15 = write_wen_0_7 ? io_wdata_0_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _data_7_T_16 = write_wen_1_7 ? io_wdata_1_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _data_7_T_17 = _data_7_T_15 | _data_7_T_16; // @[Mux.scala 27:73]
  wire [5:0] _data_7_T_18 = write_wen_0_7 ? io_wdata_0_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _data_7_T_19 = write_wen_1_7 ? io_wdata_1_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _data_7_T_20 = _data_7_T_18 | _data_7_T_19; // @[Mux.scala 27:73]
  wire [2:0] _data_7_T_21 = write_wen_0_7 ? io_wdata_0_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_7_T_22 = write_wen_1_7 ? io_wdata_1_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_7_T_23 = _data_7_T_21 | _data_7_T_22; // @[Mux.scala 27:73]
  wire  _data_7_T_26 = write_wen_0_7 & io_wdata_0_wflags | write_wen_1_7 & io_wdata_1_wflags; // @[Mux.scala 27:73]
  wire  _data_7_T_29 = write_wen_0_7 & io_wdata_0_fpWen | write_wen_1_7 & io_wdata_1_fpWen; // @[Mux.scala 27:73]
  wire  _data_7_T_32 = write_wen_0_7 & io_wdata_0_rfWen | write_wen_1_7 & io_wdata_1_rfWen; // @[Mux.scala 27:73]
  wire [4:0] _data_7_T_33 = write_wen_0_7 ? io_wdata_0_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _data_7_T_34 = write_wen_1_7 ? io_wdata_1_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _data_7_T_35 = _data_7_T_33 | _data_7_T_34; // @[Mux.scala 27:73]
  wire  write_wen_0_8 = io_wen_0 & waddr_dec_0[8]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_8 = io_wen_1 & waddr_dec_1[8]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_20 = {write_wen_1_8,write_wen_0_8}; // @[DataModuleTemplate.scala 189:30]
  wire  _data_8_T_5 = write_wen_0_8 & io_wdata_0_isMove | write_wen_1_8 & io_wdata_1_isMove; // @[Mux.scala 27:73]
  wire [2:0] _data_8_T_6 = write_wen_0_8 ? io_wdata_0_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_8_T_7 = write_wen_1_8 ? io_wdata_1_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_8_T_8 = _data_8_T_6 | _data_8_T_7; // @[Mux.scala 27:73]
  wire [2:0] _data_8_T_9 = write_wen_0_8 ? io_wdata_0_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_8_T_10 = write_wen_1_8 ? io_wdata_1_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_8_T_11 = _data_8_T_9 | _data_8_T_10; // @[Mux.scala 27:73]
  wire  _data_8_T_14 = write_wen_0_8 & io_wdata_0_ftqIdx_flag | write_wen_1_8 & io_wdata_1_ftqIdx_flag; // @[Mux.scala 27:73]
  wire [5:0] _data_8_T_15 = write_wen_0_8 ? io_wdata_0_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _data_8_T_16 = write_wen_1_8 ? io_wdata_1_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _data_8_T_17 = _data_8_T_15 | _data_8_T_16; // @[Mux.scala 27:73]
  wire [5:0] _data_8_T_18 = write_wen_0_8 ? io_wdata_0_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _data_8_T_19 = write_wen_1_8 ? io_wdata_1_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _data_8_T_20 = _data_8_T_18 | _data_8_T_19; // @[Mux.scala 27:73]
  wire [2:0] _data_8_T_21 = write_wen_0_8 ? io_wdata_0_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_8_T_22 = write_wen_1_8 ? io_wdata_1_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_8_T_23 = _data_8_T_21 | _data_8_T_22; // @[Mux.scala 27:73]
  wire  _data_8_T_26 = write_wen_0_8 & io_wdata_0_wflags | write_wen_1_8 & io_wdata_1_wflags; // @[Mux.scala 27:73]
  wire  _data_8_T_29 = write_wen_0_8 & io_wdata_0_fpWen | write_wen_1_8 & io_wdata_1_fpWen; // @[Mux.scala 27:73]
  wire  _data_8_T_32 = write_wen_0_8 & io_wdata_0_rfWen | write_wen_1_8 & io_wdata_1_rfWen; // @[Mux.scala 27:73]
  wire [4:0] _data_8_T_33 = write_wen_0_8 ? io_wdata_0_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _data_8_T_34 = write_wen_1_8 ? io_wdata_1_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _data_8_T_35 = _data_8_T_33 | _data_8_T_34; // @[Mux.scala 27:73]
  wire  write_wen_0_9 = io_wen_0 & waddr_dec_0[9]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_9 = io_wen_1 & waddr_dec_1[9]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_22 = {write_wen_1_9,write_wen_0_9}; // @[DataModuleTemplate.scala 189:30]
  wire  _data_9_T_5 = write_wen_0_9 & io_wdata_0_isMove | write_wen_1_9 & io_wdata_1_isMove; // @[Mux.scala 27:73]
  wire [2:0] _data_9_T_6 = write_wen_0_9 ? io_wdata_0_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_9_T_7 = write_wen_1_9 ? io_wdata_1_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_9_T_8 = _data_9_T_6 | _data_9_T_7; // @[Mux.scala 27:73]
  wire [2:0] _data_9_T_9 = write_wen_0_9 ? io_wdata_0_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_9_T_10 = write_wen_1_9 ? io_wdata_1_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_9_T_11 = _data_9_T_9 | _data_9_T_10; // @[Mux.scala 27:73]
  wire  _data_9_T_14 = write_wen_0_9 & io_wdata_0_ftqIdx_flag | write_wen_1_9 & io_wdata_1_ftqIdx_flag; // @[Mux.scala 27:73]
  wire [5:0] _data_9_T_15 = write_wen_0_9 ? io_wdata_0_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _data_9_T_16 = write_wen_1_9 ? io_wdata_1_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _data_9_T_17 = _data_9_T_15 | _data_9_T_16; // @[Mux.scala 27:73]
  wire [5:0] _data_9_T_18 = write_wen_0_9 ? io_wdata_0_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _data_9_T_19 = write_wen_1_9 ? io_wdata_1_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _data_9_T_20 = _data_9_T_18 | _data_9_T_19; // @[Mux.scala 27:73]
  wire [2:0] _data_9_T_21 = write_wen_0_9 ? io_wdata_0_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_9_T_22 = write_wen_1_9 ? io_wdata_1_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_9_T_23 = _data_9_T_21 | _data_9_T_22; // @[Mux.scala 27:73]
  wire  _data_9_T_26 = write_wen_0_9 & io_wdata_0_wflags | write_wen_1_9 & io_wdata_1_wflags; // @[Mux.scala 27:73]
  wire  _data_9_T_29 = write_wen_0_9 & io_wdata_0_fpWen | write_wen_1_9 & io_wdata_1_fpWen; // @[Mux.scala 27:73]
  wire  _data_9_T_32 = write_wen_0_9 & io_wdata_0_rfWen | write_wen_1_9 & io_wdata_1_rfWen; // @[Mux.scala 27:73]
  wire [4:0] _data_9_T_33 = write_wen_0_9 ? io_wdata_0_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _data_9_T_34 = write_wen_1_9 ? io_wdata_1_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _data_9_T_35 = _data_9_T_33 | _data_9_T_34; // @[Mux.scala 27:73]
  wire  write_wen_0_10 = io_wen_0 & waddr_dec_0[10]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_10 = io_wen_1 & waddr_dec_1[10]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_24 = {write_wen_1_10,write_wen_0_10}; // @[DataModuleTemplate.scala 189:30]
  wire  _data_10_T_5 = write_wen_0_10 & io_wdata_0_isMove | write_wen_1_10 & io_wdata_1_isMove; // @[Mux.scala 27:73]
  wire [2:0] _data_10_T_6 = write_wen_0_10 ? io_wdata_0_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_10_T_7 = write_wen_1_10 ? io_wdata_1_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_10_T_8 = _data_10_T_6 | _data_10_T_7; // @[Mux.scala 27:73]
  wire [2:0] _data_10_T_9 = write_wen_0_10 ? io_wdata_0_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_10_T_10 = write_wen_1_10 ? io_wdata_1_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_10_T_11 = _data_10_T_9 | _data_10_T_10; // @[Mux.scala 27:73]
  wire  _data_10_T_14 = write_wen_0_10 & io_wdata_0_ftqIdx_flag | write_wen_1_10 & io_wdata_1_ftqIdx_flag; // @[Mux.scala 27:73]
  wire [5:0] _data_10_T_15 = write_wen_0_10 ? io_wdata_0_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _data_10_T_16 = write_wen_1_10 ? io_wdata_1_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _data_10_T_17 = _data_10_T_15 | _data_10_T_16; // @[Mux.scala 27:73]
  wire [5:0] _data_10_T_18 = write_wen_0_10 ? io_wdata_0_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _data_10_T_19 = write_wen_1_10 ? io_wdata_1_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _data_10_T_20 = _data_10_T_18 | _data_10_T_19; // @[Mux.scala 27:73]
  wire [2:0] _data_10_T_21 = write_wen_0_10 ? io_wdata_0_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_10_T_22 = write_wen_1_10 ? io_wdata_1_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_10_T_23 = _data_10_T_21 | _data_10_T_22; // @[Mux.scala 27:73]
  wire  _data_10_T_26 = write_wen_0_10 & io_wdata_0_wflags | write_wen_1_10 & io_wdata_1_wflags; // @[Mux.scala 27:73]
  wire  _data_10_T_29 = write_wen_0_10 & io_wdata_0_fpWen | write_wen_1_10 & io_wdata_1_fpWen; // @[Mux.scala 27:73]
  wire  _data_10_T_32 = write_wen_0_10 & io_wdata_0_rfWen | write_wen_1_10 & io_wdata_1_rfWen; // @[Mux.scala 27:73]
  wire [4:0] _data_10_T_33 = write_wen_0_10 ? io_wdata_0_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _data_10_T_34 = write_wen_1_10 ? io_wdata_1_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _data_10_T_35 = _data_10_T_33 | _data_10_T_34; // @[Mux.scala 27:73]
  wire  write_wen_0_11 = io_wen_0 & waddr_dec_0[11]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_11 = io_wen_1 & waddr_dec_1[11]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_26 = {write_wen_1_11,write_wen_0_11}; // @[DataModuleTemplate.scala 189:30]
  wire  _data_11_T_5 = write_wen_0_11 & io_wdata_0_isMove | write_wen_1_11 & io_wdata_1_isMove; // @[Mux.scala 27:73]
  wire [2:0] _data_11_T_6 = write_wen_0_11 ? io_wdata_0_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_11_T_7 = write_wen_1_11 ? io_wdata_1_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_11_T_8 = _data_11_T_6 | _data_11_T_7; // @[Mux.scala 27:73]
  wire [2:0] _data_11_T_9 = write_wen_0_11 ? io_wdata_0_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_11_T_10 = write_wen_1_11 ? io_wdata_1_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_11_T_11 = _data_11_T_9 | _data_11_T_10; // @[Mux.scala 27:73]
  wire  _data_11_T_14 = write_wen_0_11 & io_wdata_0_ftqIdx_flag | write_wen_1_11 & io_wdata_1_ftqIdx_flag; // @[Mux.scala 27:73]
  wire [5:0] _data_11_T_15 = write_wen_0_11 ? io_wdata_0_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _data_11_T_16 = write_wen_1_11 ? io_wdata_1_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _data_11_T_17 = _data_11_T_15 | _data_11_T_16; // @[Mux.scala 27:73]
  wire [5:0] _data_11_T_18 = write_wen_0_11 ? io_wdata_0_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _data_11_T_19 = write_wen_1_11 ? io_wdata_1_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _data_11_T_20 = _data_11_T_18 | _data_11_T_19; // @[Mux.scala 27:73]
  wire [2:0] _data_11_T_21 = write_wen_0_11 ? io_wdata_0_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_11_T_22 = write_wen_1_11 ? io_wdata_1_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_11_T_23 = _data_11_T_21 | _data_11_T_22; // @[Mux.scala 27:73]
  wire  _data_11_T_26 = write_wen_0_11 & io_wdata_0_wflags | write_wen_1_11 & io_wdata_1_wflags; // @[Mux.scala 27:73]
  wire  _data_11_T_29 = write_wen_0_11 & io_wdata_0_fpWen | write_wen_1_11 & io_wdata_1_fpWen; // @[Mux.scala 27:73]
  wire  _data_11_T_32 = write_wen_0_11 & io_wdata_0_rfWen | write_wen_1_11 & io_wdata_1_rfWen; // @[Mux.scala 27:73]
  wire [4:0] _data_11_T_33 = write_wen_0_11 ? io_wdata_0_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _data_11_T_34 = write_wen_1_11 ? io_wdata_1_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _data_11_T_35 = _data_11_T_33 | _data_11_T_34; // @[Mux.scala 27:73]
  wire  write_wen_0_12 = io_wen_0 & waddr_dec_0[12]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_12 = io_wen_1 & waddr_dec_1[12]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_28 = {write_wen_1_12,write_wen_0_12}; // @[DataModuleTemplate.scala 189:30]
  wire  _data_12_T_5 = write_wen_0_12 & io_wdata_0_isMove | write_wen_1_12 & io_wdata_1_isMove; // @[Mux.scala 27:73]
  wire [2:0] _data_12_T_6 = write_wen_0_12 ? io_wdata_0_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_12_T_7 = write_wen_1_12 ? io_wdata_1_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_12_T_8 = _data_12_T_6 | _data_12_T_7; // @[Mux.scala 27:73]
  wire [2:0] _data_12_T_9 = write_wen_0_12 ? io_wdata_0_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_12_T_10 = write_wen_1_12 ? io_wdata_1_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_12_T_11 = _data_12_T_9 | _data_12_T_10; // @[Mux.scala 27:73]
  wire  _data_12_T_14 = write_wen_0_12 & io_wdata_0_ftqIdx_flag | write_wen_1_12 & io_wdata_1_ftqIdx_flag; // @[Mux.scala 27:73]
  wire [5:0] _data_12_T_15 = write_wen_0_12 ? io_wdata_0_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _data_12_T_16 = write_wen_1_12 ? io_wdata_1_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _data_12_T_17 = _data_12_T_15 | _data_12_T_16; // @[Mux.scala 27:73]
  wire [5:0] _data_12_T_18 = write_wen_0_12 ? io_wdata_0_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _data_12_T_19 = write_wen_1_12 ? io_wdata_1_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _data_12_T_20 = _data_12_T_18 | _data_12_T_19; // @[Mux.scala 27:73]
  wire [2:0] _data_12_T_21 = write_wen_0_12 ? io_wdata_0_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_12_T_22 = write_wen_1_12 ? io_wdata_1_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_12_T_23 = _data_12_T_21 | _data_12_T_22; // @[Mux.scala 27:73]
  wire  _data_12_T_26 = write_wen_0_12 & io_wdata_0_wflags | write_wen_1_12 & io_wdata_1_wflags; // @[Mux.scala 27:73]
  wire  _data_12_T_29 = write_wen_0_12 & io_wdata_0_fpWen | write_wen_1_12 & io_wdata_1_fpWen; // @[Mux.scala 27:73]
  wire  _data_12_T_32 = write_wen_0_12 & io_wdata_0_rfWen | write_wen_1_12 & io_wdata_1_rfWen; // @[Mux.scala 27:73]
  wire [4:0] _data_12_T_33 = write_wen_0_12 ? io_wdata_0_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _data_12_T_34 = write_wen_1_12 ? io_wdata_1_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _data_12_T_35 = _data_12_T_33 | _data_12_T_34; // @[Mux.scala 27:73]
  wire  write_wen_0_13 = io_wen_0 & waddr_dec_0[13]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_13 = io_wen_1 & waddr_dec_1[13]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_30 = {write_wen_1_13,write_wen_0_13}; // @[DataModuleTemplate.scala 189:30]
  wire  _data_13_T_5 = write_wen_0_13 & io_wdata_0_isMove | write_wen_1_13 & io_wdata_1_isMove; // @[Mux.scala 27:73]
  wire [2:0] _data_13_T_6 = write_wen_0_13 ? io_wdata_0_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_13_T_7 = write_wen_1_13 ? io_wdata_1_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_13_T_8 = _data_13_T_6 | _data_13_T_7; // @[Mux.scala 27:73]
  wire [2:0] _data_13_T_9 = write_wen_0_13 ? io_wdata_0_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_13_T_10 = write_wen_1_13 ? io_wdata_1_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_13_T_11 = _data_13_T_9 | _data_13_T_10; // @[Mux.scala 27:73]
  wire  _data_13_T_14 = write_wen_0_13 & io_wdata_0_ftqIdx_flag | write_wen_1_13 & io_wdata_1_ftqIdx_flag; // @[Mux.scala 27:73]
  wire [5:0] _data_13_T_15 = write_wen_0_13 ? io_wdata_0_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _data_13_T_16 = write_wen_1_13 ? io_wdata_1_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _data_13_T_17 = _data_13_T_15 | _data_13_T_16; // @[Mux.scala 27:73]
  wire [5:0] _data_13_T_18 = write_wen_0_13 ? io_wdata_0_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _data_13_T_19 = write_wen_1_13 ? io_wdata_1_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _data_13_T_20 = _data_13_T_18 | _data_13_T_19; // @[Mux.scala 27:73]
  wire [2:0] _data_13_T_21 = write_wen_0_13 ? io_wdata_0_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_13_T_22 = write_wen_1_13 ? io_wdata_1_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_13_T_23 = _data_13_T_21 | _data_13_T_22; // @[Mux.scala 27:73]
  wire  _data_13_T_26 = write_wen_0_13 & io_wdata_0_wflags | write_wen_1_13 & io_wdata_1_wflags; // @[Mux.scala 27:73]
  wire  _data_13_T_29 = write_wen_0_13 & io_wdata_0_fpWen | write_wen_1_13 & io_wdata_1_fpWen; // @[Mux.scala 27:73]
  wire  _data_13_T_32 = write_wen_0_13 & io_wdata_0_rfWen | write_wen_1_13 & io_wdata_1_rfWen; // @[Mux.scala 27:73]
  wire [4:0] _data_13_T_33 = write_wen_0_13 ? io_wdata_0_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _data_13_T_34 = write_wen_1_13 ? io_wdata_1_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _data_13_T_35 = _data_13_T_33 | _data_13_T_34; // @[Mux.scala 27:73]
  wire  write_wen_0_14 = io_wen_0 & waddr_dec_0[14]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_14 = io_wen_1 & waddr_dec_1[14]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_32 = {write_wen_1_14,write_wen_0_14}; // @[DataModuleTemplate.scala 189:30]
  wire  _data_14_T_5 = write_wen_0_14 & io_wdata_0_isMove | write_wen_1_14 & io_wdata_1_isMove; // @[Mux.scala 27:73]
  wire [2:0] _data_14_T_6 = write_wen_0_14 ? io_wdata_0_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_14_T_7 = write_wen_1_14 ? io_wdata_1_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_14_T_8 = _data_14_T_6 | _data_14_T_7; // @[Mux.scala 27:73]
  wire [2:0] _data_14_T_9 = write_wen_0_14 ? io_wdata_0_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_14_T_10 = write_wen_1_14 ? io_wdata_1_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_14_T_11 = _data_14_T_9 | _data_14_T_10; // @[Mux.scala 27:73]
  wire  _data_14_T_14 = write_wen_0_14 & io_wdata_0_ftqIdx_flag | write_wen_1_14 & io_wdata_1_ftqIdx_flag; // @[Mux.scala 27:73]
  wire [5:0] _data_14_T_15 = write_wen_0_14 ? io_wdata_0_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _data_14_T_16 = write_wen_1_14 ? io_wdata_1_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _data_14_T_17 = _data_14_T_15 | _data_14_T_16; // @[Mux.scala 27:73]
  wire [5:0] _data_14_T_18 = write_wen_0_14 ? io_wdata_0_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _data_14_T_19 = write_wen_1_14 ? io_wdata_1_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _data_14_T_20 = _data_14_T_18 | _data_14_T_19; // @[Mux.scala 27:73]
  wire [2:0] _data_14_T_21 = write_wen_0_14 ? io_wdata_0_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_14_T_22 = write_wen_1_14 ? io_wdata_1_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_14_T_23 = _data_14_T_21 | _data_14_T_22; // @[Mux.scala 27:73]
  wire  _data_14_T_26 = write_wen_0_14 & io_wdata_0_wflags | write_wen_1_14 & io_wdata_1_wflags; // @[Mux.scala 27:73]
  wire  _data_14_T_29 = write_wen_0_14 & io_wdata_0_fpWen | write_wen_1_14 & io_wdata_1_fpWen; // @[Mux.scala 27:73]
  wire  _data_14_T_32 = write_wen_0_14 & io_wdata_0_rfWen | write_wen_1_14 & io_wdata_1_rfWen; // @[Mux.scala 27:73]
  wire [4:0] _data_14_T_33 = write_wen_0_14 ? io_wdata_0_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _data_14_T_34 = write_wen_1_14 ? io_wdata_1_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _data_14_T_35 = _data_14_T_33 | _data_14_T_34; // @[Mux.scala 27:73]
  wire  write_wen_0_15 = io_wen_0 & waddr_dec_0[15]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_15 = io_wen_1 & waddr_dec_1[15]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_34 = {write_wen_1_15,write_wen_0_15}; // @[DataModuleTemplate.scala 189:30]
  wire  _data_15_T_5 = write_wen_0_15 & io_wdata_0_isMove | write_wen_1_15 & io_wdata_1_isMove; // @[Mux.scala 27:73]
  wire [2:0] _data_15_T_6 = write_wen_0_15 ? io_wdata_0_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_15_T_7 = write_wen_1_15 ? io_wdata_1_ftqOffset : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_15_T_8 = _data_15_T_6 | _data_15_T_7; // @[Mux.scala 27:73]
  wire [2:0] _data_15_T_9 = write_wen_0_15 ? io_wdata_0_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_15_T_10 = write_wen_1_15 ? io_wdata_1_ftqIdx_value : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_15_T_11 = _data_15_T_9 | _data_15_T_10; // @[Mux.scala 27:73]
  wire  _data_15_T_14 = write_wen_0_15 & io_wdata_0_ftqIdx_flag | write_wen_1_15 & io_wdata_1_ftqIdx_flag; // @[Mux.scala 27:73]
  wire [5:0] _data_15_T_15 = write_wen_0_15 ? io_wdata_0_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _data_15_T_16 = write_wen_1_15 ? io_wdata_1_old_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _data_15_T_17 = _data_15_T_15 | _data_15_T_16; // @[Mux.scala 27:73]
  wire [5:0] _data_15_T_18 = write_wen_0_15 ? io_wdata_0_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _data_15_T_19 = write_wen_1_15 ? io_wdata_1_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _data_15_T_20 = _data_15_T_18 | _data_15_T_19; // @[Mux.scala 27:73]
  wire [2:0] _data_15_T_21 = write_wen_0_15 ? io_wdata_0_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_15_T_22 = write_wen_1_15 ? io_wdata_1_commitType : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _data_15_T_23 = _data_15_T_21 | _data_15_T_22; // @[Mux.scala 27:73]
  wire  _data_15_T_26 = write_wen_0_15 & io_wdata_0_wflags | write_wen_1_15 & io_wdata_1_wflags; // @[Mux.scala 27:73]
  wire  _data_15_T_29 = write_wen_0_15 & io_wdata_0_fpWen | write_wen_1_15 & io_wdata_1_fpWen; // @[Mux.scala 27:73]
  wire  _data_15_T_32 = write_wen_0_15 & io_wdata_0_rfWen | write_wen_1_15 & io_wdata_1_rfWen; // @[Mux.scala 27:73]
  wire [4:0] _data_15_T_33 = write_wen_0_15 ? io_wdata_0_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _data_15_T_34 = write_wen_1_15 ? io_wdata_1_ldest : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _data_15_T_35 = _data_15_T_33 | _data_15_T_34; // @[Mux.scala 27:73]
  assign io_rdata_0_ldest = |_T ? _io_rdata_0_T_35 : _io_rdata_0_T_423; // @[DataModuleTemplate.scala 178:40 179:19 181:19]
  assign io_rdata_0_rfWen = |_T ? _io_rdata_0_T_32 : _io_rdata_0_T_392; // @[DataModuleTemplate.scala 178:40 179:19 181:19]
  assign io_rdata_0_fpWen = |_T ? _io_rdata_0_T_29 : _io_rdata_0_T_361; // @[DataModuleTemplate.scala 178:40 179:19 181:19]
  assign io_rdata_0_wflags = |_T ? _io_rdata_0_T_26 : _io_rdata_0_T_330; // @[DataModuleTemplate.scala 178:40 179:19 181:19]
  assign io_rdata_0_commitType = |_T ? _io_rdata_0_T_23 : _io_rdata_0_T_299; // @[DataModuleTemplate.scala 178:40 179:19 181:19]
  assign io_rdata_0_pdest = |_T ? _io_rdata_0_T_20 : _io_rdata_0_T_268; // @[DataModuleTemplate.scala 178:40 179:19 181:19]
  assign io_rdata_0_old_pdest = |_T ? _io_rdata_0_T_17 : _io_rdata_0_T_237; // @[DataModuleTemplate.scala 178:40 179:19 181:19]
  assign io_rdata_0_ftqIdx_flag = |_T ? _io_rdata_0_T_14 : _io_rdata_0_T_206; // @[DataModuleTemplate.scala 178:40 179:19 181:19]
  assign io_rdata_0_ftqIdx_value = |_T ? _io_rdata_0_T_11 : _io_rdata_0_T_175; // @[DataModuleTemplate.scala 178:40 179:19 181:19]
  assign io_rdata_0_ftqOffset = |_T ? _io_rdata_0_T_8 : _io_rdata_0_T_144; // @[DataModuleTemplate.scala 178:40 179:19 181:19]
  assign io_rdata_0_isMove = |_T ? _io_rdata_0_T_5 : _io_rdata_0_T_113; // @[DataModuleTemplate.scala 178:40 179:19 181:19]
  assign io_rdata_1_ldest = |_T_2 ? _io_rdata_1_T_35 : _io_rdata_1_T_423; // @[DataModuleTemplate.scala 178:40 179:19 181:19]
  assign io_rdata_1_rfWen = |_T_2 ? _io_rdata_1_T_32 : _io_rdata_1_T_392; // @[DataModuleTemplate.scala 178:40 179:19 181:19]
  assign io_rdata_1_fpWen = |_T_2 ? _io_rdata_1_T_29 : _io_rdata_1_T_361; // @[DataModuleTemplate.scala 178:40 179:19 181:19]
  assign io_rdata_1_wflags = |_T_2 ? _io_rdata_1_T_26 : _io_rdata_1_T_330; // @[DataModuleTemplate.scala 178:40 179:19 181:19]
  assign io_rdata_1_commitType = |_T_2 ? _io_rdata_1_T_23 : _io_rdata_1_T_299; // @[DataModuleTemplate.scala 178:40 179:19 181:19]
  assign io_rdata_1_pdest = |_T_2 ? _io_rdata_1_T_20 : _io_rdata_1_T_268; // @[DataModuleTemplate.scala 178:40 179:19 181:19]
  assign io_rdata_1_old_pdest = |_T_2 ? _io_rdata_1_T_17 : _io_rdata_1_T_237; // @[DataModuleTemplate.scala 178:40 179:19 181:19]
  assign io_rdata_1_ftqIdx_flag = |_T_2 ? _io_rdata_1_T_14 : _io_rdata_1_T_206; // @[DataModuleTemplate.scala 178:40 179:19 181:19]
  assign io_rdata_1_ftqIdx_value = |_T_2 ? _io_rdata_1_T_11 : _io_rdata_1_T_175; // @[DataModuleTemplate.scala 178:40 179:19 181:19]
  assign io_rdata_1_ftqOffset = |_T_2 ? _io_rdata_1_T_8 : _io_rdata_1_T_144; // @[DataModuleTemplate.scala 178:40 179:19 181:19]
  assign io_rdata_1_isMove = |_T_2 ? _io_rdata_1_T_5 : _io_rdata_1_T_113; // @[DataModuleTemplate.scala 178:40 179:19 181:19]
  always @(negedge clock) begin
    if (|_T_4) begin // @[DataModuleTemplate.scala 189:42]
      data_0_ldest <= _data_0_T_35; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_4) begin // @[DataModuleTemplate.scala 189:42]
      data_0_rfWen <= _data_0_T_32; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_4) begin // @[DataModuleTemplate.scala 189:42]
      data_0_fpWen <= _data_0_T_29; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_4) begin // @[DataModuleTemplate.scala 189:42]
      data_0_wflags <= _data_0_T_26; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_4) begin // @[DataModuleTemplate.scala 189:42]
      data_0_commitType <= _data_0_T_23; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_4) begin // @[DataModuleTemplate.scala 189:42]
      data_0_pdest <= _data_0_T_20; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_4) begin // @[DataModuleTemplate.scala 189:42]
      data_0_old_pdest <= _data_0_T_17; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_4) begin // @[DataModuleTemplate.scala 189:42]
      data_0_ftqIdx_flag <= _data_0_T_14; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_4) begin // @[DataModuleTemplate.scala 189:42]
      data_0_ftqIdx_value <= _data_0_T_11; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_4) begin // @[DataModuleTemplate.scala 189:42]
      data_0_ftqOffset <= _data_0_T_8; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_4) begin // @[DataModuleTemplate.scala 189:42]
      data_0_isMove <= _data_0_T_5; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_6) begin // @[DataModuleTemplate.scala 189:42]
      data_1_ldest <= _data_1_T_35; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_6) begin // @[DataModuleTemplate.scala 189:42]
      data_1_rfWen <= _data_1_T_32; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_6) begin // @[DataModuleTemplate.scala 189:42]
      data_1_fpWen <= _data_1_T_29; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_6) begin // @[DataModuleTemplate.scala 189:42]
      data_1_wflags <= _data_1_T_26; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_6) begin // @[DataModuleTemplate.scala 189:42]
      data_1_commitType <= _data_1_T_23; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_6) begin // @[DataModuleTemplate.scala 189:42]
      data_1_pdest <= _data_1_T_20; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_6) begin // @[DataModuleTemplate.scala 189:42]
      data_1_old_pdest <= _data_1_T_17; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_6) begin // @[DataModuleTemplate.scala 189:42]
      data_1_ftqIdx_flag <= _data_1_T_14; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_6) begin // @[DataModuleTemplate.scala 189:42]
      data_1_ftqIdx_value <= _data_1_T_11; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_6) begin // @[DataModuleTemplate.scala 189:42]
      data_1_ftqOffset <= _data_1_T_8; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_6) begin // @[DataModuleTemplate.scala 189:42]
      data_1_isMove <= _data_1_T_5; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_8) begin // @[DataModuleTemplate.scala 189:42]
      data_2_ldest <= _data_2_T_35; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_8) begin // @[DataModuleTemplate.scala 189:42]
      data_2_rfWen <= _data_2_T_32; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_8) begin // @[DataModuleTemplate.scala 189:42]
      data_2_fpWen <= _data_2_T_29; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_8) begin // @[DataModuleTemplate.scala 189:42]
      data_2_wflags <= _data_2_T_26; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_8) begin // @[DataModuleTemplate.scala 189:42]
      data_2_commitType <= _data_2_T_23; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_8) begin // @[DataModuleTemplate.scala 189:42]
      data_2_pdest <= _data_2_T_20; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_8) begin // @[DataModuleTemplate.scala 189:42]
      data_2_old_pdest <= _data_2_T_17; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_8) begin // @[DataModuleTemplate.scala 189:42]
      data_2_ftqIdx_flag <= _data_2_T_14; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_8) begin // @[DataModuleTemplate.scala 189:42]
      data_2_ftqIdx_value <= _data_2_T_11; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_8) begin // @[DataModuleTemplate.scala 189:42]
      data_2_ftqOffset <= _data_2_T_8; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_8) begin // @[DataModuleTemplate.scala 189:42]
      data_2_isMove <= _data_2_T_5; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_10) begin // @[DataModuleTemplate.scala 189:42]
      data_3_ldest <= _data_3_T_35; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_10) begin // @[DataModuleTemplate.scala 189:42]
      data_3_rfWen <= _data_3_T_32; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_10) begin // @[DataModuleTemplate.scala 189:42]
      data_3_fpWen <= _data_3_T_29; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_10) begin // @[DataModuleTemplate.scala 189:42]
      data_3_wflags <= _data_3_T_26; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_10) begin // @[DataModuleTemplate.scala 189:42]
      data_3_commitType <= _data_3_T_23; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_10) begin // @[DataModuleTemplate.scala 189:42]
      data_3_pdest <= _data_3_T_20; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_10) begin // @[DataModuleTemplate.scala 189:42]
      data_3_old_pdest <= _data_3_T_17; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_10) begin // @[DataModuleTemplate.scala 189:42]
      data_3_ftqIdx_flag <= _data_3_T_14; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_10) begin // @[DataModuleTemplate.scala 189:42]
      data_3_ftqIdx_value <= _data_3_T_11; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_10) begin // @[DataModuleTemplate.scala 189:42]
      data_3_ftqOffset <= _data_3_T_8; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_10) begin // @[DataModuleTemplate.scala 189:42]
      data_3_isMove <= _data_3_T_5; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_12) begin // @[DataModuleTemplate.scala 189:42]
      data_4_ldest <= _data_4_T_35; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_12) begin // @[DataModuleTemplate.scala 189:42]
      data_4_rfWen <= _data_4_T_32; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_12) begin // @[DataModuleTemplate.scala 189:42]
      data_4_fpWen <= _data_4_T_29; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_12) begin // @[DataModuleTemplate.scala 189:42]
      data_4_wflags <= _data_4_T_26; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_12) begin // @[DataModuleTemplate.scala 189:42]
      data_4_commitType <= _data_4_T_23; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_12) begin // @[DataModuleTemplate.scala 189:42]
      data_4_pdest <= _data_4_T_20; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_12) begin // @[DataModuleTemplate.scala 189:42]
      data_4_old_pdest <= _data_4_T_17; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_12) begin // @[DataModuleTemplate.scala 189:42]
      data_4_ftqIdx_flag <= _data_4_T_14; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_12) begin // @[DataModuleTemplate.scala 189:42]
      data_4_ftqIdx_value <= _data_4_T_11; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_12) begin // @[DataModuleTemplate.scala 189:42]
      data_4_ftqOffset <= _data_4_T_8; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_12) begin // @[DataModuleTemplate.scala 189:42]
      data_4_isMove <= _data_4_T_5; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_14) begin // @[DataModuleTemplate.scala 189:42]
      data_5_ldest <= _data_5_T_35; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_14) begin // @[DataModuleTemplate.scala 189:42]
      data_5_rfWen <= _data_5_T_32; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_14) begin // @[DataModuleTemplate.scala 189:42]
      data_5_fpWen <= _data_5_T_29; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_14) begin // @[DataModuleTemplate.scala 189:42]
      data_5_wflags <= _data_5_T_26; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_14) begin // @[DataModuleTemplate.scala 189:42]
      data_5_commitType <= _data_5_T_23; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_14) begin // @[DataModuleTemplate.scala 189:42]
      data_5_pdest <= _data_5_T_20; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_14) begin // @[DataModuleTemplate.scala 189:42]
      data_5_old_pdest <= _data_5_T_17; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_14) begin // @[DataModuleTemplate.scala 189:42]
      data_5_ftqIdx_flag <= _data_5_T_14; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_14) begin // @[DataModuleTemplate.scala 189:42]
      data_5_ftqIdx_value <= _data_5_T_11; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_14) begin // @[DataModuleTemplate.scala 189:42]
      data_5_ftqOffset <= _data_5_T_8; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_14) begin // @[DataModuleTemplate.scala 189:42]
      data_5_isMove <= _data_5_T_5; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_16) begin // @[DataModuleTemplate.scala 189:42]
      data_6_ldest <= _data_6_T_35; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_16) begin // @[DataModuleTemplate.scala 189:42]
      data_6_rfWen <= _data_6_T_32; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_16) begin // @[DataModuleTemplate.scala 189:42]
      data_6_fpWen <= _data_6_T_29; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_16) begin // @[DataModuleTemplate.scala 189:42]
      data_6_wflags <= _data_6_T_26; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_16) begin // @[DataModuleTemplate.scala 189:42]
      data_6_commitType <= _data_6_T_23; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_16) begin // @[DataModuleTemplate.scala 189:42]
      data_6_pdest <= _data_6_T_20; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_16) begin // @[DataModuleTemplate.scala 189:42]
      data_6_old_pdest <= _data_6_T_17; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_16) begin // @[DataModuleTemplate.scala 189:42]
      data_6_ftqIdx_flag <= _data_6_T_14; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_16) begin // @[DataModuleTemplate.scala 189:42]
      data_6_ftqIdx_value <= _data_6_T_11; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_16) begin // @[DataModuleTemplate.scala 189:42]
      data_6_ftqOffset <= _data_6_T_8; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_16) begin // @[DataModuleTemplate.scala 189:42]
      data_6_isMove <= _data_6_T_5; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_18) begin // @[DataModuleTemplate.scala 189:42]
      data_7_ldest <= _data_7_T_35; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_18) begin // @[DataModuleTemplate.scala 189:42]
      data_7_rfWen <= _data_7_T_32; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_18) begin // @[DataModuleTemplate.scala 189:42]
      data_7_fpWen <= _data_7_T_29; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_18) begin // @[DataModuleTemplate.scala 189:42]
      data_7_wflags <= _data_7_T_26; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_18) begin // @[DataModuleTemplate.scala 189:42]
      data_7_commitType <= _data_7_T_23; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_18) begin // @[DataModuleTemplate.scala 189:42]
      data_7_pdest <= _data_7_T_20; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_18) begin // @[DataModuleTemplate.scala 189:42]
      data_7_old_pdest <= _data_7_T_17; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_18) begin // @[DataModuleTemplate.scala 189:42]
      data_7_ftqIdx_flag <= _data_7_T_14; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_18) begin // @[DataModuleTemplate.scala 189:42]
      data_7_ftqIdx_value <= _data_7_T_11; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_18) begin // @[DataModuleTemplate.scala 189:42]
      data_7_ftqOffset <= _data_7_T_8; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_18) begin // @[DataModuleTemplate.scala 189:42]
      data_7_isMove <= _data_7_T_5; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_20) begin // @[DataModuleTemplate.scala 189:42]
      data_8_ldest <= _data_8_T_35; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_20) begin // @[DataModuleTemplate.scala 189:42]
      data_8_rfWen <= _data_8_T_32; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_20) begin // @[DataModuleTemplate.scala 189:42]
      data_8_fpWen <= _data_8_T_29; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_20) begin // @[DataModuleTemplate.scala 189:42]
      data_8_wflags <= _data_8_T_26; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_20) begin // @[DataModuleTemplate.scala 189:42]
      data_8_commitType <= _data_8_T_23; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_20) begin // @[DataModuleTemplate.scala 189:42]
      data_8_pdest <= _data_8_T_20; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_20) begin // @[DataModuleTemplate.scala 189:42]
      data_8_old_pdest <= _data_8_T_17; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_20) begin // @[DataModuleTemplate.scala 189:42]
      data_8_ftqIdx_flag <= _data_8_T_14; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_20) begin // @[DataModuleTemplate.scala 189:42]
      data_8_ftqIdx_value <= _data_8_T_11; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_20) begin // @[DataModuleTemplate.scala 189:42]
      data_8_ftqOffset <= _data_8_T_8; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_20) begin // @[DataModuleTemplate.scala 189:42]
      data_8_isMove <= _data_8_T_5; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_22) begin // @[DataModuleTemplate.scala 189:42]
      data_9_ldest <= _data_9_T_35; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_22) begin // @[DataModuleTemplate.scala 189:42]
      data_9_rfWen <= _data_9_T_32; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_22) begin // @[DataModuleTemplate.scala 189:42]
      data_9_fpWen <= _data_9_T_29; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_22) begin // @[DataModuleTemplate.scala 189:42]
      data_9_wflags <= _data_9_T_26; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_22) begin // @[DataModuleTemplate.scala 189:42]
      data_9_commitType <= _data_9_T_23; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_22) begin // @[DataModuleTemplate.scala 189:42]
      data_9_pdest <= _data_9_T_20; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_22) begin // @[DataModuleTemplate.scala 189:42]
      data_9_old_pdest <= _data_9_T_17; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_22) begin // @[DataModuleTemplate.scala 189:42]
      data_9_ftqIdx_flag <= _data_9_T_14; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_22) begin // @[DataModuleTemplate.scala 189:42]
      data_9_ftqIdx_value <= _data_9_T_11; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_22) begin // @[DataModuleTemplate.scala 189:42]
      data_9_ftqOffset <= _data_9_T_8; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_22) begin // @[DataModuleTemplate.scala 189:42]
      data_9_isMove <= _data_9_T_5; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_24) begin // @[DataModuleTemplate.scala 189:42]
      data_10_ldest <= _data_10_T_35; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_24) begin // @[DataModuleTemplate.scala 189:42]
      data_10_rfWen <= _data_10_T_32; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_24) begin // @[DataModuleTemplate.scala 189:42]
      data_10_fpWen <= _data_10_T_29; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_24) begin // @[DataModuleTemplate.scala 189:42]
      data_10_wflags <= _data_10_T_26; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_24) begin // @[DataModuleTemplate.scala 189:42]
      data_10_commitType <= _data_10_T_23; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_24) begin // @[DataModuleTemplate.scala 189:42]
      data_10_pdest <= _data_10_T_20; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_24) begin // @[DataModuleTemplate.scala 189:42]
      data_10_old_pdest <= _data_10_T_17; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_24) begin // @[DataModuleTemplate.scala 189:42]
      data_10_ftqIdx_flag <= _data_10_T_14; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_24) begin // @[DataModuleTemplate.scala 189:42]
      data_10_ftqIdx_value <= _data_10_T_11; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_24) begin // @[DataModuleTemplate.scala 189:42]
      data_10_ftqOffset <= _data_10_T_8; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_24) begin // @[DataModuleTemplate.scala 189:42]
      data_10_isMove <= _data_10_T_5; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_26) begin // @[DataModuleTemplate.scala 189:42]
      data_11_ldest <= _data_11_T_35; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_26) begin // @[DataModuleTemplate.scala 189:42]
      data_11_rfWen <= _data_11_T_32; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_26) begin // @[DataModuleTemplate.scala 189:42]
      data_11_fpWen <= _data_11_T_29; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_26) begin // @[DataModuleTemplate.scala 189:42]
      data_11_wflags <= _data_11_T_26; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_26) begin // @[DataModuleTemplate.scala 189:42]
      data_11_commitType <= _data_11_T_23; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_26) begin // @[DataModuleTemplate.scala 189:42]
      data_11_pdest <= _data_11_T_20; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_26) begin // @[DataModuleTemplate.scala 189:42]
      data_11_old_pdest <= _data_11_T_17; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_26) begin // @[DataModuleTemplate.scala 189:42]
      data_11_ftqIdx_flag <= _data_11_T_14; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_26) begin // @[DataModuleTemplate.scala 189:42]
      data_11_ftqIdx_value <= _data_11_T_11; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_26) begin // @[DataModuleTemplate.scala 189:42]
      data_11_ftqOffset <= _data_11_T_8; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_26) begin // @[DataModuleTemplate.scala 189:42]
      data_11_isMove <= _data_11_T_5; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_28) begin // @[DataModuleTemplate.scala 189:42]
      data_12_ldest <= _data_12_T_35; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_28) begin // @[DataModuleTemplate.scala 189:42]
      data_12_rfWen <= _data_12_T_32; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_28) begin // @[DataModuleTemplate.scala 189:42]
      data_12_fpWen <= _data_12_T_29; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_28) begin // @[DataModuleTemplate.scala 189:42]
      data_12_wflags <= _data_12_T_26; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_28) begin // @[DataModuleTemplate.scala 189:42]
      data_12_commitType <= _data_12_T_23; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_28) begin // @[DataModuleTemplate.scala 189:42]
      data_12_pdest <= _data_12_T_20; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_28) begin // @[DataModuleTemplate.scala 189:42]
      data_12_old_pdest <= _data_12_T_17; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_28) begin // @[DataModuleTemplate.scala 189:42]
      data_12_ftqIdx_flag <= _data_12_T_14; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_28) begin // @[DataModuleTemplate.scala 189:42]
      data_12_ftqIdx_value <= _data_12_T_11; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_28) begin // @[DataModuleTemplate.scala 189:42]
      data_12_ftqOffset <= _data_12_T_8; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_28) begin // @[DataModuleTemplate.scala 189:42]
      data_12_isMove <= _data_12_T_5; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_30) begin // @[DataModuleTemplate.scala 189:42]
      data_13_ldest <= _data_13_T_35; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_30) begin // @[DataModuleTemplate.scala 189:42]
      data_13_rfWen <= _data_13_T_32; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_30) begin // @[DataModuleTemplate.scala 189:42]
      data_13_fpWen <= _data_13_T_29; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_30) begin // @[DataModuleTemplate.scala 189:42]
      data_13_wflags <= _data_13_T_26; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_30) begin // @[DataModuleTemplate.scala 189:42]
      data_13_commitType <= _data_13_T_23; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_30) begin // @[DataModuleTemplate.scala 189:42]
      data_13_pdest <= _data_13_T_20; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_30) begin // @[DataModuleTemplate.scala 189:42]
      data_13_old_pdest <= _data_13_T_17; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_30) begin // @[DataModuleTemplate.scala 189:42]
      data_13_ftqIdx_flag <= _data_13_T_14; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_30) begin // @[DataModuleTemplate.scala 189:42]
      data_13_ftqIdx_value <= _data_13_T_11; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_30) begin // @[DataModuleTemplate.scala 189:42]
      data_13_ftqOffset <= _data_13_T_8; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_30) begin // @[DataModuleTemplate.scala 189:42]
      data_13_isMove <= _data_13_T_5; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_32) begin // @[DataModuleTemplate.scala 189:42]
      data_14_ldest <= _data_14_T_35; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_32) begin // @[DataModuleTemplate.scala 189:42]
      data_14_rfWen <= _data_14_T_32; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_32) begin // @[DataModuleTemplate.scala 189:42]
      data_14_fpWen <= _data_14_T_29; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_32) begin // @[DataModuleTemplate.scala 189:42]
      data_14_wflags <= _data_14_T_26; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_32) begin // @[DataModuleTemplate.scala 189:42]
      data_14_commitType <= _data_14_T_23; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_32) begin // @[DataModuleTemplate.scala 189:42]
      data_14_pdest <= _data_14_T_20; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_32) begin // @[DataModuleTemplate.scala 189:42]
      data_14_old_pdest <= _data_14_T_17; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_32) begin // @[DataModuleTemplate.scala 189:42]
      data_14_ftqIdx_flag <= _data_14_T_14; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_32) begin // @[DataModuleTemplate.scala 189:42]
      data_14_ftqIdx_value <= _data_14_T_11; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_32) begin // @[DataModuleTemplate.scala 189:42]
      data_14_ftqOffset <= _data_14_T_8; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_32) begin // @[DataModuleTemplate.scala 189:42]
      data_14_isMove <= _data_14_T_5; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_34) begin // @[DataModuleTemplate.scala 189:42]
      data_15_ldest <= _data_15_T_35; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_34) begin // @[DataModuleTemplate.scala 189:42]
      data_15_rfWen <= _data_15_T_32; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_34) begin // @[DataModuleTemplate.scala 189:42]
      data_15_fpWen <= _data_15_T_29; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_34) begin // @[DataModuleTemplate.scala 189:42]
      data_15_wflags <= _data_15_T_26; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_34) begin // @[DataModuleTemplate.scala 189:42]
      data_15_commitType <= _data_15_T_23; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_34) begin // @[DataModuleTemplate.scala 189:42]
      data_15_pdest <= _data_15_T_20; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_34) begin // @[DataModuleTemplate.scala 189:42]
      data_15_old_pdest <= _data_15_T_17; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_34) begin // @[DataModuleTemplate.scala 189:42]
      data_15_ftqIdx_flag <= _data_15_T_14; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_34) begin // @[DataModuleTemplate.scala 189:42]
      data_15_ftqIdx_value <= _data_15_T_11; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_34) begin // @[DataModuleTemplate.scala 189:42]
      data_15_ftqOffset <= _data_15_T_8; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_34) begin // @[DataModuleTemplate.scala 189:42]
      data_15_isMove <= _data_15_T_5; // @[DataModuleTemplate.scala 190:15]
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
  data_0_ldest = _RAND_0[4:0];
  _RAND_1 = {1{`RANDOM}};
  data_0_rfWen = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  data_0_fpWen = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  data_0_wflags = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  data_0_commitType = _RAND_4[2:0];
  _RAND_5 = {1{`RANDOM}};
  data_0_pdest = _RAND_5[5:0];
  _RAND_6 = {1{`RANDOM}};
  data_0_old_pdest = _RAND_6[5:0];
  _RAND_7 = {1{`RANDOM}};
  data_0_ftqIdx_flag = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  data_0_ftqIdx_value = _RAND_8[2:0];
  _RAND_9 = {1{`RANDOM}};
  data_0_ftqOffset = _RAND_9[2:0];
  _RAND_10 = {1{`RANDOM}};
  data_0_isMove = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  data_1_ldest = _RAND_11[4:0];
  _RAND_12 = {1{`RANDOM}};
  data_1_rfWen = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  data_1_fpWen = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  data_1_wflags = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  data_1_commitType = _RAND_15[2:0];
  _RAND_16 = {1{`RANDOM}};
  data_1_pdest = _RAND_16[5:0];
  _RAND_17 = {1{`RANDOM}};
  data_1_old_pdest = _RAND_17[5:0];
  _RAND_18 = {1{`RANDOM}};
  data_1_ftqIdx_flag = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  data_1_ftqIdx_value = _RAND_19[2:0];
  _RAND_20 = {1{`RANDOM}};
  data_1_ftqOffset = _RAND_20[2:0];
  _RAND_21 = {1{`RANDOM}};
  data_1_isMove = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  data_2_ldest = _RAND_22[4:0];
  _RAND_23 = {1{`RANDOM}};
  data_2_rfWen = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  data_2_fpWen = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  data_2_wflags = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  data_2_commitType = _RAND_26[2:0];
  _RAND_27 = {1{`RANDOM}};
  data_2_pdest = _RAND_27[5:0];
  _RAND_28 = {1{`RANDOM}};
  data_2_old_pdest = _RAND_28[5:0];
  _RAND_29 = {1{`RANDOM}};
  data_2_ftqIdx_flag = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  data_2_ftqIdx_value = _RAND_30[2:0];
  _RAND_31 = {1{`RANDOM}};
  data_2_ftqOffset = _RAND_31[2:0];
  _RAND_32 = {1{`RANDOM}};
  data_2_isMove = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  data_3_ldest = _RAND_33[4:0];
  _RAND_34 = {1{`RANDOM}};
  data_3_rfWen = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  data_3_fpWen = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  data_3_wflags = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  data_3_commitType = _RAND_37[2:0];
  _RAND_38 = {1{`RANDOM}};
  data_3_pdest = _RAND_38[5:0];
  _RAND_39 = {1{`RANDOM}};
  data_3_old_pdest = _RAND_39[5:0];
  _RAND_40 = {1{`RANDOM}};
  data_3_ftqIdx_flag = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  data_3_ftqIdx_value = _RAND_41[2:0];
  _RAND_42 = {1{`RANDOM}};
  data_3_ftqOffset = _RAND_42[2:0];
  _RAND_43 = {1{`RANDOM}};
  data_3_isMove = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  data_4_ldest = _RAND_44[4:0];
  _RAND_45 = {1{`RANDOM}};
  data_4_rfWen = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  data_4_fpWen = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  data_4_wflags = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  data_4_commitType = _RAND_48[2:0];
  _RAND_49 = {1{`RANDOM}};
  data_4_pdest = _RAND_49[5:0];
  _RAND_50 = {1{`RANDOM}};
  data_4_old_pdest = _RAND_50[5:0];
  _RAND_51 = {1{`RANDOM}};
  data_4_ftqIdx_flag = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  data_4_ftqIdx_value = _RAND_52[2:0];
  _RAND_53 = {1{`RANDOM}};
  data_4_ftqOffset = _RAND_53[2:0];
  _RAND_54 = {1{`RANDOM}};
  data_4_isMove = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  data_5_ldest = _RAND_55[4:0];
  _RAND_56 = {1{`RANDOM}};
  data_5_rfWen = _RAND_56[0:0];
  _RAND_57 = {1{`RANDOM}};
  data_5_fpWen = _RAND_57[0:0];
  _RAND_58 = {1{`RANDOM}};
  data_5_wflags = _RAND_58[0:0];
  _RAND_59 = {1{`RANDOM}};
  data_5_commitType = _RAND_59[2:0];
  _RAND_60 = {1{`RANDOM}};
  data_5_pdest = _RAND_60[5:0];
  _RAND_61 = {1{`RANDOM}};
  data_5_old_pdest = _RAND_61[5:0];
  _RAND_62 = {1{`RANDOM}};
  data_5_ftqIdx_flag = _RAND_62[0:0];
  _RAND_63 = {1{`RANDOM}};
  data_5_ftqIdx_value = _RAND_63[2:0];
  _RAND_64 = {1{`RANDOM}};
  data_5_ftqOffset = _RAND_64[2:0];
  _RAND_65 = {1{`RANDOM}};
  data_5_isMove = _RAND_65[0:0];
  _RAND_66 = {1{`RANDOM}};
  data_6_ldest = _RAND_66[4:0];
  _RAND_67 = {1{`RANDOM}};
  data_6_rfWen = _RAND_67[0:0];
  _RAND_68 = {1{`RANDOM}};
  data_6_fpWen = _RAND_68[0:0];
  _RAND_69 = {1{`RANDOM}};
  data_6_wflags = _RAND_69[0:0];
  _RAND_70 = {1{`RANDOM}};
  data_6_commitType = _RAND_70[2:0];
  _RAND_71 = {1{`RANDOM}};
  data_6_pdest = _RAND_71[5:0];
  _RAND_72 = {1{`RANDOM}};
  data_6_old_pdest = _RAND_72[5:0];
  _RAND_73 = {1{`RANDOM}};
  data_6_ftqIdx_flag = _RAND_73[0:0];
  _RAND_74 = {1{`RANDOM}};
  data_6_ftqIdx_value = _RAND_74[2:0];
  _RAND_75 = {1{`RANDOM}};
  data_6_ftqOffset = _RAND_75[2:0];
  _RAND_76 = {1{`RANDOM}};
  data_6_isMove = _RAND_76[0:0];
  _RAND_77 = {1{`RANDOM}};
  data_7_ldest = _RAND_77[4:0];
  _RAND_78 = {1{`RANDOM}};
  data_7_rfWen = _RAND_78[0:0];
  _RAND_79 = {1{`RANDOM}};
  data_7_fpWen = _RAND_79[0:0];
  _RAND_80 = {1{`RANDOM}};
  data_7_wflags = _RAND_80[0:0];
  _RAND_81 = {1{`RANDOM}};
  data_7_commitType = _RAND_81[2:0];
  _RAND_82 = {1{`RANDOM}};
  data_7_pdest = _RAND_82[5:0];
  _RAND_83 = {1{`RANDOM}};
  data_7_old_pdest = _RAND_83[5:0];
  _RAND_84 = {1{`RANDOM}};
  data_7_ftqIdx_flag = _RAND_84[0:0];
  _RAND_85 = {1{`RANDOM}};
  data_7_ftqIdx_value = _RAND_85[2:0];
  _RAND_86 = {1{`RANDOM}};
  data_7_ftqOffset = _RAND_86[2:0];
  _RAND_87 = {1{`RANDOM}};
  data_7_isMove = _RAND_87[0:0];
  _RAND_88 = {1{`RANDOM}};
  data_8_ldest = _RAND_88[4:0];
  _RAND_89 = {1{`RANDOM}};
  data_8_rfWen = _RAND_89[0:0];
  _RAND_90 = {1{`RANDOM}};
  data_8_fpWen = _RAND_90[0:0];
  _RAND_91 = {1{`RANDOM}};
  data_8_wflags = _RAND_91[0:0];
  _RAND_92 = {1{`RANDOM}};
  data_8_commitType = _RAND_92[2:0];
  _RAND_93 = {1{`RANDOM}};
  data_8_pdest = _RAND_93[5:0];
  _RAND_94 = {1{`RANDOM}};
  data_8_old_pdest = _RAND_94[5:0];
  _RAND_95 = {1{`RANDOM}};
  data_8_ftqIdx_flag = _RAND_95[0:0];
  _RAND_96 = {1{`RANDOM}};
  data_8_ftqIdx_value = _RAND_96[2:0];
  _RAND_97 = {1{`RANDOM}};
  data_8_ftqOffset = _RAND_97[2:0];
  _RAND_98 = {1{`RANDOM}};
  data_8_isMove = _RAND_98[0:0];
  _RAND_99 = {1{`RANDOM}};
  data_9_ldest = _RAND_99[4:0];
  _RAND_100 = {1{`RANDOM}};
  data_9_rfWen = _RAND_100[0:0];
  _RAND_101 = {1{`RANDOM}};
  data_9_fpWen = _RAND_101[0:0];
  _RAND_102 = {1{`RANDOM}};
  data_9_wflags = _RAND_102[0:0];
  _RAND_103 = {1{`RANDOM}};
  data_9_commitType = _RAND_103[2:0];
  _RAND_104 = {1{`RANDOM}};
  data_9_pdest = _RAND_104[5:0];
  _RAND_105 = {1{`RANDOM}};
  data_9_old_pdest = _RAND_105[5:0];
  _RAND_106 = {1{`RANDOM}};
  data_9_ftqIdx_flag = _RAND_106[0:0];
  _RAND_107 = {1{`RANDOM}};
  data_9_ftqIdx_value = _RAND_107[2:0];
  _RAND_108 = {1{`RANDOM}};
  data_9_ftqOffset = _RAND_108[2:0];
  _RAND_109 = {1{`RANDOM}};
  data_9_isMove = _RAND_109[0:0];
  _RAND_110 = {1{`RANDOM}};
  data_10_ldest = _RAND_110[4:0];
  _RAND_111 = {1{`RANDOM}};
  data_10_rfWen = _RAND_111[0:0];
  _RAND_112 = {1{`RANDOM}};
  data_10_fpWen = _RAND_112[0:0];
  _RAND_113 = {1{`RANDOM}};
  data_10_wflags = _RAND_113[0:0];
  _RAND_114 = {1{`RANDOM}};
  data_10_commitType = _RAND_114[2:0];
  _RAND_115 = {1{`RANDOM}};
  data_10_pdest = _RAND_115[5:0];
  _RAND_116 = {1{`RANDOM}};
  data_10_old_pdest = _RAND_116[5:0];
  _RAND_117 = {1{`RANDOM}};
  data_10_ftqIdx_flag = _RAND_117[0:0];
  _RAND_118 = {1{`RANDOM}};
  data_10_ftqIdx_value = _RAND_118[2:0];
  _RAND_119 = {1{`RANDOM}};
  data_10_ftqOffset = _RAND_119[2:0];
  _RAND_120 = {1{`RANDOM}};
  data_10_isMove = _RAND_120[0:0];
  _RAND_121 = {1{`RANDOM}};
  data_11_ldest = _RAND_121[4:0];
  _RAND_122 = {1{`RANDOM}};
  data_11_rfWen = _RAND_122[0:0];
  _RAND_123 = {1{`RANDOM}};
  data_11_fpWen = _RAND_123[0:0];
  _RAND_124 = {1{`RANDOM}};
  data_11_wflags = _RAND_124[0:0];
  _RAND_125 = {1{`RANDOM}};
  data_11_commitType = _RAND_125[2:0];
  _RAND_126 = {1{`RANDOM}};
  data_11_pdest = _RAND_126[5:0];
  _RAND_127 = {1{`RANDOM}};
  data_11_old_pdest = _RAND_127[5:0];
  _RAND_128 = {1{`RANDOM}};
  data_11_ftqIdx_flag = _RAND_128[0:0];
  _RAND_129 = {1{`RANDOM}};
  data_11_ftqIdx_value = _RAND_129[2:0];
  _RAND_130 = {1{`RANDOM}};
  data_11_ftqOffset = _RAND_130[2:0];
  _RAND_131 = {1{`RANDOM}};
  data_11_isMove = _RAND_131[0:0];
  _RAND_132 = {1{`RANDOM}};
  data_12_ldest = _RAND_132[4:0];
  _RAND_133 = {1{`RANDOM}};
  data_12_rfWen = _RAND_133[0:0];
  _RAND_134 = {1{`RANDOM}};
  data_12_fpWen = _RAND_134[0:0];
  _RAND_135 = {1{`RANDOM}};
  data_12_wflags = _RAND_135[0:0];
  _RAND_136 = {1{`RANDOM}};
  data_12_commitType = _RAND_136[2:0];
  _RAND_137 = {1{`RANDOM}};
  data_12_pdest = _RAND_137[5:0];
  _RAND_138 = {1{`RANDOM}};
  data_12_old_pdest = _RAND_138[5:0];
  _RAND_139 = {1{`RANDOM}};
  data_12_ftqIdx_flag = _RAND_139[0:0];
  _RAND_140 = {1{`RANDOM}};
  data_12_ftqIdx_value = _RAND_140[2:0];
  _RAND_141 = {1{`RANDOM}};
  data_12_ftqOffset = _RAND_141[2:0];
  _RAND_142 = {1{`RANDOM}};
  data_12_isMove = _RAND_142[0:0];
  _RAND_143 = {1{`RANDOM}};
  data_13_ldest = _RAND_143[4:0];
  _RAND_144 = {1{`RANDOM}};
  data_13_rfWen = _RAND_144[0:0];
  _RAND_145 = {1{`RANDOM}};
  data_13_fpWen = _RAND_145[0:0];
  _RAND_146 = {1{`RANDOM}};
  data_13_wflags = _RAND_146[0:0];
  _RAND_147 = {1{`RANDOM}};
  data_13_commitType = _RAND_147[2:0];
  _RAND_148 = {1{`RANDOM}};
  data_13_pdest = _RAND_148[5:0];
  _RAND_149 = {1{`RANDOM}};
  data_13_old_pdest = _RAND_149[5:0];
  _RAND_150 = {1{`RANDOM}};
  data_13_ftqIdx_flag = _RAND_150[0:0];
  _RAND_151 = {1{`RANDOM}};
  data_13_ftqIdx_value = _RAND_151[2:0];
  _RAND_152 = {1{`RANDOM}};
  data_13_ftqOffset = _RAND_152[2:0];
  _RAND_153 = {1{`RANDOM}};
  data_13_isMove = _RAND_153[0:0];
  _RAND_154 = {1{`RANDOM}};
  data_14_ldest = _RAND_154[4:0];
  _RAND_155 = {1{`RANDOM}};
  data_14_rfWen = _RAND_155[0:0];
  _RAND_156 = {1{`RANDOM}};
  data_14_fpWen = _RAND_156[0:0];
  _RAND_157 = {1{`RANDOM}};
  data_14_wflags = _RAND_157[0:0];
  _RAND_158 = {1{`RANDOM}};
  data_14_commitType = _RAND_158[2:0];
  _RAND_159 = {1{`RANDOM}};
  data_14_pdest = _RAND_159[5:0];
  _RAND_160 = {1{`RANDOM}};
  data_14_old_pdest = _RAND_160[5:0];
  _RAND_161 = {1{`RANDOM}};
  data_14_ftqIdx_flag = _RAND_161[0:0];
  _RAND_162 = {1{`RANDOM}};
  data_14_ftqIdx_value = _RAND_162[2:0];
  _RAND_163 = {1{`RANDOM}};
  data_14_ftqOffset = _RAND_163[2:0];
  _RAND_164 = {1{`RANDOM}};
  data_14_isMove = _RAND_164[0:0];
  _RAND_165 = {1{`RANDOM}};
  data_15_ldest = _RAND_165[4:0];
  _RAND_166 = {1{`RANDOM}};
  data_15_rfWen = _RAND_166[0:0];
  _RAND_167 = {1{`RANDOM}};
  data_15_fpWen = _RAND_167[0:0];
  _RAND_168 = {1{`RANDOM}};
  data_15_wflags = _RAND_168[0:0];
  _RAND_169 = {1{`RANDOM}};
  data_15_commitType = _RAND_169[2:0];
  _RAND_170 = {1{`RANDOM}};
  data_15_pdest = _RAND_170[5:0];
  _RAND_171 = {1{`RANDOM}};
  data_15_old_pdest = _RAND_171[5:0];
  _RAND_172 = {1{`RANDOM}};
  data_15_ftqIdx_flag = _RAND_172[0:0];
  _RAND_173 = {1{`RANDOM}};
  data_15_ftqIdx_value = _RAND_173[2:0];
  _RAND_174 = {1{`RANDOM}};
  data_15_ftqOffset = _RAND_174[2:0];
  _RAND_175 = {1{`RANDOM}};
  data_15_isMove = _RAND_175[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

