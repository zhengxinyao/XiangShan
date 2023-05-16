module NegedgeDataModule__64entry(
  input        clock,
  input  [5:0] io_raddr_0,
  input  [5:0] io_raddr_1,
  output [1:0] io_rdata_0,
  output [1:0] io_rdata_1,
  input        io_wen_0,
  input        io_wen_1,
  input  [5:0] io_waddr_0,
  input  [5:0] io_waddr_1,
  input  [1:0] io_wdata_0,
  input  [1:0] io_wdata_1
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
`endif // RANDOMIZE_REG_INIT
  reg [1:0] data_0; // @[DataModuleTemplate.scala 168:17]
  reg [1:0] data_1; // @[DataModuleTemplate.scala 168:17]
  reg [1:0] data_2; // @[DataModuleTemplate.scala 168:17]
  reg [1:0] data_3; // @[DataModuleTemplate.scala 168:17]
  reg [1:0] data_4; // @[DataModuleTemplate.scala 168:17]
  reg [1:0] data_5; // @[DataModuleTemplate.scala 168:17]
  reg [1:0] data_6; // @[DataModuleTemplate.scala 168:17]
  reg [1:0] data_7; // @[DataModuleTemplate.scala 168:17]
  reg [1:0] data_8; // @[DataModuleTemplate.scala 168:17]
  reg [1:0] data_9; // @[DataModuleTemplate.scala 168:17]
  reg [1:0] data_10; // @[DataModuleTemplate.scala 168:17]
  reg [1:0] data_11; // @[DataModuleTemplate.scala 168:17]
  reg [1:0] data_12; // @[DataModuleTemplate.scala 168:17]
  reg [1:0] data_13; // @[DataModuleTemplate.scala 168:17]
  reg [1:0] data_14; // @[DataModuleTemplate.scala 168:17]
  reg [1:0] data_15; // @[DataModuleTemplate.scala 168:17]
  reg [1:0] data_16; // @[DataModuleTemplate.scala 168:17]
  reg [1:0] data_17; // @[DataModuleTemplate.scala 168:17]
  reg [1:0] data_18; // @[DataModuleTemplate.scala 168:17]
  reg [1:0] data_19; // @[DataModuleTemplate.scala 168:17]
  reg [1:0] data_20; // @[DataModuleTemplate.scala 168:17]
  reg [1:0] data_21; // @[DataModuleTemplate.scala 168:17]
  reg [1:0] data_22; // @[DataModuleTemplate.scala 168:17]
  reg [1:0] data_23; // @[DataModuleTemplate.scala 168:17]
  reg [1:0] data_24; // @[DataModuleTemplate.scala 168:17]
  reg [1:0] data_25; // @[DataModuleTemplate.scala 168:17]
  reg [1:0] data_26; // @[DataModuleTemplate.scala 168:17]
  reg [1:0] data_27; // @[DataModuleTemplate.scala 168:17]
  reg [1:0] data_28; // @[DataModuleTemplate.scala 168:17]
  reg [1:0] data_29; // @[DataModuleTemplate.scala 168:17]
  reg [1:0] data_30; // @[DataModuleTemplate.scala 168:17]
  reg [1:0] data_31; // @[DataModuleTemplate.scala 168:17]
  reg [1:0] data_32; // @[DataModuleTemplate.scala 168:17]
  reg [1:0] data_33; // @[DataModuleTemplate.scala 168:17]
  reg [1:0] data_34; // @[DataModuleTemplate.scala 168:17]
  reg [1:0] data_35; // @[DataModuleTemplate.scala 168:17]
  reg [1:0] data_36; // @[DataModuleTemplate.scala 168:17]
  reg [1:0] data_37; // @[DataModuleTemplate.scala 168:17]
  reg [1:0] data_38; // @[DataModuleTemplate.scala 168:17]
  reg [1:0] data_39; // @[DataModuleTemplate.scala 168:17]
  reg [1:0] data_40; // @[DataModuleTemplate.scala 168:17]
  reg [1:0] data_41; // @[DataModuleTemplate.scala 168:17]
  reg [1:0] data_42; // @[DataModuleTemplate.scala 168:17]
  reg [1:0] data_43; // @[DataModuleTemplate.scala 168:17]
  reg [1:0] data_44; // @[DataModuleTemplate.scala 168:17]
  reg [1:0] data_45; // @[DataModuleTemplate.scala 168:17]
  reg [1:0] data_46; // @[DataModuleTemplate.scala 168:17]
  reg [1:0] data_47; // @[DataModuleTemplate.scala 168:17]
  reg [1:0] data_48; // @[DataModuleTemplate.scala 168:17]
  reg [1:0] data_49; // @[DataModuleTemplate.scala 168:17]
  reg [1:0] data_50; // @[DataModuleTemplate.scala 168:17]
  reg [1:0] data_51; // @[DataModuleTemplate.scala 168:17]
  reg [1:0] data_52; // @[DataModuleTemplate.scala 168:17]
  reg [1:0] data_53; // @[DataModuleTemplate.scala 168:17]
  reg [1:0] data_54; // @[DataModuleTemplate.scala 168:17]
  reg [1:0] data_55; // @[DataModuleTemplate.scala 168:17]
  reg [1:0] data_56; // @[DataModuleTemplate.scala 168:17]
  reg [1:0] data_57; // @[DataModuleTemplate.scala 168:17]
  reg [1:0] data_58; // @[DataModuleTemplate.scala 168:17]
  reg [1:0] data_59; // @[DataModuleTemplate.scala 168:17]
  reg [1:0] data_60; // @[DataModuleTemplate.scala 168:17]
  reg [1:0] data_61; // @[DataModuleTemplate.scala 168:17]
  reg [1:0] data_62; // @[DataModuleTemplate.scala 168:17]
  reg [1:0] data_63; // @[DataModuleTemplate.scala 168:17]
  wire  read_by_0 = io_wen_0 & io_waddr_0 == io_raddr_0; // @[DataModuleTemplate.scala 176:54]
  wire  read_by_1 = io_wen_1 & io_waddr_1 == io_raddr_0; // @[DataModuleTemplate.scala 176:54]
  wire [63:0] addr_dec = 64'h1 << io_raddr_0; // @[OneHot.scala 64:12]
  wire [1:0] _T = {read_by_1,read_by_0}; // @[DataModuleTemplate.scala 178:28]
  wire [1:0] _io_rdata_0_T = read_by_0 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_1 = read_by_1 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_2 = _io_rdata_0_T | _io_rdata_0_T_1; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_67 = addr_dec[0] ? data_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_68 = addr_dec[1] ? data_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_69 = addr_dec[2] ? data_2 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_70 = addr_dec[3] ? data_3 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_71 = addr_dec[4] ? data_4 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_72 = addr_dec[5] ? data_5 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_73 = addr_dec[6] ? data_6 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_74 = addr_dec[7] ? data_7 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_75 = addr_dec[8] ? data_8 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_76 = addr_dec[9] ? data_9 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_77 = addr_dec[10] ? data_10 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_78 = addr_dec[11] ? data_11 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_79 = addr_dec[12] ? data_12 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_80 = addr_dec[13] ? data_13 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_81 = addr_dec[14] ? data_14 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_82 = addr_dec[15] ? data_15 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_83 = addr_dec[16] ? data_16 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_84 = addr_dec[17] ? data_17 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_85 = addr_dec[18] ? data_18 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_86 = addr_dec[19] ? data_19 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_87 = addr_dec[20] ? data_20 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_88 = addr_dec[21] ? data_21 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_89 = addr_dec[22] ? data_22 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_90 = addr_dec[23] ? data_23 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_91 = addr_dec[24] ? data_24 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_92 = addr_dec[25] ? data_25 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_93 = addr_dec[26] ? data_26 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_94 = addr_dec[27] ? data_27 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_95 = addr_dec[28] ? data_28 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_96 = addr_dec[29] ? data_29 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_97 = addr_dec[30] ? data_30 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_98 = addr_dec[31] ? data_31 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_99 = addr_dec[32] ? data_32 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_100 = addr_dec[33] ? data_33 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_101 = addr_dec[34] ? data_34 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_102 = addr_dec[35] ? data_35 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_103 = addr_dec[36] ? data_36 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_104 = addr_dec[37] ? data_37 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_105 = addr_dec[38] ? data_38 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_106 = addr_dec[39] ? data_39 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_107 = addr_dec[40] ? data_40 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_108 = addr_dec[41] ? data_41 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_109 = addr_dec[42] ? data_42 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_110 = addr_dec[43] ? data_43 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_111 = addr_dec[44] ? data_44 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_112 = addr_dec[45] ? data_45 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_113 = addr_dec[46] ? data_46 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_114 = addr_dec[47] ? data_47 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_115 = addr_dec[48] ? data_48 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_116 = addr_dec[49] ? data_49 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_117 = addr_dec[50] ? data_50 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_118 = addr_dec[51] ? data_51 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_119 = addr_dec[52] ? data_52 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_120 = addr_dec[53] ? data_53 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_121 = addr_dec[54] ? data_54 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_122 = addr_dec[55] ? data_55 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_123 = addr_dec[56] ? data_56 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_124 = addr_dec[57] ? data_57 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_125 = addr_dec[58] ? data_58 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_126 = addr_dec[59] ? data_59 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_127 = addr_dec[60] ? data_60 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_128 = addr_dec[61] ? data_61 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_129 = addr_dec[62] ? data_62 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_130 = addr_dec[63] ? data_63 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_131 = _io_rdata_0_T_67 | _io_rdata_0_T_68; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_132 = _io_rdata_0_T_131 | _io_rdata_0_T_69; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_133 = _io_rdata_0_T_132 | _io_rdata_0_T_70; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_134 = _io_rdata_0_T_133 | _io_rdata_0_T_71; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_135 = _io_rdata_0_T_134 | _io_rdata_0_T_72; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_136 = _io_rdata_0_T_135 | _io_rdata_0_T_73; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_137 = _io_rdata_0_T_136 | _io_rdata_0_T_74; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_138 = _io_rdata_0_T_137 | _io_rdata_0_T_75; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_139 = _io_rdata_0_T_138 | _io_rdata_0_T_76; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_140 = _io_rdata_0_T_139 | _io_rdata_0_T_77; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_141 = _io_rdata_0_T_140 | _io_rdata_0_T_78; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_142 = _io_rdata_0_T_141 | _io_rdata_0_T_79; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_143 = _io_rdata_0_T_142 | _io_rdata_0_T_80; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_144 = _io_rdata_0_T_143 | _io_rdata_0_T_81; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_145 = _io_rdata_0_T_144 | _io_rdata_0_T_82; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_146 = _io_rdata_0_T_145 | _io_rdata_0_T_83; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_147 = _io_rdata_0_T_146 | _io_rdata_0_T_84; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_148 = _io_rdata_0_T_147 | _io_rdata_0_T_85; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_149 = _io_rdata_0_T_148 | _io_rdata_0_T_86; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_150 = _io_rdata_0_T_149 | _io_rdata_0_T_87; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_151 = _io_rdata_0_T_150 | _io_rdata_0_T_88; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_152 = _io_rdata_0_T_151 | _io_rdata_0_T_89; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_153 = _io_rdata_0_T_152 | _io_rdata_0_T_90; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_154 = _io_rdata_0_T_153 | _io_rdata_0_T_91; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_155 = _io_rdata_0_T_154 | _io_rdata_0_T_92; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_156 = _io_rdata_0_T_155 | _io_rdata_0_T_93; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_157 = _io_rdata_0_T_156 | _io_rdata_0_T_94; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_158 = _io_rdata_0_T_157 | _io_rdata_0_T_95; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_159 = _io_rdata_0_T_158 | _io_rdata_0_T_96; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_160 = _io_rdata_0_T_159 | _io_rdata_0_T_97; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_161 = _io_rdata_0_T_160 | _io_rdata_0_T_98; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_162 = _io_rdata_0_T_161 | _io_rdata_0_T_99; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_163 = _io_rdata_0_T_162 | _io_rdata_0_T_100; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_164 = _io_rdata_0_T_163 | _io_rdata_0_T_101; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_165 = _io_rdata_0_T_164 | _io_rdata_0_T_102; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_166 = _io_rdata_0_T_165 | _io_rdata_0_T_103; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_167 = _io_rdata_0_T_166 | _io_rdata_0_T_104; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_168 = _io_rdata_0_T_167 | _io_rdata_0_T_105; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_169 = _io_rdata_0_T_168 | _io_rdata_0_T_106; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_170 = _io_rdata_0_T_169 | _io_rdata_0_T_107; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_171 = _io_rdata_0_T_170 | _io_rdata_0_T_108; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_172 = _io_rdata_0_T_171 | _io_rdata_0_T_109; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_173 = _io_rdata_0_T_172 | _io_rdata_0_T_110; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_174 = _io_rdata_0_T_173 | _io_rdata_0_T_111; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_175 = _io_rdata_0_T_174 | _io_rdata_0_T_112; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_176 = _io_rdata_0_T_175 | _io_rdata_0_T_113; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_177 = _io_rdata_0_T_176 | _io_rdata_0_T_114; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_178 = _io_rdata_0_T_177 | _io_rdata_0_T_115; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_179 = _io_rdata_0_T_178 | _io_rdata_0_T_116; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_180 = _io_rdata_0_T_179 | _io_rdata_0_T_117; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_181 = _io_rdata_0_T_180 | _io_rdata_0_T_118; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_182 = _io_rdata_0_T_181 | _io_rdata_0_T_119; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_183 = _io_rdata_0_T_182 | _io_rdata_0_T_120; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_184 = _io_rdata_0_T_183 | _io_rdata_0_T_121; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_185 = _io_rdata_0_T_184 | _io_rdata_0_T_122; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_186 = _io_rdata_0_T_185 | _io_rdata_0_T_123; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_187 = _io_rdata_0_T_186 | _io_rdata_0_T_124; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_188 = _io_rdata_0_T_187 | _io_rdata_0_T_125; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_189 = _io_rdata_0_T_188 | _io_rdata_0_T_126; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_190 = _io_rdata_0_T_189 | _io_rdata_0_T_127; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_191 = _io_rdata_0_T_190 | _io_rdata_0_T_128; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_192 = _io_rdata_0_T_191 | _io_rdata_0_T_129; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_0_T_193 = _io_rdata_0_T_192 | _io_rdata_0_T_130; // @[Mux.scala 27:73]
  wire  read_by_0_1 = io_wen_0 & io_waddr_0 == io_raddr_1; // @[DataModuleTemplate.scala 176:54]
  wire  read_by_1_1 = io_wen_1 & io_waddr_1 == io_raddr_1; // @[DataModuleTemplate.scala 176:54]
  wire [63:0] addr_dec_1 = 64'h1 << io_raddr_1; // @[OneHot.scala 64:12]
  wire [1:0] _T_2 = {read_by_1_1,read_by_0_1}; // @[DataModuleTemplate.scala 178:28]
  wire [1:0] _io_rdata_1_T = read_by_0_1 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_1 = read_by_1_1 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_2 = _io_rdata_1_T | _io_rdata_1_T_1; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_67 = addr_dec_1[0] ? data_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_68 = addr_dec_1[1] ? data_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_69 = addr_dec_1[2] ? data_2 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_70 = addr_dec_1[3] ? data_3 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_71 = addr_dec_1[4] ? data_4 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_72 = addr_dec_1[5] ? data_5 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_73 = addr_dec_1[6] ? data_6 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_74 = addr_dec_1[7] ? data_7 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_75 = addr_dec_1[8] ? data_8 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_76 = addr_dec_1[9] ? data_9 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_77 = addr_dec_1[10] ? data_10 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_78 = addr_dec_1[11] ? data_11 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_79 = addr_dec_1[12] ? data_12 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_80 = addr_dec_1[13] ? data_13 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_81 = addr_dec_1[14] ? data_14 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_82 = addr_dec_1[15] ? data_15 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_83 = addr_dec_1[16] ? data_16 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_84 = addr_dec_1[17] ? data_17 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_85 = addr_dec_1[18] ? data_18 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_86 = addr_dec_1[19] ? data_19 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_87 = addr_dec_1[20] ? data_20 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_88 = addr_dec_1[21] ? data_21 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_89 = addr_dec_1[22] ? data_22 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_90 = addr_dec_1[23] ? data_23 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_91 = addr_dec_1[24] ? data_24 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_92 = addr_dec_1[25] ? data_25 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_93 = addr_dec_1[26] ? data_26 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_94 = addr_dec_1[27] ? data_27 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_95 = addr_dec_1[28] ? data_28 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_96 = addr_dec_1[29] ? data_29 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_97 = addr_dec_1[30] ? data_30 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_98 = addr_dec_1[31] ? data_31 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_99 = addr_dec_1[32] ? data_32 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_100 = addr_dec_1[33] ? data_33 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_101 = addr_dec_1[34] ? data_34 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_102 = addr_dec_1[35] ? data_35 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_103 = addr_dec_1[36] ? data_36 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_104 = addr_dec_1[37] ? data_37 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_105 = addr_dec_1[38] ? data_38 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_106 = addr_dec_1[39] ? data_39 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_107 = addr_dec_1[40] ? data_40 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_108 = addr_dec_1[41] ? data_41 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_109 = addr_dec_1[42] ? data_42 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_110 = addr_dec_1[43] ? data_43 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_111 = addr_dec_1[44] ? data_44 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_112 = addr_dec_1[45] ? data_45 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_113 = addr_dec_1[46] ? data_46 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_114 = addr_dec_1[47] ? data_47 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_115 = addr_dec_1[48] ? data_48 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_116 = addr_dec_1[49] ? data_49 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_117 = addr_dec_1[50] ? data_50 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_118 = addr_dec_1[51] ? data_51 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_119 = addr_dec_1[52] ? data_52 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_120 = addr_dec_1[53] ? data_53 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_121 = addr_dec_1[54] ? data_54 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_122 = addr_dec_1[55] ? data_55 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_123 = addr_dec_1[56] ? data_56 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_124 = addr_dec_1[57] ? data_57 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_125 = addr_dec_1[58] ? data_58 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_126 = addr_dec_1[59] ? data_59 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_127 = addr_dec_1[60] ? data_60 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_128 = addr_dec_1[61] ? data_61 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_129 = addr_dec_1[62] ? data_62 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_130 = addr_dec_1[63] ? data_63 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_131 = _io_rdata_1_T_67 | _io_rdata_1_T_68; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_132 = _io_rdata_1_T_131 | _io_rdata_1_T_69; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_133 = _io_rdata_1_T_132 | _io_rdata_1_T_70; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_134 = _io_rdata_1_T_133 | _io_rdata_1_T_71; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_135 = _io_rdata_1_T_134 | _io_rdata_1_T_72; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_136 = _io_rdata_1_T_135 | _io_rdata_1_T_73; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_137 = _io_rdata_1_T_136 | _io_rdata_1_T_74; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_138 = _io_rdata_1_T_137 | _io_rdata_1_T_75; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_139 = _io_rdata_1_T_138 | _io_rdata_1_T_76; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_140 = _io_rdata_1_T_139 | _io_rdata_1_T_77; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_141 = _io_rdata_1_T_140 | _io_rdata_1_T_78; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_142 = _io_rdata_1_T_141 | _io_rdata_1_T_79; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_143 = _io_rdata_1_T_142 | _io_rdata_1_T_80; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_144 = _io_rdata_1_T_143 | _io_rdata_1_T_81; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_145 = _io_rdata_1_T_144 | _io_rdata_1_T_82; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_146 = _io_rdata_1_T_145 | _io_rdata_1_T_83; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_147 = _io_rdata_1_T_146 | _io_rdata_1_T_84; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_148 = _io_rdata_1_T_147 | _io_rdata_1_T_85; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_149 = _io_rdata_1_T_148 | _io_rdata_1_T_86; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_150 = _io_rdata_1_T_149 | _io_rdata_1_T_87; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_151 = _io_rdata_1_T_150 | _io_rdata_1_T_88; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_152 = _io_rdata_1_T_151 | _io_rdata_1_T_89; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_153 = _io_rdata_1_T_152 | _io_rdata_1_T_90; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_154 = _io_rdata_1_T_153 | _io_rdata_1_T_91; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_155 = _io_rdata_1_T_154 | _io_rdata_1_T_92; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_156 = _io_rdata_1_T_155 | _io_rdata_1_T_93; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_157 = _io_rdata_1_T_156 | _io_rdata_1_T_94; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_158 = _io_rdata_1_T_157 | _io_rdata_1_T_95; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_159 = _io_rdata_1_T_158 | _io_rdata_1_T_96; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_160 = _io_rdata_1_T_159 | _io_rdata_1_T_97; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_161 = _io_rdata_1_T_160 | _io_rdata_1_T_98; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_162 = _io_rdata_1_T_161 | _io_rdata_1_T_99; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_163 = _io_rdata_1_T_162 | _io_rdata_1_T_100; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_164 = _io_rdata_1_T_163 | _io_rdata_1_T_101; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_165 = _io_rdata_1_T_164 | _io_rdata_1_T_102; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_166 = _io_rdata_1_T_165 | _io_rdata_1_T_103; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_167 = _io_rdata_1_T_166 | _io_rdata_1_T_104; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_168 = _io_rdata_1_T_167 | _io_rdata_1_T_105; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_169 = _io_rdata_1_T_168 | _io_rdata_1_T_106; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_170 = _io_rdata_1_T_169 | _io_rdata_1_T_107; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_171 = _io_rdata_1_T_170 | _io_rdata_1_T_108; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_172 = _io_rdata_1_T_171 | _io_rdata_1_T_109; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_173 = _io_rdata_1_T_172 | _io_rdata_1_T_110; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_174 = _io_rdata_1_T_173 | _io_rdata_1_T_111; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_175 = _io_rdata_1_T_174 | _io_rdata_1_T_112; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_176 = _io_rdata_1_T_175 | _io_rdata_1_T_113; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_177 = _io_rdata_1_T_176 | _io_rdata_1_T_114; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_178 = _io_rdata_1_T_177 | _io_rdata_1_T_115; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_179 = _io_rdata_1_T_178 | _io_rdata_1_T_116; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_180 = _io_rdata_1_T_179 | _io_rdata_1_T_117; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_181 = _io_rdata_1_T_180 | _io_rdata_1_T_118; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_182 = _io_rdata_1_T_181 | _io_rdata_1_T_119; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_183 = _io_rdata_1_T_182 | _io_rdata_1_T_120; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_184 = _io_rdata_1_T_183 | _io_rdata_1_T_121; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_185 = _io_rdata_1_T_184 | _io_rdata_1_T_122; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_186 = _io_rdata_1_T_185 | _io_rdata_1_T_123; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_187 = _io_rdata_1_T_186 | _io_rdata_1_T_124; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_188 = _io_rdata_1_T_187 | _io_rdata_1_T_125; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_189 = _io_rdata_1_T_188 | _io_rdata_1_T_126; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_190 = _io_rdata_1_T_189 | _io_rdata_1_T_127; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_191 = _io_rdata_1_T_190 | _io_rdata_1_T_128; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_192 = _io_rdata_1_T_191 | _io_rdata_1_T_129; // @[Mux.scala 27:73]
  wire [1:0] _io_rdata_1_T_193 = _io_rdata_1_T_192 | _io_rdata_1_T_130; // @[Mux.scala 27:73]
  wire [63:0] waddr_dec_0 = 64'h1 << io_waddr_0; // @[OneHot.scala 57:35]
  wire [63:0] waddr_dec_1 = 64'h1 << io_waddr_1; // @[OneHot.scala 57:35]
  wire  write_wen_0 = io_wen_0 & waddr_dec_0[0]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1 = io_wen_1 & waddr_dec_1[0]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_4 = {write_wen_1,write_wen_0}; // @[DataModuleTemplate.scala 189:30]
  wire [1:0] _data_0_T = write_wen_0 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_0_T_1 = write_wen_1 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_0_T_2 = _data_0_T | _data_0_T_1; // @[Mux.scala 27:73]
  wire  write_wen_0_1 = io_wen_0 & waddr_dec_0[1]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_1 = io_wen_1 & waddr_dec_1[1]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_6 = {write_wen_1_1,write_wen_0_1}; // @[DataModuleTemplate.scala 189:30]
  wire [1:0] _data_1_T = write_wen_0_1 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_1_T_1 = write_wen_1_1 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_1_T_2 = _data_1_T | _data_1_T_1; // @[Mux.scala 27:73]
  wire  write_wen_0_2 = io_wen_0 & waddr_dec_0[2]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_2 = io_wen_1 & waddr_dec_1[2]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_8 = {write_wen_1_2,write_wen_0_2}; // @[DataModuleTemplate.scala 189:30]
  wire [1:0] _data_2_T = write_wen_0_2 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_2_T_1 = write_wen_1_2 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_2_T_2 = _data_2_T | _data_2_T_1; // @[Mux.scala 27:73]
  wire  write_wen_0_3 = io_wen_0 & waddr_dec_0[3]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_3 = io_wen_1 & waddr_dec_1[3]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_10 = {write_wen_1_3,write_wen_0_3}; // @[DataModuleTemplate.scala 189:30]
  wire [1:0] _data_3_T = write_wen_0_3 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_3_T_1 = write_wen_1_3 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_3_T_2 = _data_3_T | _data_3_T_1; // @[Mux.scala 27:73]
  wire  write_wen_0_4 = io_wen_0 & waddr_dec_0[4]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_4 = io_wen_1 & waddr_dec_1[4]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_12 = {write_wen_1_4,write_wen_0_4}; // @[DataModuleTemplate.scala 189:30]
  wire [1:0] _data_4_T = write_wen_0_4 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_4_T_1 = write_wen_1_4 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_4_T_2 = _data_4_T | _data_4_T_1; // @[Mux.scala 27:73]
  wire  write_wen_0_5 = io_wen_0 & waddr_dec_0[5]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_5 = io_wen_1 & waddr_dec_1[5]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_14 = {write_wen_1_5,write_wen_0_5}; // @[DataModuleTemplate.scala 189:30]
  wire [1:0] _data_5_T = write_wen_0_5 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_5_T_1 = write_wen_1_5 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_5_T_2 = _data_5_T | _data_5_T_1; // @[Mux.scala 27:73]
  wire  write_wen_0_6 = io_wen_0 & waddr_dec_0[6]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_6 = io_wen_1 & waddr_dec_1[6]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_16 = {write_wen_1_6,write_wen_0_6}; // @[DataModuleTemplate.scala 189:30]
  wire [1:0] _data_6_T = write_wen_0_6 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_6_T_1 = write_wen_1_6 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_6_T_2 = _data_6_T | _data_6_T_1; // @[Mux.scala 27:73]
  wire  write_wen_0_7 = io_wen_0 & waddr_dec_0[7]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_7 = io_wen_1 & waddr_dec_1[7]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_18 = {write_wen_1_7,write_wen_0_7}; // @[DataModuleTemplate.scala 189:30]
  wire [1:0] _data_7_T = write_wen_0_7 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_7_T_1 = write_wen_1_7 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_7_T_2 = _data_7_T | _data_7_T_1; // @[Mux.scala 27:73]
  wire  write_wen_0_8 = io_wen_0 & waddr_dec_0[8]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_8 = io_wen_1 & waddr_dec_1[8]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_20 = {write_wen_1_8,write_wen_0_8}; // @[DataModuleTemplate.scala 189:30]
  wire [1:0] _data_8_T = write_wen_0_8 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_8_T_1 = write_wen_1_8 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_8_T_2 = _data_8_T | _data_8_T_1; // @[Mux.scala 27:73]
  wire  write_wen_0_9 = io_wen_0 & waddr_dec_0[9]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_9 = io_wen_1 & waddr_dec_1[9]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_22 = {write_wen_1_9,write_wen_0_9}; // @[DataModuleTemplate.scala 189:30]
  wire [1:0] _data_9_T = write_wen_0_9 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_9_T_1 = write_wen_1_9 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_9_T_2 = _data_9_T | _data_9_T_1; // @[Mux.scala 27:73]
  wire  write_wen_0_10 = io_wen_0 & waddr_dec_0[10]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_10 = io_wen_1 & waddr_dec_1[10]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_24 = {write_wen_1_10,write_wen_0_10}; // @[DataModuleTemplate.scala 189:30]
  wire [1:0] _data_10_T = write_wen_0_10 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_10_T_1 = write_wen_1_10 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_10_T_2 = _data_10_T | _data_10_T_1; // @[Mux.scala 27:73]
  wire  write_wen_0_11 = io_wen_0 & waddr_dec_0[11]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_11 = io_wen_1 & waddr_dec_1[11]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_26 = {write_wen_1_11,write_wen_0_11}; // @[DataModuleTemplate.scala 189:30]
  wire [1:0] _data_11_T = write_wen_0_11 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_11_T_1 = write_wen_1_11 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_11_T_2 = _data_11_T | _data_11_T_1; // @[Mux.scala 27:73]
  wire  write_wen_0_12 = io_wen_0 & waddr_dec_0[12]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_12 = io_wen_1 & waddr_dec_1[12]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_28 = {write_wen_1_12,write_wen_0_12}; // @[DataModuleTemplate.scala 189:30]
  wire [1:0] _data_12_T = write_wen_0_12 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_12_T_1 = write_wen_1_12 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_12_T_2 = _data_12_T | _data_12_T_1; // @[Mux.scala 27:73]
  wire  write_wen_0_13 = io_wen_0 & waddr_dec_0[13]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_13 = io_wen_1 & waddr_dec_1[13]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_30 = {write_wen_1_13,write_wen_0_13}; // @[DataModuleTemplate.scala 189:30]
  wire [1:0] _data_13_T = write_wen_0_13 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_13_T_1 = write_wen_1_13 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_13_T_2 = _data_13_T | _data_13_T_1; // @[Mux.scala 27:73]
  wire  write_wen_0_14 = io_wen_0 & waddr_dec_0[14]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_14 = io_wen_1 & waddr_dec_1[14]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_32 = {write_wen_1_14,write_wen_0_14}; // @[DataModuleTemplate.scala 189:30]
  wire [1:0] _data_14_T = write_wen_0_14 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_14_T_1 = write_wen_1_14 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_14_T_2 = _data_14_T | _data_14_T_1; // @[Mux.scala 27:73]
  wire  write_wen_0_15 = io_wen_0 & waddr_dec_0[15]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_15 = io_wen_1 & waddr_dec_1[15]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_34 = {write_wen_1_15,write_wen_0_15}; // @[DataModuleTemplate.scala 189:30]
  wire [1:0] _data_15_T = write_wen_0_15 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_15_T_1 = write_wen_1_15 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_15_T_2 = _data_15_T | _data_15_T_1; // @[Mux.scala 27:73]
  wire  write_wen_0_16 = io_wen_0 & waddr_dec_0[16]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_16 = io_wen_1 & waddr_dec_1[16]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_36 = {write_wen_1_16,write_wen_0_16}; // @[DataModuleTemplate.scala 189:30]
  wire [1:0] _data_16_T = write_wen_0_16 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_16_T_1 = write_wen_1_16 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_16_T_2 = _data_16_T | _data_16_T_1; // @[Mux.scala 27:73]
  wire  write_wen_0_17 = io_wen_0 & waddr_dec_0[17]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_17 = io_wen_1 & waddr_dec_1[17]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_38 = {write_wen_1_17,write_wen_0_17}; // @[DataModuleTemplate.scala 189:30]
  wire [1:0] _data_17_T = write_wen_0_17 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_17_T_1 = write_wen_1_17 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_17_T_2 = _data_17_T | _data_17_T_1; // @[Mux.scala 27:73]
  wire  write_wen_0_18 = io_wen_0 & waddr_dec_0[18]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_18 = io_wen_1 & waddr_dec_1[18]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_40 = {write_wen_1_18,write_wen_0_18}; // @[DataModuleTemplate.scala 189:30]
  wire [1:0] _data_18_T = write_wen_0_18 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_18_T_1 = write_wen_1_18 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_18_T_2 = _data_18_T | _data_18_T_1; // @[Mux.scala 27:73]
  wire  write_wen_0_19 = io_wen_0 & waddr_dec_0[19]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_19 = io_wen_1 & waddr_dec_1[19]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_42 = {write_wen_1_19,write_wen_0_19}; // @[DataModuleTemplate.scala 189:30]
  wire [1:0] _data_19_T = write_wen_0_19 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_19_T_1 = write_wen_1_19 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_19_T_2 = _data_19_T | _data_19_T_1; // @[Mux.scala 27:73]
  wire  write_wen_0_20 = io_wen_0 & waddr_dec_0[20]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_20 = io_wen_1 & waddr_dec_1[20]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_44 = {write_wen_1_20,write_wen_0_20}; // @[DataModuleTemplate.scala 189:30]
  wire [1:0] _data_20_T = write_wen_0_20 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_20_T_1 = write_wen_1_20 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_20_T_2 = _data_20_T | _data_20_T_1; // @[Mux.scala 27:73]
  wire  write_wen_0_21 = io_wen_0 & waddr_dec_0[21]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_21 = io_wen_1 & waddr_dec_1[21]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_46 = {write_wen_1_21,write_wen_0_21}; // @[DataModuleTemplate.scala 189:30]
  wire [1:0] _data_21_T = write_wen_0_21 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_21_T_1 = write_wen_1_21 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_21_T_2 = _data_21_T | _data_21_T_1; // @[Mux.scala 27:73]
  wire  write_wen_0_22 = io_wen_0 & waddr_dec_0[22]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_22 = io_wen_1 & waddr_dec_1[22]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_48 = {write_wen_1_22,write_wen_0_22}; // @[DataModuleTemplate.scala 189:30]
  wire [1:0] _data_22_T = write_wen_0_22 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_22_T_1 = write_wen_1_22 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_22_T_2 = _data_22_T | _data_22_T_1; // @[Mux.scala 27:73]
  wire  write_wen_0_23 = io_wen_0 & waddr_dec_0[23]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_23 = io_wen_1 & waddr_dec_1[23]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_50 = {write_wen_1_23,write_wen_0_23}; // @[DataModuleTemplate.scala 189:30]
  wire [1:0] _data_23_T = write_wen_0_23 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_23_T_1 = write_wen_1_23 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_23_T_2 = _data_23_T | _data_23_T_1; // @[Mux.scala 27:73]
  wire  write_wen_0_24 = io_wen_0 & waddr_dec_0[24]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_24 = io_wen_1 & waddr_dec_1[24]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_52 = {write_wen_1_24,write_wen_0_24}; // @[DataModuleTemplate.scala 189:30]
  wire [1:0] _data_24_T = write_wen_0_24 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_24_T_1 = write_wen_1_24 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_24_T_2 = _data_24_T | _data_24_T_1; // @[Mux.scala 27:73]
  wire  write_wen_0_25 = io_wen_0 & waddr_dec_0[25]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_25 = io_wen_1 & waddr_dec_1[25]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_54 = {write_wen_1_25,write_wen_0_25}; // @[DataModuleTemplate.scala 189:30]
  wire [1:0] _data_25_T = write_wen_0_25 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_25_T_1 = write_wen_1_25 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_25_T_2 = _data_25_T | _data_25_T_1; // @[Mux.scala 27:73]
  wire  write_wen_0_26 = io_wen_0 & waddr_dec_0[26]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_26 = io_wen_1 & waddr_dec_1[26]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_56 = {write_wen_1_26,write_wen_0_26}; // @[DataModuleTemplate.scala 189:30]
  wire [1:0] _data_26_T = write_wen_0_26 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_26_T_1 = write_wen_1_26 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_26_T_2 = _data_26_T | _data_26_T_1; // @[Mux.scala 27:73]
  wire  write_wen_0_27 = io_wen_0 & waddr_dec_0[27]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_27 = io_wen_1 & waddr_dec_1[27]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_58 = {write_wen_1_27,write_wen_0_27}; // @[DataModuleTemplate.scala 189:30]
  wire [1:0] _data_27_T = write_wen_0_27 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_27_T_1 = write_wen_1_27 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_27_T_2 = _data_27_T | _data_27_T_1; // @[Mux.scala 27:73]
  wire  write_wen_0_28 = io_wen_0 & waddr_dec_0[28]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_28 = io_wen_1 & waddr_dec_1[28]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_60 = {write_wen_1_28,write_wen_0_28}; // @[DataModuleTemplate.scala 189:30]
  wire [1:0] _data_28_T = write_wen_0_28 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_28_T_1 = write_wen_1_28 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_28_T_2 = _data_28_T | _data_28_T_1; // @[Mux.scala 27:73]
  wire  write_wen_0_29 = io_wen_0 & waddr_dec_0[29]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_29 = io_wen_1 & waddr_dec_1[29]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_62 = {write_wen_1_29,write_wen_0_29}; // @[DataModuleTemplate.scala 189:30]
  wire [1:0] _data_29_T = write_wen_0_29 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_29_T_1 = write_wen_1_29 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_29_T_2 = _data_29_T | _data_29_T_1; // @[Mux.scala 27:73]
  wire  write_wen_0_30 = io_wen_0 & waddr_dec_0[30]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_30 = io_wen_1 & waddr_dec_1[30]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_64 = {write_wen_1_30,write_wen_0_30}; // @[DataModuleTemplate.scala 189:30]
  wire [1:0] _data_30_T = write_wen_0_30 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_30_T_1 = write_wen_1_30 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_30_T_2 = _data_30_T | _data_30_T_1; // @[Mux.scala 27:73]
  wire  write_wen_0_31 = io_wen_0 & waddr_dec_0[31]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_31 = io_wen_1 & waddr_dec_1[31]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_66 = {write_wen_1_31,write_wen_0_31}; // @[DataModuleTemplate.scala 189:30]
  wire [1:0] _data_31_T = write_wen_0_31 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_31_T_1 = write_wen_1_31 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_31_T_2 = _data_31_T | _data_31_T_1; // @[Mux.scala 27:73]
  wire  write_wen_0_32 = io_wen_0 & waddr_dec_0[32]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_32 = io_wen_1 & waddr_dec_1[32]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_68 = {write_wen_1_32,write_wen_0_32}; // @[DataModuleTemplate.scala 189:30]
  wire [1:0] _data_32_T = write_wen_0_32 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_32_T_1 = write_wen_1_32 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_32_T_2 = _data_32_T | _data_32_T_1; // @[Mux.scala 27:73]
  wire  write_wen_0_33 = io_wen_0 & waddr_dec_0[33]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_33 = io_wen_1 & waddr_dec_1[33]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_70 = {write_wen_1_33,write_wen_0_33}; // @[DataModuleTemplate.scala 189:30]
  wire [1:0] _data_33_T = write_wen_0_33 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_33_T_1 = write_wen_1_33 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_33_T_2 = _data_33_T | _data_33_T_1; // @[Mux.scala 27:73]
  wire  write_wen_0_34 = io_wen_0 & waddr_dec_0[34]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_34 = io_wen_1 & waddr_dec_1[34]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_72 = {write_wen_1_34,write_wen_0_34}; // @[DataModuleTemplate.scala 189:30]
  wire [1:0] _data_34_T = write_wen_0_34 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_34_T_1 = write_wen_1_34 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_34_T_2 = _data_34_T | _data_34_T_1; // @[Mux.scala 27:73]
  wire  write_wen_0_35 = io_wen_0 & waddr_dec_0[35]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_35 = io_wen_1 & waddr_dec_1[35]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_74 = {write_wen_1_35,write_wen_0_35}; // @[DataModuleTemplate.scala 189:30]
  wire [1:0] _data_35_T = write_wen_0_35 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_35_T_1 = write_wen_1_35 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_35_T_2 = _data_35_T | _data_35_T_1; // @[Mux.scala 27:73]
  wire  write_wen_0_36 = io_wen_0 & waddr_dec_0[36]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_36 = io_wen_1 & waddr_dec_1[36]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_76 = {write_wen_1_36,write_wen_0_36}; // @[DataModuleTemplate.scala 189:30]
  wire [1:0] _data_36_T = write_wen_0_36 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_36_T_1 = write_wen_1_36 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_36_T_2 = _data_36_T | _data_36_T_1; // @[Mux.scala 27:73]
  wire  write_wen_0_37 = io_wen_0 & waddr_dec_0[37]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_37 = io_wen_1 & waddr_dec_1[37]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_78 = {write_wen_1_37,write_wen_0_37}; // @[DataModuleTemplate.scala 189:30]
  wire [1:0] _data_37_T = write_wen_0_37 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_37_T_1 = write_wen_1_37 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_37_T_2 = _data_37_T | _data_37_T_1; // @[Mux.scala 27:73]
  wire  write_wen_0_38 = io_wen_0 & waddr_dec_0[38]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_38 = io_wen_1 & waddr_dec_1[38]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_80 = {write_wen_1_38,write_wen_0_38}; // @[DataModuleTemplate.scala 189:30]
  wire [1:0] _data_38_T = write_wen_0_38 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_38_T_1 = write_wen_1_38 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_38_T_2 = _data_38_T | _data_38_T_1; // @[Mux.scala 27:73]
  wire  write_wen_0_39 = io_wen_0 & waddr_dec_0[39]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_39 = io_wen_1 & waddr_dec_1[39]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_82 = {write_wen_1_39,write_wen_0_39}; // @[DataModuleTemplate.scala 189:30]
  wire [1:0] _data_39_T = write_wen_0_39 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_39_T_1 = write_wen_1_39 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_39_T_2 = _data_39_T | _data_39_T_1; // @[Mux.scala 27:73]
  wire  write_wen_0_40 = io_wen_0 & waddr_dec_0[40]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_40 = io_wen_1 & waddr_dec_1[40]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_84 = {write_wen_1_40,write_wen_0_40}; // @[DataModuleTemplate.scala 189:30]
  wire [1:0] _data_40_T = write_wen_0_40 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_40_T_1 = write_wen_1_40 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_40_T_2 = _data_40_T | _data_40_T_1; // @[Mux.scala 27:73]
  wire  write_wen_0_41 = io_wen_0 & waddr_dec_0[41]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_41 = io_wen_1 & waddr_dec_1[41]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_86 = {write_wen_1_41,write_wen_0_41}; // @[DataModuleTemplate.scala 189:30]
  wire [1:0] _data_41_T = write_wen_0_41 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_41_T_1 = write_wen_1_41 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_41_T_2 = _data_41_T | _data_41_T_1; // @[Mux.scala 27:73]
  wire  write_wen_0_42 = io_wen_0 & waddr_dec_0[42]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_42 = io_wen_1 & waddr_dec_1[42]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_88 = {write_wen_1_42,write_wen_0_42}; // @[DataModuleTemplate.scala 189:30]
  wire [1:0] _data_42_T = write_wen_0_42 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_42_T_1 = write_wen_1_42 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_42_T_2 = _data_42_T | _data_42_T_1; // @[Mux.scala 27:73]
  wire  write_wen_0_43 = io_wen_0 & waddr_dec_0[43]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_43 = io_wen_1 & waddr_dec_1[43]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_90 = {write_wen_1_43,write_wen_0_43}; // @[DataModuleTemplate.scala 189:30]
  wire [1:0] _data_43_T = write_wen_0_43 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_43_T_1 = write_wen_1_43 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_43_T_2 = _data_43_T | _data_43_T_1; // @[Mux.scala 27:73]
  wire  write_wen_0_44 = io_wen_0 & waddr_dec_0[44]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_44 = io_wen_1 & waddr_dec_1[44]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_92 = {write_wen_1_44,write_wen_0_44}; // @[DataModuleTemplate.scala 189:30]
  wire [1:0] _data_44_T = write_wen_0_44 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_44_T_1 = write_wen_1_44 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_44_T_2 = _data_44_T | _data_44_T_1; // @[Mux.scala 27:73]
  wire  write_wen_0_45 = io_wen_0 & waddr_dec_0[45]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_45 = io_wen_1 & waddr_dec_1[45]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_94 = {write_wen_1_45,write_wen_0_45}; // @[DataModuleTemplate.scala 189:30]
  wire [1:0] _data_45_T = write_wen_0_45 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_45_T_1 = write_wen_1_45 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_45_T_2 = _data_45_T | _data_45_T_1; // @[Mux.scala 27:73]
  wire  write_wen_0_46 = io_wen_0 & waddr_dec_0[46]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_46 = io_wen_1 & waddr_dec_1[46]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_96 = {write_wen_1_46,write_wen_0_46}; // @[DataModuleTemplate.scala 189:30]
  wire [1:0] _data_46_T = write_wen_0_46 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_46_T_1 = write_wen_1_46 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_46_T_2 = _data_46_T | _data_46_T_1; // @[Mux.scala 27:73]
  wire  write_wen_0_47 = io_wen_0 & waddr_dec_0[47]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_47 = io_wen_1 & waddr_dec_1[47]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_98 = {write_wen_1_47,write_wen_0_47}; // @[DataModuleTemplate.scala 189:30]
  wire [1:0] _data_47_T = write_wen_0_47 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_47_T_1 = write_wen_1_47 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_47_T_2 = _data_47_T | _data_47_T_1; // @[Mux.scala 27:73]
  wire  write_wen_0_48 = io_wen_0 & waddr_dec_0[48]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_48 = io_wen_1 & waddr_dec_1[48]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_100 = {write_wen_1_48,write_wen_0_48}; // @[DataModuleTemplate.scala 189:30]
  wire [1:0] _data_48_T = write_wen_0_48 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_48_T_1 = write_wen_1_48 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_48_T_2 = _data_48_T | _data_48_T_1; // @[Mux.scala 27:73]
  wire  write_wen_0_49 = io_wen_0 & waddr_dec_0[49]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_49 = io_wen_1 & waddr_dec_1[49]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_102 = {write_wen_1_49,write_wen_0_49}; // @[DataModuleTemplate.scala 189:30]
  wire [1:0] _data_49_T = write_wen_0_49 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_49_T_1 = write_wen_1_49 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_49_T_2 = _data_49_T | _data_49_T_1; // @[Mux.scala 27:73]
  wire  write_wen_0_50 = io_wen_0 & waddr_dec_0[50]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_50 = io_wen_1 & waddr_dec_1[50]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_104 = {write_wen_1_50,write_wen_0_50}; // @[DataModuleTemplate.scala 189:30]
  wire [1:0] _data_50_T = write_wen_0_50 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_50_T_1 = write_wen_1_50 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_50_T_2 = _data_50_T | _data_50_T_1; // @[Mux.scala 27:73]
  wire  write_wen_0_51 = io_wen_0 & waddr_dec_0[51]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_51 = io_wen_1 & waddr_dec_1[51]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_106 = {write_wen_1_51,write_wen_0_51}; // @[DataModuleTemplate.scala 189:30]
  wire [1:0] _data_51_T = write_wen_0_51 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_51_T_1 = write_wen_1_51 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_51_T_2 = _data_51_T | _data_51_T_1; // @[Mux.scala 27:73]
  wire  write_wen_0_52 = io_wen_0 & waddr_dec_0[52]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_52 = io_wen_1 & waddr_dec_1[52]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_108 = {write_wen_1_52,write_wen_0_52}; // @[DataModuleTemplate.scala 189:30]
  wire [1:0] _data_52_T = write_wen_0_52 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_52_T_1 = write_wen_1_52 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_52_T_2 = _data_52_T | _data_52_T_1; // @[Mux.scala 27:73]
  wire  write_wen_0_53 = io_wen_0 & waddr_dec_0[53]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_53 = io_wen_1 & waddr_dec_1[53]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_110 = {write_wen_1_53,write_wen_0_53}; // @[DataModuleTemplate.scala 189:30]
  wire [1:0] _data_53_T = write_wen_0_53 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_53_T_1 = write_wen_1_53 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_53_T_2 = _data_53_T | _data_53_T_1; // @[Mux.scala 27:73]
  wire  write_wen_0_54 = io_wen_0 & waddr_dec_0[54]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_54 = io_wen_1 & waddr_dec_1[54]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_112 = {write_wen_1_54,write_wen_0_54}; // @[DataModuleTemplate.scala 189:30]
  wire [1:0] _data_54_T = write_wen_0_54 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_54_T_1 = write_wen_1_54 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_54_T_2 = _data_54_T | _data_54_T_1; // @[Mux.scala 27:73]
  wire  write_wen_0_55 = io_wen_0 & waddr_dec_0[55]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_55 = io_wen_1 & waddr_dec_1[55]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_114 = {write_wen_1_55,write_wen_0_55}; // @[DataModuleTemplate.scala 189:30]
  wire [1:0] _data_55_T = write_wen_0_55 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_55_T_1 = write_wen_1_55 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_55_T_2 = _data_55_T | _data_55_T_1; // @[Mux.scala 27:73]
  wire  write_wen_0_56 = io_wen_0 & waddr_dec_0[56]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_56 = io_wen_1 & waddr_dec_1[56]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_116 = {write_wen_1_56,write_wen_0_56}; // @[DataModuleTemplate.scala 189:30]
  wire [1:0] _data_56_T = write_wen_0_56 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_56_T_1 = write_wen_1_56 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_56_T_2 = _data_56_T | _data_56_T_1; // @[Mux.scala 27:73]
  wire  write_wen_0_57 = io_wen_0 & waddr_dec_0[57]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_57 = io_wen_1 & waddr_dec_1[57]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_118 = {write_wen_1_57,write_wen_0_57}; // @[DataModuleTemplate.scala 189:30]
  wire [1:0] _data_57_T = write_wen_0_57 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_57_T_1 = write_wen_1_57 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_57_T_2 = _data_57_T | _data_57_T_1; // @[Mux.scala 27:73]
  wire  write_wen_0_58 = io_wen_0 & waddr_dec_0[58]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_58 = io_wen_1 & waddr_dec_1[58]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_120 = {write_wen_1_58,write_wen_0_58}; // @[DataModuleTemplate.scala 189:30]
  wire [1:0] _data_58_T = write_wen_0_58 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_58_T_1 = write_wen_1_58 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_58_T_2 = _data_58_T | _data_58_T_1; // @[Mux.scala 27:73]
  wire  write_wen_0_59 = io_wen_0 & waddr_dec_0[59]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_59 = io_wen_1 & waddr_dec_1[59]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_122 = {write_wen_1_59,write_wen_0_59}; // @[DataModuleTemplate.scala 189:30]
  wire [1:0] _data_59_T = write_wen_0_59 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_59_T_1 = write_wen_1_59 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_59_T_2 = _data_59_T | _data_59_T_1; // @[Mux.scala 27:73]
  wire  write_wen_0_60 = io_wen_0 & waddr_dec_0[60]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_60 = io_wen_1 & waddr_dec_1[60]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_124 = {write_wen_1_60,write_wen_0_60}; // @[DataModuleTemplate.scala 189:30]
  wire [1:0] _data_60_T = write_wen_0_60 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_60_T_1 = write_wen_1_60 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_60_T_2 = _data_60_T | _data_60_T_1; // @[Mux.scala 27:73]
  wire  write_wen_0_61 = io_wen_0 & waddr_dec_0[61]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_61 = io_wen_1 & waddr_dec_1[61]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_126 = {write_wen_1_61,write_wen_0_61}; // @[DataModuleTemplate.scala 189:30]
  wire [1:0] _data_61_T = write_wen_0_61 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_61_T_1 = write_wen_1_61 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_61_T_2 = _data_61_T | _data_61_T_1; // @[Mux.scala 27:73]
  wire  write_wen_0_62 = io_wen_0 & waddr_dec_0[62]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_62 = io_wen_1 & waddr_dec_1[62]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_128 = {write_wen_1_62,write_wen_0_62}; // @[DataModuleTemplate.scala 189:30]
  wire [1:0] _data_62_T = write_wen_0_62 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_62_T_1 = write_wen_1_62 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_62_T_2 = _data_62_T | _data_62_T_1; // @[Mux.scala 27:73]
  wire  write_wen_0_63 = io_wen_0 & waddr_dec_0[63]; // @[DataModuleTemplate.scala 188:57]
  wire  write_wen_1_63 = io_wen_1 & waddr_dec_1[63]; // @[DataModuleTemplate.scala 188:57]
  wire [1:0] _T_130 = {write_wen_1_63,write_wen_0_63}; // @[DataModuleTemplate.scala 189:30]
  wire [1:0] _data_63_T = write_wen_0_63 ? io_wdata_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_63_T_1 = write_wen_1_63 ? io_wdata_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _data_63_T_2 = _data_63_T | _data_63_T_1; // @[Mux.scala 27:73]
  assign io_rdata_0 = |_T ? _io_rdata_0_T_2 : _io_rdata_0_T_193; // @[DataModuleTemplate.scala 178:40 179:19 181:19]
  assign io_rdata_1 = |_T_2 ? _io_rdata_1_T_2 : _io_rdata_1_T_193; // @[DataModuleTemplate.scala 178:40 179:19 181:19]
  always @(negedge clock) begin
    if (|_T_4) begin // @[DataModuleTemplate.scala 189:42]
      data_0 <= _data_0_T_2; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_6) begin // @[DataModuleTemplate.scala 189:42]
      data_1 <= _data_1_T_2; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_8) begin // @[DataModuleTemplate.scala 189:42]
      data_2 <= _data_2_T_2; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_10) begin // @[DataModuleTemplate.scala 189:42]
      data_3 <= _data_3_T_2; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_12) begin // @[DataModuleTemplate.scala 189:42]
      data_4 <= _data_4_T_2; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_14) begin // @[DataModuleTemplate.scala 189:42]
      data_5 <= _data_5_T_2; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_16) begin // @[DataModuleTemplate.scala 189:42]
      data_6 <= _data_6_T_2; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_18) begin // @[DataModuleTemplate.scala 189:42]
      data_7 <= _data_7_T_2; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_20) begin // @[DataModuleTemplate.scala 189:42]
      data_8 <= _data_8_T_2; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_22) begin // @[DataModuleTemplate.scala 189:42]
      data_9 <= _data_9_T_2; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_24) begin // @[DataModuleTemplate.scala 189:42]
      data_10 <= _data_10_T_2; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_26) begin // @[DataModuleTemplate.scala 189:42]
      data_11 <= _data_11_T_2; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_28) begin // @[DataModuleTemplate.scala 189:42]
      data_12 <= _data_12_T_2; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_30) begin // @[DataModuleTemplate.scala 189:42]
      data_13 <= _data_13_T_2; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_32) begin // @[DataModuleTemplate.scala 189:42]
      data_14 <= _data_14_T_2; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_34) begin // @[DataModuleTemplate.scala 189:42]
      data_15 <= _data_15_T_2; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_36) begin // @[DataModuleTemplate.scala 189:42]
      data_16 <= _data_16_T_2; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_38) begin // @[DataModuleTemplate.scala 189:42]
      data_17 <= _data_17_T_2; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_40) begin // @[DataModuleTemplate.scala 189:42]
      data_18 <= _data_18_T_2; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_42) begin // @[DataModuleTemplate.scala 189:42]
      data_19 <= _data_19_T_2; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_44) begin // @[DataModuleTemplate.scala 189:42]
      data_20 <= _data_20_T_2; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_46) begin // @[DataModuleTemplate.scala 189:42]
      data_21 <= _data_21_T_2; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_48) begin // @[DataModuleTemplate.scala 189:42]
      data_22 <= _data_22_T_2; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_50) begin // @[DataModuleTemplate.scala 189:42]
      data_23 <= _data_23_T_2; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_52) begin // @[DataModuleTemplate.scala 189:42]
      data_24 <= _data_24_T_2; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_54) begin // @[DataModuleTemplate.scala 189:42]
      data_25 <= _data_25_T_2; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_56) begin // @[DataModuleTemplate.scala 189:42]
      data_26 <= _data_26_T_2; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_58) begin // @[DataModuleTemplate.scala 189:42]
      data_27 <= _data_27_T_2; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_60) begin // @[DataModuleTemplate.scala 189:42]
      data_28 <= _data_28_T_2; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_62) begin // @[DataModuleTemplate.scala 189:42]
      data_29 <= _data_29_T_2; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_64) begin // @[DataModuleTemplate.scala 189:42]
      data_30 <= _data_30_T_2; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_66) begin // @[DataModuleTemplate.scala 189:42]
      data_31 <= _data_31_T_2; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_68) begin // @[DataModuleTemplate.scala 189:42]
      data_32 <= _data_32_T_2; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_70) begin // @[DataModuleTemplate.scala 189:42]
      data_33 <= _data_33_T_2; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_72) begin // @[DataModuleTemplate.scala 189:42]
      data_34 <= _data_34_T_2; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_74) begin // @[DataModuleTemplate.scala 189:42]
      data_35 <= _data_35_T_2; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_76) begin // @[DataModuleTemplate.scala 189:42]
      data_36 <= _data_36_T_2; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_78) begin // @[DataModuleTemplate.scala 189:42]
      data_37 <= _data_37_T_2; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_80) begin // @[DataModuleTemplate.scala 189:42]
      data_38 <= _data_38_T_2; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_82) begin // @[DataModuleTemplate.scala 189:42]
      data_39 <= _data_39_T_2; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_84) begin // @[DataModuleTemplate.scala 189:42]
      data_40 <= _data_40_T_2; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_86) begin // @[DataModuleTemplate.scala 189:42]
      data_41 <= _data_41_T_2; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_88) begin // @[DataModuleTemplate.scala 189:42]
      data_42 <= _data_42_T_2; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_90) begin // @[DataModuleTemplate.scala 189:42]
      data_43 <= _data_43_T_2; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_92) begin // @[DataModuleTemplate.scala 189:42]
      data_44 <= _data_44_T_2; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_94) begin // @[DataModuleTemplate.scala 189:42]
      data_45 <= _data_45_T_2; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_96) begin // @[DataModuleTemplate.scala 189:42]
      data_46 <= _data_46_T_2; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_98) begin // @[DataModuleTemplate.scala 189:42]
      data_47 <= _data_47_T_2; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_100) begin // @[DataModuleTemplate.scala 189:42]
      data_48 <= _data_48_T_2; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_102) begin // @[DataModuleTemplate.scala 189:42]
      data_49 <= _data_49_T_2; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_104) begin // @[DataModuleTemplate.scala 189:42]
      data_50 <= _data_50_T_2; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_106) begin // @[DataModuleTemplate.scala 189:42]
      data_51 <= _data_51_T_2; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_108) begin // @[DataModuleTemplate.scala 189:42]
      data_52 <= _data_52_T_2; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_110) begin // @[DataModuleTemplate.scala 189:42]
      data_53 <= _data_53_T_2; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_112) begin // @[DataModuleTemplate.scala 189:42]
      data_54 <= _data_54_T_2; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_114) begin // @[DataModuleTemplate.scala 189:42]
      data_55 <= _data_55_T_2; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_116) begin // @[DataModuleTemplate.scala 189:42]
      data_56 <= _data_56_T_2; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_118) begin // @[DataModuleTemplate.scala 189:42]
      data_57 <= _data_57_T_2; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_120) begin // @[DataModuleTemplate.scala 189:42]
      data_58 <= _data_58_T_2; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_122) begin // @[DataModuleTemplate.scala 189:42]
      data_59 <= _data_59_T_2; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_124) begin // @[DataModuleTemplate.scala 189:42]
      data_60 <= _data_60_T_2; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_126) begin // @[DataModuleTemplate.scala 189:42]
      data_61 <= _data_61_T_2; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_128) begin // @[DataModuleTemplate.scala 189:42]
      data_62 <= _data_62_T_2; // @[DataModuleTemplate.scala 190:15]
    end
    if (|_T_130) begin // @[DataModuleTemplate.scala 189:42]
      data_63 <= _data_63_T_2; // @[DataModuleTemplate.scala 190:15]
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
  data_0 = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  data_1 = _RAND_1[1:0];
  _RAND_2 = {1{`RANDOM}};
  data_2 = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  data_3 = _RAND_3[1:0];
  _RAND_4 = {1{`RANDOM}};
  data_4 = _RAND_4[1:0];
  _RAND_5 = {1{`RANDOM}};
  data_5 = _RAND_5[1:0];
  _RAND_6 = {1{`RANDOM}};
  data_6 = _RAND_6[1:0];
  _RAND_7 = {1{`RANDOM}};
  data_7 = _RAND_7[1:0];
  _RAND_8 = {1{`RANDOM}};
  data_8 = _RAND_8[1:0];
  _RAND_9 = {1{`RANDOM}};
  data_9 = _RAND_9[1:0];
  _RAND_10 = {1{`RANDOM}};
  data_10 = _RAND_10[1:0];
  _RAND_11 = {1{`RANDOM}};
  data_11 = _RAND_11[1:0];
  _RAND_12 = {1{`RANDOM}};
  data_12 = _RAND_12[1:0];
  _RAND_13 = {1{`RANDOM}};
  data_13 = _RAND_13[1:0];
  _RAND_14 = {1{`RANDOM}};
  data_14 = _RAND_14[1:0];
  _RAND_15 = {1{`RANDOM}};
  data_15 = _RAND_15[1:0];
  _RAND_16 = {1{`RANDOM}};
  data_16 = _RAND_16[1:0];
  _RAND_17 = {1{`RANDOM}};
  data_17 = _RAND_17[1:0];
  _RAND_18 = {1{`RANDOM}};
  data_18 = _RAND_18[1:0];
  _RAND_19 = {1{`RANDOM}};
  data_19 = _RAND_19[1:0];
  _RAND_20 = {1{`RANDOM}};
  data_20 = _RAND_20[1:0];
  _RAND_21 = {1{`RANDOM}};
  data_21 = _RAND_21[1:0];
  _RAND_22 = {1{`RANDOM}};
  data_22 = _RAND_22[1:0];
  _RAND_23 = {1{`RANDOM}};
  data_23 = _RAND_23[1:0];
  _RAND_24 = {1{`RANDOM}};
  data_24 = _RAND_24[1:0];
  _RAND_25 = {1{`RANDOM}};
  data_25 = _RAND_25[1:0];
  _RAND_26 = {1{`RANDOM}};
  data_26 = _RAND_26[1:0];
  _RAND_27 = {1{`RANDOM}};
  data_27 = _RAND_27[1:0];
  _RAND_28 = {1{`RANDOM}};
  data_28 = _RAND_28[1:0];
  _RAND_29 = {1{`RANDOM}};
  data_29 = _RAND_29[1:0];
  _RAND_30 = {1{`RANDOM}};
  data_30 = _RAND_30[1:0];
  _RAND_31 = {1{`RANDOM}};
  data_31 = _RAND_31[1:0];
  _RAND_32 = {1{`RANDOM}};
  data_32 = _RAND_32[1:0];
  _RAND_33 = {1{`RANDOM}};
  data_33 = _RAND_33[1:0];
  _RAND_34 = {1{`RANDOM}};
  data_34 = _RAND_34[1:0];
  _RAND_35 = {1{`RANDOM}};
  data_35 = _RAND_35[1:0];
  _RAND_36 = {1{`RANDOM}};
  data_36 = _RAND_36[1:0];
  _RAND_37 = {1{`RANDOM}};
  data_37 = _RAND_37[1:0];
  _RAND_38 = {1{`RANDOM}};
  data_38 = _RAND_38[1:0];
  _RAND_39 = {1{`RANDOM}};
  data_39 = _RAND_39[1:0];
  _RAND_40 = {1{`RANDOM}};
  data_40 = _RAND_40[1:0];
  _RAND_41 = {1{`RANDOM}};
  data_41 = _RAND_41[1:0];
  _RAND_42 = {1{`RANDOM}};
  data_42 = _RAND_42[1:0];
  _RAND_43 = {1{`RANDOM}};
  data_43 = _RAND_43[1:0];
  _RAND_44 = {1{`RANDOM}};
  data_44 = _RAND_44[1:0];
  _RAND_45 = {1{`RANDOM}};
  data_45 = _RAND_45[1:0];
  _RAND_46 = {1{`RANDOM}};
  data_46 = _RAND_46[1:0];
  _RAND_47 = {1{`RANDOM}};
  data_47 = _RAND_47[1:0];
  _RAND_48 = {1{`RANDOM}};
  data_48 = _RAND_48[1:0];
  _RAND_49 = {1{`RANDOM}};
  data_49 = _RAND_49[1:0];
  _RAND_50 = {1{`RANDOM}};
  data_50 = _RAND_50[1:0];
  _RAND_51 = {1{`RANDOM}};
  data_51 = _RAND_51[1:0];
  _RAND_52 = {1{`RANDOM}};
  data_52 = _RAND_52[1:0];
  _RAND_53 = {1{`RANDOM}};
  data_53 = _RAND_53[1:0];
  _RAND_54 = {1{`RANDOM}};
  data_54 = _RAND_54[1:0];
  _RAND_55 = {1{`RANDOM}};
  data_55 = _RAND_55[1:0];
  _RAND_56 = {1{`RANDOM}};
  data_56 = _RAND_56[1:0];
  _RAND_57 = {1{`RANDOM}};
  data_57 = _RAND_57[1:0];
  _RAND_58 = {1{`RANDOM}};
  data_58 = _RAND_58[1:0];
  _RAND_59 = {1{`RANDOM}};
  data_59 = _RAND_59[1:0];
  _RAND_60 = {1{`RANDOM}};
  data_60 = _RAND_60[1:0];
  _RAND_61 = {1{`RANDOM}};
  data_61 = _RAND_61[1:0];
  _RAND_62 = {1{`RANDOM}};
  data_62 = _RAND_62[1:0];
  _RAND_63 = {1{`RANDOM}};
  data_63 = _RAND_63[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

