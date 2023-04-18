module RefCounter(
  input        clock,
  input        reset,
  input        io_allocate_0_valid,
  input  [5:0] io_allocate_0_bits,
  input        io_allocate_1_valid,
  input  [5:0] io_allocate_1_bits,
  input        io_deallocate_0_valid,
  input  [5:0] io_deallocate_0_bits,
  input        io_deallocate_1_valid,
  input  [5:0] io_deallocate_1_bits,
  output       io_freeRegs_0_valid,
  output [5:0] io_freeRegs_0_bits,
  output       io_freeRegs_1_valid,
  output [5:0] io_freeRegs_1_bits,
  input        io_commit_isCommit,
  input        io_commit_commitValid_0,
  input        io_commit_commitValid_1,
  input        io_commit_info_0_rfWen,
  input  [5:0] io_commit_info_0_pdest,
  input  [5:0] io_commit_info_0_old_pdest,
  input        io_commit_info_1_rfWen,
  input  [5:0] io_commit_info_1_pdest,
  input  [5:0] io_commit_info_1_old_pdest,
  input        io_redirect
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
`endif // RANDOMIZE_REG_INIT
  reg  allocate_0_valid; // @[RefCounter.scala 39:25]
  reg [5:0] allocate_0_bits; // @[RefCounter.scala 39:25]
  reg  allocate_1_valid; // @[RefCounter.scala 39:25]
  reg [5:0] allocate_1_bits; // @[RefCounter.scala 39:25]
  reg  deallocate_0_valid; // @[RefCounter.scala 40:27]
  reg [5:0] deallocate_0_bits; // @[RefCounter.scala 40:27]
  reg  deallocate_1_valid; // @[RefCounter.scala 40:27]
  reg [5:0] deallocate_1_bits; // @[RefCounter.scala 40:27]
  reg  commit_isCommit; // @[RefCounter.scala 41:23]
  reg  commit_commitValid_0; // @[RefCounter.scala 41:23]
  reg  commit_commitValid_1; // @[RefCounter.scala 41:23]
  reg  commit_info_0_rfWen; // @[RefCounter.scala 41:23]
  reg [5:0] commit_info_0_pdest; // @[RefCounter.scala 41:23]
  reg [5:0] commit_info_0_old_pdest; // @[RefCounter.scala 41:23]
  reg  commit_info_1_rfWen; // @[RefCounter.scala 41:23]
  reg [5:0] commit_info_1_pdest; // @[RefCounter.scala 41:23]
  reg [5:0] commit_info_1_old_pdest; // @[RefCounter.scala 41:23]
  reg  redirect; // @[RefCounter.scala 42:25]
  reg [4:0] refCounter_1; // @[RefCounter.scala 46:27]
  reg [4:0] refCounter_2; // @[RefCounter.scala 46:27]
  reg [4:0] refCounter_3; // @[RefCounter.scala 46:27]
  reg [4:0] refCounter_4; // @[RefCounter.scala 46:27]
  reg [4:0] refCounter_5; // @[RefCounter.scala 46:27]
  reg [4:0] refCounter_6; // @[RefCounter.scala 46:27]
  reg [4:0] refCounter_7; // @[RefCounter.scala 46:27]
  reg [4:0] refCounter_8; // @[RefCounter.scala 46:27]
  reg [4:0] refCounter_9; // @[RefCounter.scala 46:27]
  reg [4:0] refCounter_10; // @[RefCounter.scala 46:27]
  reg [4:0] refCounter_11; // @[RefCounter.scala 46:27]
  reg [4:0] refCounter_12; // @[RefCounter.scala 46:27]
  reg [4:0] refCounter_13; // @[RefCounter.scala 46:27]
  reg [4:0] refCounter_14; // @[RefCounter.scala 46:27]
  reg [4:0] refCounter_15; // @[RefCounter.scala 46:27]
  reg [4:0] refCounter_16; // @[RefCounter.scala 46:27]
  reg [4:0] refCounter_17; // @[RefCounter.scala 46:27]
  reg [4:0] refCounter_18; // @[RefCounter.scala 46:27]
  reg [4:0] refCounter_19; // @[RefCounter.scala 46:27]
  reg [4:0] refCounter_20; // @[RefCounter.scala 46:27]
  reg [4:0] refCounter_21; // @[RefCounter.scala 46:27]
  reg [4:0] refCounter_22; // @[RefCounter.scala 46:27]
  reg [4:0] refCounter_23; // @[RefCounter.scala 46:27]
  reg [4:0] refCounter_24; // @[RefCounter.scala 46:27]
  reg [4:0] refCounter_25; // @[RefCounter.scala 46:27]
  reg [4:0] refCounter_26; // @[RefCounter.scala 46:27]
  reg [4:0] refCounter_27; // @[RefCounter.scala 46:27]
  reg [4:0] refCounter_28; // @[RefCounter.scala 46:27]
  reg [4:0] refCounter_29; // @[RefCounter.scala 46:27]
  reg [4:0] refCounter_30; // @[RefCounter.scala 46:27]
  reg [4:0] refCounter_31; // @[RefCounter.scala 46:27]
  reg [4:0] refCounter_32; // @[RefCounter.scala 46:27]
  reg [4:0] refCounter_33; // @[RefCounter.scala 46:27]
  reg [4:0] refCounter_34; // @[RefCounter.scala 46:27]
  reg [4:0] refCounter_35; // @[RefCounter.scala 46:27]
  reg [4:0] refCounter_36; // @[RefCounter.scala 46:27]
  reg [4:0] refCounter_37; // @[RefCounter.scala 46:27]
  reg [4:0] refCounter_38; // @[RefCounter.scala 46:27]
  reg [4:0] refCounter_39; // @[RefCounter.scala 46:27]
  reg [4:0] refCounter_40; // @[RefCounter.scala 46:27]
  reg [4:0] refCounter_41; // @[RefCounter.scala 46:27]
  reg [4:0] refCounter_42; // @[RefCounter.scala 46:27]
  reg [4:0] refCounter_43; // @[RefCounter.scala 46:27]
  reg [4:0] refCounter_44; // @[RefCounter.scala 46:27]
  reg [4:0] refCounter_45; // @[RefCounter.scala 46:27]
  reg [4:0] refCounter_46; // @[RefCounter.scala 46:27]
  reg [4:0] refCounter_47; // @[RefCounter.scala 46:27]
  reg [4:0] refCounter_48; // @[RefCounter.scala 46:27]
  reg [4:0] refCounter_49; // @[RefCounter.scala 46:27]
  reg [4:0] refCounter_50; // @[RefCounter.scala 46:27]
  reg [4:0] refCounter_51; // @[RefCounter.scala 46:27]
  reg [4:0] refCounter_52; // @[RefCounter.scala 46:27]
  reg [4:0] refCounter_53; // @[RefCounter.scala 46:27]
  reg [4:0] refCounter_54; // @[RefCounter.scala 46:27]
  reg [4:0] refCounter_55; // @[RefCounter.scala 46:27]
  reg [4:0] refCounter_56; // @[RefCounter.scala 46:27]
  reg [4:0] refCounter_57; // @[RefCounter.scala 46:27]
  reg [4:0] refCounter_58; // @[RefCounter.scala 46:27]
  reg [4:0] refCounter_59; // @[RefCounter.scala 46:27]
  reg [4:0] refCounter_60; // @[RefCounter.scala 46:27]
  reg [4:0] refCounter_61; // @[RefCounter.scala 46:27]
  reg [4:0] refCounter_62; // @[RefCounter.scala 46:27]
  reg [4:0] refCounter_63; // @[RefCounter.scala 46:27]
  reg [4:0] archRefCounter_1; // @[RefCounter.scala 51:31]
  reg [4:0] archRefCounter_2; // @[RefCounter.scala 51:31]
  reg [4:0] archRefCounter_3; // @[RefCounter.scala 51:31]
  reg [4:0] archRefCounter_4; // @[RefCounter.scala 51:31]
  reg [4:0] archRefCounter_5; // @[RefCounter.scala 51:31]
  reg [4:0] archRefCounter_6; // @[RefCounter.scala 51:31]
  reg [4:0] archRefCounter_7; // @[RefCounter.scala 51:31]
  reg [4:0] archRefCounter_8; // @[RefCounter.scala 51:31]
  reg [4:0] archRefCounter_9; // @[RefCounter.scala 51:31]
  reg [4:0] archRefCounter_10; // @[RefCounter.scala 51:31]
  reg [4:0] archRefCounter_11; // @[RefCounter.scala 51:31]
  reg [4:0] archRefCounter_12; // @[RefCounter.scala 51:31]
  reg [4:0] archRefCounter_13; // @[RefCounter.scala 51:31]
  reg [4:0] archRefCounter_14; // @[RefCounter.scala 51:31]
  reg [4:0] archRefCounter_15; // @[RefCounter.scala 51:31]
  reg [4:0] archRefCounter_16; // @[RefCounter.scala 51:31]
  reg [4:0] archRefCounter_17; // @[RefCounter.scala 51:31]
  reg [4:0] archRefCounter_18; // @[RefCounter.scala 51:31]
  reg [4:0] archRefCounter_19; // @[RefCounter.scala 51:31]
  reg [4:0] archRefCounter_20; // @[RefCounter.scala 51:31]
  reg [4:0] archRefCounter_21; // @[RefCounter.scala 51:31]
  reg [4:0] archRefCounter_22; // @[RefCounter.scala 51:31]
  reg [4:0] archRefCounter_23; // @[RefCounter.scala 51:31]
  reg [4:0] archRefCounter_24; // @[RefCounter.scala 51:31]
  reg [4:0] archRefCounter_25; // @[RefCounter.scala 51:31]
  reg [4:0] archRefCounter_26; // @[RefCounter.scala 51:31]
  reg [4:0] archRefCounter_27; // @[RefCounter.scala 51:31]
  reg [4:0] archRefCounter_28; // @[RefCounter.scala 51:31]
  reg [4:0] archRefCounter_29; // @[RefCounter.scala 51:31]
  reg [4:0] archRefCounter_30; // @[RefCounter.scala 51:31]
  reg [4:0] archRefCounter_31; // @[RefCounter.scala 51:31]
  reg [4:0] archRefCounter_32; // @[RefCounter.scala 51:31]
  reg [4:0] archRefCounter_33; // @[RefCounter.scala 51:31]
  reg [4:0] archRefCounter_34; // @[RefCounter.scala 51:31]
  reg [4:0] archRefCounter_35; // @[RefCounter.scala 51:31]
  reg [4:0] archRefCounter_36; // @[RefCounter.scala 51:31]
  reg [4:0] archRefCounter_37; // @[RefCounter.scala 51:31]
  reg [4:0] archRefCounter_38; // @[RefCounter.scala 51:31]
  reg [4:0] archRefCounter_39; // @[RefCounter.scala 51:31]
  reg [4:0] archRefCounter_40; // @[RefCounter.scala 51:31]
  reg [4:0] archRefCounter_41; // @[RefCounter.scala 51:31]
  reg [4:0] archRefCounter_42; // @[RefCounter.scala 51:31]
  reg [4:0] archRefCounter_43; // @[RefCounter.scala 51:31]
  reg [4:0] archRefCounter_44; // @[RefCounter.scala 51:31]
  reg [4:0] archRefCounter_45; // @[RefCounter.scala 51:31]
  reg [4:0] archRefCounter_46; // @[RefCounter.scala 51:31]
  reg [4:0] archRefCounter_47; // @[RefCounter.scala 51:31]
  reg [4:0] archRefCounter_48; // @[RefCounter.scala 51:31]
  reg [4:0] archRefCounter_49; // @[RefCounter.scala 51:31]
  reg [4:0] archRefCounter_50; // @[RefCounter.scala 51:31]
  reg [4:0] archRefCounter_51; // @[RefCounter.scala 51:31]
  reg [4:0] archRefCounter_52; // @[RefCounter.scala 51:31]
  reg [4:0] archRefCounter_53; // @[RefCounter.scala 51:31]
  reg [4:0] archRefCounter_54; // @[RefCounter.scala 51:31]
  reg [4:0] archRefCounter_55; // @[RefCounter.scala 51:31]
  reg [4:0] archRefCounter_56; // @[RefCounter.scala 51:31]
  reg [4:0] archRefCounter_57; // @[RefCounter.scala 51:31]
  reg [4:0] archRefCounter_58; // @[RefCounter.scala 51:31]
  reg [4:0] archRefCounter_59; // @[RefCounter.scala 51:31]
  reg [4:0] archRefCounter_60; // @[RefCounter.scala 51:31]
  reg [4:0] archRefCounter_61; // @[RefCounter.scala 51:31]
  reg [4:0] archRefCounter_62; // @[RefCounter.scala 51:31]
  reg [4:0] archRefCounter_63; // @[RefCounter.scala 51:31]
  wire [63:0] allocateOH_0 = 64'h1 << allocate_0_bits; // @[OneHot.scala 57:35]
  wire [63:0] allocateOH_1 = 64'h1 << allocate_1_bits; // @[OneHot.scala 57:35]
  wire [63:0] deallocateOH_0 = 64'h1 << deallocate_0_bits; // @[OneHot.scala 57:35]
  wire [63:0] deallocateOH_1 = 64'h1 << deallocate_1_bits; // @[OneHot.scala 57:35]
  wire [63:0] commitPdestOH_0 = 64'h1 << commit_info_0_pdest; // @[OneHot.scala 57:35]
  wire [63:0] commitPdestOH_1 = 64'h1 << commit_info_1_pdest; // @[OneHot.scala 57:35]
  wire [63:0] commitOldPdestOH_0 = 64'h1 << commit_info_0_old_pdest; // @[OneHot.scala 57:35]
  wire [63:0] commitOldPdestOH_1 = 64'h1 << commit_info_1_old_pdest; // @[OneHot.scala 57:35]
  wire  archRefIncSeq_0_1 = commitPdestOH_0[1] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_0_2 = commitPdestOH_0[2] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_0_3 = commitPdestOH_0[3] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_0_4 = commitPdestOH_0[4] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_0_5 = commitPdestOH_0[5] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_0_6 = commitPdestOH_0[6] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_0_7 = commitPdestOH_0[7] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_0_8 = commitPdestOH_0[8] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_0_9 = commitPdestOH_0[9] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_0_10 = commitPdestOH_0[10] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_0_11 = commitPdestOH_0[11] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_0_12 = commitPdestOH_0[12] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_0_13 = commitPdestOH_0[13] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_0_14 = commitPdestOH_0[14] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_0_15 = commitPdestOH_0[15] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_0_16 = commitPdestOH_0[16] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_0_17 = commitPdestOH_0[17] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_0_18 = commitPdestOH_0[18] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_0_19 = commitPdestOH_0[19] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_0_20 = commitPdestOH_0[20] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_0_21 = commitPdestOH_0[21] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_0_22 = commitPdestOH_0[22] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_0_23 = commitPdestOH_0[23] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_0_24 = commitPdestOH_0[24] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_0_25 = commitPdestOH_0[25] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_0_26 = commitPdestOH_0[26] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_0_27 = commitPdestOH_0[27] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_0_28 = commitPdestOH_0[28] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_0_29 = commitPdestOH_0[29] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_0_30 = commitPdestOH_0[30] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_0_31 = commitPdestOH_0[31] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_0_32 = commitPdestOH_0[32] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_0_33 = commitPdestOH_0[33] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_0_34 = commitPdestOH_0[34] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_0_35 = commitPdestOH_0[35] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_0_36 = commitPdestOH_0[36] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_0_37 = commitPdestOH_0[37] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_0_38 = commitPdestOH_0[38] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_0_39 = commitPdestOH_0[39] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_0_40 = commitPdestOH_0[40] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_0_41 = commitPdestOH_0[41] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_0_42 = commitPdestOH_0[42] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_0_43 = commitPdestOH_0[43] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_0_44 = commitPdestOH_0[44] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_0_45 = commitPdestOH_0[45] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_0_46 = commitPdestOH_0[46] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_0_47 = commitPdestOH_0[47] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_0_48 = commitPdestOH_0[48] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_0_49 = commitPdestOH_0[49] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_0_50 = commitPdestOH_0[50] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_0_51 = commitPdestOH_0[51] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_0_52 = commitPdestOH_0[52] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_0_53 = commitPdestOH_0[53] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_0_54 = commitPdestOH_0[54] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_0_55 = commitPdestOH_0[55] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_0_56 = commitPdestOH_0[56] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_0_57 = commitPdestOH_0[57] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_0_58 = commitPdestOH_0[58] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_0_59 = commitPdestOH_0[59] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_0_60 = commitPdestOH_0[60] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_0_61 = commitPdestOH_0[61] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_0_62 = commitPdestOH_0[62] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_0_63 = commitPdestOH_0[63] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_1_1 = commitPdestOH_1[1] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_1_2 = commitPdestOH_1[2] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_1_3 = commitPdestOH_1[3] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_1_4 = commitPdestOH_1[4] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_1_5 = commitPdestOH_1[5] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_1_6 = commitPdestOH_1[6] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_1_7 = commitPdestOH_1[7] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_1_8 = commitPdestOH_1[8] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_1_9 = commitPdestOH_1[9] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_1_10 = commitPdestOH_1[10] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_1_11 = commitPdestOH_1[11] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_1_12 = commitPdestOH_1[12] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_1_13 = commitPdestOH_1[13] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_1_14 = commitPdestOH_1[14] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_1_15 = commitPdestOH_1[15] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_1_16 = commitPdestOH_1[16] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_1_17 = commitPdestOH_1[17] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_1_18 = commitPdestOH_1[18] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_1_19 = commitPdestOH_1[19] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_1_20 = commitPdestOH_1[20] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_1_21 = commitPdestOH_1[21] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_1_22 = commitPdestOH_1[22] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_1_23 = commitPdestOH_1[23] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_1_24 = commitPdestOH_1[24] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_1_25 = commitPdestOH_1[25] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_1_26 = commitPdestOH_1[26] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_1_27 = commitPdestOH_1[27] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_1_28 = commitPdestOH_1[28] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_1_29 = commitPdestOH_1[29] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_1_30 = commitPdestOH_1[30] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_1_31 = commitPdestOH_1[31] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_1_32 = commitPdestOH_1[32] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_1_33 = commitPdestOH_1[33] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_1_34 = commitPdestOH_1[34] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_1_35 = commitPdestOH_1[35] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_1_36 = commitPdestOH_1[36] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_1_37 = commitPdestOH_1[37] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_1_38 = commitPdestOH_1[38] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_1_39 = commitPdestOH_1[39] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_1_40 = commitPdestOH_1[40] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_1_41 = commitPdestOH_1[41] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_1_42 = commitPdestOH_1[42] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_1_43 = commitPdestOH_1[43] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_1_44 = commitPdestOH_1[44] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_1_45 = commitPdestOH_1[45] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_1_46 = commitPdestOH_1[46] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_1_47 = commitPdestOH_1[47] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_1_48 = commitPdestOH_1[48] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_1_49 = commitPdestOH_1[49] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_1_50 = commitPdestOH_1[50] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_1_51 = commitPdestOH_1[51] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_1_52 = commitPdestOH_1[52] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_1_53 = commitPdestOH_1[53] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_1_54 = commitPdestOH_1[54] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_1_55 = commitPdestOH_1[55] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_1_56 = commitPdestOH_1[56] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_1_57 = commitPdestOH_1[57] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_1_58 = commitPdestOH_1[58] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_1_59 = commitPdestOH_1[59] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_1_60 = commitPdestOH_1[60] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_1_61 = commitPdestOH_1[61] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_1_62 = commitPdestOH_1[62] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefIncSeq_1_63 = commitPdestOH_1[63] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 62:65]
  wire  archRefDecSeq_0_1 = commitOldPdestOH_0[1] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_0_2 = commitOldPdestOH_0[2] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_0_3 = commitOldPdestOH_0[3] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_0_4 = commitOldPdestOH_0[4] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_0_5 = commitOldPdestOH_0[5] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_0_6 = commitOldPdestOH_0[6] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_0_7 = commitOldPdestOH_0[7] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_0_8 = commitOldPdestOH_0[8] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_0_9 = commitOldPdestOH_0[9] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_0_10 = commitOldPdestOH_0[10] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_0_11 = commitOldPdestOH_0[11] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_0_12 = commitOldPdestOH_0[12] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_0_13 = commitOldPdestOH_0[13] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_0_14 = commitOldPdestOH_0[14] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_0_15 = commitOldPdestOH_0[15] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_0_16 = commitOldPdestOH_0[16] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_0_17 = commitOldPdestOH_0[17] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_0_18 = commitOldPdestOH_0[18] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_0_19 = commitOldPdestOH_0[19] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_0_20 = commitOldPdestOH_0[20] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_0_21 = commitOldPdestOH_0[21] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_0_22 = commitOldPdestOH_0[22] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_0_23 = commitOldPdestOH_0[23] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_0_24 = commitOldPdestOH_0[24] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_0_25 = commitOldPdestOH_0[25] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_0_26 = commitOldPdestOH_0[26] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_0_27 = commitOldPdestOH_0[27] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_0_28 = commitOldPdestOH_0[28] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_0_29 = commitOldPdestOH_0[29] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_0_30 = commitOldPdestOH_0[30] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_0_31 = commitOldPdestOH_0[31] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_0_32 = commitOldPdestOH_0[32] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_0_33 = commitOldPdestOH_0[33] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_0_34 = commitOldPdestOH_0[34] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_0_35 = commitOldPdestOH_0[35] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_0_36 = commitOldPdestOH_0[36] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_0_37 = commitOldPdestOH_0[37] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_0_38 = commitOldPdestOH_0[38] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_0_39 = commitOldPdestOH_0[39] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_0_40 = commitOldPdestOH_0[40] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_0_41 = commitOldPdestOH_0[41] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_0_42 = commitOldPdestOH_0[42] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_0_43 = commitOldPdestOH_0[43] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_0_44 = commitOldPdestOH_0[44] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_0_45 = commitOldPdestOH_0[45] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_0_46 = commitOldPdestOH_0[46] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_0_47 = commitOldPdestOH_0[47] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_0_48 = commitOldPdestOH_0[48] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_0_49 = commitOldPdestOH_0[49] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_0_50 = commitOldPdestOH_0[50] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_0_51 = commitOldPdestOH_0[51] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_0_52 = commitOldPdestOH_0[52] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_0_53 = commitOldPdestOH_0[53] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_0_54 = commitOldPdestOH_0[54] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_0_55 = commitOldPdestOH_0[55] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_0_56 = commitOldPdestOH_0[56] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_0_57 = commitOldPdestOH_0[57] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_0_58 = commitOldPdestOH_0[58] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_0_59 = commitOldPdestOH_0[59] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_0_60 = commitOldPdestOH_0[60] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_0_61 = commitOldPdestOH_0[61] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_0_62 = commitOldPdestOH_0[62] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_0_63 = commitOldPdestOH_0[63] & commit_commitValid_0 & commit_info_0_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_1_1 = commitOldPdestOH_1[1] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_1_2 = commitOldPdestOH_1[2] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_1_3 = commitOldPdestOH_1[3] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_1_4 = commitOldPdestOH_1[4] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_1_5 = commitOldPdestOH_1[5] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_1_6 = commitOldPdestOH_1[6] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_1_7 = commitOldPdestOH_1[7] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_1_8 = commitOldPdestOH_1[8] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_1_9 = commitOldPdestOH_1[9] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_1_10 = commitOldPdestOH_1[10] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_1_11 = commitOldPdestOH_1[11] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_1_12 = commitOldPdestOH_1[12] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_1_13 = commitOldPdestOH_1[13] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_1_14 = commitOldPdestOH_1[14] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_1_15 = commitOldPdestOH_1[15] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_1_16 = commitOldPdestOH_1[16] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_1_17 = commitOldPdestOH_1[17] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_1_18 = commitOldPdestOH_1[18] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_1_19 = commitOldPdestOH_1[19] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_1_20 = commitOldPdestOH_1[20] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_1_21 = commitOldPdestOH_1[21] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_1_22 = commitOldPdestOH_1[22] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_1_23 = commitOldPdestOH_1[23] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_1_24 = commitOldPdestOH_1[24] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_1_25 = commitOldPdestOH_1[25] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_1_26 = commitOldPdestOH_1[26] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_1_27 = commitOldPdestOH_1[27] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_1_28 = commitOldPdestOH_1[28] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_1_29 = commitOldPdestOH_1[29] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_1_30 = commitOldPdestOH_1[30] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_1_31 = commitOldPdestOH_1[31] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_1_32 = commitOldPdestOH_1[32] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_1_33 = commitOldPdestOH_1[33] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_1_34 = commitOldPdestOH_1[34] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_1_35 = commitOldPdestOH_1[35] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_1_36 = commitOldPdestOH_1[36] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_1_37 = commitOldPdestOH_1[37] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_1_38 = commitOldPdestOH_1[38] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_1_39 = commitOldPdestOH_1[39] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_1_40 = commitOldPdestOH_1[40] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_1_41 = commitOldPdestOH_1[41] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_1_42 = commitOldPdestOH_1[42] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_1_43 = commitOldPdestOH_1[43] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_1_44 = commitOldPdestOH_1[44] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_1_45 = commitOldPdestOH_1[45] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_1_46 = commitOldPdestOH_1[46] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_1_47 = commitOldPdestOH_1[47] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_1_48 = commitOldPdestOH_1[48] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_1_49 = commitOldPdestOH_1[49] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_1_50 = commitOldPdestOH_1[50] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_1_51 = commitOldPdestOH_1[51] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_1_52 = commitOldPdestOH_1[52] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_1_53 = commitOldPdestOH_1[53] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_1_54 = commitOldPdestOH_1[54] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_1_55 = commitOldPdestOH_1[55] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_1_56 = commitOldPdestOH_1[56] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_1_57 = commitOldPdestOH_1[57] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_1_58 = commitOldPdestOH_1[58] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_1_59 = commitOldPdestOH_1[59] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_1_60 = commitOldPdestOH_1[60] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_1_61 = commitOldPdestOH_1[61] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_1_62 = commitOldPdestOH_1[62] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 65:73]
  wire  archRefDecSeq_1_63 = commitOldPdestOH_1[63] & commit_commitValid_1 & commit_info_1_rfWen; // @[RefCounter.scala 65:73]
  wire [1:0] archRefInc_1 = archRefIncSeq_0_1 + archRefIncSeq_1_1; // @[Bitwise.scala 48:55]
  wire [1:0] archRefInc_2 = archRefIncSeq_0_2 + archRefIncSeq_1_2; // @[Bitwise.scala 48:55]
  wire [1:0] archRefInc_3 = archRefIncSeq_0_3 + archRefIncSeq_1_3; // @[Bitwise.scala 48:55]
  wire [1:0] archRefInc_4 = archRefIncSeq_0_4 + archRefIncSeq_1_4; // @[Bitwise.scala 48:55]
  wire [1:0] archRefInc_5 = archRefIncSeq_0_5 + archRefIncSeq_1_5; // @[Bitwise.scala 48:55]
  wire [1:0] archRefInc_6 = archRefIncSeq_0_6 + archRefIncSeq_1_6; // @[Bitwise.scala 48:55]
  wire [1:0] archRefInc_7 = archRefIncSeq_0_7 + archRefIncSeq_1_7; // @[Bitwise.scala 48:55]
  wire [1:0] archRefInc_8 = archRefIncSeq_0_8 + archRefIncSeq_1_8; // @[Bitwise.scala 48:55]
  wire [1:0] archRefInc_9 = archRefIncSeq_0_9 + archRefIncSeq_1_9; // @[Bitwise.scala 48:55]
  wire [1:0] archRefInc_10 = archRefIncSeq_0_10 + archRefIncSeq_1_10; // @[Bitwise.scala 48:55]
  wire [1:0] archRefInc_11 = archRefIncSeq_0_11 + archRefIncSeq_1_11; // @[Bitwise.scala 48:55]
  wire [1:0] archRefInc_12 = archRefIncSeq_0_12 + archRefIncSeq_1_12; // @[Bitwise.scala 48:55]
  wire [1:0] archRefInc_13 = archRefIncSeq_0_13 + archRefIncSeq_1_13; // @[Bitwise.scala 48:55]
  wire [1:0] archRefInc_14 = archRefIncSeq_0_14 + archRefIncSeq_1_14; // @[Bitwise.scala 48:55]
  wire [1:0] archRefInc_15 = archRefIncSeq_0_15 + archRefIncSeq_1_15; // @[Bitwise.scala 48:55]
  wire [1:0] archRefInc_16 = archRefIncSeq_0_16 + archRefIncSeq_1_16; // @[Bitwise.scala 48:55]
  wire [1:0] archRefInc_17 = archRefIncSeq_0_17 + archRefIncSeq_1_17; // @[Bitwise.scala 48:55]
  wire [1:0] archRefInc_18 = archRefIncSeq_0_18 + archRefIncSeq_1_18; // @[Bitwise.scala 48:55]
  wire [1:0] archRefInc_19 = archRefIncSeq_0_19 + archRefIncSeq_1_19; // @[Bitwise.scala 48:55]
  wire [1:0] archRefInc_20 = archRefIncSeq_0_20 + archRefIncSeq_1_20; // @[Bitwise.scala 48:55]
  wire [1:0] archRefInc_21 = archRefIncSeq_0_21 + archRefIncSeq_1_21; // @[Bitwise.scala 48:55]
  wire [1:0] archRefInc_22 = archRefIncSeq_0_22 + archRefIncSeq_1_22; // @[Bitwise.scala 48:55]
  wire [1:0] archRefInc_23 = archRefIncSeq_0_23 + archRefIncSeq_1_23; // @[Bitwise.scala 48:55]
  wire [1:0] archRefInc_24 = archRefIncSeq_0_24 + archRefIncSeq_1_24; // @[Bitwise.scala 48:55]
  wire [1:0] archRefInc_25 = archRefIncSeq_0_25 + archRefIncSeq_1_25; // @[Bitwise.scala 48:55]
  wire [1:0] archRefInc_26 = archRefIncSeq_0_26 + archRefIncSeq_1_26; // @[Bitwise.scala 48:55]
  wire [1:0] archRefInc_27 = archRefIncSeq_0_27 + archRefIncSeq_1_27; // @[Bitwise.scala 48:55]
  wire [1:0] archRefInc_28 = archRefIncSeq_0_28 + archRefIncSeq_1_28; // @[Bitwise.scala 48:55]
  wire [1:0] archRefInc_29 = archRefIncSeq_0_29 + archRefIncSeq_1_29; // @[Bitwise.scala 48:55]
  wire [1:0] archRefInc_30 = archRefIncSeq_0_30 + archRefIncSeq_1_30; // @[Bitwise.scala 48:55]
  wire [1:0] archRefInc_31 = archRefIncSeq_0_31 + archRefIncSeq_1_31; // @[Bitwise.scala 48:55]
  wire [1:0] archRefInc_32 = archRefIncSeq_0_32 + archRefIncSeq_1_32; // @[Bitwise.scala 48:55]
  wire [1:0] archRefInc_33 = archRefIncSeq_0_33 + archRefIncSeq_1_33; // @[Bitwise.scala 48:55]
  wire [1:0] archRefInc_34 = archRefIncSeq_0_34 + archRefIncSeq_1_34; // @[Bitwise.scala 48:55]
  wire [1:0] archRefInc_35 = archRefIncSeq_0_35 + archRefIncSeq_1_35; // @[Bitwise.scala 48:55]
  wire [1:0] archRefInc_36 = archRefIncSeq_0_36 + archRefIncSeq_1_36; // @[Bitwise.scala 48:55]
  wire [1:0] archRefInc_37 = archRefIncSeq_0_37 + archRefIncSeq_1_37; // @[Bitwise.scala 48:55]
  wire [1:0] archRefInc_38 = archRefIncSeq_0_38 + archRefIncSeq_1_38; // @[Bitwise.scala 48:55]
  wire [1:0] archRefInc_39 = archRefIncSeq_0_39 + archRefIncSeq_1_39; // @[Bitwise.scala 48:55]
  wire [1:0] archRefInc_40 = archRefIncSeq_0_40 + archRefIncSeq_1_40; // @[Bitwise.scala 48:55]
  wire [1:0] archRefInc_41 = archRefIncSeq_0_41 + archRefIncSeq_1_41; // @[Bitwise.scala 48:55]
  wire [1:0] archRefInc_42 = archRefIncSeq_0_42 + archRefIncSeq_1_42; // @[Bitwise.scala 48:55]
  wire [1:0] archRefInc_43 = archRefIncSeq_0_43 + archRefIncSeq_1_43; // @[Bitwise.scala 48:55]
  wire [1:0] archRefInc_44 = archRefIncSeq_0_44 + archRefIncSeq_1_44; // @[Bitwise.scala 48:55]
  wire [1:0] archRefInc_45 = archRefIncSeq_0_45 + archRefIncSeq_1_45; // @[Bitwise.scala 48:55]
  wire [1:0] archRefInc_46 = archRefIncSeq_0_46 + archRefIncSeq_1_46; // @[Bitwise.scala 48:55]
  wire [1:0] archRefInc_47 = archRefIncSeq_0_47 + archRefIncSeq_1_47; // @[Bitwise.scala 48:55]
  wire [1:0] archRefInc_48 = archRefIncSeq_0_48 + archRefIncSeq_1_48; // @[Bitwise.scala 48:55]
  wire [1:0] archRefInc_49 = archRefIncSeq_0_49 + archRefIncSeq_1_49; // @[Bitwise.scala 48:55]
  wire [1:0] archRefInc_50 = archRefIncSeq_0_50 + archRefIncSeq_1_50; // @[Bitwise.scala 48:55]
  wire [1:0] archRefInc_51 = archRefIncSeq_0_51 + archRefIncSeq_1_51; // @[Bitwise.scala 48:55]
  wire [1:0] archRefInc_52 = archRefIncSeq_0_52 + archRefIncSeq_1_52; // @[Bitwise.scala 48:55]
  wire [1:0] archRefInc_53 = archRefIncSeq_0_53 + archRefIncSeq_1_53; // @[Bitwise.scala 48:55]
  wire [1:0] archRefInc_54 = archRefIncSeq_0_54 + archRefIncSeq_1_54; // @[Bitwise.scala 48:55]
  wire [1:0] archRefInc_55 = archRefIncSeq_0_55 + archRefIncSeq_1_55; // @[Bitwise.scala 48:55]
  wire [1:0] archRefInc_56 = archRefIncSeq_0_56 + archRefIncSeq_1_56; // @[Bitwise.scala 48:55]
  wire [1:0] archRefInc_57 = archRefIncSeq_0_57 + archRefIncSeq_1_57; // @[Bitwise.scala 48:55]
  wire [1:0] archRefInc_58 = archRefIncSeq_0_58 + archRefIncSeq_1_58; // @[Bitwise.scala 48:55]
  wire [1:0] archRefInc_59 = archRefIncSeq_0_59 + archRefIncSeq_1_59; // @[Bitwise.scala 48:55]
  wire [1:0] archRefInc_60 = archRefIncSeq_0_60 + archRefIncSeq_1_60; // @[Bitwise.scala 48:55]
  wire [1:0] archRefInc_61 = archRefIncSeq_0_61 + archRefIncSeq_1_61; // @[Bitwise.scala 48:55]
  wire [1:0] archRefInc_62 = archRefIncSeq_0_62 + archRefIncSeq_1_62; // @[Bitwise.scala 48:55]
  wire [1:0] archRefInc_63 = archRefIncSeq_0_63 + archRefIncSeq_1_63; // @[Bitwise.scala 48:55]
  wire [1:0] archRefDec_1 = archRefDecSeq_0_1 + archRefDecSeq_1_1; // @[Bitwise.scala 48:55]
  wire [1:0] archRefDec_2 = archRefDecSeq_0_2 + archRefDecSeq_1_2; // @[Bitwise.scala 48:55]
  wire [1:0] archRefDec_3 = archRefDecSeq_0_3 + archRefDecSeq_1_3; // @[Bitwise.scala 48:55]
  wire [1:0] archRefDec_4 = archRefDecSeq_0_4 + archRefDecSeq_1_4; // @[Bitwise.scala 48:55]
  wire [1:0] archRefDec_5 = archRefDecSeq_0_5 + archRefDecSeq_1_5; // @[Bitwise.scala 48:55]
  wire [1:0] archRefDec_6 = archRefDecSeq_0_6 + archRefDecSeq_1_6; // @[Bitwise.scala 48:55]
  wire [1:0] archRefDec_7 = archRefDecSeq_0_7 + archRefDecSeq_1_7; // @[Bitwise.scala 48:55]
  wire [1:0] archRefDec_8 = archRefDecSeq_0_8 + archRefDecSeq_1_8; // @[Bitwise.scala 48:55]
  wire [1:0] archRefDec_9 = archRefDecSeq_0_9 + archRefDecSeq_1_9; // @[Bitwise.scala 48:55]
  wire [1:0] archRefDec_10 = archRefDecSeq_0_10 + archRefDecSeq_1_10; // @[Bitwise.scala 48:55]
  wire [1:0] archRefDec_11 = archRefDecSeq_0_11 + archRefDecSeq_1_11; // @[Bitwise.scala 48:55]
  wire [1:0] archRefDec_12 = archRefDecSeq_0_12 + archRefDecSeq_1_12; // @[Bitwise.scala 48:55]
  wire [1:0] archRefDec_13 = archRefDecSeq_0_13 + archRefDecSeq_1_13; // @[Bitwise.scala 48:55]
  wire [1:0] archRefDec_14 = archRefDecSeq_0_14 + archRefDecSeq_1_14; // @[Bitwise.scala 48:55]
  wire [1:0] archRefDec_15 = archRefDecSeq_0_15 + archRefDecSeq_1_15; // @[Bitwise.scala 48:55]
  wire [1:0] archRefDec_16 = archRefDecSeq_0_16 + archRefDecSeq_1_16; // @[Bitwise.scala 48:55]
  wire [1:0] archRefDec_17 = archRefDecSeq_0_17 + archRefDecSeq_1_17; // @[Bitwise.scala 48:55]
  wire [1:0] archRefDec_18 = archRefDecSeq_0_18 + archRefDecSeq_1_18; // @[Bitwise.scala 48:55]
  wire [1:0] archRefDec_19 = archRefDecSeq_0_19 + archRefDecSeq_1_19; // @[Bitwise.scala 48:55]
  wire [1:0] archRefDec_20 = archRefDecSeq_0_20 + archRefDecSeq_1_20; // @[Bitwise.scala 48:55]
  wire [1:0] archRefDec_21 = archRefDecSeq_0_21 + archRefDecSeq_1_21; // @[Bitwise.scala 48:55]
  wire [1:0] archRefDec_22 = archRefDecSeq_0_22 + archRefDecSeq_1_22; // @[Bitwise.scala 48:55]
  wire [1:0] archRefDec_23 = archRefDecSeq_0_23 + archRefDecSeq_1_23; // @[Bitwise.scala 48:55]
  wire [1:0] archRefDec_24 = archRefDecSeq_0_24 + archRefDecSeq_1_24; // @[Bitwise.scala 48:55]
  wire [1:0] archRefDec_25 = archRefDecSeq_0_25 + archRefDecSeq_1_25; // @[Bitwise.scala 48:55]
  wire [1:0] archRefDec_26 = archRefDecSeq_0_26 + archRefDecSeq_1_26; // @[Bitwise.scala 48:55]
  wire [1:0] archRefDec_27 = archRefDecSeq_0_27 + archRefDecSeq_1_27; // @[Bitwise.scala 48:55]
  wire [1:0] archRefDec_28 = archRefDecSeq_0_28 + archRefDecSeq_1_28; // @[Bitwise.scala 48:55]
  wire [1:0] archRefDec_29 = archRefDecSeq_0_29 + archRefDecSeq_1_29; // @[Bitwise.scala 48:55]
  wire [1:0] archRefDec_30 = archRefDecSeq_0_30 + archRefDecSeq_1_30; // @[Bitwise.scala 48:55]
  wire [1:0] archRefDec_31 = archRefDecSeq_0_31 + archRefDecSeq_1_31; // @[Bitwise.scala 48:55]
  wire [1:0] archRefDec_32 = archRefDecSeq_0_32 + archRefDecSeq_1_32; // @[Bitwise.scala 48:55]
  wire [1:0] archRefDec_33 = archRefDecSeq_0_33 + archRefDecSeq_1_33; // @[Bitwise.scala 48:55]
  wire [1:0] archRefDec_34 = archRefDecSeq_0_34 + archRefDecSeq_1_34; // @[Bitwise.scala 48:55]
  wire [1:0] archRefDec_35 = archRefDecSeq_0_35 + archRefDecSeq_1_35; // @[Bitwise.scala 48:55]
  wire [1:0] archRefDec_36 = archRefDecSeq_0_36 + archRefDecSeq_1_36; // @[Bitwise.scala 48:55]
  wire [1:0] archRefDec_37 = archRefDecSeq_0_37 + archRefDecSeq_1_37; // @[Bitwise.scala 48:55]
  wire [1:0] archRefDec_38 = archRefDecSeq_0_38 + archRefDecSeq_1_38; // @[Bitwise.scala 48:55]
  wire [1:0] archRefDec_39 = archRefDecSeq_0_39 + archRefDecSeq_1_39; // @[Bitwise.scala 48:55]
  wire [1:0] archRefDec_40 = archRefDecSeq_0_40 + archRefDecSeq_1_40; // @[Bitwise.scala 48:55]
  wire [1:0] archRefDec_41 = archRefDecSeq_0_41 + archRefDecSeq_1_41; // @[Bitwise.scala 48:55]
  wire [1:0] archRefDec_42 = archRefDecSeq_0_42 + archRefDecSeq_1_42; // @[Bitwise.scala 48:55]
  wire [1:0] archRefDec_43 = archRefDecSeq_0_43 + archRefDecSeq_1_43; // @[Bitwise.scala 48:55]
  wire [1:0] archRefDec_44 = archRefDecSeq_0_44 + archRefDecSeq_1_44; // @[Bitwise.scala 48:55]
  wire [1:0] archRefDec_45 = archRefDecSeq_0_45 + archRefDecSeq_1_45; // @[Bitwise.scala 48:55]
  wire [1:0] archRefDec_46 = archRefDecSeq_0_46 + archRefDecSeq_1_46; // @[Bitwise.scala 48:55]
  wire [1:0] archRefDec_47 = archRefDecSeq_0_47 + archRefDecSeq_1_47; // @[Bitwise.scala 48:55]
  wire [1:0] archRefDec_48 = archRefDecSeq_0_48 + archRefDecSeq_1_48; // @[Bitwise.scala 48:55]
  wire [1:0] archRefDec_49 = archRefDecSeq_0_49 + archRefDecSeq_1_49; // @[Bitwise.scala 48:55]
  wire [1:0] archRefDec_50 = archRefDecSeq_0_50 + archRefDecSeq_1_50; // @[Bitwise.scala 48:55]
  wire [1:0] archRefDec_51 = archRefDecSeq_0_51 + archRefDecSeq_1_51; // @[Bitwise.scala 48:55]
  wire [1:0] archRefDec_52 = archRefDecSeq_0_52 + archRefDecSeq_1_52; // @[Bitwise.scala 48:55]
  wire [1:0] archRefDec_53 = archRefDecSeq_0_53 + archRefDecSeq_1_53; // @[Bitwise.scala 48:55]
  wire [1:0] archRefDec_54 = archRefDecSeq_0_54 + archRefDecSeq_1_54; // @[Bitwise.scala 48:55]
  wire [1:0] archRefDec_55 = archRefDecSeq_0_55 + archRefDecSeq_1_55; // @[Bitwise.scala 48:55]
  wire [1:0] archRefDec_56 = archRefDecSeq_0_56 + archRefDecSeq_1_56; // @[Bitwise.scala 48:55]
  wire [1:0] archRefDec_57 = archRefDecSeq_0_57 + archRefDecSeq_1_57; // @[Bitwise.scala 48:55]
  wire [1:0] archRefDec_58 = archRefDecSeq_0_58 + archRefDecSeq_1_58; // @[Bitwise.scala 48:55]
  wire [1:0] archRefDec_59 = archRefDecSeq_0_59 + archRefDecSeq_1_59; // @[Bitwise.scala 48:55]
  wire [1:0] archRefDec_60 = archRefDecSeq_0_60 + archRefDecSeq_1_60; // @[Bitwise.scala 48:55]
  wire [1:0] archRefDec_61 = archRefDecSeq_0_61 + archRefDecSeq_1_61; // @[Bitwise.scala 48:55]
  wire [1:0] archRefDec_62 = archRefDecSeq_0_62 + archRefDecSeq_1_62; // @[Bitwise.scala 48:55]
  wire [1:0] archRefDec_63 = archRefDecSeq_0_63 + archRefDecSeq_1_63; // @[Bitwise.scala 48:55]
  wire [4:0] _GEN_578 = {{3'd0}, archRefInc_1}; // @[RefCounter.scala 71:97]
  wire [4:0] _archRefCounterNext_1_T_1 = archRefCounter_1 + _GEN_578; // @[RefCounter.scala 71:97]
  wire [4:0] _GEN_579 = {{3'd0}, archRefDec_1}; // @[RefCounter.scala 71:103]
  wire [4:0] _archRefCounterNext_1_T_3 = _archRefCounterNext_1_T_1 - _GEN_579; // @[RefCounter.scala 71:103]
  wire [4:0] _GEN_580 = {{3'd0}, archRefInc_2}; // @[RefCounter.scala 71:97]
  wire [4:0] _archRefCounterNext_2_T_1 = archRefCounter_2 + _GEN_580; // @[RefCounter.scala 71:97]
  wire [4:0] _GEN_581 = {{3'd0}, archRefDec_2}; // @[RefCounter.scala 71:103]
  wire [4:0] _archRefCounterNext_2_T_3 = _archRefCounterNext_2_T_1 - _GEN_581; // @[RefCounter.scala 71:103]
  wire [4:0] _GEN_582 = {{3'd0}, archRefInc_3}; // @[RefCounter.scala 71:97]
  wire [4:0] _archRefCounterNext_3_T_1 = archRefCounter_3 + _GEN_582; // @[RefCounter.scala 71:97]
  wire [4:0] _GEN_583 = {{3'd0}, archRefDec_3}; // @[RefCounter.scala 71:103]
  wire [4:0] _archRefCounterNext_3_T_3 = _archRefCounterNext_3_T_1 - _GEN_583; // @[RefCounter.scala 71:103]
  wire [4:0] _GEN_584 = {{3'd0}, archRefInc_4}; // @[RefCounter.scala 71:97]
  wire [4:0] _archRefCounterNext_4_T_1 = archRefCounter_4 + _GEN_584; // @[RefCounter.scala 71:97]
  wire [4:0] _GEN_585 = {{3'd0}, archRefDec_4}; // @[RefCounter.scala 71:103]
  wire [4:0] _archRefCounterNext_4_T_3 = _archRefCounterNext_4_T_1 - _GEN_585; // @[RefCounter.scala 71:103]
  wire [4:0] _GEN_586 = {{3'd0}, archRefInc_5}; // @[RefCounter.scala 71:97]
  wire [4:0] _archRefCounterNext_5_T_1 = archRefCounter_5 + _GEN_586; // @[RefCounter.scala 71:97]
  wire [4:0] _GEN_587 = {{3'd0}, archRefDec_5}; // @[RefCounter.scala 71:103]
  wire [4:0] _archRefCounterNext_5_T_3 = _archRefCounterNext_5_T_1 - _GEN_587; // @[RefCounter.scala 71:103]
  wire [4:0] _GEN_588 = {{3'd0}, archRefInc_6}; // @[RefCounter.scala 71:97]
  wire [4:0] _archRefCounterNext_6_T_1 = archRefCounter_6 + _GEN_588; // @[RefCounter.scala 71:97]
  wire [4:0] _GEN_589 = {{3'd0}, archRefDec_6}; // @[RefCounter.scala 71:103]
  wire [4:0] _archRefCounterNext_6_T_3 = _archRefCounterNext_6_T_1 - _GEN_589; // @[RefCounter.scala 71:103]
  wire [4:0] _GEN_590 = {{3'd0}, archRefInc_7}; // @[RefCounter.scala 71:97]
  wire [4:0] _archRefCounterNext_7_T_1 = archRefCounter_7 + _GEN_590; // @[RefCounter.scala 71:97]
  wire [4:0] _GEN_591 = {{3'd0}, archRefDec_7}; // @[RefCounter.scala 71:103]
  wire [4:0] _archRefCounterNext_7_T_3 = _archRefCounterNext_7_T_1 - _GEN_591; // @[RefCounter.scala 71:103]
  wire [4:0] _GEN_592 = {{3'd0}, archRefInc_8}; // @[RefCounter.scala 71:97]
  wire [4:0] _archRefCounterNext_8_T_1 = archRefCounter_8 + _GEN_592; // @[RefCounter.scala 71:97]
  wire [4:0] _GEN_593 = {{3'd0}, archRefDec_8}; // @[RefCounter.scala 71:103]
  wire [4:0] _archRefCounterNext_8_T_3 = _archRefCounterNext_8_T_1 - _GEN_593; // @[RefCounter.scala 71:103]
  wire [4:0] _GEN_594 = {{3'd0}, archRefInc_9}; // @[RefCounter.scala 71:97]
  wire [4:0] _archRefCounterNext_9_T_1 = archRefCounter_9 + _GEN_594; // @[RefCounter.scala 71:97]
  wire [4:0] _GEN_595 = {{3'd0}, archRefDec_9}; // @[RefCounter.scala 71:103]
  wire [4:0] _archRefCounterNext_9_T_3 = _archRefCounterNext_9_T_1 - _GEN_595; // @[RefCounter.scala 71:103]
  wire [4:0] _GEN_596 = {{3'd0}, archRefInc_10}; // @[RefCounter.scala 71:97]
  wire [4:0] _archRefCounterNext_10_T_1 = archRefCounter_10 + _GEN_596; // @[RefCounter.scala 71:97]
  wire [4:0] _GEN_597 = {{3'd0}, archRefDec_10}; // @[RefCounter.scala 71:103]
  wire [4:0] _archRefCounterNext_10_T_3 = _archRefCounterNext_10_T_1 - _GEN_597; // @[RefCounter.scala 71:103]
  wire [4:0] _GEN_598 = {{3'd0}, archRefInc_11}; // @[RefCounter.scala 71:97]
  wire [4:0] _archRefCounterNext_11_T_1 = archRefCounter_11 + _GEN_598; // @[RefCounter.scala 71:97]
  wire [4:0] _GEN_599 = {{3'd0}, archRefDec_11}; // @[RefCounter.scala 71:103]
  wire [4:0] _archRefCounterNext_11_T_3 = _archRefCounterNext_11_T_1 - _GEN_599; // @[RefCounter.scala 71:103]
  wire [4:0] _GEN_600 = {{3'd0}, archRefInc_12}; // @[RefCounter.scala 71:97]
  wire [4:0] _archRefCounterNext_12_T_1 = archRefCounter_12 + _GEN_600; // @[RefCounter.scala 71:97]
  wire [4:0] _GEN_601 = {{3'd0}, archRefDec_12}; // @[RefCounter.scala 71:103]
  wire [4:0] _archRefCounterNext_12_T_3 = _archRefCounterNext_12_T_1 - _GEN_601; // @[RefCounter.scala 71:103]
  wire [4:0] _GEN_602 = {{3'd0}, archRefInc_13}; // @[RefCounter.scala 71:97]
  wire [4:0] _archRefCounterNext_13_T_1 = archRefCounter_13 + _GEN_602; // @[RefCounter.scala 71:97]
  wire [4:0] _GEN_603 = {{3'd0}, archRefDec_13}; // @[RefCounter.scala 71:103]
  wire [4:0] _archRefCounterNext_13_T_3 = _archRefCounterNext_13_T_1 - _GEN_603; // @[RefCounter.scala 71:103]
  wire [4:0] _GEN_604 = {{3'd0}, archRefInc_14}; // @[RefCounter.scala 71:97]
  wire [4:0] _archRefCounterNext_14_T_1 = archRefCounter_14 + _GEN_604; // @[RefCounter.scala 71:97]
  wire [4:0] _GEN_605 = {{3'd0}, archRefDec_14}; // @[RefCounter.scala 71:103]
  wire [4:0] _archRefCounterNext_14_T_3 = _archRefCounterNext_14_T_1 - _GEN_605; // @[RefCounter.scala 71:103]
  wire [4:0] _GEN_606 = {{3'd0}, archRefInc_15}; // @[RefCounter.scala 71:97]
  wire [4:0] _archRefCounterNext_15_T_1 = archRefCounter_15 + _GEN_606; // @[RefCounter.scala 71:97]
  wire [4:0] _GEN_607 = {{3'd0}, archRefDec_15}; // @[RefCounter.scala 71:103]
  wire [4:0] _archRefCounterNext_15_T_3 = _archRefCounterNext_15_T_1 - _GEN_607; // @[RefCounter.scala 71:103]
  wire [4:0] _GEN_608 = {{3'd0}, archRefInc_16}; // @[RefCounter.scala 71:97]
  wire [4:0] _archRefCounterNext_16_T_1 = archRefCounter_16 + _GEN_608; // @[RefCounter.scala 71:97]
  wire [4:0] _GEN_609 = {{3'd0}, archRefDec_16}; // @[RefCounter.scala 71:103]
  wire [4:0] _archRefCounterNext_16_T_3 = _archRefCounterNext_16_T_1 - _GEN_609; // @[RefCounter.scala 71:103]
  wire [4:0] _GEN_610 = {{3'd0}, archRefInc_17}; // @[RefCounter.scala 71:97]
  wire [4:0] _archRefCounterNext_17_T_1 = archRefCounter_17 + _GEN_610; // @[RefCounter.scala 71:97]
  wire [4:0] _GEN_611 = {{3'd0}, archRefDec_17}; // @[RefCounter.scala 71:103]
  wire [4:0] _archRefCounterNext_17_T_3 = _archRefCounterNext_17_T_1 - _GEN_611; // @[RefCounter.scala 71:103]
  wire [4:0] _GEN_612 = {{3'd0}, archRefInc_18}; // @[RefCounter.scala 71:97]
  wire [4:0] _archRefCounterNext_18_T_1 = archRefCounter_18 + _GEN_612; // @[RefCounter.scala 71:97]
  wire [4:0] _GEN_613 = {{3'd0}, archRefDec_18}; // @[RefCounter.scala 71:103]
  wire [4:0] _archRefCounterNext_18_T_3 = _archRefCounterNext_18_T_1 - _GEN_613; // @[RefCounter.scala 71:103]
  wire [4:0] _GEN_614 = {{3'd0}, archRefInc_19}; // @[RefCounter.scala 71:97]
  wire [4:0] _archRefCounterNext_19_T_1 = archRefCounter_19 + _GEN_614; // @[RefCounter.scala 71:97]
  wire [4:0] _GEN_615 = {{3'd0}, archRefDec_19}; // @[RefCounter.scala 71:103]
  wire [4:0] _archRefCounterNext_19_T_3 = _archRefCounterNext_19_T_1 - _GEN_615; // @[RefCounter.scala 71:103]
  wire [4:0] _GEN_616 = {{3'd0}, archRefInc_20}; // @[RefCounter.scala 71:97]
  wire [4:0] _archRefCounterNext_20_T_1 = archRefCounter_20 + _GEN_616; // @[RefCounter.scala 71:97]
  wire [4:0] _GEN_617 = {{3'd0}, archRefDec_20}; // @[RefCounter.scala 71:103]
  wire [4:0] _archRefCounterNext_20_T_3 = _archRefCounterNext_20_T_1 - _GEN_617; // @[RefCounter.scala 71:103]
  wire [4:0] _GEN_618 = {{3'd0}, archRefInc_21}; // @[RefCounter.scala 71:97]
  wire [4:0] _archRefCounterNext_21_T_1 = archRefCounter_21 + _GEN_618; // @[RefCounter.scala 71:97]
  wire [4:0] _GEN_619 = {{3'd0}, archRefDec_21}; // @[RefCounter.scala 71:103]
  wire [4:0] _archRefCounterNext_21_T_3 = _archRefCounterNext_21_T_1 - _GEN_619; // @[RefCounter.scala 71:103]
  wire [4:0] _GEN_620 = {{3'd0}, archRefInc_22}; // @[RefCounter.scala 71:97]
  wire [4:0] _archRefCounterNext_22_T_1 = archRefCounter_22 + _GEN_620; // @[RefCounter.scala 71:97]
  wire [4:0] _GEN_621 = {{3'd0}, archRefDec_22}; // @[RefCounter.scala 71:103]
  wire [4:0] _archRefCounterNext_22_T_3 = _archRefCounterNext_22_T_1 - _GEN_621; // @[RefCounter.scala 71:103]
  wire [4:0] _GEN_622 = {{3'd0}, archRefInc_23}; // @[RefCounter.scala 71:97]
  wire [4:0] _archRefCounterNext_23_T_1 = archRefCounter_23 + _GEN_622; // @[RefCounter.scala 71:97]
  wire [4:0] _GEN_623 = {{3'd0}, archRefDec_23}; // @[RefCounter.scala 71:103]
  wire [4:0] _archRefCounterNext_23_T_3 = _archRefCounterNext_23_T_1 - _GEN_623; // @[RefCounter.scala 71:103]
  wire [4:0] _GEN_624 = {{3'd0}, archRefInc_24}; // @[RefCounter.scala 71:97]
  wire [4:0] _archRefCounterNext_24_T_1 = archRefCounter_24 + _GEN_624; // @[RefCounter.scala 71:97]
  wire [4:0] _GEN_625 = {{3'd0}, archRefDec_24}; // @[RefCounter.scala 71:103]
  wire [4:0] _archRefCounterNext_24_T_3 = _archRefCounterNext_24_T_1 - _GEN_625; // @[RefCounter.scala 71:103]
  wire [4:0] _GEN_626 = {{3'd0}, archRefInc_25}; // @[RefCounter.scala 71:97]
  wire [4:0] _archRefCounterNext_25_T_1 = archRefCounter_25 + _GEN_626; // @[RefCounter.scala 71:97]
  wire [4:0] _GEN_627 = {{3'd0}, archRefDec_25}; // @[RefCounter.scala 71:103]
  wire [4:0] _archRefCounterNext_25_T_3 = _archRefCounterNext_25_T_1 - _GEN_627; // @[RefCounter.scala 71:103]
  wire [4:0] _GEN_628 = {{3'd0}, archRefInc_26}; // @[RefCounter.scala 71:97]
  wire [4:0] _archRefCounterNext_26_T_1 = archRefCounter_26 + _GEN_628; // @[RefCounter.scala 71:97]
  wire [4:0] _GEN_629 = {{3'd0}, archRefDec_26}; // @[RefCounter.scala 71:103]
  wire [4:0] _archRefCounterNext_26_T_3 = _archRefCounterNext_26_T_1 - _GEN_629; // @[RefCounter.scala 71:103]
  wire [4:0] _GEN_630 = {{3'd0}, archRefInc_27}; // @[RefCounter.scala 71:97]
  wire [4:0] _archRefCounterNext_27_T_1 = archRefCounter_27 + _GEN_630; // @[RefCounter.scala 71:97]
  wire [4:0] _GEN_631 = {{3'd0}, archRefDec_27}; // @[RefCounter.scala 71:103]
  wire [4:0] _archRefCounterNext_27_T_3 = _archRefCounterNext_27_T_1 - _GEN_631; // @[RefCounter.scala 71:103]
  wire [4:0] _GEN_632 = {{3'd0}, archRefInc_28}; // @[RefCounter.scala 71:97]
  wire [4:0] _archRefCounterNext_28_T_1 = archRefCounter_28 + _GEN_632; // @[RefCounter.scala 71:97]
  wire [4:0] _GEN_633 = {{3'd0}, archRefDec_28}; // @[RefCounter.scala 71:103]
  wire [4:0] _archRefCounterNext_28_T_3 = _archRefCounterNext_28_T_1 - _GEN_633; // @[RefCounter.scala 71:103]
  wire [4:0] _GEN_634 = {{3'd0}, archRefInc_29}; // @[RefCounter.scala 71:97]
  wire [4:0] _archRefCounterNext_29_T_1 = archRefCounter_29 + _GEN_634; // @[RefCounter.scala 71:97]
  wire [4:0] _GEN_635 = {{3'd0}, archRefDec_29}; // @[RefCounter.scala 71:103]
  wire [4:0] _archRefCounterNext_29_T_3 = _archRefCounterNext_29_T_1 - _GEN_635; // @[RefCounter.scala 71:103]
  wire [4:0] _GEN_636 = {{3'd0}, archRefInc_30}; // @[RefCounter.scala 71:97]
  wire [4:0] _archRefCounterNext_30_T_1 = archRefCounter_30 + _GEN_636; // @[RefCounter.scala 71:97]
  wire [4:0] _GEN_637 = {{3'd0}, archRefDec_30}; // @[RefCounter.scala 71:103]
  wire [4:0] _archRefCounterNext_30_T_3 = _archRefCounterNext_30_T_1 - _GEN_637; // @[RefCounter.scala 71:103]
  wire [4:0] _GEN_638 = {{3'd0}, archRefInc_31}; // @[RefCounter.scala 71:97]
  wire [4:0] _archRefCounterNext_31_T_1 = archRefCounter_31 + _GEN_638; // @[RefCounter.scala 71:97]
  wire [4:0] _GEN_639 = {{3'd0}, archRefDec_31}; // @[RefCounter.scala 71:103]
  wire [4:0] _archRefCounterNext_31_T_3 = _archRefCounterNext_31_T_1 - _GEN_639; // @[RefCounter.scala 71:103]
  wire [4:0] _GEN_640 = {{3'd0}, archRefInc_32}; // @[RefCounter.scala 71:97]
  wire [4:0] _archRefCounterNext_32_T_1 = archRefCounter_32 + _GEN_640; // @[RefCounter.scala 71:97]
  wire [4:0] _GEN_641 = {{3'd0}, archRefDec_32}; // @[RefCounter.scala 71:103]
  wire [4:0] _archRefCounterNext_32_T_3 = _archRefCounterNext_32_T_1 - _GEN_641; // @[RefCounter.scala 71:103]
  wire [4:0] _GEN_642 = {{3'd0}, archRefInc_33}; // @[RefCounter.scala 71:97]
  wire [4:0] _archRefCounterNext_33_T_1 = archRefCounter_33 + _GEN_642; // @[RefCounter.scala 71:97]
  wire [4:0] _GEN_643 = {{3'd0}, archRefDec_33}; // @[RefCounter.scala 71:103]
  wire [4:0] _archRefCounterNext_33_T_3 = _archRefCounterNext_33_T_1 - _GEN_643; // @[RefCounter.scala 71:103]
  wire [4:0] _GEN_644 = {{3'd0}, archRefInc_34}; // @[RefCounter.scala 71:97]
  wire [4:0] _archRefCounterNext_34_T_1 = archRefCounter_34 + _GEN_644; // @[RefCounter.scala 71:97]
  wire [4:0] _GEN_645 = {{3'd0}, archRefDec_34}; // @[RefCounter.scala 71:103]
  wire [4:0] _archRefCounterNext_34_T_3 = _archRefCounterNext_34_T_1 - _GEN_645; // @[RefCounter.scala 71:103]
  wire [4:0] _GEN_646 = {{3'd0}, archRefInc_35}; // @[RefCounter.scala 71:97]
  wire [4:0] _archRefCounterNext_35_T_1 = archRefCounter_35 + _GEN_646; // @[RefCounter.scala 71:97]
  wire [4:0] _GEN_647 = {{3'd0}, archRefDec_35}; // @[RefCounter.scala 71:103]
  wire [4:0] _archRefCounterNext_35_T_3 = _archRefCounterNext_35_T_1 - _GEN_647; // @[RefCounter.scala 71:103]
  wire [4:0] _GEN_648 = {{3'd0}, archRefInc_36}; // @[RefCounter.scala 71:97]
  wire [4:0] _archRefCounterNext_36_T_1 = archRefCounter_36 + _GEN_648; // @[RefCounter.scala 71:97]
  wire [4:0] _GEN_649 = {{3'd0}, archRefDec_36}; // @[RefCounter.scala 71:103]
  wire [4:0] _archRefCounterNext_36_T_3 = _archRefCounterNext_36_T_1 - _GEN_649; // @[RefCounter.scala 71:103]
  wire [4:0] _GEN_650 = {{3'd0}, archRefInc_37}; // @[RefCounter.scala 71:97]
  wire [4:0] _archRefCounterNext_37_T_1 = archRefCounter_37 + _GEN_650; // @[RefCounter.scala 71:97]
  wire [4:0] _GEN_651 = {{3'd0}, archRefDec_37}; // @[RefCounter.scala 71:103]
  wire [4:0] _archRefCounterNext_37_T_3 = _archRefCounterNext_37_T_1 - _GEN_651; // @[RefCounter.scala 71:103]
  wire [4:0] _GEN_652 = {{3'd0}, archRefInc_38}; // @[RefCounter.scala 71:97]
  wire [4:0] _archRefCounterNext_38_T_1 = archRefCounter_38 + _GEN_652; // @[RefCounter.scala 71:97]
  wire [4:0] _GEN_653 = {{3'd0}, archRefDec_38}; // @[RefCounter.scala 71:103]
  wire [4:0] _archRefCounterNext_38_T_3 = _archRefCounterNext_38_T_1 - _GEN_653; // @[RefCounter.scala 71:103]
  wire [4:0] _GEN_654 = {{3'd0}, archRefInc_39}; // @[RefCounter.scala 71:97]
  wire [4:0] _archRefCounterNext_39_T_1 = archRefCounter_39 + _GEN_654; // @[RefCounter.scala 71:97]
  wire [4:0] _GEN_655 = {{3'd0}, archRefDec_39}; // @[RefCounter.scala 71:103]
  wire [4:0] _archRefCounterNext_39_T_3 = _archRefCounterNext_39_T_1 - _GEN_655; // @[RefCounter.scala 71:103]
  wire [4:0] _GEN_656 = {{3'd0}, archRefInc_40}; // @[RefCounter.scala 71:97]
  wire [4:0] _archRefCounterNext_40_T_1 = archRefCounter_40 + _GEN_656; // @[RefCounter.scala 71:97]
  wire [4:0] _GEN_657 = {{3'd0}, archRefDec_40}; // @[RefCounter.scala 71:103]
  wire [4:0] _archRefCounterNext_40_T_3 = _archRefCounterNext_40_T_1 - _GEN_657; // @[RefCounter.scala 71:103]
  wire [4:0] _GEN_658 = {{3'd0}, archRefInc_41}; // @[RefCounter.scala 71:97]
  wire [4:0] _archRefCounterNext_41_T_1 = archRefCounter_41 + _GEN_658; // @[RefCounter.scala 71:97]
  wire [4:0] _GEN_659 = {{3'd0}, archRefDec_41}; // @[RefCounter.scala 71:103]
  wire [4:0] _archRefCounterNext_41_T_3 = _archRefCounterNext_41_T_1 - _GEN_659; // @[RefCounter.scala 71:103]
  wire [4:0] _GEN_660 = {{3'd0}, archRefInc_42}; // @[RefCounter.scala 71:97]
  wire [4:0] _archRefCounterNext_42_T_1 = archRefCounter_42 + _GEN_660; // @[RefCounter.scala 71:97]
  wire [4:0] _GEN_661 = {{3'd0}, archRefDec_42}; // @[RefCounter.scala 71:103]
  wire [4:0] _archRefCounterNext_42_T_3 = _archRefCounterNext_42_T_1 - _GEN_661; // @[RefCounter.scala 71:103]
  wire [4:0] _GEN_662 = {{3'd0}, archRefInc_43}; // @[RefCounter.scala 71:97]
  wire [4:0] _archRefCounterNext_43_T_1 = archRefCounter_43 + _GEN_662; // @[RefCounter.scala 71:97]
  wire [4:0] _GEN_663 = {{3'd0}, archRefDec_43}; // @[RefCounter.scala 71:103]
  wire [4:0] _archRefCounterNext_43_T_3 = _archRefCounterNext_43_T_1 - _GEN_663; // @[RefCounter.scala 71:103]
  wire [4:0] _GEN_664 = {{3'd0}, archRefInc_44}; // @[RefCounter.scala 71:97]
  wire [4:0] _archRefCounterNext_44_T_1 = archRefCounter_44 + _GEN_664; // @[RefCounter.scala 71:97]
  wire [4:0] _GEN_665 = {{3'd0}, archRefDec_44}; // @[RefCounter.scala 71:103]
  wire [4:0] _archRefCounterNext_44_T_3 = _archRefCounterNext_44_T_1 - _GEN_665; // @[RefCounter.scala 71:103]
  wire [4:0] _GEN_666 = {{3'd0}, archRefInc_45}; // @[RefCounter.scala 71:97]
  wire [4:0] _archRefCounterNext_45_T_1 = archRefCounter_45 + _GEN_666; // @[RefCounter.scala 71:97]
  wire [4:0] _GEN_667 = {{3'd0}, archRefDec_45}; // @[RefCounter.scala 71:103]
  wire [4:0] _archRefCounterNext_45_T_3 = _archRefCounterNext_45_T_1 - _GEN_667; // @[RefCounter.scala 71:103]
  wire [4:0] _GEN_668 = {{3'd0}, archRefInc_46}; // @[RefCounter.scala 71:97]
  wire [4:0] _archRefCounterNext_46_T_1 = archRefCounter_46 + _GEN_668; // @[RefCounter.scala 71:97]
  wire [4:0] _GEN_669 = {{3'd0}, archRefDec_46}; // @[RefCounter.scala 71:103]
  wire [4:0] _archRefCounterNext_46_T_3 = _archRefCounterNext_46_T_1 - _GEN_669; // @[RefCounter.scala 71:103]
  wire [4:0] _GEN_670 = {{3'd0}, archRefInc_47}; // @[RefCounter.scala 71:97]
  wire [4:0] _archRefCounterNext_47_T_1 = archRefCounter_47 + _GEN_670; // @[RefCounter.scala 71:97]
  wire [4:0] _GEN_671 = {{3'd0}, archRefDec_47}; // @[RefCounter.scala 71:103]
  wire [4:0] _archRefCounterNext_47_T_3 = _archRefCounterNext_47_T_1 - _GEN_671; // @[RefCounter.scala 71:103]
  wire [4:0] _GEN_672 = {{3'd0}, archRefInc_48}; // @[RefCounter.scala 71:97]
  wire [4:0] _archRefCounterNext_48_T_1 = archRefCounter_48 + _GEN_672; // @[RefCounter.scala 71:97]
  wire [4:0] _GEN_673 = {{3'd0}, archRefDec_48}; // @[RefCounter.scala 71:103]
  wire [4:0] _archRefCounterNext_48_T_3 = _archRefCounterNext_48_T_1 - _GEN_673; // @[RefCounter.scala 71:103]
  wire [4:0] _GEN_674 = {{3'd0}, archRefInc_49}; // @[RefCounter.scala 71:97]
  wire [4:0] _archRefCounterNext_49_T_1 = archRefCounter_49 + _GEN_674; // @[RefCounter.scala 71:97]
  wire [4:0] _GEN_675 = {{3'd0}, archRefDec_49}; // @[RefCounter.scala 71:103]
  wire [4:0] _archRefCounterNext_49_T_3 = _archRefCounterNext_49_T_1 - _GEN_675; // @[RefCounter.scala 71:103]
  wire [4:0] _GEN_676 = {{3'd0}, archRefInc_50}; // @[RefCounter.scala 71:97]
  wire [4:0] _archRefCounterNext_50_T_1 = archRefCounter_50 + _GEN_676; // @[RefCounter.scala 71:97]
  wire [4:0] _GEN_677 = {{3'd0}, archRefDec_50}; // @[RefCounter.scala 71:103]
  wire [4:0] _archRefCounterNext_50_T_3 = _archRefCounterNext_50_T_1 - _GEN_677; // @[RefCounter.scala 71:103]
  wire [4:0] _GEN_678 = {{3'd0}, archRefInc_51}; // @[RefCounter.scala 71:97]
  wire [4:0] _archRefCounterNext_51_T_1 = archRefCounter_51 + _GEN_678; // @[RefCounter.scala 71:97]
  wire [4:0] _GEN_679 = {{3'd0}, archRefDec_51}; // @[RefCounter.scala 71:103]
  wire [4:0] _archRefCounterNext_51_T_3 = _archRefCounterNext_51_T_1 - _GEN_679; // @[RefCounter.scala 71:103]
  wire [4:0] _GEN_680 = {{3'd0}, archRefInc_52}; // @[RefCounter.scala 71:97]
  wire [4:0] _archRefCounterNext_52_T_1 = archRefCounter_52 + _GEN_680; // @[RefCounter.scala 71:97]
  wire [4:0] _GEN_681 = {{3'd0}, archRefDec_52}; // @[RefCounter.scala 71:103]
  wire [4:0] _archRefCounterNext_52_T_3 = _archRefCounterNext_52_T_1 - _GEN_681; // @[RefCounter.scala 71:103]
  wire [4:0] _GEN_682 = {{3'd0}, archRefInc_53}; // @[RefCounter.scala 71:97]
  wire [4:0] _archRefCounterNext_53_T_1 = archRefCounter_53 + _GEN_682; // @[RefCounter.scala 71:97]
  wire [4:0] _GEN_683 = {{3'd0}, archRefDec_53}; // @[RefCounter.scala 71:103]
  wire [4:0] _archRefCounterNext_53_T_3 = _archRefCounterNext_53_T_1 - _GEN_683; // @[RefCounter.scala 71:103]
  wire [4:0] _GEN_684 = {{3'd0}, archRefInc_54}; // @[RefCounter.scala 71:97]
  wire [4:0] _archRefCounterNext_54_T_1 = archRefCounter_54 + _GEN_684; // @[RefCounter.scala 71:97]
  wire [4:0] _GEN_685 = {{3'd0}, archRefDec_54}; // @[RefCounter.scala 71:103]
  wire [4:0] _archRefCounterNext_54_T_3 = _archRefCounterNext_54_T_1 - _GEN_685; // @[RefCounter.scala 71:103]
  wire [4:0] _GEN_686 = {{3'd0}, archRefInc_55}; // @[RefCounter.scala 71:97]
  wire [4:0] _archRefCounterNext_55_T_1 = archRefCounter_55 + _GEN_686; // @[RefCounter.scala 71:97]
  wire [4:0] _GEN_687 = {{3'd0}, archRefDec_55}; // @[RefCounter.scala 71:103]
  wire [4:0] _archRefCounterNext_55_T_3 = _archRefCounterNext_55_T_1 - _GEN_687; // @[RefCounter.scala 71:103]
  wire [4:0] _GEN_688 = {{3'd0}, archRefInc_56}; // @[RefCounter.scala 71:97]
  wire [4:0] _archRefCounterNext_56_T_1 = archRefCounter_56 + _GEN_688; // @[RefCounter.scala 71:97]
  wire [4:0] _GEN_689 = {{3'd0}, archRefDec_56}; // @[RefCounter.scala 71:103]
  wire [4:0] _archRefCounterNext_56_T_3 = _archRefCounterNext_56_T_1 - _GEN_689; // @[RefCounter.scala 71:103]
  wire [4:0] _GEN_690 = {{3'd0}, archRefInc_57}; // @[RefCounter.scala 71:97]
  wire [4:0] _archRefCounterNext_57_T_1 = archRefCounter_57 + _GEN_690; // @[RefCounter.scala 71:97]
  wire [4:0] _GEN_691 = {{3'd0}, archRefDec_57}; // @[RefCounter.scala 71:103]
  wire [4:0] _archRefCounterNext_57_T_3 = _archRefCounterNext_57_T_1 - _GEN_691; // @[RefCounter.scala 71:103]
  wire [4:0] _GEN_692 = {{3'd0}, archRefInc_58}; // @[RefCounter.scala 71:97]
  wire [4:0] _archRefCounterNext_58_T_1 = archRefCounter_58 + _GEN_692; // @[RefCounter.scala 71:97]
  wire [4:0] _GEN_693 = {{3'd0}, archRefDec_58}; // @[RefCounter.scala 71:103]
  wire [4:0] _archRefCounterNext_58_T_3 = _archRefCounterNext_58_T_1 - _GEN_693; // @[RefCounter.scala 71:103]
  wire [4:0] _GEN_694 = {{3'd0}, archRefInc_59}; // @[RefCounter.scala 71:97]
  wire [4:0] _archRefCounterNext_59_T_1 = archRefCounter_59 + _GEN_694; // @[RefCounter.scala 71:97]
  wire [4:0] _GEN_695 = {{3'd0}, archRefDec_59}; // @[RefCounter.scala 71:103]
  wire [4:0] _archRefCounterNext_59_T_3 = _archRefCounterNext_59_T_1 - _GEN_695; // @[RefCounter.scala 71:103]
  wire [4:0] _GEN_696 = {{3'd0}, archRefInc_60}; // @[RefCounter.scala 71:97]
  wire [4:0] _archRefCounterNext_60_T_1 = archRefCounter_60 + _GEN_696; // @[RefCounter.scala 71:97]
  wire [4:0] _GEN_697 = {{3'd0}, archRefDec_60}; // @[RefCounter.scala 71:103]
  wire [4:0] _archRefCounterNext_60_T_3 = _archRefCounterNext_60_T_1 - _GEN_697; // @[RefCounter.scala 71:103]
  wire [4:0] _GEN_698 = {{3'd0}, archRefInc_61}; // @[RefCounter.scala 71:97]
  wire [4:0] _archRefCounterNext_61_T_1 = archRefCounter_61 + _GEN_698; // @[RefCounter.scala 71:97]
  wire [4:0] _GEN_699 = {{3'd0}, archRefDec_61}; // @[RefCounter.scala 71:103]
  wire [4:0] _archRefCounterNext_61_T_3 = _archRefCounterNext_61_T_1 - _GEN_699; // @[RefCounter.scala 71:103]
  wire [4:0] _GEN_700 = {{3'd0}, archRefInc_62}; // @[RefCounter.scala 71:97]
  wire [4:0] _archRefCounterNext_62_T_1 = archRefCounter_62 + _GEN_700; // @[RefCounter.scala 71:97]
  wire [4:0] _GEN_701 = {{3'd0}, archRefDec_62}; // @[RefCounter.scala 71:103]
  wire [4:0] _archRefCounterNext_62_T_3 = _archRefCounterNext_62_T_1 - _GEN_701; // @[RefCounter.scala 71:103]
  wire [4:0] _GEN_702 = {{3'd0}, archRefInc_63}; // @[RefCounter.scala 71:97]
  wire [4:0] _archRefCounterNext_63_T_1 = archRefCounter_63 + _GEN_702; // @[RefCounter.scala 71:97]
  wire [4:0] _GEN_703 = {{3'd0}, archRefDec_63}; // @[RefCounter.scala 71:103]
  wire [4:0] _archRefCounterNext_63_T_3 = _archRefCounterNext_63_T_1 - _GEN_703; // @[RefCounter.scala 71:103]
  wire [4:0] _GEN_65 = 6'h1 == deallocate_0_bits ? refCounter_1 : 5'h0; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_66 = 6'h2 == deallocate_0_bits ? refCounter_2 : _GEN_65; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_67 = 6'h3 == deallocate_0_bits ? refCounter_3 : _GEN_66; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_68 = 6'h4 == deallocate_0_bits ? refCounter_4 : _GEN_67; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_69 = 6'h5 == deallocate_0_bits ? refCounter_5 : _GEN_68; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_70 = 6'h6 == deallocate_0_bits ? refCounter_6 : _GEN_69; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_71 = 6'h7 == deallocate_0_bits ? refCounter_7 : _GEN_70; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_72 = 6'h8 == deallocate_0_bits ? refCounter_8 : _GEN_71; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_73 = 6'h9 == deallocate_0_bits ? refCounter_9 : _GEN_72; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_74 = 6'ha == deallocate_0_bits ? refCounter_10 : _GEN_73; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_75 = 6'hb == deallocate_0_bits ? refCounter_11 : _GEN_74; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_76 = 6'hc == deallocate_0_bits ? refCounter_12 : _GEN_75; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_77 = 6'hd == deallocate_0_bits ? refCounter_13 : _GEN_76; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_78 = 6'he == deallocate_0_bits ? refCounter_14 : _GEN_77; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_79 = 6'hf == deallocate_0_bits ? refCounter_15 : _GEN_78; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_80 = 6'h10 == deallocate_0_bits ? refCounter_16 : _GEN_79; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_81 = 6'h11 == deallocate_0_bits ? refCounter_17 : _GEN_80; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_82 = 6'h12 == deallocate_0_bits ? refCounter_18 : _GEN_81; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_83 = 6'h13 == deallocate_0_bits ? refCounter_19 : _GEN_82; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_84 = 6'h14 == deallocate_0_bits ? refCounter_20 : _GEN_83; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_85 = 6'h15 == deallocate_0_bits ? refCounter_21 : _GEN_84; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_86 = 6'h16 == deallocate_0_bits ? refCounter_22 : _GEN_85; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_87 = 6'h17 == deallocate_0_bits ? refCounter_23 : _GEN_86; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_88 = 6'h18 == deallocate_0_bits ? refCounter_24 : _GEN_87; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_89 = 6'h19 == deallocate_0_bits ? refCounter_25 : _GEN_88; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_90 = 6'h1a == deallocate_0_bits ? refCounter_26 : _GEN_89; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_91 = 6'h1b == deallocate_0_bits ? refCounter_27 : _GEN_90; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_92 = 6'h1c == deallocate_0_bits ? refCounter_28 : _GEN_91; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_93 = 6'h1d == deallocate_0_bits ? refCounter_29 : _GEN_92; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_94 = 6'h1e == deallocate_0_bits ? refCounter_30 : _GEN_93; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_95 = 6'h1f == deallocate_0_bits ? refCounter_31 : _GEN_94; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_96 = 6'h20 == deallocate_0_bits ? refCounter_32 : _GEN_95; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_97 = 6'h21 == deallocate_0_bits ? refCounter_33 : _GEN_96; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_98 = 6'h22 == deallocate_0_bits ? refCounter_34 : _GEN_97; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_99 = 6'h23 == deallocate_0_bits ? refCounter_35 : _GEN_98; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_100 = 6'h24 == deallocate_0_bits ? refCounter_36 : _GEN_99; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_101 = 6'h25 == deallocate_0_bits ? refCounter_37 : _GEN_100; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_102 = 6'h26 == deallocate_0_bits ? refCounter_38 : _GEN_101; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_103 = 6'h27 == deallocate_0_bits ? refCounter_39 : _GEN_102; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_104 = 6'h28 == deallocate_0_bits ? refCounter_40 : _GEN_103; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_105 = 6'h29 == deallocate_0_bits ? refCounter_41 : _GEN_104; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_106 = 6'h2a == deallocate_0_bits ? refCounter_42 : _GEN_105; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_107 = 6'h2b == deallocate_0_bits ? refCounter_43 : _GEN_106; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_108 = 6'h2c == deallocate_0_bits ? refCounter_44 : _GEN_107; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_109 = 6'h2d == deallocate_0_bits ? refCounter_45 : _GEN_108; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_110 = 6'h2e == deallocate_0_bits ? refCounter_46 : _GEN_109; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_111 = 6'h2f == deallocate_0_bits ? refCounter_47 : _GEN_110; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_112 = 6'h30 == deallocate_0_bits ? refCounter_48 : _GEN_111; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_113 = 6'h31 == deallocate_0_bits ? refCounter_49 : _GEN_112; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_114 = 6'h32 == deallocate_0_bits ? refCounter_50 : _GEN_113; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_115 = 6'h33 == deallocate_0_bits ? refCounter_51 : _GEN_114; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_116 = 6'h34 == deallocate_0_bits ? refCounter_52 : _GEN_115; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_117 = 6'h35 == deallocate_0_bits ? refCounter_53 : _GEN_116; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_118 = 6'h36 == deallocate_0_bits ? refCounter_54 : _GEN_117; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_119 = 6'h37 == deallocate_0_bits ? refCounter_55 : _GEN_118; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_120 = 6'h38 == deallocate_0_bits ? refCounter_56 : _GEN_119; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_121 = 6'h39 == deallocate_0_bits ? refCounter_57 : _GEN_120; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_122 = 6'h3a == deallocate_0_bits ? refCounter_58 : _GEN_121; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_123 = 6'h3b == deallocate_0_bits ? refCounter_59 : _GEN_122; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_124 = 6'h3c == deallocate_0_bits ? refCounter_60 : _GEN_123; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_125 = 6'h3d == deallocate_0_bits ? refCounter_61 : _GEN_124; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_126 = 6'h3e == deallocate_0_bits ? refCounter_62 : _GEN_125; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_127 = 6'h3f == deallocate_0_bits ? refCounter_63 : _GEN_126; // @[RefCounter.scala 78:{53,53}]
  wire  _refCounterInc_1_T_1 = allocate_0_valid & allocateOH_0[1]; // @[RefCounter.scala 107:87]
  wire  _refCounterInc_1_T_3 = allocate_1_valid & allocateOH_1[1]; // @[RefCounter.scala 107:87]
  wire [1:0] _refCounterInc_1_T_4 = _refCounterInc_1_T_1 + _refCounterInc_1_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterInc_1 = {{3'd0}, _refCounterInc_1_T_4};
  wire [4:0] _GEN_129 = 6'h1 == deallocate_0_bits ? refCounterInc_1 : 5'h0; // @[RefCounter.scala 81:{39,39}]
  wire  _refCounterInc_2_T_1 = allocate_0_valid & allocateOH_0[2]; // @[RefCounter.scala 107:87]
  wire  _refCounterInc_2_T_3 = allocate_1_valid & allocateOH_1[2]; // @[RefCounter.scala 107:87]
  wire [1:0] _refCounterInc_2_T_4 = _refCounterInc_2_T_1 + _refCounterInc_2_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterInc_2 = {{3'd0}, _refCounterInc_2_T_4};
  wire [4:0] _GEN_130 = 6'h2 == deallocate_0_bits ? refCounterInc_2 : _GEN_129; // @[RefCounter.scala 81:{39,39}]
  wire  _refCounterInc_3_T_1 = allocate_0_valid & allocateOH_0[3]; // @[RefCounter.scala 107:87]
  wire  _refCounterInc_3_T_3 = allocate_1_valid & allocateOH_1[3]; // @[RefCounter.scala 107:87]
  wire [1:0] _refCounterInc_3_T_4 = _refCounterInc_3_T_1 + _refCounterInc_3_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterInc_3 = {{3'd0}, _refCounterInc_3_T_4};
  wire [4:0] _GEN_131 = 6'h3 == deallocate_0_bits ? refCounterInc_3 : _GEN_130; // @[RefCounter.scala 81:{39,39}]
  wire  _refCounterInc_4_T_1 = allocate_0_valid & allocateOH_0[4]; // @[RefCounter.scala 107:87]
  wire  _refCounterInc_4_T_3 = allocate_1_valid & allocateOH_1[4]; // @[RefCounter.scala 107:87]
  wire [1:0] _refCounterInc_4_T_4 = _refCounterInc_4_T_1 + _refCounterInc_4_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterInc_4 = {{3'd0}, _refCounterInc_4_T_4};
  wire [4:0] _GEN_132 = 6'h4 == deallocate_0_bits ? refCounterInc_4 : _GEN_131; // @[RefCounter.scala 81:{39,39}]
  wire  _refCounterInc_5_T_1 = allocate_0_valid & allocateOH_0[5]; // @[RefCounter.scala 107:87]
  wire  _refCounterInc_5_T_3 = allocate_1_valid & allocateOH_1[5]; // @[RefCounter.scala 107:87]
  wire [1:0] _refCounterInc_5_T_4 = _refCounterInc_5_T_1 + _refCounterInc_5_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterInc_5 = {{3'd0}, _refCounterInc_5_T_4};
  wire [4:0] _GEN_133 = 6'h5 == deallocate_0_bits ? refCounterInc_5 : _GEN_132; // @[RefCounter.scala 81:{39,39}]
  wire  _refCounterInc_6_T_1 = allocate_0_valid & allocateOH_0[6]; // @[RefCounter.scala 107:87]
  wire  _refCounterInc_6_T_3 = allocate_1_valid & allocateOH_1[6]; // @[RefCounter.scala 107:87]
  wire [1:0] _refCounterInc_6_T_4 = _refCounterInc_6_T_1 + _refCounterInc_6_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterInc_6 = {{3'd0}, _refCounterInc_6_T_4};
  wire [4:0] _GEN_134 = 6'h6 == deallocate_0_bits ? refCounterInc_6 : _GEN_133; // @[RefCounter.scala 81:{39,39}]
  wire  _refCounterInc_7_T_1 = allocate_0_valid & allocateOH_0[7]; // @[RefCounter.scala 107:87]
  wire  _refCounterInc_7_T_3 = allocate_1_valid & allocateOH_1[7]; // @[RefCounter.scala 107:87]
  wire [1:0] _refCounterInc_7_T_4 = _refCounterInc_7_T_1 + _refCounterInc_7_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterInc_7 = {{3'd0}, _refCounterInc_7_T_4};
  wire [4:0] _GEN_135 = 6'h7 == deallocate_0_bits ? refCounterInc_7 : _GEN_134; // @[RefCounter.scala 81:{39,39}]
  wire  _refCounterInc_8_T_1 = allocate_0_valid & allocateOH_0[8]; // @[RefCounter.scala 107:87]
  wire  _refCounterInc_8_T_3 = allocate_1_valid & allocateOH_1[8]; // @[RefCounter.scala 107:87]
  wire [1:0] _refCounterInc_8_T_4 = _refCounterInc_8_T_1 + _refCounterInc_8_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterInc_8 = {{3'd0}, _refCounterInc_8_T_4};
  wire [4:0] _GEN_136 = 6'h8 == deallocate_0_bits ? refCounterInc_8 : _GEN_135; // @[RefCounter.scala 81:{39,39}]
  wire  _refCounterInc_9_T_1 = allocate_0_valid & allocateOH_0[9]; // @[RefCounter.scala 107:87]
  wire  _refCounterInc_9_T_3 = allocate_1_valid & allocateOH_1[9]; // @[RefCounter.scala 107:87]
  wire [1:0] _refCounterInc_9_T_4 = _refCounterInc_9_T_1 + _refCounterInc_9_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterInc_9 = {{3'd0}, _refCounterInc_9_T_4};
  wire [4:0] _GEN_137 = 6'h9 == deallocate_0_bits ? refCounterInc_9 : _GEN_136; // @[RefCounter.scala 81:{39,39}]
  wire  _refCounterInc_10_T_1 = allocate_0_valid & allocateOH_0[10]; // @[RefCounter.scala 107:87]
  wire  _refCounterInc_10_T_3 = allocate_1_valid & allocateOH_1[10]; // @[RefCounter.scala 107:87]
  wire [1:0] _refCounterInc_10_T_4 = _refCounterInc_10_T_1 + _refCounterInc_10_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterInc_10 = {{3'd0}, _refCounterInc_10_T_4};
  wire [4:0] _GEN_138 = 6'ha == deallocate_0_bits ? refCounterInc_10 : _GEN_137; // @[RefCounter.scala 81:{39,39}]
  wire  _refCounterInc_11_T_1 = allocate_0_valid & allocateOH_0[11]; // @[RefCounter.scala 107:87]
  wire  _refCounterInc_11_T_3 = allocate_1_valid & allocateOH_1[11]; // @[RefCounter.scala 107:87]
  wire [1:0] _refCounterInc_11_T_4 = _refCounterInc_11_T_1 + _refCounterInc_11_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterInc_11 = {{3'd0}, _refCounterInc_11_T_4};
  wire [4:0] _GEN_139 = 6'hb == deallocate_0_bits ? refCounterInc_11 : _GEN_138; // @[RefCounter.scala 81:{39,39}]
  wire  _refCounterInc_12_T_1 = allocate_0_valid & allocateOH_0[12]; // @[RefCounter.scala 107:87]
  wire  _refCounterInc_12_T_3 = allocate_1_valid & allocateOH_1[12]; // @[RefCounter.scala 107:87]
  wire [1:0] _refCounterInc_12_T_4 = _refCounterInc_12_T_1 + _refCounterInc_12_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterInc_12 = {{3'd0}, _refCounterInc_12_T_4};
  wire [4:0] _GEN_140 = 6'hc == deallocate_0_bits ? refCounterInc_12 : _GEN_139; // @[RefCounter.scala 81:{39,39}]
  wire  _refCounterInc_13_T_1 = allocate_0_valid & allocateOH_0[13]; // @[RefCounter.scala 107:87]
  wire  _refCounterInc_13_T_3 = allocate_1_valid & allocateOH_1[13]; // @[RefCounter.scala 107:87]
  wire [1:0] _refCounterInc_13_T_4 = _refCounterInc_13_T_1 + _refCounterInc_13_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterInc_13 = {{3'd0}, _refCounterInc_13_T_4};
  wire [4:0] _GEN_141 = 6'hd == deallocate_0_bits ? refCounterInc_13 : _GEN_140; // @[RefCounter.scala 81:{39,39}]
  wire  _refCounterInc_14_T_1 = allocate_0_valid & allocateOH_0[14]; // @[RefCounter.scala 107:87]
  wire  _refCounterInc_14_T_3 = allocate_1_valid & allocateOH_1[14]; // @[RefCounter.scala 107:87]
  wire [1:0] _refCounterInc_14_T_4 = _refCounterInc_14_T_1 + _refCounterInc_14_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterInc_14 = {{3'd0}, _refCounterInc_14_T_4};
  wire [4:0] _GEN_142 = 6'he == deallocate_0_bits ? refCounterInc_14 : _GEN_141; // @[RefCounter.scala 81:{39,39}]
  wire  _refCounterInc_15_T_1 = allocate_0_valid & allocateOH_0[15]; // @[RefCounter.scala 107:87]
  wire  _refCounterInc_15_T_3 = allocate_1_valid & allocateOH_1[15]; // @[RefCounter.scala 107:87]
  wire [1:0] _refCounterInc_15_T_4 = _refCounterInc_15_T_1 + _refCounterInc_15_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterInc_15 = {{3'd0}, _refCounterInc_15_T_4};
  wire [4:0] _GEN_143 = 6'hf == deallocate_0_bits ? refCounterInc_15 : _GEN_142; // @[RefCounter.scala 81:{39,39}]
  wire  _refCounterInc_16_T_1 = allocate_0_valid & allocateOH_0[16]; // @[RefCounter.scala 107:87]
  wire  _refCounterInc_16_T_3 = allocate_1_valid & allocateOH_1[16]; // @[RefCounter.scala 107:87]
  wire [1:0] _refCounterInc_16_T_4 = _refCounterInc_16_T_1 + _refCounterInc_16_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterInc_16 = {{3'd0}, _refCounterInc_16_T_4};
  wire [4:0] _GEN_144 = 6'h10 == deallocate_0_bits ? refCounterInc_16 : _GEN_143; // @[RefCounter.scala 81:{39,39}]
  wire  _refCounterInc_17_T_1 = allocate_0_valid & allocateOH_0[17]; // @[RefCounter.scala 107:87]
  wire  _refCounterInc_17_T_3 = allocate_1_valid & allocateOH_1[17]; // @[RefCounter.scala 107:87]
  wire [1:0] _refCounterInc_17_T_4 = _refCounterInc_17_T_1 + _refCounterInc_17_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterInc_17 = {{3'd0}, _refCounterInc_17_T_4};
  wire [4:0] _GEN_145 = 6'h11 == deallocate_0_bits ? refCounterInc_17 : _GEN_144; // @[RefCounter.scala 81:{39,39}]
  wire  _refCounterInc_18_T_1 = allocate_0_valid & allocateOH_0[18]; // @[RefCounter.scala 107:87]
  wire  _refCounterInc_18_T_3 = allocate_1_valid & allocateOH_1[18]; // @[RefCounter.scala 107:87]
  wire [1:0] _refCounterInc_18_T_4 = _refCounterInc_18_T_1 + _refCounterInc_18_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterInc_18 = {{3'd0}, _refCounterInc_18_T_4};
  wire [4:0] _GEN_146 = 6'h12 == deallocate_0_bits ? refCounterInc_18 : _GEN_145; // @[RefCounter.scala 81:{39,39}]
  wire  _refCounterInc_19_T_1 = allocate_0_valid & allocateOH_0[19]; // @[RefCounter.scala 107:87]
  wire  _refCounterInc_19_T_3 = allocate_1_valid & allocateOH_1[19]; // @[RefCounter.scala 107:87]
  wire [1:0] _refCounterInc_19_T_4 = _refCounterInc_19_T_1 + _refCounterInc_19_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterInc_19 = {{3'd0}, _refCounterInc_19_T_4};
  wire [4:0] _GEN_147 = 6'h13 == deallocate_0_bits ? refCounterInc_19 : _GEN_146; // @[RefCounter.scala 81:{39,39}]
  wire  _refCounterInc_20_T_1 = allocate_0_valid & allocateOH_0[20]; // @[RefCounter.scala 107:87]
  wire  _refCounterInc_20_T_3 = allocate_1_valid & allocateOH_1[20]; // @[RefCounter.scala 107:87]
  wire [1:0] _refCounterInc_20_T_4 = _refCounterInc_20_T_1 + _refCounterInc_20_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterInc_20 = {{3'd0}, _refCounterInc_20_T_4};
  wire [4:0] _GEN_148 = 6'h14 == deallocate_0_bits ? refCounterInc_20 : _GEN_147; // @[RefCounter.scala 81:{39,39}]
  wire  _refCounterInc_21_T_1 = allocate_0_valid & allocateOH_0[21]; // @[RefCounter.scala 107:87]
  wire  _refCounterInc_21_T_3 = allocate_1_valid & allocateOH_1[21]; // @[RefCounter.scala 107:87]
  wire [1:0] _refCounterInc_21_T_4 = _refCounterInc_21_T_1 + _refCounterInc_21_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterInc_21 = {{3'd0}, _refCounterInc_21_T_4};
  wire [4:0] _GEN_149 = 6'h15 == deallocate_0_bits ? refCounterInc_21 : _GEN_148; // @[RefCounter.scala 81:{39,39}]
  wire  _refCounterInc_22_T_1 = allocate_0_valid & allocateOH_0[22]; // @[RefCounter.scala 107:87]
  wire  _refCounterInc_22_T_3 = allocate_1_valid & allocateOH_1[22]; // @[RefCounter.scala 107:87]
  wire [1:0] _refCounterInc_22_T_4 = _refCounterInc_22_T_1 + _refCounterInc_22_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterInc_22 = {{3'd0}, _refCounterInc_22_T_4};
  wire [4:0] _GEN_150 = 6'h16 == deallocate_0_bits ? refCounterInc_22 : _GEN_149; // @[RefCounter.scala 81:{39,39}]
  wire  _refCounterInc_23_T_1 = allocate_0_valid & allocateOH_0[23]; // @[RefCounter.scala 107:87]
  wire  _refCounterInc_23_T_3 = allocate_1_valid & allocateOH_1[23]; // @[RefCounter.scala 107:87]
  wire [1:0] _refCounterInc_23_T_4 = _refCounterInc_23_T_1 + _refCounterInc_23_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterInc_23 = {{3'd0}, _refCounterInc_23_T_4};
  wire [4:0] _GEN_151 = 6'h17 == deallocate_0_bits ? refCounterInc_23 : _GEN_150; // @[RefCounter.scala 81:{39,39}]
  wire  _refCounterInc_24_T_1 = allocate_0_valid & allocateOH_0[24]; // @[RefCounter.scala 107:87]
  wire  _refCounterInc_24_T_3 = allocate_1_valid & allocateOH_1[24]; // @[RefCounter.scala 107:87]
  wire [1:0] _refCounterInc_24_T_4 = _refCounterInc_24_T_1 + _refCounterInc_24_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterInc_24 = {{3'd0}, _refCounterInc_24_T_4};
  wire [4:0] _GEN_152 = 6'h18 == deallocate_0_bits ? refCounterInc_24 : _GEN_151; // @[RefCounter.scala 81:{39,39}]
  wire  _refCounterInc_25_T_1 = allocate_0_valid & allocateOH_0[25]; // @[RefCounter.scala 107:87]
  wire  _refCounterInc_25_T_3 = allocate_1_valid & allocateOH_1[25]; // @[RefCounter.scala 107:87]
  wire [1:0] _refCounterInc_25_T_4 = _refCounterInc_25_T_1 + _refCounterInc_25_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterInc_25 = {{3'd0}, _refCounterInc_25_T_4};
  wire [4:0] _GEN_153 = 6'h19 == deallocate_0_bits ? refCounterInc_25 : _GEN_152; // @[RefCounter.scala 81:{39,39}]
  wire  _refCounterInc_26_T_1 = allocate_0_valid & allocateOH_0[26]; // @[RefCounter.scala 107:87]
  wire  _refCounterInc_26_T_3 = allocate_1_valid & allocateOH_1[26]; // @[RefCounter.scala 107:87]
  wire [1:0] _refCounterInc_26_T_4 = _refCounterInc_26_T_1 + _refCounterInc_26_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterInc_26 = {{3'd0}, _refCounterInc_26_T_4};
  wire [4:0] _GEN_154 = 6'h1a == deallocate_0_bits ? refCounterInc_26 : _GEN_153; // @[RefCounter.scala 81:{39,39}]
  wire  _refCounterInc_27_T_1 = allocate_0_valid & allocateOH_0[27]; // @[RefCounter.scala 107:87]
  wire  _refCounterInc_27_T_3 = allocate_1_valid & allocateOH_1[27]; // @[RefCounter.scala 107:87]
  wire [1:0] _refCounterInc_27_T_4 = _refCounterInc_27_T_1 + _refCounterInc_27_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterInc_27 = {{3'd0}, _refCounterInc_27_T_4};
  wire [4:0] _GEN_155 = 6'h1b == deallocate_0_bits ? refCounterInc_27 : _GEN_154; // @[RefCounter.scala 81:{39,39}]
  wire  _refCounterInc_28_T_1 = allocate_0_valid & allocateOH_0[28]; // @[RefCounter.scala 107:87]
  wire  _refCounterInc_28_T_3 = allocate_1_valid & allocateOH_1[28]; // @[RefCounter.scala 107:87]
  wire [1:0] _refCounterInc_28_T_4 = _refCounterInc_28_T_1 + _refCounterInc_28_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterInc_28 = {{3'd0}, _refCounterInc_28_T_4};
  wire [4:0] _GEN_156 = 6'h1c == deallocate_0_bits ? refCounterInc_28 : _GEN_155; // @[RefCounter.scala 81:{39,39}]
  wire  _refCounterInc_29_T_1 = allocate_0_valid & allocateOH_0[29]; // @[RefCounter.scala 107:87]
  wire  _refCounterInc_29_T_3 = allocate_1_valid & allocateOH_1[29]; // @[RefCounter.scala 107:87]
  wire [1:0] _refCounterInc_29_T_4 = _refCounterInc_29_T_1 + _refCounterInc_29_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterInc_29 = {{3'd0}, _refCounterInc_29_T_4};
  wire [4:0] _GEN_157 = 6'h1d == deallocate_0_bits ? refCounterInc_29 : _GEN_156; // @[RefCounter.scala 81:{39,39}]
  wire  _refCounterInc_30_T_1 = allocate_0_valid & allocateOH_0[30]; // @[RefCounter.scala 107:87]
  wire  _refCounterInc_30_T_3 = allocate_1_valid & allocateOH_1[30]; // @[RefCounter.scala 107:87]
  wire [1:0] _refCounterInc_30_T_4 = _refCounterInc_30_T_1 + _refCounterInc_30_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterInc_30 = {{3'd0}, _refCounterInc_30_T_4};
  wire [4:0] _GEN_158 = 6'h1e == deallocate_0_bits ? refCounterInc_30 : _GEN_157; // @[RefCounter.scala 81:{39,39}]
  wire  _refCounterInc_31_T_1 = allocate_0_valid & allocateOH_0[31]; // @[RefCounter.scala 107:87]
  wire  _refCounterInc_31_T_3 = allocate_1_valid & allocateOH_1[31]; // @[RefCounter.scala 107:87]
  wire [1:0] _refCounterInc_31_T_4 = _refCounterInc_31_T_1 + _refCounterInc_31_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterInc_31 = {{3'd0}, _refCounterInc_31_T_4};
  wire [4:0] _GEN_159 = 6'h1f == deallocate_0_bits ? refCounterInc_31 : _GEN_158; // @[RefCounter.scala 81:{39,39}]
  wire  _refCounterInc_32_T_1 = allocate_0_valid & allocateOH_0[32]; // @[RefCounter.scala 107:87]
  wire  _refCounterInc_32_T_3 = allocate_1_valid & allocateOH_1[32]; // @[RefCounter.scala 107:87]
  wire [1:0] _refCounterInc_32_T_4 = _refCounterInc_32_T_1 + _refCounterInc_32_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterInc_32 = {{3'd0}, _refCounterInc_32_T_4};
  wire [4:0] _GEN_160 = 6'h20 == deallocate_0_bits ? refCounterInc_32 : _GEN_159; // @[RefCounter.scala 81:{39,39}]
  wire  _refCounterInc_33_T_1 = allocate_0_valid & allocateOH_0[33]; // @[RefCounter.scala 107:87]
  wire  _refCounterInc_33_T_3 = allocate_1_valid & allocateOH_1[33]; // @[RefCounter.scala 107:87]
  wire [1:0] _refCounterInc_33_T_4 = _refCounterInc_33_T_1 + _refCounterInc_33_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterInc_33 = {{3'd0}, _refCounterInc_33_T_4};
  wire [4:0] _GEN_161 = 6'h21 == deallocate_0_bits ? refCounterInc_33 : _GEN_160; // @[RefCounter.scala 81:{39,39}]
  wire  _refCounterInc_34_T_1 = allocate_0_valid & allocateOH_0[34]; // @[RefCounter.scala 107:87]
  wire  _refCounterInc_34_T_3 = allocate_1_valid & allocateOH_1[34]; // @[RefCounter.scala 107:87]
  wire [1:0] _refCounterInc_34_T_4 = _refCounterInc_34_T_1 + _refCounterInc_34_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterInc_34 = {{3'd0}, _refCounterInc_34_T_4};
  wire [4:0] _GEN_162 = 6'h22 == deallocate_0_bits ? refCounterInc_34 : _GEN_161; // @[RefCounter.scala 81:{39,39}]
  wire  _refCounterInc_35_T_1 = allocate_0_valid & allocateOH_0[35]; // @[RefCounter.scala 107:87]
  wire  _refCounterInc_35_T_3 = allocate_1_valid & allocateOH_1[35]; // @[RefCounter.scala 107:87]
  wire [1:0] _refCounterInc_35_T_4 = _refCounterInc_35_T_1 + _refCounterInc_35_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterInc_35 = {{3'd0}, _refCounterInc_35_T_4};
  wire [4:0] _GEN_163 = 6'h23 == deallocate_0_bits ? refCounterInc_35 : _GEN_162; // @[RefCounter.scala 81:{39,39}]
  wire  _refCounterInc_36_T_1 = allocate_0_valid & allocateOH_0[36]; // @[RefCounter.scala 107:87]
  wire  _refCounterInc_36_T_3 = allocate_1_valid & allocateOH_1[36]; // @[RefCounter.scala 107:87]
  wire [1:0] _refCounterInc_36_T_4 = _refCounterInc_36_T_1 + _refCounterInc_36_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterInc_36 = {{3'd0}, _refCounterInc_36_T_4};
  wire [4:0] _GEN_164 = 6'h24 == deallocate_0_bits ? refCounterInc_36 : _GEN_163; // @[RefCounter.scala 81:{39,39}]
  wire  _refCounterInc_37_T_1 = allocate_0_valid & allocateOH_0[37]; // @[RefCounter.scala 107:87]
  wire  _refCounterInc_37_T_3 = allocate_1_valid & allocateOH_1[37]; // @[RefCounter.scala 107:87]
  wire [1:0] _refCounterInc_37_T_4 = _refCounterInc_37_T_1 + _refCounterInc_37_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterInc_37 = {{3'd0}, _refCounterInc_37_T_4};
  wire [4:0] _GEN_165 = 6'h25 == deallocate_0_bits ? refCounterInc_37 : _GEN_164; // @[RefCounter.scala 81:{39,39}]
  wire  _refCounterInc_38_T_1 = allocate_0_valid & allocateOH_0[38]; // @[RefCounter.scala 107:87]
  wire  _refCounterInc_38_T_3 = allocate_1_valid & allocateOH_1[38]; // @[RefCounter.scala 107:87]
  wire [1:0] _refCounterInc_38_T_4 = _refCounterInc_38_T_1 + _refCounterInc_38_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterInc_38 = {{3'd0}, _refCounterInc_38_T_4};
  wire [4:0] _GEN_166 = 6'h26 == deallocate_0_bits ? refCounterInc_38 : _GEN_165; // @[RefCounter.scala 81:{39,39}]
  wire  _refCounterInc_39_T_1 = allocate_0_valid & allocateOH_0[39]; // @[RefCounter.scala 107:87]
  wire  _refCounterInc_39_T_3 = allocate_1_valid & allocateOH_1[39]; // @[RefCounter.scala 107:87]
  wire [1:0] _refCounterInc_39_T_4 = _refCounterInc_39_T_1 + _refCounterInc_39_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterInc_39 = {{3'd0}, _refCounterInc_39_T_4};
  wire [4:0] _GEN_167 = 6'h27 == deallocate_0_bits ? refCounterInc_39 : _GEN_166; // @[RefCounter.scala 81:{39,39}]
  wire  _refCounterInc_40_T_1 = allocate_0_valid & allocateOH_0[40]; // @[RefCounter.scala 107:87]
  wire  _refCounterInc_40_T_3 = allocate_1_valid & allocateOH_1[40]; // @[RefCounter.scala 107:87]
  wire [1:0] _refCounterInc_40_T_4 = _refCounterInc_40_T_1 + _refCounterInc_40_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterInc_40 = {{3'd0}, _refCounterInc_40_T_4};
  wire [4:0] _GEN_168 = 6'h28 == deallocate_0_bits ? refCounterInc_40 : _GEN_167; // @[RefCounter.scala 81:{39,39}]
  wire  _refCounterInc_41_T_1 = allocate_0_valid & allocateOH_0[41]; // @[RefCounter.scala 107:87]
  wire  _refCounterInc_41_T_3 = allocate_1_valid & allocateOH_1[41]; // @[RefCounter.scala 107:87]
  wire [1:0] _refCounterInc_41_T_4 = _refCounterInc_41_T_1 + _refCounterInc_41_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterInc_41 = {{3'd0}, _refCounterInc_41_T_4};
  wire [4:0] _GEN_169 = 6'h29 == deallocate_0_bits ? refCounterInc_41 : _GEN_168; // @[RefCounter.scala 81:{39,39}]
  wire  _refCounterInc_42_T_1 = allocate_0_valid & allocateOH_0[42]; // @[RefCounter.scala 107:87]
  wire  _refCounterInc_42_T_3 = allocate_1_valid & allocateOH_1[42]; // @[RefCounter.scala 107:87]
  wire [1:0] _refCounterInc_42_T_4 = _refCounterInc_42_T_1 + _refCounterInc_42_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterInc_42 = {{3'd0}, _refCounterInc_42_T_4};
  wire [4:0] _GEN_170 = 6'h2a == deallocate_0_bits ? refCounterInc_42 : _GEN_169; // @[RefCounter.scala 81:{39,39}]
  wire  _refCounterInc_43_T_1 = allocate_0_valid & allocateOH_0[43]; // @[RefCounter.scala 107:87]
  wire  _refCounterInc_43_T_3 = allocate_1_valid & allocateOH_1[43]; // @[RefCounter.scala 107:87]
  wire [1:0] _refCounterInc_43_T_4 = _refCounterInc_43_T_1 + _refCounterInc_43_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterInc_43 = {{3'd0}, _refCounterInc_43_T_4};
  wire [4:0] _GEN_171 = 6'h2b == deallocate_0_bits ? refCounterInc_43 : _GEN_170; // @[RefCounter.scala 81:{39,39}]
  wire  _refCounterInc_44_T_1 = allocate_0_valid & allocateOH_0[44]; // @[RefCounter.scala 107:87]
  wire  _refCounterInc_44_T_3 = allocate_1_valid & allocateOH_1[44]; // @[RefCounter.scala 107:87]
  wire [1:0] _refCounterInc_44_T_4 = _refCounterInc_44_T_1 + _refCounterInc_44_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterInc_44 = {{3'd0}, _refCounterInc_44_T_4};
  wire [4:0] _GEN_172 = 6'h2c == deallocate_0_bits ? refCounterInc_44 : _GEN_171; // @[RefCounter.scala 81:{39,39}]
  wire  _refCounterInc_45_T_1 = allocate_0_valid & allocateOH_0[45]; // @[RefCounter.scala 107:87]
  wire  _refCounterInc_45_T_3 = allocate_1_valid & allocateOH_1[45]; // @[RefCounter.scala 107:87]
  wire [1:0] _refCounterInc_45_T_4 = _refCounterInc_45_T_1 + _refCounterInc_45_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterInc_45 = {{3'd0}, _refCounterInc_45_T_4};
  wire [4:0] _GEN_173 = 6'h2d == deallocate_0_bits ? refCounterInc_45 : _GEN_172; // @[RefCounter.scala 81:{39,39}]
  wire  _refCounterInc_46_T_1 = allocate_0_valid & allocateOH_0[46]; // @[RefCounter.scala 107:87]
  wire  _refCounterInc_46_T_3 = allocate_1_valid & allocateOH_1[46]; // @[RefCounter.scala 107:87]
  wire [1:0] _refCounterInc_46_T_4 = _refCounterInc_46_T_1 + _refCounterInc_46_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterInc_46 = {{3'd0}, _refCounterInc_46_T_4};
  wire [4:0] _GEN_174 = 6'h2e == deallocate_0_bits ? refCounterInc_46 : _GEN_173; // @[RefCounter.scala 81:{39,39}]
  wire  _refCounterInc_47_T_1 = allocate_0_valid & allocateOH_0[47]; // @[RefCounter.scala 107:87]
  wire  _refCounterInc_47_T_3 = allocate_1_valid & allocateOH_1[47]; // @[RefCounter.scala 107:87]
  wire [1:0] _refCounterInc_47_T_4 = _refCounterInc_47_T_1 + _refCounterInc_47_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterInc_47 = {{3'd0}, _refCounterInc_47_T_4};
  wire [4:0] _GEN_175 = 6'h2f == deallocate_0_bits ? refCounterInc_47 : _GEN_174; // @[RefCounter.scala 81:{39,39}]
  wire  _refCounterInc_48_T_1 = allocate_0_valid & allocateOH_0[48]; // @[RefCounter.scala 107:87]
  wire  _refCounterInc_48_T_3 = allocate_1_valid & allocateOH_1[48]; // @[RefCounter.scala 107:87]
  wire [1:0] _refCounterInc_48_T_4 = _refCounterInc_48_T_1 + _refCounterInc_48_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterInc_48 = {{3'd0}, _refCounterInc_48_T_4};
  wire [4:0] _GEN_176 = 6'h30 == deallocate_0_bits ? refCounterInc_48 : _GEN_175; // @[RefCounter.scala 81:{39,39}]
  wire  _refCounterInc_49_T_1 = allocate_0_valid & allocateOH_0[49]; // @[RefCounter.scala 107:87]
  wire  _refCounterInc_49_T_3 = allocate_1_valid & allocateOH_1[49]; // @[RefCounter.scala 107:87]
  wire [1:0] _refCounterInc_49_T_4 = _refCounterInc_49_T_1 + _refCounterInc_49_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterInc_49 = {{3'd0}, _refCounterInc_49_T_4};
  wire [4:0] _GEN_177 = 6'h31 == deallocate_0_bits ? refCounterInc_49 : _GEN_176; // @[RefCounter.scala 81:{39,39}]
  wire  _refCounterInc_50_T_1 = allocate_0_valid & allocateOH_0[50]; // @[RefCounter.scala 107:87]
  wire  _refCounterInc_50_T_3 = allocate_1_valid & allocateOH_1[50]; // @[RefCounter.scala 107:87]
  wire [1:0] _refCounterInc_50_T_4 = _refCounterInc_50_T_1 + _refCounterInc_50_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterInc_50 = {{3'd0}, _refCounterInc_50_T_4};
  wire [4:0] _GEN_178 = 6'h32 == deallocate_0_bits ? refCounterInc_50 : _GEN_177; // @[RefCounter.scala 81:{39,39}]
  wire  _refCounterInc_51_T_1 = allocate_0_valid & allocateOH_0[51]; // @[RefCounter.scala 107:87]
  wire  _refCounterInc_51_T_3 = allocate_1_valid & allocateOH_1[51]; // @[RefCounter.scala 107:87]
  wire [1:0] _refCounterInc_51_T_4 = _refCounterInc_51_T_1 + _refCounterInc_51_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterInc_51 = {{3'd0}, _refCounterInc_51_T_4};
  wire [4:0] _GEN_179 = 6'h33 == deallocate_0_bits ? refCounterInc_51 : _GEN_178; // @[RefCounter.scala 81:{39,39}]
  wire  _refCounterInc_52_T_1 = allocate_0_valid & allocateOH_0[52]; // @[RefCounter.scala 107:87]
  wire  _refCounterInc_52_T_3 = allocate_1_valid & allocateOH_1[52]; // @[RefCounter.scala 107:87]
  wire [1:0] _refCounterInc_52_T_4 = _refCounterInc_52_T_1 + _refCounterInc_52_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterInc_52 = {{3'd0}, _refCounterInc_52_T_4};
  wire [4:0] _GEN_180 = 6'h34 == deallocate_0_bits ? refCounterInc_52 : _GEN_179; // @[RefCounter.scala 81:{39,39}]
  wire  _refCounterInc_53_T_1 = allocate_0_valid & allocateOH_0[53]; // @[RefCounter.scala 107:87]
  wire  _refCounterInc_53_T_3 = allocate_1_valid & allocateOH_1[53]; // @[RefCounter.scala 107:87]
  wire [1:0] _refCounterInc_53_T_4 = _refCounterInc_53_T_1 + _refCounterInc_53_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterInc_53 = {{3'd0}, _refCounterInc_53_T_4};
  wire [4:0] _GEN_181 = 6'h35 == deallocate_0_bits ? refCounterInc_53 : _GEN_180; // @[RefCounter.scala 81:{39,39}]
  wire  _refCounterInc_54_T_1 = allocate_0_valid & allocateOH_0[54]; // @[RefCounter.scala 107:87]
  wire  _refCounterInc_54_T_3 = allocate_1_valid & allocateOH_1[54]; // @[RefCounter.scala 107:87]
  wire [1:0] _refCounterInc_54_T_4 = _refCounterInc_54_T_1 + _refCounterInc_54_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterInc_54 = {{3'd0}, _refCounterInc_54_T_4};
  wire [4:0] _GEN_182 = 6'h36 == deallocate_0_bits ? refCounterInc_54 : _GEN_181; // @[RefCounter.scala 81:{39,39}]
  wire  _refCounterInc_55_T_1 = allocate_0_valid & allocateOH_0[55]; // @[RefCounter.scala 107:87]
  wire  _refCounterInc_55_T_3 = allocate_1_valid & allocateOH_1[55]; // @[RefCounter.scala 107:87]
  wire [1:0] _refCounterInc_55_T_4 = _refCounterInc_55_T_1 + _refCounterInc_55_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterInc_55 = {{3'd0}, _refCounterInc_55_T_4};
  wire [4:0] _GEN_183 = 6'h37 == deallocate_0_bits ? refCounterInc_55 : _GEN_182; // @[RefCounter.scala 81:{39,39}]
  wire  _refCounterInc_56_T_1 = allocate_0_valid & allocateOH_0[56]; // @[RefCounter.scala 107:87]
  wire  _refCounterInc_56_T_3 = allocate_1_valid & allocateOH_1[56]; // @[RefCounter.scala 107:87]
  wire [1:0] _refCounterInc_56_T_4 = _refCounterInc_56_T_1 + _refCounterInc_56_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterInc_56 = {{3'd0}, _refCounterInc_56_T_4};
  wire [4:0] _GEN_184 = 6'h38 == deallocate_0_bits ? refCounterInc_56 : _GEN_183; // @[RefCounter.scala 81:{39,39}]
  wire  _refCounterInc_57_T_1 = allocate_0_valid & allocateOH_0[57]; // @[RefCounter.scala 107:87]
  wire  _refCounterInc_57_T_3 = allocate_1_valid & allocateOH_1[57]; // @[RefCounter.scala 107:87]
  wire [1:0] _refCounterInc_57_T_4 = _refCounterInc_57_T_1 + _refCounterInc_57_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterInc_57 = {{3'd0}, _refCounterInc_57_T_4};
  wire [4:0] _GEN_185 = 6'h39 == deallocate_0_bits ? refCounterInc_57 : _GEN_184; // @[RefCounter.scala 81:{39,39}]
  wire  _refCounterInc_58_T_1 = allocate_0_valid & allocateOH_0[58]; // @[RefCounter.scala 107:87]
  wire  _refCounterInc_58_T_3 = allocate_1_valid & allocateOH_1[58]; // @[RefCounter.scala 107:87]
  wire [1:0] _refCounterInc_58_T_4 = _refCounterInc_58_T_1 + _refCounterInc_58_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterInc_58 = {{3'd0}, _refCounterInc_58_T_4};
  wire [4:0] _GEN_186 = 6'h3a == deallocate_0_bits ? refCounterInc_58 : _GEN_185; // @[RefCounter.scala 81:{39,39}]
  wire  _refCounterInc_59_T_1 = allocate_0_valid & allocateOH_0[59]; // @[RefCounter.scala 107:87]
  wire  _refCounterInc_59_T_3 = allocate_1_valid & allocateOH_1[59]; // @[RefCounter.scala 107:87]
  wire [1:0] _refCounterInc_59_T_4 = _refCounterInc_59_T_1 + _refCounterInc_59_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterInc_59 = {{3'd0}, _refCounterInc_59_T_4};
  wire [4:0] _GEN_187 = 6'h3b == deallocate_0_bits ? refCounterInc_59 : _GEN_186; // @[RefCounter.scala 81:{39,39}]
  wire  _refCounterInc_60_T_1 = allocate_0_valid & allocateOH_0[60]; // @[RefCounter.scala 107:87]
  wire  _refCounterInc_60_T_3 = allocate_1_valid & allocateOH_1[60]; // @[RefCounter.scala 107:87]
  wire [1:0] _refCounterInc_60_T_4 = _refCounterInc_60_T_1 + _refCounterInc_60_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterInc_60 = {{3'd0}, _refCounterInc_60_T_4};
  wire [4:0] _GEN_188 = 6'h3c == deallocate_0_bits ? refCounterInc_60 : _GEN_187; // @[RefCounter.scala 81:{39,39}]
  wire  _refCounterInc_61_T_1 = allocate_0_valid & allocateOH_0[61]; // @[RefCounter.scala 107:87]
  wire  _refCounterInc_61_T_3 = allocate_1_valid & allocateOH_1[61]; // @[RefCounter.scala 107:87]
  wire [1:0] _refCounterInc_61_T_4 = _refCounterInc_61_T_1 + _refCounterInc_61_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterInc_61 = {{3'd0}, _refCounterInc_61_T_4};
  wire [4:0] _GEN_189 = 6'h3d == deallocate_0_bits ? refCounterInc_61 : _GEN_188; // @[RefCounter.scala 81:{39,39}]
  wire  _refCounterInc_62_T_1 = allocate_0_valid & allocateOH_0[62]; // @[RefCounter.scala 107:87]
  wire  _refCounterInc_62_T_3 = allocate_1_valid & allocateOH_1[62]; // @[RefCounter.scala 107:87]
  wire [1:0] _refCounterInc_62_T_4 = _refCounterInc_62_T_1 + _refCounterInc_62_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterInc_62 = {{3'd0}, _refCounterInc_62_T_4};
  wire [4:0] _GEN_190 = 6'h3e == deallocate_0_bits ? refCounterInc_62 : _GEN_189; // @[RefCounter.scala 81:{39,39}]
  wire  _refCounterInc_63_T_1 = allocate_0_valid & allocateOH_0[63]; // @[RefCounter.scala 107:87]
  wire  _refCounterInc_63_T_3 = allocate_1_valid & allocateOH_1[63]; // @[RefCounter.scala 107:87]
  wire [1:0] _refCounterInc_63_T_4 = _refCounterInc_63_T_1 + _refCounterInc_63_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterInc_63 = {{3'd0}, _refCounterInc_63_T_4};
  wire [4:0] _GEN_191 = 6'h3f == deallocate_0_bits ? refCounterInc_63 : _GEN_190; // @[RefCounter.scala 81:{39,39}]
  wire [4:0] _isFreed_T_1 = _GEN_127 + _GEN_191; // @[RefCounter.scala 81:39]
  wire  _refCounterDec_1_T_1 = deallocate_0_valid & deallocateOH_0[1]; // @[RefCounter.scala 108:95]
  wire  _refCounterDec_1_T_3 = deallocate_1_valid & deallocateOH_1[1]; // @[RefCounter.scala 108:95]
  wire [1:0] _refCounterDec_1_T_4 = _refCounterDec_1_T_1 + _refCounterDec_1_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterDec_1 = {{3'd0}, _refCounterDec_1_T_4};
  wire [4:0] _GEN_193 = 6'h1 == deallocate_0_bits ? refCounterDec_1 : 5'h0; // @[RefCounter.scala 81:{64,64}]
  wire  _refCounterDec_2_T_1 = deallocate_0_valid & deallocateOH_0[2]; // @[RefCounter.scala 108:95]
  wire  _refCounterDec_2_T_3 = deallocate_1_valid & deallocateOH_1[2]; // @[RefCounter.scala 108:95]
  wire [1:0] _refCounterDec_2_T_4 = _refCounterDec_2_T_1 + _refCounterDec_2_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterDec_2 = {{3'd0}, _refCounterDec_2_T_4};
  wire [4:0] _GEN_194 = 6'h2 == deallocate_0_bits ? refCounterDec_2 : _GEN_193; // @[RefCounter.scala 81:{64,64}]
  wire  _refCounterDec_3_T_1 = deallocate_0_valid & deallocateOH_0[3]; // @[RefCounter.scala 108:95]
  wire  _refCounterDec_3_T_3 = deallocate_1_valid & deallocateOH_1[3]; // @[RefCounter.scala 108:95]
  wire [1:0] _refCounterDec_3_T_4 = _refCounterDec_3_T_1 + _refCounterDec_3_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterDec_3 = {{3'd0}, _refCounterDec_3_T_4};
  wire [4:0] _GEN_195 = 6'h3 == deallocate_0_bits ? refCounterDec_3 : _GEN_194; // @[RefCounter.scala 81:{64,64}]
  wire  _refCounterDec_4_T_1 = deallocate_0_valid & deallocateOH_0[4]; // @[RefCounter.scala 108:95]
  wire  _refCounterDec_4_T_3 = deallocate_1_valid & deallocateOH_1[4]; // @[RefCounter.scala 108:95]
  wire [1:0] _refCounterDec_4_T_4 = _refCounterDec_4_T_1 + _refCounterDec_4_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterDec_4 = {{3'd0}, _refCounterDec_4_T_4};
  wire [4:0] _GEN_196 = 6'h4 == deallocate_0_bits ? refCounterDec_4 : _GEN_195; // @[RefCounter.scala 81:{64,64}]
  wire  _refCounterDec_5_T_1 = deallocate_0_valid & deallocateOH_0[5]; // @[RefCounter.scala 108:95]
  wire  _refCounterDec_5_T_3 = deallocate_1_valid & deallocateOH_1[5]; // @[RefCounter.scala 108:95]
  wire [1:0] _refCounterDec_5_T_4 = _refCounterDec_5_T_1 + _refCounterDec_5_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterDec_5 = {{3'd0}, _refCounterDec_5_T_4};
  wire [4:0] _GEN_197 = 6'h5 == deallocate_0_bits ? refCounterDec_5 : _GEN_196; // @[RefCounter.scala 81:{64,64}]
  wire  _refCounterDec_6_T_1 = deallocate_0_valid & deallocateOH_0[6]; // @[RefCounter.scala 108:95]
  wire  _refCounterDec_6_T_3 = deallocate_1_valid & deallocateOH_1[6]; // @[RefCounter.scala 108:95]
  wire [1:0] _refCounterDec_6_T_4 = _refCounterDec_6_T_1 + _refCounterDec_6_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterDec_6 = {{3'd0}, _refCounterDec_6_T_4};
  wire [4:0] _GEN_198 = 6'h6 == deallocate_0_bits ? refCounterDec_6 : _GEN_197; // @[RefCounter.scala 81:{64,64}]
  wire  _refCounterDec_7_T_1 = deallocate_0_valid & deallocateOH_0[7]; // @[RefCounter.scala 108:95]
  wire  _refCounterDec_7_T_3 = deallocate_1_valid & deallocateOH_1[7]; // @[RefCounter.scala 108:95]
  wire [1:0] _refCounterDec_7_T_4 = _refCounterDec_7_T_1 + _refCounterDec_7_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterDec_7 = {{3'd0}, _refCounterDec_7_T_4};
  wire [4:0] _GEN_199 = 6'h7 == deallocate_0_bits ? refCounterDec_7 : _GEN_198; // @[RefCounter.scala 81:{64,64}]
  wire  _refCounterDec_8_T_1 = deallocate_0_valid & deallocateOH_0[8]; // @[RefCounter.scala 108:95]
  wire  _refCounterDec_8_T_3 = deallocate_1_valid & deallocateOH_1[8]; // @[RefCounter.scala 108:95]
  wire [1:0] _refCounterDec_8_T_4 = _refCounterDec_8_T_1 + _refCounterDec_8_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterDec_8 = {{3'd0}, _refCounterDec_8_T_4};
  wire [4:0] _GEN_200 = 6'h8 == deallocate_0_bits ? refCounterDec_8 : _GEN_199; // @[RefCounter.scala 81:{64,64}]
  wire  _refCounterDec_9_T_1 = deallocate_0_valid & deallocateOH_0[9]; // @[RefCounter.scala 108:95]
  wire  _refCounterDec_9_T_3 = deallocate_1_valid & deallocateOH_1[9]; // @[RefCounter.scala 108:95]
  wire [1:0] _refCounterDec_9_T_4 = _refCounterDec_9_T_1 + _refCounterDec_9_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterDec_9 = {{3'd0}, _refCounterDec_9_T_4};
  wire [4:0] _GEN_201 = 6'h9 == deallocate_0_bits ? refCounterDec_9 : _GEN_200; // @[RefCounter.scala 81:{64,64}]
  wire  _refCounterDec_10_T_1 = deallocate_0_valid & deallocateOH_0[10]; // @[RefCounter.scala 108:95]
  wire  _refCounterDec_10_T_3 = deallocate_1_valid & deallocateOH_1[10]; // @[RefCounter.scala 108:95]
  wire [1:0] _refCounterDec_10_T_4 = _refCounterDec_10_T_1 + _refCounterDec_10_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterDec_10 = {{3'd0}, _refCounterDec_10_T_4};
  wire [4:0] _GEN_202 = 6'ha == deallocate_0_bits ? refCounterDec_10 : _GEN_201; // @[RefCounter.scala 81:{64,64}]
  wire  _refCounterDec_11_T_1 = deallocate_0_valid & deallocateOH_0[11]; // @[RefCounter.scala 108:95]
  wire  _refCounterDec_11_T_3 = deallocate_1_valid & deallocateOH_1[11]; // @[RefCounter.scala 108:95]
  wire [1:0] _refCounterDec_11_T_4 = _refCounterDec_11_T_1 + _refCounterDec_11_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterDec_11 = {{3'd0}, _refCounterDec_11_T_4};
  wire [4:0] _GEN_203 = 6'hb == deallocate_0_bits ? refCounterDec_11 : _GEN_202; // @[RefCounter.scala 81:{64,64}]
  wire  _refCounterDec_12_T_1 = deallocate_0_valid & deallocateOH_0[12]; // @[RefCounter.scala 108:95]
  wire  _refCounterDec_12_T_3 = deallocate_1_valid & deallocateOH_1[12]; // @[RefCounter.scala 108:95]
  wire [1:0] _refCounterDec_12_T_4 = _refCounterDec_12_T_1 + _refCounterDec_12_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterDec_12 = {{3'd0}, _refCounterDec_12_T_4};
  wire [4:0] _GEN_204 = 6'hc == deallocate_0_bits ? refCounterDec_12 : _GEN_203; // @[RefCounter.scala 81:{64,64}]
  wire  _refCounterDec_13_T_1 = deallocate_0_valid & deallocateOH_0[13]; // @[RefCounter.scala 108:95]
  wire  _refCounterDec_13_T_3 = deallocate_1_valid & deallocateOH_1[13]; // @[RefCounter.scala 108:95]
  wire [1:0] _refCounterDec_13_T_4 = _refCounterDec_13_T_1 + _refCounterDec_13_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterDec_13 = {{3'd0}, _refCounterDec_13_T_4};
  wire [4:0] _GEN_205 = 6'hd == deallocate_0_bits ? refCounterDec_13 : _GEN_204; // @[RefCounter.scala 81:{64,64}]
  wire  _refCounterDec_14_T_1 = deallocate_0_valid & deallocateOH_0[14]; // @[RefCounter.scala 108:95]
  wire  _refCounterDec_14_T_3 = deallocate_1_valid & deallocateOH_1[14]; // @[RefCounter.scala 108:95]
  wire [1:0] _refCounterDec_14_T_4 = _refCounterDec_14_T_1 + _refCounterDec_14_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterDec_14 = {{3'd0}, _refCounterDec_14_T_4};
  wire [4:0] _GEN_206 = 6'he == deallocate_0_bits ? refCounterDec_14 : _GEN_205; // @[RefCounter.scala 81:{64,64}]
  wire  _refCounterDec_15_T_1 = deallocate_0_valid & deallocateOH_0[15]; // @[RefCounter.scala 108:95]
  wire  _refCounterDec_15_T_3 = deallocate_1_valid & deallocateOH_1[15]; // @[RefCounter.scala 108:95]
  wire [1:0] _refCounterDec_15_T_4 = _refCounterDec_15_T_1 + _refCounterDec_15_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterDec_15 = {{3'd0}, _refCounterDec_15_T_4};
  wire [4:0] _GEN_207 = 6'hf == deallocate_0_bits ? refCounterDec_15 : _GEN_206; // @[RefCounter.scala 81:{64,64}]
  wire  _refCounterDec_16_T_1 = deallocate_0_valid & deallocateOH_0[16]; // @[RefCounter.scala 108:95]
  wire  _refCounterDec_16_T_3 = deallocate_1_valid & deallocateOH_1[16]; // @[RefCounter.scala 108:95]
  wire [1:0] _refCounterDec_16_T_4 = _refCounterDec_16_T_1 + _refCounterDec_16_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterDec_16 = {{3'd0}, _refCounterDec_16_T_4};
  wire [4:0] _GEN_208 = 6'h10 == deallocate_0_bits ? refCounterDec_16 : _GEN_207; // @[RefCounter.scala 81:{64,64}]
  wire  _refCounterDec_17_T_1 = deallocate_0_valid & deallocateOH_0[17]; // @[RefCounter.scala 108:95]
  wire  _refCounterDec_17_T_3 = deallocate_1_valid & deallocateOH_1[17]; // @[RefCounter.scala 108:95]
  wire [1:0] _refCounterDec_17_T_4 = _refCounterDec_17_T_1 + _refCounterDec_17_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterDec_17 = {{3'd0}, _refCounterDec_17_T_4};
  wire [4:0] _GEN_209 = 6'h11 == deallocate_0_bits ? refCounterDec_17 : _GEN_208; // @[RefCounter.scala 81:{64,64}]
  wire  _refCounterDec_18_T_1 = deallocate_0_valid & deallocateOH_0[18]; // @[RefCounter.scala 108:95]
  wire  _refCounterDec_18_T_3 = deallocate_1_valid & deallocateOH_1[18]; // @[RefCounter.scala 108:95]
  wire [1:0] _refCounterDec_18_T_4 = _refCounterDec_18_T_1 + _refCounterDec_18_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterDec_18 = {{3'd0}, _refCounterDec_18_T_4};
  wire [4:0] _GEN_210 = 6'h12 == deallocate_0_bits ? refCounterDec_18 : _GEN_209; // @[RefCounter.scala 81:{64,64}]
  wire  _refCounterDec_19_T_1 = deallocate_0_valid & deallocateOH_0[19]; // @[RefCounter.scala 108:95]
  wire  _refCounterDec_19_T_3 = deallocate_1_valid & deallocateOH_1[19]; // @[RefCounter.scala 108:95]
  wire [1:0] _refCounterDec_19_T_4 = _refCounterDec_19_T_1 + _refCounterDec_19_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterDec_19 = {{3'd0}, _refCounterDec_19_T_4};
  wire [4:0] _GEN_211 = 6'h13 == deallocate_0_bits ? refCounterDec_19 : _GEN_210; // @[RefCounter.scala 81:{64,64}]
  wire  _refCounterDec_20_T_1 = deallocate_0_valid & deallocateOH_0[20]; // @[RefCounter.scala 108:95]
  wire  _refCounterDec_20_T_3 = deallocate_1_valid & deallocateOH_1[20]; // @[RefCounter.scala 108:95]
  wire [1:0] _refCounterDec_20_T_4 = _refCounterDec_20_T_1 + _refCounterDec_20_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterDec_20 = {{3'd0}, _refCounterDec_20_T_4};
  wire [4:0] _GEN_212 = 6'h14 == deallocate_0_bits ? refCounterDec_20 : _GEN_211; // @[RefCounter.scala 81:{64,64}]
  wire  _refCounterDec_21_T_1 = deallocate_0_valid & deallocateOH_0[21]; // @[RefCounter.scala 108:95]
  wire  _refCounterDec_21_T_3 = deallocate_1_valid & deallocateOH_1[21]; // @[RefCounter.scala 108:95]
  wire [1:0] _refCounterDec_21_T_4 = _refCounterDec_21_T_1 + _refCounterDec_21_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterDec_21 = {{3'd0}, _refCounterDec_21_T_4};
  wire [4:0] _GEN_213 = 6'h15 == deallocate_0_bits ? refCounterDec_21 : _GEN_212; // @[RefCounter.scala 81:{64,64}]
  wire  _refCounterDec_22_T_1 = deallocate_0_valid & deallocateOH_0[22]; // @[RefCounter.scala 108:95]
  wire  _refCounterDec_22_T_3 = deallocate_1_valid & deallocateOH_1[22]; // @[RefCounter.scala 108:95]
  wire [1:0] _refCounterDec_22_T_4 = _refCounterDec_22_T_1 + _refCounterDec_22_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterDec_22 = {{3'd0}, _refCounterDec_22_T_4};
  wire [4:0] _GEN_214 = 6'h16 == deallocate_0_bits ? refCounterDec_22 : _GEN_213; // @[RefCounter.scala 81:{64,64}]
  wire  _refCounterDec_23_T_1 = deallocate_0_valid & deallocateOH_0[23]; // @[RefCounter.scala 108:95]
  wire  _refCounterDec_23_T_3 = deallocate_1_valid & deallocateOH_1[23]; // @[RefCounter.scala 108:95]
  wire [1:0] _refCounterDec_23_T_4 = _refCounterDec_23_T_1 + _refCounterDec_23_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterDec_23 = {{3'd0}, _refCounterDec_23_T_4};
  wire [4:0] _GEN_215 = 6'h17 == deallocate_0_bits ? refCounterDec_23 : _GEN_214; // @[RefCounter.scala 81:{64,64}]
  wire  _refCounterDec_24_T_1 = deallocate_0_valid & deallocateOH_0[24]; // @[RefCounter.scala 108:95]
  wire  _refCounterDec_24_T_3 = deallocate_1_valid & deallocateOH_1[24]; // @[RefCounter.scala 108:95]
  wire [1:0] _refCounterDec_24_T_4 = _refCounterDec_24_T_1 + _refCounterDec_24_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterDec_24 = {{3'd0}, _refCounterDec_24_T_4};
  wire [4:0] _GEN_216 = 6'h18 == deallocate_0_bits ? refCounterDec_24 : _GEN_215; // @[RefCounter.scala 81:{64,64}]
  wire  _refCounterDec_25_T_1 = deallocate_0_valid & deallocateOH_0[25]; // @[RefCounter.scala 108:95]
  wire  _refCounterDec_25_T_3 = deallocate_1_valid & deallocateOH_1[25]; // @[RefCounter.scala 108:95]
  wire [1:0] _refCounterDec_25_T_4 = _refCounterDec_25_T_1 + _refCounterDec_25_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterDec_25 = {{3'd0}, _refCounterDec_25_T_4};
  wire [4:0] _GEN_217 = 6'h19 == deallocate_0_bits ? refCounterDec_25 : _GEN_216; // @[RefCounter.scala 81:{64,64}]
  wire  _refCounterDec_26_T_1 = deallocate_0_valid & deallocateOH_0[26]; // @[RefCounter.scala 108:95]
  wire  _refCounterDec_26_T_3 = deallocate_1_valid & deallocateOH_1[26]; // @[RefCounter.scala 108:95]
  wire [1:0] _refCounterDec_26_T_4 = _refCounterDec_26_T_1 + _refCounterDec_26_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterDec_26 = {{3'd0}, _refCounterDec_26_T_4};
  wire [4:0] _GEN_218 = 6'h1a == deallocate_0_bits ? refCounterDec_26 : _GEN_217; // @[RefCounter.scala 81:{64,64}]
  wire  _refCounterDec_27_T_1 = deallocate_0_valid & deallocateOH_0[27]; // @[RefCounter.scala 108:95]
  wire  _refCounterDec_27_T_3 = deallocate_1_valid & deallocateOH_1[27]; // @[RefCounter.scala 108:95]
  wire [1:0] _refCounterDec_27_T_4 = _refCounterDec_27_T_1 + _refCounterDec_27_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterDec_27 = {{3'd0}, _refCounterDec_27_T_4};
  wire [4:0] _GEN_219 = 6'h1b == deallocate_0_bits ? refCounterDec_27 : _GEN_218; // @[RefCounter.scala 81:{64,64}]
  wire  _refCounterDec_28_T_1 = deallocate_0_valid & deallocateOH_0[28]; // @[RefCounter.scala 108:95]
  wire  _refCounterDec_28_T_3 = deallocate_1_valid & deallocateOH_1[28]; // @[RefCounter.scala 108:95]
  wire [1:0] _refCounterDec_28_T_4 = _refCounterDec_28_T_1 + _refCounterDec_28_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterDec_28 = {{3'd0}, _refCounterDec_28_T_4};
  wire [4:0] _GEN_220 = 6'h1c == deallocate_0_bits ? refCounterDec_28 : _GEN_219; // @[RefCounter.scala 81:{64,64}]
  wire  _refCounterDec_29_T_1 = deallocate_0_valid & deallocateOH_0[29]; // @[RefCounter.scala 108:95]
  wire  _refCounterDec_29_T_3 = deallocate_1_valid & deallocateOH_1[29]; // @[RefCounter.scala 108:95]
  wire [1:0] _refCounterDec_29_T_4 = _refCounterDec_29_T_1 + _refCounterDec_29_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterDec_29 = {{3'd0}, _refCounterDec_29_T_4};
  wire [4:0] _GEN_221 = 6'h1d == deallocate_0_bits ? refCounterDec_29 : _GEN_220; // @[RefCounter.scala 81:{64,64}]
  wire  _refCounterDec_30_T_1 = deallocate_0_valid & deallocateOH_0[30]; // @[RefCounter.scala 108:95]
  wire  _refCounterDec_30_T_3 = deallocate_1_valid & deallocateOH_1[30]; // @[RefCounter.scala 108:95]
  wire [1:0] _refCounterDec_30_T_4 = _refCounterDec_30_T_1 + _refCounterDec_30_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterDec_30 = {{3'd0}, _refCounterDec_30_T_4};
  wire [4:0] _GEN_222 = 6'h1e == deallocate_0_bits ? refCounterDec_30 : _GEN_221; // @[RefCounter.scala 81:{64,64}]
  wire  _refCounterDec_31_T_1 = deallocate_0_valid & deallocateOH_0[31]; // @[RefCounter.scala 108:95]
  wire  _refCounterDec_31_T_3 = deallocate_1_valid & deallocateOH_1[31]; // @[RefCounter.scala 108:95]
  wire [1:0] _refCounterDec_31_T_4 = _refCounterDec_31_T_1 + _refCounterDec_31_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterDec_31 = {{3'd0}, _refCounterDec_31_T_4};
  wire [4:0] _GEN_223 = 6'h1f == deallocate_0_bits ? refCounterDec_31 : _GEN_222; // @[RefCounter.scala 81:{64,64}]
  wire  _refCounterDec_32_T_1 = deallocate_0_valid & deallocateOH_0[32]; // @[RefCounter.scala 108:95]
  wire  _refCounterDec_32_T_3 = deallocate_1_valid & deallocateOH_1[32]; // @[RefCounter.scala 108:95]
  wire [1:0] _refCounterDec_32_T_4 = _refCounterDec_32_T_1 + _refCounterDec_32_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterDec_32 = {{3'd0}, _refCounterDec_32_T_4};
  wire [4:0] _GEN_224 = 6'h20 == deallocate_0_bits ? refCounterDec_32 : _GEN_223; // @[RefCounter.scala 81:{64,64}]
  wire  _refCounterDec_33_T_1 = deallocate_0_valid & deallocateOH_0[33]; // @[RefCounter.scala 108:95]
  wire  _refCounterDec_33_T_3 = deallocate_1_valid & deallocateOH_1[33]; // @[RefCounter.scala 108:95]
  wire [1:0] _refCounterDec_33_T_4 = _refCounterDec_33_T_1 + _refCounterDec_33_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterDec_33 = {{3'd0}, _refCounterDec_33_T_4};
  wire [4:0] _GEN_225 = 6'h21 == deallocate_0_bits ? refCounterDec_33 : _GEN_224; // @[RefCounter.scala 81:{64,64}]
  wire  _refCounterDec_34_T_1 = deallocate_0_valid & deallocateOH_0[34]; // @[RefCounter.scala 108:95]
  wire  _refCounterDec_34_T_3 = deallocate_1_valid & deallocateOH_1[34]; // @[RefCounter.scala 108:95]
  wire [1:0] _refCounterDec_34_T_4 = _refCounterDec_34_T_1 + _refCounterDec_34_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterDec_34 = {{3'd0}, _refCounterDec_34_T_4};
  wire [4:0] _GEN_226 = 6'h22 == deallocate_0_bits ? refCounterDec_34 : _GEN_225; // @[RefCounter.scala 81:{64,64}]
  wire  _refCounterDec_35_T_1 = deallocate_0_valid & deallocateOH_0[35]; // @[RefCounter.scala 108:95]
  wire  _refCounterDec_35_T_3 = deallocate_1_valid & deallocateOH_1[35]; // @[RefCounter.scala 108:95]
  wire [1:0] _refCounterDec_35_T_4 = _refCounterDec_35_T_1 + _refCounterDec_35_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterDec_35 = {{3'd0}, _refCounterDec_35_T_4};
  wire [4:0] _GEN_227 = 6'h23 == deallocate_0_bits ? refCounterDec_35 : _GEN_226; // @[RefCounter.scala 81:{64,64}]
  wire  _refCounterDec_36_T_1 = deallocate_0_valid & deallocateOH_0[36]; // @[RefCounter.scala 108:95]
  wire  _refCounterDec_36_T_3 = deallocate_1_valid & deallocateOH_1[36]; // @[RefCounter.scala 108:95]
  wire [1:0] _refCounterDec_36_T_4 = _refCounterDec_36_T_1 + _refCounterDec_36_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterDec_36 = {{3'd0}, _refCounterDec_36_T_4};
  wire [4:0] _GEN_228 = 6'h24 == deallocate_0_bits ? refCounterDec_36 : _GEN_227; // @[RefCounter.scala 81:{64,64}]
  wire  _refCounterDec_37_T_1 = deallocate_0_valid & deallocateOH_0[37]; // @[RefCounter.scala 108:95]
  wire  _refCounterDec_37_T_3 = deallocate_1_valid & deallocateOH_1[37]; // @[RefCounter.scala 108:95]
  wire [1:0] _refCounterDec_37_T_4 = _refCounterDec_37_T_1 + _refCounterDec_37_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterDec_37 = {{3'd0}, _refCounterDec_37_T_4};
  wire [4:0] _GEN_229 = 6'h25 == deallocate_0_bits ? refCounterDec_37 : _GEN_228; // @[RefCounter.scala 81:{64,64}]
  wire  _refCounterDec_38_T_1 = deallocate_0_valid & deallocateOH_0[38]; // @[RefCounter.scala 108:95]
  wire  _refCounterDec_38_T_3 = deallocate_1_valid & deallocateOH_1[38]; // @[RefCounter.scala 108:95]
  wire [1:0] _refCounterDec_38_T_4 = _refCounterDec_38_T_1 + _refCounterDec_38_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterDec_38 = {{3'd0}, _refCounterDec_38_T_4};
  wire [4:0] _GEN_230 = 6'h26 == deallocate_0_bits ? refCounterDec_38 : _GEN_229; // @[RefCounter.scala 81:{64,64}]
  wire  _refCounterDec_39_T_1 = deallocate_0_valid & deallocateOH_0[39]; // @[RefCounter.scala 108:95]
  wire  _refCounterDec_39_T_3 = deallocate_1_valid & deallocateOH_1[39]; // @[RefCounter.scala 108:95]
  wire [1:0] _refCounterDec_39_T_4 = _refCounterDec_39_T_1 + _refCounterDec_39_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterDec_39 = {{3'd0}, _refCounterDec_39_T_4};
  wire [4:0] _GEN_231 = 6'h27 == deallocate_0_bits ? refCounterDec_39 : _GEN_230; // @[RefCounter.scala 81:{64,64}]
  wire  _refCounterDec_40_T_1 = deallocate_0_valid & deallocateOH_0[40]; // @[RefCounter.scala 108:95]
  wire  _refCounterDec_40_T_3 = deallocate_1_valid & deallocateOH_1[40]; // @[RefCounter.scala 108:95]
  wire [1:0] _refCounterDec_40_T_4 = _refCounterDec_40_T_1 + _refCounterDec_40_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterDec_40 = {{3'd0}, _refCounterDec_40_T_4};
  wire [4:0] _GEN_232 = 6'h28 == deallocate_0_bits ? refCounterDec_40 : _GEN_231; // @[RefCounter.scala 81:{64,64}]
  wire  _refCounterDec_41_T_1 = deallocate_0_valid & deallocateOH_0[41]; // @[RefCounter.scala 108:95]
  wire  _refCounterDec_41_T_3 = deallocate_1_valid & deallocateOH_1[41]; // @[RefCounter.scala 108:95]
  wire [1:0] _refCounterDec_41_T_4 = _refCounterDec_41_T_1 + _refCounterDec_41_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterDec_41 = {{3'd0}, _refCounterDec_41_T_4};
  wire [4:0] _GEN_233 = 6'h29 == deallocate_0_bits ? refCounterDec_41 : _GEN_232; // @[RefCounter.scala 81:{64,64}]
  wire  _refCounterDec_42_T_1 = deallocate_0_valid & deallocateOH_0[42]; // @[RefCounter.scala 108:95]
  wire  _refCounterDec_42_T_3 = deallocate_1_valid & deallocateOH_1[42]; // @[RefCounter.scala 108:95]
  wire [1:0] _refCounterDec_42_T_4 = _refCounterDec_42_T_1 + _refCounterDec_42_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterDec_42 = {{3'd0}, _refCounterDec_42_T_4};
  wire [4:0] _GEN_234 = 6'h2a == deallocate_0_bits ? refCounterDec_42 : _GEN_233; // @[RefCounter.scala 81:{64,64}]
  wire  _refCounterDec_43_T_1 = deallocate_0_valid & deallocateOH_0[43]; // @[RefCounter.scala 108:95]
  wire  _refCounterDec_43_T_3 = deallocate_1_valid & deallocateOH_1[43]; // @[RefCounter.scala 108:95]
  wire [1:0] _refCounterDec_43_T_4 = _refCounterDec_43_T_1 + _refCounterDec_43_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterDec_43 = {{3'd0}, _refCounterDec_43_T_4};
  wire [4:0] _GEN_235 = 6'h2b == deallocate_0_bits ? refCounterDec_43 : _GEN_234; // @[RefCounter.scala 81:{64,64}]
  wire  _refCounterDec_44_T_1 = deallocate_0_valid & deallocateOH_0[44]; // @[RefCounter.scala 108:95]
  wire  _refCounterDec_44_T_3 = deallocate_1_valid & deallocateOH_1[44]; // @[RefCounter.scala 108:95]
  wire [1:0] _refCounterDec_44_T_4 = _refCounterDec_44_T_1 + _refCounterDec_44_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterDec_44 = {{3'd0}, _refCounterDec_44_T_4};
  wire [4:0] _GEN_236 = 6'h2c == deallocate_0_bits ? refCounterDec_44 : _GEN_235; // @[RefCounter.scala 81:{64,64}]
  wire  _refCounterDec_45_T_1 = deallocate_0_valid & deallocateOH_0[45]; // @[RefCounter.scala 108:95]
  wire  _refCounterDec_45_T_3 = deallocate_1_valid & deallocateOH_1[45]; // @[RefCounter.scala 108:95]
  wire [1:0] _refCounterDec_45_T_4 = _refCounterDec_45_T_1 + _refCounterDec_45_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterDec_45 = {{3'd0}, _refCounterDec_45_T_4};
  wire [4:0] _GEN_237 = 6'h2d == deallocate_0_bits ? refCounterDec_45 : _GEN_236; // @[RefCounter.scala 81:{64,64}]
  wire  _refCounterDec_46_T_1 = deallocate_0_valid & deallocateOH_0[46]; // @[RefCounter.scala 108:95]
  wire  _refCounterDec_46_T_3 = deallocate_1_valid & deallocateOH_1[46]; // @[RefCounter.scala 108:95]
  wire [1:0] _refCounterDec_46_T_4 = _refCounterDec_46_T_1 + _refCounterDec_46_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterDec_46 = {{3'd0}, _refCounterDec_46_T_4};
  wire [4:0] _GEN_238 = 6'h2e == deallocate_0_bits ? refCounterDec_46 : _GEN_237; // @[RefCounter.scala 81:{64,64}]
  wire  _refCounterDec_47_T_1 = deallocate_0_valid & deallocateOH_0[47]; // @[RefCounter.scala 108:95]
  wire  _refCounterDec_47_T_3 = deallocate_1_valid & deallocateOH_1[47]; // @[RefCounter.scala 108:95]
  wire [1:0] _refCounterDec_47_T_4 = _refCounterDec_47_T_1 + _refCounterDec_47_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterDec_47 = {{3'd0}, _refCounterDec_47_T_4};
  wire [4:0] _GEN_239 = 6'h2f == deallocate_0_bits ? refCounterDec_47 : _GEN_238; // @[RefCounter.scala 81:{64,64}]
  wire  _refCounterDec_48_T_1 = deallocate_0_valid & deallocateOH_0[48]; // @[RefCounter.scala 108:95]
  wire  _refCounterDec_48_T_3 = deallocate_1_valid & deallocateOH_1[48]; // @[RefCounter.scala 108:95]
  wire [1:0] _refCounterDec_48_T_4 = _refCounterDec_48_T_1 + _refCounterDec_48_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterDec_48 = {{3'd0}, _refCounterDec_48_T_4};
  wire [4:0] _GEN_240 = 6'h30 == deallocate_0_bits ? refCounterDec_48 : _GEN_239; // @[RefCounter.scala 81:{64,64}]
  wire  _refCounterDec_49_T_1 = deallocate_0_valid & deallocateOH_0[49]; // @[RefCounter.scala 108:95]
  wire  _refCounterDec_49_T_3 = deallocate_1_valid & deallocateOH_1[49]; // @[RefCounter.scala 108:95]
  wire [1:0] _refCounterDec_49_T_4 = _refCounterDec_49_T_1 + _refCounterDec_49_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterDec_49 = {{3'd0}, _refCounterDec_49_T_4};
  wire [4:0] _GEN_241 = 6'h31 == deallocate_0_bits ? refCounterDec_49 : _GEN_240; // @[RefCounter.scala 81:{64,64}]
  wire  _refCounterDec_50_T_1 = deallocate_0_valid & deallocateOH_0[50]; // @[RefCounter.scala 108:95]
  wire  _refCounterDec_50_T_3 = deallocate_1_valid & deallocateOH_1[50]; // @[RefCounter.scala 108:95]
  wire [1:0] _refCounterDec_50_T_4 = _refCounterDec_50_T_1 + _refCounterDec_50_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterDec_50 = {{3'd0}, _refCounterDec_50_T_4};
  wire [4:0] _GEN_242 = 6'h32 == deallocate_0_bits ? refCounterDec_50 : _GEN_241; // @[RefCounter.scala 81:{64,64}]
  wire  _refCounterDec_51_T_1 = deallocate_0_valid & deallocateOH_0[51]; // @[RefCounter.scala 108:95]
  wire  _refCounterDec_51_T_3 = deallocate_1_valid & deallocateOH_1[51]; // @[RefCounter.scala 108:95]
  wire [1:0] _refCounterDec_51_T_4 = _refCounterDec_51_T_1 + _refCounterDec_51_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterDec_51 = {{3'd0}, _refCounterDec_51_T_4};
  wire [4:0] _GEN_243 = 6'h33 == deallocate_0_bits ? refCounterDec_51 : _GEN_242; // @[RefCounter.scala 81:{64,64}]
  wire  _refCounterDec_52_T_1 = deallocate_0_valid & deallocateOH_0[52]; // @[RefCounter.scala 108:95]
  wire  _refCounterDec_52_T_3 = deallocate_1_valid & deallocateOH_1[52]; // @[RefCounter.scala 108:95]
  wire [1:0] _refCounterDec_52_T_4 = _refCounterDec_52_T_1 + _refCounterDec_52_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterDec_52 = {{3'd0}, _refCounterDec_52_T_4};
  wire [4:0] _GEN_244 = 6'h34 == deallocate_0_bits ? refCounterDec_52 : _GEN_243; // @[RefCounter.scala 81:{64,64}]
  wire  _refCounterDec_53_T_1 = deallocate_0_valid & deallocateOH_0[53]; // @[RefCounter.scala 108:95]
  wire  _refCounterDec_53_T_3 = deallocate_1_valid & deallocateOH_1[53]; // @[RefCounter.scala 108:95]
  wire [1:0] _refCounterDec_53_T_4 = _refCounterDec_53_T_1 + _refCounterDec_53_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterDec_53 = {{3'd0}, _refCounterDec_53_T_4};
  wire [4:0] _GEN_245 = 6'h35 == deallocate_0_bits ? refCounterDec_53 : _GEN_244; // @[RefCounter.scala 81:{64,64}]
  wire  _refCounterDec_54_T_1 = deallocate_0_valid & deallocateOH_0[54]; // @[RefCounter.scala 108:95]
  wire  _refCounterDec_54_T_3 = deallocate_1_valid & deallocateOH_1[54]; // @[RefCounter.scala 108:95]
  wire [1:0] _refCounterDec_54_T_4 = _refCounterDec_54_T_1 + _refCounterDec_54_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterDec_54 = {{3'd0}, _refCounterDec_54_T_4};
  wire [4:0] _GEN_246 = 6'h36 == deallocate_0_bits ? refCounterDec_54 : _GEN_245; // @[RefCounter.scala 81:{64,64}]
  wire  _refCounterDec_55_T_1 = deallocate_0_valid & deallocateOH_0[55]; // @[RefCounter.scala 108:95]
  wire  _refCounterDec_55_T_3 = deallocate_1_valid & deallocateOH_1[55]; // @[RefCounter.scala 108:95]
  wire [1:0] _refCounterDec_55_T_4 = _refCounterDec_55_T_1 + _refCounterDec_55_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterDec_55 = {{3'd0}, _refCounterDec_55_T_4};
  wire [4:0] _GEN_247 = 6'h37 == deallocate_0_bits ? refCounterDec_55 : _GEN_246; // @[RefCounter.scala 81:{64,64}]
  wire  _refCounterDec_56_T_1 = deallocate_0_valid & deallocateOH_0[56]; // @[RefCounter.scala 108:95]
  wire  _refCounterDec_56_T_3 = deallocate_1_valid & deallocateOH_1[56]; // @[RefCounter.scala 108:95]
  wire [1:0] _refCounterDec_56_T_4 = _refCounterDec_56_T_1 + _refCounterDec_56_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterDec_56 = {{3'd0}, _refCounterDec_56_T_4};
  wire [4:0] _GEN_248 = 6'h38 == deallocate_0_bits ? refCounterDec_56 : _GEN_247; // @[RefCounter.scala 81:{64,64}]
  wire  _refCounterDec_57_T_1 = deallocate_0_valid & deallocateOH_0[57]; // @[RefCounter.scala 108:95]
  wire  _refCounterDec_57_T_3 = deallocate_1_valid & deallocateOH_1[57]; // @[RefCounter.scala 108:95]
  wire [1:0] _refCounterDec_57_T_4 = _refCounterDec_57_T_1 + _refCounterDec_57_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterDec_57 = {{3'd0}, _refCounterDec_57_T_4};
  wire [4:0] _GEN_249 = 6'h39 == deallocate_0_bits ? refCounterDec_57 : _GEN_248; // @[RefCounter.scala 81:{64,64}]
  wire  _refCounterDec_58_T_1 = deallocate_0_valid & deallocateOH_0[58]; // @[RefCounter.scala 108:95]
  wire  _refCounterDec_58_T_3 = deallocate_1_valid & deallocateOH_1[58]; // @[RefCounter.scala 108:95]
  wire [1:0] _refCounterDec_58_T_4 = _refCounterDec_58_T_1 + _refCounterDec_58_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterDec_58 = {{3'd0}, _refCounterDec_58_T_4};
  wire [4:0] _GEN_250 = 6'h3a == deallocate_0_bits ? refCounterDec_58 : _GEN_249; // @[RefCounter.scala 81:{64,64}]
  wire  _refCounterDec_59_T_1 = deallocate_0_valid & deallocateOH_0[59]; // @[RefCounter.scala 108:95]
  wire  _refCounterDec_59_T_3 = deallocate_1_valid & deallocateOH_1[59]; // @[RefCounter.scala 108:95]
  wire [1:0] _refCounterDec_59_T_4 = _refCounterDec_59_T_1 + _refCounterDec_59_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterDec_59 = {{3'd0}, _refCounterDec_59_T_4};
  wire [4:0] _GEN_251 = 6'h3b == deallocate_0_bits ? refCounterDec_59 : _GEN_250; // @[RefCounter.scala 81:{64,64}]
  wire  _refCounterDec_60_T_1 = deallocate_0_valid & deallocateOH_0[60]; // @[RefCounter.scala 108:95]
  wire  _refCounterDec_60_T_3 = deallocate_1_valid & deallocateOH_1[60]; // @[RefCounter.scala 108:95]
  wire [1:0] _refCounterDec_60_T_4 = _refCounterDec_60_T_1 + _refCounterDec_60_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterDec_60 = {{3'd0}, _refCounterDec_60_T_4};
  wire [4:0] _GEN_252 = 6'h3c == deallocate_0_bits ? refCounterDec_60 : _GEN_251; // @[RefCounter.scala 81:{64,64}]
  wire  _refCounterDec_61_T_1 = deallocate_0_valid & deallocateOH_0[61]; // @[RefCounter.scala 108:95]
  wire  _refCounterDec_61_T_3 = deallocate_1_valid & deallocateOH_1[61]; // @[RefCounter.scala 108:95]
  wire [1:0] _refCounterDec_61_T_4 = _refCounterDec_61_T_1 + _refCounterDec_61_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterDec_61 = {{3'd0}, _refCounterDec_61_T_4};
  wire [4:0] _GEN_253 = 6'h3d == deallocate_0_bits ? refCounterDec_61 : _GEN_252; // @[RefCounter.scala 81:{64,64}]
  wire  _refCounterDec_62_T_1 = deallocate_0_valid & deallocateOH_0[62]; // @[RefCounter.scala 108:95]
  wire  _refCounterDec_62_T_3 = deallocate_1_valid & deallocateOH_1[62]; // @[RefCounter.scala 108:95]
  wire [1:0] _refCounterDec_62_T_4 = _refCounterDec_62_T_1 + _refCounterDec_62_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterDec_62 = {{3'd0}, _refCounterDec_62_T_4};
  wire [4:0] _GEN_254 = 6'h3e == deallocate_0_bits ? refCounterDec_62 : _GEN_253; // @[RefCounter.scala 81:{64,64}]
  wire  _refCounterDec_63_T_1 = deallocate_0_valid & deallocateOH_0[63]; // @[RefCounter.scala 108:95]
  wire  _refCounterDec_63_T_3 = deallocate_1_valid & deallocateOH_1[63]; // @[RefCounter.scala 108:95]
  wire [1:0] _refCounterDec_63_T_4 = _refCounterDec_63_T_1 + _refCounterDec_63_T_3; // @[Bitwise.scala 48:55]
  wire [4:0] refCounterDec_63 = {{3'd0}, _refCounterDec_63_T_4};
  wire [4:0] _GEN_255 = 6'h3f == deallocate_0_bits ? refCounterDec_63 : _GEN_254; // @[RefCounter.scala 81:{64,64}]
  reg  io_freeRegs_0_valid_REG; // @[RefCounter.scala 82:36]
  reg  io_freeRegs_0_valid_REG_1; // @[RefCounter.scala 82:75]
  reg [5:0] io_freeRegs_0_bits_REG; // @[RefCounter.scala 87:35]
  wire [4:0] _GEN_321 = 6'h1 == deallocate_1_bits ? refCounter_1 : 5'h0; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_322 = 6'h2 == deallocate_1_bits ? refCounter_2 : _GEN_321; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_323 = 6'h3 == deallocate_1_bits ? refCounter_3 : _GEN_322; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_324 = 6'h4 == deallocate_1_bits ? refCounter_4 : _GEN_323; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_325 = 6'h5 == deallocate_1_bits ? refCounter_5 : _GEN_324; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_326 = 6'h6 == deallocate_1_bits ? refCounter_6 : _GEN_325; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_327 = 6'h7 == deallocate_1_bits ? refCounter_7 : _GEN_326; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_328 = 6'h8 == deallocate_1_bits ? refCounter_8 : _GEN_327; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_329 = 6'h9 == deallocate_1_bits ? refCounter_9 : _GEN_328; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_330 = 6'ha == deallocate_1_bits ? refCounter_10 : _GEN_329; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_331 = 6'hb == deallocate_1_bits ? refCounter_11 : _GEN_330; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_332 = 6'hc == deallocate_1_bits ? refCounter_12 : _GEN_331; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_333 = 6'hd == deallocate_1_bits ? refCounter_13 : _GEN_332; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_334 = 6'he == deallocate_1_bits ? refCounter_14 : _GEN_333; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_335 = 6'hf == deallocate_1_bits ? refCounter_15 : _GEN_334; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_336 = 6'h10 == deallocate_1_bits ? refCounter_16 : _GEN_335; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_337 = 6'h11 == deallocate_1_bits ? refCounter_17 : _GEN_336; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_338 = 6'h12 == deallocate_1_bits ? refCounter_18 : _GEN_337; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_339 = 6'h13 == deallocate_1_bits ? refCounter_19 : _GEN_338; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_340 = 6'h14 == deallocate_1_bits ? refCounter_20 : _GEN_339; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_341 = 6'h15 == deallocate_1_bits ? refCounter_21 : _GEN_340; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_342 = 6'h16 == deallocate_1_bits ? refCounter_22 : _GEN_341; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_343 = 6'h17 == deallocate_1_bits ? refCounter_23 : _GEN_342; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_344 = 6'h18 == deallocate_1_bits ? refCounter_24 : _GEN_343; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_345 = 6'h19 == deallocate_1_bits ? refCounter_25 : _GEN_344; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_346 = 6'h1a == deallocate_1_bits ? refCounter_26 : _GEN_345; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_347 = 6'h1b == deallocate_1_bits ? refCounter_27 : _GEN_346; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_348 = 6'h1c == deallocate_1_bits ? refCounter_28 : _GEN_347; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_349 = 6'h1d == deallocate_1_bits ? refCounter_29 : _GEN_348; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_350 = 6'h1e == deallocate_1_bits ? refCounter_30 : _GEN_349; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_351 = 6'h1f == deallocate_1_bits ? refCounter_31 : _GEN_350; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_352 = 6'h20 == deallocate_1_bits ? refCounter_32 : _GEN_351; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_353 = 6'h21 == deallocate_1_bits ? refCounter_33 : _GEN_352; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_354 = 6'h22 == deallocate_1_bits ? refCounter_34 : _GEN_353; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_355 = 6'h23 == deallocate_1_bits ? refCounter_35 : _GEN_354; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_356 = 6'h24 == deallocate_1_bits ? refCounter_36 : _GEN_355; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_357 = 6'h25 == deallocate_1_bits ? refCounter_37 : _GEN_356; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_358 = 6'h26 == deallocate_1_bits ? refCounter_38 : _GEN_357; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_359 = 6'h27 == deallocate_1_bits ? refCounter_39 : _GEN_358; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_360 = 6'h28 == deallocate_1_bits ? refCounter_40 : _GEN_359; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_361 = 6'h29 == deallocate_1_bits ? refCounter_41 : _GEN_360; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_362 = 6'h2a == deallocate_1_bits ? refCounter_42 : _GEN_361; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_363 = 6'h2b == deallocate_1_bits ? refCounter_43 : _GEN_362; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_364 = 6'h2c == deallocate_1_bits ? refCounter_44 : _GEN_363; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_365 = 6'h2d == deallocate_1_bits ? refCounter_45 : _GEN_364; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_366 = 6'h2e == deallocate_1_bits ? refCounter_46 : _GEN_365; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_367 = 6'h2f == deallocate_1_bits ? refCounter_47 : _GEN_366; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_368 = 6'h30 == deallocate_1_bits ? refCounter_48 : _GEN_367; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_369 = 6'h31 == deallocate_1_bits ? refCounter_49 : _GEN_368; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_370 = 6'h32 == deallocate_1_bits ? refCounter_50 : _GEN_369; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_371 = 6'h33 == deallocate_1_bits ? refCounter_51 : _GEN_370; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_372 = 6'h34 == deallocate_1_bits ? refCounter_52 : _GEN_371; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_373 = 6'h35 == deallocate_1_bits ? refCounter_53 : _GEN_372; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_374 = 6'h36 == deallocate_1_bits ? refCounter_54 : _GEN_373; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_375 = 6'h37 == deallocate_1_bits ? refCounter_55 : _GEN_374; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_376 = 6'h38 == deallocate_1_bits ? refCounter_56 : _GEN_375; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_377 = 6'h39 == deallocate_1_bits ? refCounter_57 : _GEN_376; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_378 = 6'h3a == deallocate_1_bits ? refCounter_58 : _GEN_377; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_379 = 6'h3b == deallocate_1_bits ? refCounter_59 : _GEN_378; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_380 = 6'h3c == deallocate_1_bits ? refCounter_60 : _GEN_379; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_381 = 6'h3d == deallocate_1_bits ? refCounter_61 : _GEN_380; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_382 = 6'h3e == deallocate_1_bits ? refCounter_62 : _GEN_381; // @[RefCounter.scala 78:{53,53}]
  wire [4:0] _GEN_383 = 6'h3f == deallocate_1_bits ? refCounter_63 : _GEN_382; // @[RefCounter.scala 78:{53,53}]
  wire  isNonZero_1 = deallocate_1_valid & _GEN_383 != 5'h0; // @[RefCounter.scala 78:30]
  wire  hasDuplicate_0 = deallocate_0_valid & deallocate_0_bits == deallocate_1_bits; // @[RefCounter.scala 79:62]
  wire  blockedByDup = |hasDuplicate_0; // @[RefCounter.scala 80:78]
  wire [4:0] _GEN_385 = 6'h1 == deallocate_1_bits ? refCounterInc_1 : 5'h0; // @[RefCounter.scala 81:{39,39}]
  wire [4:0] _GEN_386 = 6'h2 == deallocate_1_bits ? refCounterInc_2 : _GEN_385; // @[RefCounter.scala 81:{39,39}]
  wire [4:0] _GEN_387 = 6'h3 == deallocate_1_bits ? refCounterInc_3 : _GEN_386; // @[RefCounter.scala 81:{39,39}]
  wire [4:0] _GEN_388 = 6'h4 == deallocate_1_bits ? refCounterInc_4 : _GEN_387; // @[RefCounter.scala 81:{39,39}]
  wire [4:0] _GEN_389 = 6'h5 == deallocate_1_bits ? refCounterInc_5 : _GEN_388; // @[RefCounter.scala 81:{39,39}]
  wire [4:0] _GEN_390 = 6'h6 == deallocate_1_bits ? refCounterInc_6 : _GEN_389; // @[RefCounter.scala 81:{39,39}]
  wire [4:0] _GEN_391 = 6'h7 == deallocate_1_bits ? refCounterInc_7 : _GEN_390; // @[RefCounter.scala 81:{39,39}]
  wire [4:0] _GEN_392 = 6'h8 == deallocate_1_bits ? refCounterInc_8 : _GEN_391; // @[RefCounter.scala 81:{39,39}]
  wire [4:0] _GEN_393 = 6'h9 == deallocate_1_bits ? refCounterInc_9 : _GEN_392; // @[RefCounter.scala 81:{39,39}]
  wire [4:0] _GEN_394 = 6'ha == deallocate_1_bits ? refCounterInc_10 : _GEN_393; // @[RefCounter.scala 81:{39,39}]
  wire [4:0] _GEN_395 = 6'hb == deallocate_1_bits ? refCounterInc_11 : _GEN_394; // @[RefCounter.scala 81:{39,39}]
  wire [4:0] _GEN_396 = 6'hc == deallocate_1_bits ? refCounterInc_12 : _GEN_395; // @[RefCounter.scala 81:{39,39}]
  wire [4:0] _GEN_397 = 6'hd == deallocate_1_bits ? refCounterInc_13 : _GEN_396; // @[RefCounter.scala 81:{39,39}]
  wire [4:0] _GEN_398 = 6'he == deallocate_1_bits ? refCounterInc_14 : _GEN_397; // @[RefCounter.scala 81:{39,39}]
  wire [4:0] _GEN_399 = 6'hf == deallocate_1_bits ? refCounterInc_15 : _GEN_398; // @[RefCounter.scala 81:{39,39}]
  wire [4:0] _GEN_400 = 6'h10 == deallocate_1_bits ? refCounterInc_16 : _GEN_399; // @[RefCounter.scala 81:{39,39}]
  wire [4:0] _GEN_401 = 6'h11 == deallocate_1_bits ? refCounterInc_17 : _GEN_400; // @[RefCounter.scala 81:{39,39}]
  wire [4:0] _GEN_402 = 6'h12 == deallocate_1_bits ? refCounterInc_18 : _GEN_401; // @[RefCounter.scala 81:{39,39}]
  wire [4:0] _GEN_403 = 6'h13 == deallocate_1_bits ? refCounterInc_19 : _GEN_402; // @[RefCounter.scala 81:{39,39}]
  wire [4:0] _GEN_404 = 6'h14 == deallocate_1_bits ? refCounterInc_20 : _GEN_403; // @[RefCounter.scala 81:{39,39}]
  wire [4:0] _GEN_405 = 6'h15 == deallocate_1_bits ? refCounterInc_21 : _GEN_404; // @[RefCounter.scala 81:{39,39}]
  wire [4:0] _GEN_406 = 6'h16 == deallocate_1_bits ? refCounterInc_22 : _GEN_405; // @[RefCounter.scala 81:{39,39}]
  wire [4:0] _GEN_407 = 6'h17 == deallocate_1_bits ? refCounterInc_23 : _GEN_406; // @[RefCounter.scala 81:{39,39}]
  wire [4:0] _GEN_408 = 6'h18 == deallocate_1_bits ? refCounterInc_24 : _GEN_407; // @[RefCounter.scala 81:{39,39}]
  wire [4:0] _GEN_409 = 6'h19 == deallocate_1_bits ? refCounterInc_25 : _GEN_408; // @[RefCounter.scala 81:{39,39}]
  wire [4:0] _GEN_410 = 6'h1a == deallocate_1_bits ? refCounterInc_26 : _GEN_409; // @[RefCounter.scala 81:{39,39}]
  wire [4:0] _GEN_411 = 6'h1b == deallocate_1_bits ? refCounterInc_27 : _GEN_410; // @[RefCounter.scala 81:{39,39}]
  wire [4:0] _GEN_412 = 6'h1c == deallocate_1_bits ? refCounterInc_28 : _GEN_411; // @[RefCounter.scala 81:{39,39}]
  wire [4:0] _GEN_413 = 6'h1d == deallocate_1_bits ? refCounterInc_29 : _GEN_412; // @[RefCounter.scala 81:{39,39}]
  wire [4:0] _GEN_414 = 6'h1e == deallocate_1_bits ? refCounterInc_30 : _GEN_413; // @[RefCounter.scala 81:{39,39}]
  wire [4:0] _GEN_415 = 6'h1f == deallocate_1_bits ? refCounterInc_31 : _GEN_414; // @[RefCounter.scala 81:{39,39}]
  wire [4:0] _GEN_416 = 6'h20 == deallocate_1_bits ? refCounterInc_32 : _GEN_415; // @[RefCounter.scala 81:{39,39}]
  wire [4:0] _GEN_417 = 6'h21 == deallocate_1_bits ? refCounterInc_33 : _GEN_416; // @[RefCounter.scala 81:{39,39}]
  wire [4:0] _GEN_418 = 6'h22 == deallocate_1_bits ? refCounterInc_34 : _GEN_417; // @[RefCounter.scala 81:{39,39}]
  wire [4:0] _GEN_419 = 6'h23 == deallocate_1_bits ? refCounterInc_35 : _GEN_418; // @[RefCounter.scala 81:{39,39}]
  wire [4:0] _GEN_420 = 6'h24 == deallocate_1_bits ? refCounterInc_36 : _GEN_419; // @[RefCounter.scala 81:{39,39}]
  wire [4:0] _GEN_421 = 6'h25 == deallocate_1_bits ? refCounterInc_37 : _GEN_420; // @[RefCounter.scala 81:{39,39}]
  wire [4:0] _GEN_422 = 6'h26 == deallocate_1_bits ? refCounterInc_38 : _GEN_421; // @[RefCounter.scala 81:{39,39}]
  wire [4:0] _GEN_423 = 6'h27 == deallocate_1_bits ? refCounterInc_39 : _GEN_422; // @[RefCounter.scala 81:{39,39}]
  wire [4:0] _GEN_424 = 6'h28 == deallocate_1_bits ? refCounterInc_40 : _GEN_423; // @[RefCounter.scala 81:{39,39}]
  wire [4:0] _GEN_425 = 6'h29 == deallocate_1_bits ? refCounterInc_41 : _GEN_424; // @[RefCounter.scala 81:{39,39}]
  wire [4:0] _GEN_426 = 6'h2a == deallocate_1_bits ? refCounterInc_42 : _GEN_425; // @[RefCounter.scala 81:{39,39}]
  wire [4:0] _GEN_427 = 6'h2b == deallocate_1_bits ? refCounterInc_43 : _GEN_426; // @[RefCounter.scala 81:{39,39}]
  wire [4:0] _GEN_428 = 6'h2c == deallocate_1_bits ? refCounterInc_44 : _GEN_427; // @[RefCounter.scala 81:{39,39}]
  wire [4:0] _GEN_429 = 6'h2d == deallocate_1_bits ? refCounterInc_45 : _GEN_428; // @[RefCounter.scala 81:{39,39}]
  wire [4:0] _GEN_430 = 6'h2e == deallocate_1_bits ? refCounterInc_46 : _GEN_429; // @[RefCounter.scala 81:{39,39}]
  wire [4:0] _GEN_431 = 6'h2f == deallocate_1_bits ? refCounterInc_47 : _GEN_430; // @[RefCounter.scala 81:{39,39}]
  wire [4:0] _GEN_432 = 6'h30 == deallocate_1_bits ? refCounterInc_48 : _GEN_431; // @[RefCounter.scala 81:{39,39}]
  wire [4:0] _GEN_433 = 6'h31 == deallocate_1_bits ? refCounterInc_49 : _GEN_432; // @[RefCounter.scala 81:{39,39}]
  wire [4:0] _GEN_434 = 6'h32 == deallocate_1_bits ? refCounterInc_50 : _GEN_433; // @[RefCounter.scala 81:{39,39}]
  wire [4:0] _GEN_435 = 6'h33 == deallocate_1_bits ? refCounterInc_51 : _GEN_434; // @[RefCounter.scala 81:{39,39}]
  wire [4:0] _GEN_436 = 6'h34 == deallocate_1_bits ? refCounterInc_52 : _GEN_435; // @[RefCounter.scala 81:{39,39}]
  wire [4:0] _GEN_437 = 6'h35 == deallocate_1_bits ? refCounterInc_53 : _GEN_436; // @[RefCounter.scala 81:{39,39}]
  wire [4:0] _GEN_438 = 6'h36 == deallocate_1_bits ? refCounterInc_54 : _GEN_437; // @[RefCounter.scala 81:{39,39}]
  wire [4:0] _GEN_439 = 6'h37 == deallocate_1_bits ? refCounterInc_55 : _GEN_438; // @[RefCounter.scala 81:{39,39}]
  wire [4:0] _GEN_440 = 6'h38 == deallocate_1_bits ? refCounterInc_56 : _GEN_439; // @[RefCounter.scala 81:{39,39}]
  wire [4:0] _GEN_441 = 6'h39 == deallocate_1_bits ? refCounterInc_57 : _GEN_440; // @[RefCounter.scala 81:{39,39}]
  wire [4:0] _GEN_442 = 6'h3a == deallocate_1_bits ? refCounterInc_58 : _GEN_441; // @[RefCounter.scala 81:{39,39}]
  wire [4:0] _GEN_443 = 6'h3b == deallocate_1_bits ? refCounterInc_59 : _GEN_442; // @[RefCounter.scala 81:{39,39}]
  wire [4:0] _GEN_444 = 6'h3c == deallocate_1_bits ? refCounterInc_60 : _GEN_443; // @[RefCounter.scala 81:{39,39}]
  wire [4:0] _GEN_445 = 6'h3d == deallocate_1_bits ? refCounterInc_61 : _GEN_444; // @[RefCounter.scala 81:{39,39}]
  wire [4:0] _GEN_446 = 6'h3e == deallocate_1_bits ? refCounterInc_62 : _GEN_445; // @[RefCounter.scala 81:{39,39}]
  wire [4:0] _GEN_447 = 6'h3f == deallocate_1_bits ? refCounterInc_63 : _GEN_446; // @[RefCounter.scala 81:{39,39}]
  wire [4:0] _isFreed_T_3 = _GEN_383 + _GEN_447; // @[RefCounter.scala 81:39]
  wire [4:0] _GEN_449 = 6'h1 == deallocate_1_bits ? refCounterDec_1 : 5'h0; // @[RefCounter.scala 81:{64,64}]
  wire [4:0] _GEN_450 = 6'h2 == deallocate_1_bits ? refCounterDec_2 : _GEN_449; // @[RefCounter.scala 81:{64,64}]
  wire [4:0] _GEN_451 = 6'h3 == deallocate_1_bits ? refCounterDec_3 : _GEN_450; // @[RefCounter.scala 81:{64,64}]
  wire [4:0] _GEN_452 = 6'h4 == deallocate_1_bits ? refCounterDec_4 : _GEN_451; // @[RefCounter.scala 81:{64,64}]
  wire [4:0] _GEN_453 = 6'h5 == deallocate_1_bits ? refCounterDec_5 : _GEN_452; // @[RefCounter.scala 81:{64,64}]
  wire [4:0] _GEN_454 = 6'h6 == deallocate_1_bits ? refCounterDec_6 : _GEN_453; // @[RefCounter.scala 81:{64,64}]
  wire [4:0] _GEN_455 = 6'h7 == deallocate_1_bits ? refCounterDec_7 : _GEN_454; // @[RefCounter.scala 81:{64,64}]
  wire [4:0] _GEN_456 = 6'h8 == deallocate_1_bits ? refCounterDec_8 : _GEN_455; // @[RefCounter.scala 81:{64,64}]
  wire [4:0] _GEN_457 = 6'h9 == deallocate_1_bits ? refCounterDec_9 : _GEN_456; // @[RefCounter.scala 81:{64,64}]
  wire [4:0] _GEN_458 = 6'ha == deallocate_1_bits ? refCounterDec_10 : _GEN_457; // @[RefCounter.scala 81:{64,64}]
  wire [4:0] _GEN_459 = 6'hb == deallocate_1_bits ? refCounterDec_11 : _GEN_458; // @[RefCounter.scala 81:{64,64}]
  wire [4:0] _GEN_460 = 6'hc == deallocate_1_bits ? refCounterDec_12 : _GEN_459; // @[RefCounter.scala 81:{64,64}]
  wire [4:0] _GEN_461 = 6'hd == deallocate_1_bits ? refCounterDec_13 : _GEN_460; // @[RefCounter.scala 81:{64,64}]
  wire [4:0] _GEN_462 = 6'he == deallocate_1_bits ? refCounterDec_14 : _GEN_461; // @[RefCounter.scala 81:{64,64}]
  wire [4:0] _GEN_463 = 6'hf == deallocate_1_bits ? refCounterDec_15 : _GEN_462; // @[RefCounter.scala 81:{64,64}]
  wire [4:0] _GEN_464 = 6'h10 == deallocate_1_bits ? refCounterDec_16 : _GEN_463; // @[RefCounter.scala 81:{64,64}]
  wire [4:0] _GEN_465 = 6'h11 == deallocate_1_bits ? refCounterDec_17 : _GEN_464; // @[RefCounter.scala 81:{64,64}]
  wire [4:0] _GEN_466 = 6'h12 == deallocate_1_bits ? refCounterDec_18 : _GEN_465; // @[RefCounter.scala 81:{64,64}]
  wire [4:0] _GEN_467 = 6'h13 == deallocate_1_bits ? refCounterDec_19 : _GEN_466; // @[RefCounter.scala 81:{64,64}]
  wire [4:0] _GEN_468 = 6'h14 == deallocate_1_bits ? refCounterDec_20 : _GEN_467; // @[RefCounter.scala 81:{64,64}]
  wire [4:0] _GEN_469 = 6'h15 == deallocate_1_bits ? refCounterDec_21 : _GEN_468; // @[RefCounter.scala 81:{64,64}]
  wire [4:0] _GEN_470 = 6'h16 == deallocate_1_bits ? refCounterDec_22 : _GEN_469; // @[RefCounter.scala 81:{64,64}]
  wire [4:0] _GEN_471 = 6'h17 == deallocate_1_bits ? refCounterDec_23 : _GEN_470; // @[RefCounter.scala 81:{64,64}]
  wire [4:0] _GEN_472 = 6'h18 == deallocate_1_bits ? refCounterDec_24 : _GEN_471; // @[RefCounter.scala 81:{64,64}]
  wire [4:0] _GEN_473 = 6'h19 == deallocate_1_bits ? refCounterDec_25 : _GEN_472; // @[RefCounter.scala 81:{64,64}]
  wire [4:0] _GEN_474 = 6'h1a == deallocate_1_bits ? refCounterDec_26 : _GEN_473; // @[RefCounter.scala 81:{64,64}]
  wire [4:0] _GEN_475 = 6'h1b == deallocate_1_bits ? refCounterDec_27 : _GEN_474; // @[RefCounter.scala 81:{64,64}]
  wire [4:0] _GEN_476 = 6'h1c == deallocate_1_bits ? refCounterDec_28 : _GEN_475; // @[RefCounter.scala 81:{64,64}]
  wire [4:0] _GEN_477 = 6'h1d == deallocate_1_bits ? refCounterDec_29 : _GEN_476; // @[RefCounter.scala 81:{64,64}]
  wire [4:0] _GEN_478 = 6'h1e == deallocate_1_bits ? refCounterDec_30 : _GEN_477; // @[RefCounter.scala 81:{64,64}]
  wire [4:0] _GEN_479 = 6'h1f == deallocate_1_bits ? refCounterDec_31 : _GEN_478; // @[RefCounter.scala 81:{64,64}]
  wire [4:0] _GEN_480 = 6'h20 == deallocate_1_bits ? refCounterDec_32 : _GEN_479; // @[RefCounter.scala 81:{64,64}]
  wire [4:0] _GEN_481 = 6'h21 == deallocate_1_bits ? refCounterDec_33 : _GEN_480; // @[RefCounter.scala 81:{64,64}]
  wire [4:0] _GEN_482 = 6'h22 == deallocate_1_bits ? refCounterDec_34 : _GEN_481; // @[RefCounter.scala 81:{64,64}]
  wire [4:0] _GEN_483 = 6'h23 == deallocate_1_bits ? refCounterDec_35 : _GEN_482; // @[RefCounter.scala 81:{64,64}]
  wire [4:0] _GEN_484 = 6'h24 == deallocate_1_bits ? refCounterDec_36 : _GEN_483; // @[RefCounter.scala 81:{64,64}]
  wire [4:0] _GEN_485 = 6'h25 == deallocate_1_bits ? refCounterDec_37 : _GEN_484; // @[RefCounter.scala 81:{64,64}]
  wire [4:0] _GEN_486 = 6'h26 == deallocate_1_bits ? refCounterDec_38 : _GEN_485; // @[RefCounter.scala 81:{64,64}]
  wire [4:0] _GEN_487 = 6'h27 == deallocate_1_bits ? refCounterDec_39 : _GEN_486; // @[RefCounter.scala 81:{64,64}]
  wire [4:0] _GEN_488 = 6'h28 == deallocate_1_bits ? refCounterDec_40 : _GEN_487; // @[RefCounter.scala 81:{64,64}]
  wire [4:0] _GEN_489 = 6'h29 == deallocate_1_bits ? refCounterDec_41 : _GEN_488; // @[RefCounter.scala 81:{64,64}]
  wire [4:0] _GEN_490 = 6'h2a == deallocate_1_bits ? refCounterDec_42 : _GEN_489; // @[RefCounter.scala 81:{64,64}]
  wire [4:0] _GEN_491 = 6'h2b == deallocate_1_bits ? refCounterDec_43 : _GEN_490; // @[RefCounter.scala 81:{64,64}]
  wire [4:0] _GEN_492 = 6'h2c == deallocate_1_bits ? refCounterDec_44 : _GEN_491; // @[RefCounter.scala 81:{64,64}]
  wire [4:0] _GEN_493 = 6'h2d == deallocate_1_bits ? refCounterDec_45 : _GEN_492; // @[RefCounter.scala 81:{64,64}]
  wire [4:0] _GEN_494 = 6'h2e == deallocate_1_bits ? refCounterDec_46 : _GEN_493; // @[RefCounter.scala 81:{64,64}]
  wire [4:0] _GEN_495 = 6'h2f == deallocate_1_bits ? refCounterDec_47 : _GEN_494; // @[RefCounter.scala 81:{64,64}]
  wire [4:0] _GEN_496 = 6'h30 == deallocate_1_bits ? refCounterDec_48 : _GEN_495; // @[RefCounter.scala 81:{64,64}]
  wire [4:0] _GEN_497 = 6'h31 == deallocate_1_bits ? refCounterDec_49 : _GEN_496; // @[RefCounter.scala 81:{64,64}]
  wire [4:0] _GEN_498 = 6'h32 == deallocate_1_bits ? refCounterDec_50 : _GEN_497; // @[RefCounter.scala 81:{64,64}]
  wire [4:0] _GEN_499 = 6'h33 == deallocate_1_bits ? refCounterDec_51 : _GEN_498; // @[RefCounter.scala 81:{64,64}]
  wire [4:0] _GEN_500 = 6'h34 == deallocate_1_bits ? refCounterDec_52 : _GEN_499; // @[RefCounter.scala 81:{64,64}]
  wire [4:0] _GEN_501 = 6'h35 == deallocate_1_bits ? refCounterDec_53 : _GEN_500; // @[RefCounter.scala 81:{64,64}]
  wire [4:0] _GEN_502 = 6'h36 == deallocate_1_bits ? refCounterDec_54 : _GEN_501; // @[RefCounter.scala 81:{64,64}]
  wire [4:0] _GEN_503 = 6'h37 == deallocate_1_bits ? refCounterDec_55 : _GEN_502; // @[RefCounter.scala 81:{64,64}]
  wire [4:0] _GEN_504 = 6'h38 == deallocate_1_bits ? refCounterDec_56 : _GEN_503; // @[RefCounter.scala 81:{64,64}]
  wire [4:0] _GEN_505 = 6'h39 == deallocate_1_bits ? refCounterDec_57 : _GEN_504; // @[RefCounter.scala 81:{64,64}]
  wire [4:0] _GEN_506 = 6'h3a == deallocate_1_bits ? refCounterDec_58 : _GEN_505; // @[RefCounter.scala 81:{64,64}]
  wire [4:0] _GEN_507 = 6'h3b == deallocate_1_bits ? refCounterDec_59 : _GEN_506; // @[RefCounter.scala 81:{64,64}]
  wire [4:0] _GEN_508 = 6'h3c == deallocate_1_bits ? refCounterDec_60 : _GEN_507; // @[RefCounter.scala 81:{64,64}]
  wire [4:0] _GEN_509 = 6'h3d == deallocate_1_bits ? refCounterDec_61 : _GEN_508; // @[RefCounter.scala 81:{64,64}]
  wire [4:0] _GEN_510 = 6'h3e == deallocate_1_bits ? refCounterDec_62 : _GEN_509; // @[RefCounter.scala 81:{64,64}]
  wire [4:0] _GEN_511 = 6'h3f == deallocate_1_bits ? refCounterDec_63 : _GEN_510; // @[RefCounter.scala 81:{64,64}]
  reg  io_freeRegs_1_valid_REG; // @[RefCounter.scala 82:36]
  reg  io_freeRegs_1_valid_REG_1; // @[RefCounter.scala 82:75]
  reg [5:0] io_freeRegs_1_bits_REG; // @[RefCounter.scala 87:35]
  wire [4:0] _refCounterNext_1_T_1 = refCounter_1 + refCounterInc_1; // @[RefCounter.scala 113:40]
  wire [4:0] refCounterNext_1 = _refCounterNext_1_T_1 - refCounterDec_1; // @[RefCounter.scala 113:59]
  wire [4:0] _refCounterNext_2_T_1 = refCounter_2 + refCounterInc_2; // @[RefCounter.scala 113:40]
  wire [4:0] refCounterNext_2 = _refCounterNext_2_T_1 - refCounterDec_2; // @[RefCounter.scala 113:59]
  wire [4:0] _refCounterNext_3_T_1 = refCounter_3 + refCounterInc_3; // @[RefCounter.scala 113:40]
  wire [4:0] refCounterNext_3 = _refCounterNext_3_T_1 - refCounterDec_3; // @[RefCounter.scala 113:59]
  wire [4:0] _refCounterNext_4_T_1 = refCounter_4 + refCounterInc_4; // @[RefCounter.scala 113:40]
  wire [4:0] refCounterNext_4 = _refCounterNext_4_T_1 - refCounterDec_4; // @[RefCounter.scala 113:59]
  wire [4:0] _refCounterNext_5_T_1 = refCounter_5 + refCounterInc_5; // @[RefCounter.scala 113:40]
  wire [4:0] refCounterNext_5 = _refCounterNext_5_T_1 - refCounterDec_5; // @[RefCounter.scala 113:59]
  wire [4:0] _refCounterNext_6_T_1 = refCounter_6 + refCounterInc_6; // @[RefCounter.scala 113:40]
  wire [4:0] refCounterNext_6 = _refCounterNext_6_T_1 - refCounterDec_6; // @[RefCounter.scala 113:59]
  wire [4:0] _refCounterNext_7_T_1 = refCounter_7 + refCounterInc_7; // @[RefCounter.scala 113:40]
  wire [4:0] refCounterNext_7 = _refCounterNext_7_T_1 - refCounterDec_7; // @[RefCounter.scala 113:59]
  wire [4:0] _refCounterNext_8_T_1 = refCounter_8 + refCounterInc_8; // @[RefCounter.scala 113:40]
  wire [4:0] refCounterNext_8 = _refCounterNext_8_T_1 - refCounterDec_8; // @[RefCounter.scala 113:59]
  wire [4:0] _refCounterNext_9_T_1 = refCounter_9 + refCounterInc_9; // @[RefCounter.scala 113:40]
  wire [4:0] refCounterNext_9 = _refCounterNext_9_T_1 - refCounterDec_9; // @[RefCounter.scala 113:59]
  wire [4:0] _refCounterNext_10_T_1 = refCounter_10 + refCounterInc_10; // @[RefCounter.scala 113:40]
  wire [4:0] refCounterNext_10 = _refCounterNext_10_T_1 - refCounterDec_10; // @[RefCounter.scala 113:59]
  wire [4:0] _refCounterNext_11_T_1 = refCounter_11 + refCounterInc_11; // @[RefCounter.scala 113:40]
  wire [4:0] refCounterNext_11 = _refCounterNext_11_T_1 - refCounterDec_11; // @[RefCounter.scala 113:59]
  wire [4:0] _refCounterNext_12_T_1 = refCounter_12 + refCounterInc_12; // @[RefCounter.scala 113:40]
  wire [4:0] refCounterNext_12 = _refCounterNext_12_T_1 - refCounterDec_12; // @[RefCounter.scala 113:59]
  wire [4:0] _refCounterNext_13_T_1 = refCounter_13 + refCounterInc_13; // @[RefCounter.scala 113:40]
  wire [4:0] refCounterNext_13 = _refCounterNext_13_T_1 - refCounterDec_13; // @[RefCounter.scala 113:59]
  wire [4:0] _refCounterNext_14_T_1 = refCounter_14 + refCounterInc_14; // @[RefCounter.scala 113:40]
  wire [4:0] refCounterNext_14 = _refCounterNext_14_T_1 - refCounterDec_14; // @[RefCounter.scala 113:59]
  wire [4:0] _refCounterNext_15_T_1 = refCounter_15 + refCounterInc_15; // @[RefCounter.scala 113:40]
  wire [4:0] refCounterNext_15 = _refCounterNext_15_T_1 - refCounterDec_15; // @[RefCounter.scala 113:59]
  wire [4:0] _refCounterNext_16_T_1 = refCounter_16 + refCounterInc_16; // @[RefCounter.scala 113:40]
  wire [4:0] refCounterNext_16 = _refCounterNext_16_T_1 - refCounterDec_16; // @[RefCounter.scala 113:59]
  wire [4:0] _refCounterNext_17_T_1 = refCounter_17 + refCounterInc_17; // @[RefCounter.scala 113:40]
  wire [4:0] refCounterNext_17 = _refCounterNext_17_T_1 - refCounterDec_17; // @[RefCounter.scala 113:59]
  wire [4:0] _refCounterNext_18_T_1 = refCounter_18 + refCounterInc_18; // @[RefCounter.scala 113:40]
  wire [4:0] refCounterNext_18 = _refCounterNext_18_T_1 - refCounterDec_18; // @[RefCounter.scala 113:59]
  wire [4:0] _refCounterNext_19_T_1 = refCounter_19 + refCounterInc_19; // @[RefCounter.scala 113:40]
  wire [4:0] refCounterNext_19 = _refCounterNext_19_T_1 - refCounterDec_19; // @[RefCounter.scala 113:59]
  wire [4:0] _refCounterNext_20_T_1 = refCounter_20 + refCounterInc_20; // @[RefCounter.scala 113:40]
  wire [4:0] refCounterNext_20 = _refCounterNext_20_T_1 - refCounterDec_20; // @[RefCounter.scala 113:59]
  wire [4:0] _refCounterNext_21_T_1 = refCounter_21 + refCounterInc_21; // @[RefCounter.scala 113:40]
  wire [4:0] refCounterNext_21 = _refCounterNext_21_T_1 - refCounterDec_21; // @[RefCounter.scala 113:59]
  wire [4:0] _refCounterNext_22_T_1 = refCounter_22 + refCounterInc_22; // @[RefCounter.scala 113:40]
  wire [4:0] refCounterNext_22 = _refCounterNext_22_T_1 - refCounterDec_22; // @[RefCounter.scala 113:59]
  wire [4:0] _refCounterNext_23_T_1 = refCounter_23 + refCounterInc_23; // @[RefCounter.scala 113:40]
  wire [4:0] refCounterNext_23 = _refCounterNext_23_T_1 - refCounterDec_23; // @[RefCounter.scala 113:59]
  wire [4:0] _refCounterNext_24_T_1 = refCounter_24 + refCounterInc_24; // @[RefCounter.scala 113:40]
  wire [4:0] refCounterNext_24 = _refCounterNext_24_T_1 - refCounterDec_24; // @[RefCounter.scala 113:59]
  wire [4:0] _refCounterNext_25_T_1 = refCounter_25 + refCounterInc_25; // @[RefCounter.scala 113:40]
  wire [4:0] refCounterNext_25 = _refCounterNext_25_T_1 - refCounterDec_25; // @[RefCounter.scala 113:59]
  wire [4:0] _refCounterNext_26_T_1 = refCounter_26 + refCounterInc_26; // @[RefCounter.scala 113:40]
  wire [4:0] refCounterNext_26 = _refCounterNext_26_T_1 - refCounterDec_26; // @[RefCounter.scala 113:59]
  wire [4:0] _refCounterNext_27_T_1 = refCounter_27 + refCounterInc_27; // @[RefCounter.scala 113:40]
  wire [4:0] refCounterNext_27 = _refCounterNext_27_T_1 - refCounterDec_27; // @[RefCounter.scala 113:59]
  wire [4:0] _refCounterNext_28_T_1 = refCounter_28 + refCounterInc_28; // @[RefCounter.scala 113:40]
  wire [4:0] refCounterNext_28 = _refCounterNext_28_T_1 - refCounterDec_28; // @[RefCounter.scala 113:59]
  wire [4:0] _refCounterNext_29_T_1 = refCounter_29 + refCounterInc_29; // @[RefCounter.scala 113:40]
  wire [4:0] refCounterNext_29 = _refCounterNext_29_T_1 - refCounterDec_29; // @[RefCounter.scala 113:59]
  wire [4:0] _refCounterNext_30_T_1 = refCounter_30 + refCounterInc_30; // @[RefCounter.scala 113:40]
  wire [4:0] refCounterNext_30 = _refCounterNext_30_T_1 - refCounterDec_30; // @[RefCounter.scala 113:59]
  wire [4:0] _refCounterNext_31_T_1 = refCounter_31 + refCounterInc_31; // @[RefCounter.scala 113:40]
  wire [4:0] refCounterNext_31 = _refCounterNext_31_T_1 - refCounterDec_31; // @[RefCounter.scala 113:59]
  wire [4:0] _refCounterNext_32_T_1 = refCounter_32 + refCounterInc_32; // @[RefCounter.scala 113:40]
  wire [4:0] refCounterNext_32 = _refCounterNext_32_T_1 - refCounterDec_32; // @[RefCounter.scala 113:59]
  wire [4:0] _refCounterNext_33_T_1 = refCounter_33 + refCounterInc_33; // @[RefCounter.scala 113:40]
  wire [4:0] refCounterNext_33 = _refCounterNext_33_T_1 - refCounterDec_33; // @[RefCounter.scala 113:59]
  wire [4:0] _refCounterNext_34_T_1 = refCounter_34 + refCounterInc_34; // @[RefCounter.scala 113:40]
  wire [4:0] refCounterNext_34 = _refCounterNext_34_T_1 - refCounterDec_34; // @[RefCounter.scala 113:59]
  wire [4:0] _refCounterNext_35_T_1 = refCounter_35 + refCounterInc_35; // @[RefCounter.scala 113:40]
  wire [4:0] refCounterNext_35 = _refCounterNext_35_T_1 - refCounterDec_35; // @[RefCounter.scala 113:59]
  wire [4:0] _refCounterNext_36_T_1 = refCounter_36 + refCounterInc_36; // @[RefCounter.scala 113:40]
  wire [4:0] refCounterNext_36 = _refCounterNext_36_T_1 - refCounterDec_36; // @[RefCounter.scala 113:59]
  wire [4:0] _refCounterNext_37_T_1 = refCounter_37 + refCounterInc_37; // @[RefCounter.scala 113:40]
  wire [4:0] refCounterNext_37 = _refCounterNext_37_T_1 - refCounterDec_37; // @[RefCounter.scala 113:59]
  wire [4:0] _refCounterNext_38_T_1 = refCounter_38 + refCounterInc_38; // @[RefCounter.scala 113:40]
  wire [4:0] refCounterNext_38 = _refCounterNext_38_T_1 - refCounterDec_38; // @[RefCounter.scala 113:59]
  wire [4:0] _refCounterNext_39_T_1 = refCounter_39 + refCounterInc_39; // @[RefCounter.scala 113:40]
  wire [4:0] refCounterNext_39 = _refCounterNext_39_T_1 - refCounterDec_39; // @[RefCounter.scala 113:59]
  wire [4:0] _refCounterNext_40_T_1 = refCounter_40 + refCounterInc_40; // @[RefCounter.scala 113:40]
  wire [4:0] refCounterNext_40 = _refCounterNext_40_T_1 - refCounterDec_40; // @[RefCounter.scala 113:59]
  wire [4:0] _refCounterNext_41_T_1 = refCounter_41 + refCounterInc_41; // @[RefCounter.scala 113:40]
  wire [4:0] refCounterNext_41 = _refCounterNext_41_T_1 - refCounterDec_41; // @[RefCounter.scala 113:59]
  wire [4:0] _refCounterNext_42_T_1 = refCounter_42 + refCounterInc_42; // @[RefCounter.scala 113:40]
  wire [4:0] refCounterNext_42 = _refCounterNext_42_T_1 - refCounterDec_42; // @[RefCounter.scala 113:59]
  wire [4:0] _refCounterNext_43_T_1 = refCounter_43 + refCounterInc_43; // @[RefCounter.scala 113:40]
  wire [4:0] refCounterNext_43 = _refCounterNext_43_T_1 - refCounterDec_43; // @[RefCounter.scala 113:59]
  wire [4:0] _refCounterNext_44_T_1 = refCounter_44 + refCounterInc_44; // @[RefCounter.scala 113:40]
  wire [4:0] refCounterNext_44 = _refCounterNext_44_T_1 - refCounterDec_44; // @[RefCounter.scala 113:59]
  wire [4:0] _refCounterNext_45_T_1 = refCounter_45 + refCounterInc_45; // @[RefCounter.scala 113:40]
  wire [4:0] refCounterNext_45 = _refCounterNext_45_T_1 - refCounterDec_45; // @[RefCounter.scala 113:59]
  wire [4:0] _refCounterNext_46_T_1 = refCounter_46 + refCounterInc_46; // @[RefCounter.scala 113:40]
  wire [4:0] refCounterNext_46 = _refCounterNext_46_T_1 - refCounterDec_46; // @[RefCounter.scala 113:59]
  wire [4:0] _refCounterNext_47_T_1 = refCounter_47 + refCounterInc_47; // @[RefCounter.scala 113:40]
  wire [4:0] refCounterNext_47 = _refCounterNext_47_T_1 - refCounterDec_47; // @[RefCounter.scala 113:59]
  wire [4:0] _refCounterNext_48_T_1 = refCounter_48 + refCounterInc_48; // @[RefCounter.scala 113:40]
  wire [4:0] refCounterNext_48 = _refCounterNext_48_T_1 - refCounterDec_48; // @[RefCounter.scala 113:59]
  wire [4:0] _refCounterNext_49_T_1 = refCounter_49 + refCounterInc_49; // @[RefCounter.scala 113:40]
  wire [4:0] refCounterNext_49 = _refCounterNext_49_T_1 - refCounterDec_49; // @[RefCounter.scala 113:59]
  wire [4:0] _refCounterNext_50_T_1 = refCounter_50 + refCounterInc_50; // @[RefCounter.scala 113:40]
  wire [4:0] refCounterNext_50 = _refCounterNext_50_T_1 - refCounterDec_50; // @[RefCounter.scala 113:59]
  wire [4:0] _refCounterNext_51_T_1 = refCounter_51 + refCounterInc_51; // @[RefCounter.scala 113:40]
  wire [4:0] refCounterNext_51 = _refCounterNext_51_T_1 - refCounterDec_51; // @[RefCounter.scala 113:59]
  wire [4:0] _refCounterNext_52_T_1 = refCounter_52 + refCounterInc_52; // @[RefCounter.scala 113:40]
  wire [4:0] refCounterNext_52 = _refCounterNext_52_T_1 - refCounterDec_52; // @[RefCounter.scala 113:59]
  wire [4:0] _refCounterNext_53_T_1 = refCounter_53 + refCounterInc_53; // @[RefCounter.scala 113:40]
  wire [4:0] refCounterNext_53 = _refCounterNext_53_T_1 - refCounterDec_53; // @[RefCounter.scala 113:59]
  wire [4:0] _refCounterNext_54_T_1 = refCounter_54 + refCounterInc_54; // @[RefCounter.scala 113:40]
  wire [4:0] refCounterNext_54 = _refCounterNext_54_T_1 - refCounterDec_54; // @[RefCounter.scala 113:59]
  wire [4:0] _refCounterNext_55_T_1 = refCounter_55 + refCounterInc_55; // @[RefCounter.scala 113:40]
  wire [4:0] refCounterNext_55 = _refCounterNext_55_T_1 - refCounterDec_55; // @[RefCounter.scala 113:59]
  wire [4:0] _refCounterNext_56_T_1 = refCounter_56 + refCounterInc_56; // @[RefCounter.scala 113:40]
  wire [4:0] refCounterNext_56 = _refCounterNext_56_T_1 - refCounterDec_56; // @[RefCounter.scala 113:59]
  wire [4:0] _refCounterNext_57_T_1 = refCounter_57 + refCounterInc_57; // @[RefCounter.scala 113:40]
  wire [4:0] refCounterNext_57 = _refCounterNext_57_T_1 - refCounterDec_57; // @[RefCounter.scala 113:59]
  wire [4:0] _refCounterNext_58_T_1 = refCounter_58 + refCounterInc_58; // @[RefCounter.scala 113:40]
  wire [4:0] refCounterNext_58 = _refCounterNext_58_T_1 - refCounterDec_58; // @[RefCounter.scala 113:59]
  wire [4:0] _refCounterNext_59_T_1 = refCounter_59 + refCounterInc_59; // @[RefCounter.scala 113:40]
  wire [4:0] refCounterNext_59 = _refCounterNext_59_T_1 - refCounterDec_59; // @[RefCounter.scala 113:59]
  wire [4:0] _refCounterNext_60_T_1 = refCounter_60 + refCounterInc_60; // @[RefCounter.scala 113:40]
  wire [4:0] refCounterNext_60 = _refCounterNext_60_T_1 - refCounterDec_60; // @[RefCounter.scala 113:59]
  wire [4:0] _refCounterNext_61_T_1 = refCounter_61 + refCounterInc_61; // @[RefCounter.scala 113:40]
  wire [4:0] refCounterNext_61 = _refCounterNext_61_T_1 - refCounterDec_61; // @[RefCounter.scala 113:59]
  wire [4:0] _refCounterNext_62_T_1 = refCounter_62 + refCounterInc_62; // @[RefCounter.scala 113:40]
  wire [4:0] refCounterNext_62 = _refCounterNext_62_T_1 - refCounterDec_62; // @[RefCounter.scala 113:59]
  wire [4:0] _refCounterNext_63_T_1 = refCounter_63 + refCounterInc_63; // @[RefCounter.scala 113:40]
  wire [4:0] refCounterNext_63 = _refCounterNext_63_T_1 - refCounterDec_63; // @[RefCounter.scala 113:59]
  assign io_freeRegs_0_valid = io_freeRegs_0_valid_REG & io_freeRegs_0_valid_REG_1; // @[RefCounter.scala 82:65]
  assign io_freeRegs_0_bits = io_freeRegs_0_bits_REG; // @[RefCounter.scala 87:25]
  assign io_freeRegs_1_valid = io_freeRegs_1_valid_REG & io_freeRegs_1_valid_REG_1; // @[RefCounter.scala 82:65]
  assign io_freeRegs_1_bits = io_freeRegs_1_bits_REG; // @[RefCounter.scala 87:25]
  always @(posedge clock) begin
    allocate_0_valid <= io_allocate_0_valid; // @[RefCounter.scala 39:25]
    allocate_0_bits <= io_allocate_0_bits; // @[RefCounter.scala 39:25]
    allocate_1_valid <= io_allocate_1_valid; // @[RefCounter.scala 39:25]
    allocate_1_bits <= io_allocate_1_bits; // @[RefCounter.scala 39:25]
    deallocate_0_valid <= io_deallocate_0_valid; // @[RefCounter.scala 40:27]
    deallocate_0_bits <= io_deallocate_0_bits; // @[RefCounter.scala 40:27]
    deallocate_1_valid <= io_deallocate_1_valid; // @[RefCounter.scala 40:27]
    deallocate_1_bits <= io_deallocate_1_bits; // @[RefCounter.scala 40:27]
    io_freeRegs_0_valid_REG <= deallocate_0_valid & _GEN_127 != 5'h0; // @[RefCounter.scala 78:30]
    io_freeRegs_0_valid_REG_1 <= _isFreed_T_1 == _GEN_255; // @[RefCounter.scala 81:64]
    io_freeRegs_0_bits_REG <= deallocate_0_bits; // @[RefCounter.scala 87:35]
    io_freeRegs_1_valid_REG <= isNonZero_1 & ~blockedByDup; // @[RefCounter.scala 82:47]
    io_freeRegs_1_valid_REG_1 <= _isFreed_T_3 == _GEN_511; // @[RefCounter.scala 81:64]
    io_freeRegs_1_bits_REG <= deallocate_1_bits; // @[RefCounter.scala 87:35]
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 41:23]
      commit_isCommit <= 1'h0; // @[RefCounter.scala 41:23]
    end else begin
      commit_isCommit <= io_commit_isCommit; // @[RefCounter.scala 41:23]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 41:23]
      commit_commitValid_0 <= 1'h0; // @[RefCounter.scala 41:23]
    end else begin
      commit_commitValid_0 <= io_commit_commitValid_0; // @[RefCounter.scala 41:23]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 41:23]
      commit_commitValid_1 <= 1'h0; // @[RefCounter.scala 41:23]
    end else begin
      commit_commitValid_1 <= io_commit_commitValid_1; // @[RefCounter.scala 41:23]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 41:23]
      commit_info_0_rfWen <= 1'h0; // @[RefCounter.scala 41:23]
    end else begin
      commit_info_0_rfWen <= io_commit_info_0_rfWen; // @[RefCounter.scala 41:23]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 41:23]
      commit_info_0_pdest <= 6'h0; // @[RefCounter.scala 41:23]
    end else begin
      commit_info_0_pdest <= io_commit_info_0_pdest; // @[RefCounter.scala 41:23]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 41:23]
      commit_info_0_old_pdest <= 6'h0; // @[RefCounter.scala 41:23]
    end else begin
      commit_info_0_old_pdest <= io_commit_info_0_old_pdest; // @[RefCounter.scala 41:23]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 41:23]
      commit_info_1_rfWen <= 1'h0; // @[RefCounter.scala 41:23]
    end else begin
      commit_info_1_rfWen <= io_commit_info_1_rfWen; // @[RefCounter.scala 41:23]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 41:23]
      commit_info_1_pdest <= 6'h0; // @[RefCounter.scala 41:23]
    end else begin
      commit_info_1_pdest <= io_commit_info_1_pdest; // @[RefCounter.scala 41:23]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 41:23]
      commit_info_1_old_pdest <= 6'h0; // @[RefCounter.scala 41:23]
    end else begin
      commit_info_1_old_pdest <= io_commit_info_1_old_pdest; // @[RefCounter.scala 41:23]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 42:25]
      redirect <= 1'h0; // @[RefCounter.scala 42:25]
    end else begin
      redirect <= io_redirect; // @[RefCounter.scala 42:25]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 115:25]
      refCounter_1 <= 5'h0; // @[RefCounter.scala 71:{72,86}]
    end else if (redirect) begin
      if (commit_isCommit) begin
        refCounter_1 <= _archRefCounterNext_1_T_3;
      end else begin
        refCounter_1 <= archRefCounter_1;
      end
    end else begin
      refCounter_1 <= refCounterNext_1;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 115:25]
      refCounter_2 <= 5'h0; // @[RefCounter.scala 71:{72,86}]
    end else if (redirect) begin
      if (commit_isCommit) begin
        refCounter_2 <= _archRefCounterNext_2_T_3;
      end else begin
        refCounter_2 <= archRefCounter_2;
      end
    end else begin
      refCounter_2 <= refCounterNext_2;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 115:25]
      refCounter_3 <= 5'h0; // @[RefCounter.scala 71:{72,86}]
    end else if (redirect) begin
      if (commit_isCommit) begin
        refCounter_3 <= _archRefCounterNext_3_T_3;
      end else begin
        refCounter_3 <= archRefCounter_3;
      end
    end else begin
      refCounter_3 <= refCounterNext_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 115:25]
      refCounter_4 <= 5'h0; // @[RefCounter.scala 71:{72,86}]
    end else if (redirect) begin
      if (commit_isCommit) begin
        refCounter_4 <= _archRefCounterNext_4_T_3;
      end else begin
        refCounter_4 <= archRefCounter_4;
      end
    end else begin
      refCounter_4 <= refCounterNext_4;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 115:25]
      refCounter_5 <= 5'h0; // @[RefCounter.scala 71:{72,86}]
    end else if (redirect) begin
      if (commit_isCommit) begin
        refCounter_5 <= _archRefCounterNext_5_T_3;
      end else begin
        refCounter_5 <= archRefCounter_5;
      end
    end else begin
      refCounter_5 <= refCounterNext_5;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 115:25]
      refCounter_6 <= 5'h0; // @[RefCounter.scala 71:{72,86}]
    end else if (redirect) begin
      if (commit_isCommit) begin
        refCounter_6 <= _archRefCounterNext_6_T_3;
      end else begin
        refCounter_6 <= archRefCounter_6;
      end
    end else begin
      refCounter_6 <= refCounterNext_6;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 115:25]
      refCounter_7 <= 5'h0; // @[RefCounter.scala 71:{72,86}]
    end else if (redirect) begin
      if (commit_isCommit) begin
        refCounter_7 <= _archRefCounterNext_7_T_3;
      end else begin
        refCounter_7 <= archRefCounter_7;
      end
    end else begin
      refCounter_7 <= refCounterNext_7;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 115:25]
      refCounter_8 <= 5'h0; // @[RefCounter.scala 71:{72,86}]
    end else if (redirect) begin
      if (commit_isCommit) begin
        refCounter_8 <= _archRefCounterNext_8_T_3;
      end else begin
        refCounter_8 <= archRefCounter_8;
      end
    end else begin
      refCounter_8 <= refCounterNext_8;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 115:25]
      refCounter_9 <= 5'h0; // @[RefCounter.scala 71:{72,86}]
    end else if (redirect) begin
      if (commit_isCommit) begin
        refCounter_9 <= _archRefCounterNext_9_T_3;
      end else begin
        refCounter_9 <= archRefCounter_9;
      end
    end else begin
      refCounter_9 <= refCounterNext_9;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 115:25]
      refCounter_10 <= 5'h0; // @[RefCounter.scala 71:{72,86}]
    end else if (redirect) begin
      if (commit_isCommit) begin
        refCounter_10 <= _archRefCounterNext_10_T_3;
      end else begin
        refCounter_10 <= archRefCounter_10;
      end
    end else begin
      refCounter_10 <= refCounterNext_10;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 115:25]
      refCounter_11 <= 5'h0; // @[RefCounter.scala 71:{72,86}]
    end else if (redirect) begin
      if (commit_isCommit) begin
        refCounter_11 <= _archRefCounterNext_11_T_3;
      end else begin
        refCounter_11 <= archRefCounter_11;
      end
    end else begin
      refCounter_11 <= refCounterNext_11;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 115:25]
      refCounter_12 <= 5'h0; // @[RefCounter.scala 71:{72,86}]
    end else if (redirect) begin
      if (commit_isCommit) begin
        refCounter_12 <= _archRefCounterNext_12_T_3;
      end else begin
        refCounter_12 <= archRefCounter_12;
      end
    end else begin
      refCounter_12 <= refCounterNext_12;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 115:25]
      refCounter_13 <= 5'h0; // @[RefCounter.scala 71:{72,86}]
    end else if (redirect) begin
      if (commit_isCommit) begin
        refCounter_13 <= _archRefCounterNext_13_T_3;
      end else begin
        refCounter_13 <= archRefCounter_13;
      end
    end else begin
      refCounter_13 <= refCounterNext_13;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 115:25]
      refCounter_14 <= 5'h0; // @[RefCounter.scala 71:{72,86}]
    end else if (redirect) begin
      if (commit_isCommit) begin
        refCounter_14 <= _archRefCounterNext_14_T_3;
      end else begin
        refCounter_14 <= archRefCounter_14;
      end
    end else begin
      refCounter_14 <= refCounterNext_14;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 115:25]
      refCounter_15 <= 5'h0; // @[RefCounter.scala 71:{72,86}]
    end else if (redirect) begin
      if (commit_isCommit) begin
        refCounter_15 <= _archRefCounterNext_15_T_3;
      end else begin
        refCounter_15 <= archRefCounter_15;
      end
    end else begin
      refCounter_15 <= refCounterNext_15;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 115:25]
      refCounter_16 <= 5'h0; // @[RefCounter.scala 71:{72,86}]
    end else if (redirect) begin
      if (commit_isCommit) begin
        refCounter_16 <= _archRefCounterNext_16_T_3;
      end else begin
        refCounter_16 <= archRefCounter_16;
      end
    end else begin
      refCounter_16 <= refCounterNext_16;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 115:25]
      refCounter_17 <= 5'h0; // @[RefCounter.scala 71:{72,86}]
    end else if (redirect) begin
      if (commit_isCommit) begin
        refCounter_17 <= _archRefCounterNext_17_T_3;
      end else begin
        refCounter_17 <= archRefCounter_17;
      end
    end else begin
      refCounter_17 <= refCounterNext_17;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 115:25]
      refCounter_18 <= 5'h0; // @[RefCounter.scala 71:{72,86}]
    end else if (redirect) begin
      if (commit_isCommit) begin
        refCounter_18 <= _archRefCounterNext_18_T_3;
      end else begin
        refCounter_18 <= archRefCounter_18;
      end
    end else begin
      refCounter_18 <= refCounterNext_18;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 115:25]
      refCounter_19 <= 5'h0; // @[RefCounter.scala 71:{72,86}]
    end else if (redirect) begin
      if (commit_isCommit) begin
        refCounter_19 <= _archRefCounterNext_19_T_3;
      end else begin
        refCounter_19 <= archRefCounter_19;
      end
    end else begin
      refCounter_19 <= refCounterNext_19;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 115:25]
      refCounter_20 <= 5'h0; // @[RefCounter.scala 71:{72,86}]
    end else if (redirect) begin
      if (commit_isCommit) begin
        refCounter_20 <= _archRefCounterNext_20_T_3;
      end else begin
        refCounter_20 <= archRefCounter_20;
      end
    end else begin
      refCounter_20 <= refCounterNext_20;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 115:25]
      refCounter_21 <= 5'h0; // @[RefCounter.scala 71:{72,86}]
    end else if (redirect) begin
      if (commit_isCommit) begin
        refCounter_21 <= _archRefCounterNext_21_T_3;
      end else begin
        refCounter_21 <= archRefCounter_21;
      end
    end else begin
      refCounter_21 <= refCounterNext_21;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 115:25]
      refCounter_22 <= 5'h0; // @[RefCounter.scala 71:{72,86}]
    end else if (redirect) begin
      if (commit_isCommit) begin
        refCounter_22 <= _archRefCounterNext_22_T_3;
      end else begin
        refCounter_22 <= archRefCounter_22;
      end
    end else begin
      refCounter_22 <= refCounterNext_22;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 115:25]
      refCounter_23 <= 5'h0; // @[RefCounter.scala 71:{72,86}]
    end else if (redirect) begin
      if (commit_isCommit) begin
        refCounter_23 <= _archRefCounterNext_23_T_3;
      end else begin
        refCounter_23 <= archRefCounter_23;
      end
    end else begin
      refCounter_23 <= refCounterNext_23;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 115:25]
      refCounter_24 <= 5'h0; // @[RefCounter.scala 71:{72,86}]
    end else if (redirect) begin
      if (commit_isCommit) begin
        refCounter_24 <= _archRefCounterNext_24_T_3;
      end else begin
        refCounter_24 <= archRefCounter_24;
      end
    end else begin
      refCounter_24 <= refCounterNext_24;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 115:25]
      refCounter_25 <= 5'h0; // @[RefCounter.scala 71:{72,86}]
    end else if (redirect) begin
      if (commit_isCommit) begin
        refCounter_25 <= _archRefCounterNext_25_T_3;
      end else begin
        refCounter_25 <= archRefCounter_25;
      end
    end else begin
      refCounter_25 <= refCounterNext_25;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 115:25]
      refCounter_26 <= 5'h0; // @[RefCounter.scala 71:{72,86}]
    end else if (redirect) begin
      if (commit_isCommit) begin
        refCounter_26 <= _archRefCounterNext_26_T_3;
      end else begin
        refCounter_26 <= archRefCounter_26;
      end
    end else begin
      refCounter_26 <= refCounterNext_26;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 115:25]
      refCounter_27 <= 5'h0; // @[RefCounter.scala 71:{72,86}]
    end else if (redirect) begin
      if (commit_isCommit) begin
        refCounter_27 <= _archRefCounterNext_27_T_3;
      end else begin
        refCounter_27 <= archRefCounter_27;
      end
    end else begin
      refCounter_27 <= refCounterNext_27;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 115:25]
      refCounter_28 <= 5'h0; // @[RefCounter.scala 71:{72,86}]
    end else if (redirect) begin
      if (commit_isCommit) begin
        refCounter_28 <= _archRefCounterNext_28_T_3;
      end else begin
        refCounter_28 <= archRefCounter_28;
      end
    end else begin
      refCounter_28 <= refCounterNext_28;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 115:25]
      refCounter_29 <= 5'h0; // @[RefCounter.scala 71:{72,86}]
    end else if (redirect) begin
      if (commit_isCommit) begin
        refCounter_29 <= _archRefCounterNext_29_T_3;
      end else begin
        refCounter_29 <= archRefCounter_29;
      end
    end else begin
      refCounter_29 <= refCounterNext_29;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 115:25]
      refCounter_30 <= 5'h0; // @[RefCounter.scala 71:{72,86}]
    end else if (redirect) begin
      if (commit_isCommit) begin
        refCounter_30 <= _archRefCounterNext_30_T_3;
      end else begin
        refCounter_30 <= archRefCounter_30;
      end
    end else begin
      refCounter_30 <= refCounterNext_30;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 115:25]
      refCounter_31 <= 5'h0; // @[RefCounter.scala 71:{72,86}]
    end else if (redirect) begin
      if (commit_isCommit) begin
        refCounter_31 <= _archRefCounterNext_31_T_3;
      end else begin
        refCounter_31 <= archRefCounter_31;
      end
    end else begin
      refCounter_31 <= refCounterNext_31;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 115:25]
      refCounter_32 <= 5'h0; // @[RefCounter.scala 71:{72,86}]
    end else if (redirect) begin
      if (commit_isCommit) begin
        refCounter_32 <= _archRefCounterNext_32_T_3;
      end else begin
        refCounter_32 <= archRefCounter_32;
      end
    end else begin
      refCounter_32 <= refCounterNext_32;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 115:25]
      refCounter_33 <= 5'h0; // @[RefCounter.scala 71:{72,86}]
    end else if (redirect) begin
      if (commit_isCommit) begin
        refCounter_33 <= _archRefCounterNext_33_T_3;
      end else begin
        refCounter_33 <= archRefCounter_33;
      end
    end else begin
      refCounter_33 <= refCounterNext_33;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 115:25]
      refCounter_34 <= 5'h0; // @[RefCounter.scala 71:{72,86}]
    end else if (redirect) begin
      if (commit_isCommit) begin
        refCounter_34 <= _archRefCounterNext_34_T_3;
      end else begin
        refCounter_34 <= archRefCounter_34;
      end
    end else begin
      refCounter_34 <= refCounterNext_34;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 115:25]
      refCounter_35 <= 5'h0; // @[RefCounter.scala 71:{72,86}]
    end else if (redirect) begin
      if (commit_isCommit) begin
        refCounter_35 <= _archRefCounterNext_35_T_3;
      end else begin
        refCounter_35 <= archRefCounter_35;
      end
    end else begin
      refCounter_35 <= refCounterNext_35;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 115:25]
      refCounter_36 <= 5'h0; // @[RefCounter.scala 71:{72,86}]
    end else if (redirect) begin
      if (commit_isCommit) begin
        refCounter_36 <= _archRefCounterNext_36_T_3;
      end else begin
        refCounter_36 <= archRefCounter_36;
      end
    end else begin
      refCounter_36 <= refCounterNext_36;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 115:25]
      refCounter_37 <= 5'h0; // @[RefCounter.scala 71:{72,86}]
    end else if (redirect) begin
      if (commit_isCommit) begin
        refCounter_37 <= _archRefCounterNext_37_T_3;
      end else begin
        refCounter_37 <= archRefCounter_37;
      end
    end else begin
      refCounter_37 <= refCounterNext_37;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 115:25]
      refCounter_38 <= 5'h0; // @[RefCounter.scala 71:{72,86}]
    end else if (redirect) begin
      if (commit_isCommit) begin
        refCounter_38 <= _archRefCounterNext_38_T_3;
      end else begin
        refCounter_38 <= archRefCounter_38;
      end
    end else begin
      refCounter_38 <= refCounterNext_38;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 115:25]
      refCounter_39 <= 5'h0; // @[RefCounter.scala 71:{72,86}]
    end else if (redirect) begin
      if (commit_isCommit) begin
        refCounter_39 <= _archRefCounterNext_39_T_3;
      end else begin
        refCounter_39 <= archRefCounter_39;
      end
    end else begin
      refCounter_39 <= refCounterNext_39;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 115:25]
      refCounter_40 <= 5'h0; // @[RefCounter.scala 71:{72,86}]
    end else if (redirect) begin
      if (commit_isCommit) begin
        refCounter_40 <= _archRefCounterNext_40_T_3;
      end else begin
        refCounter_40 <= archRefCounter_40;
      end
    end else begin
      refCounter_40 <= refCounterNext_40;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 115:25]
      refCounter_41 <= 5'h0; // @[RefCounter.scala 71:{72,86}]
    end else if (redirect) begin
      if (commit_isCommit) begin
        refCounter_41 <= _archRefCounterNext_41_T_3;
      end else begin
        refCounter_41 <= archRefCounter_41;
      end
    end else begin
      refCounter_41 <= refCounterNext_41;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 115:25]
      refCounter_42 <= 5'h0; // @[RefCounter.scala 71:{72,86}]
    end else if (redirect) begin
      if (commit_isCommit) begin
        refCounter_42 <= _archRefCounterNext_42_T_3;
      end else begin
        refCounter_42 <= archRefCounter_42;
      end
    end else begin
      refCounter_42 <= refCounterNext_42;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 115:25]
      refCounter_43 <= 5'h0; // @[RefCounter.scala 71:{72,86}]
    end else if (redirect) begin
      if (commit_isCommit) begin
        refCounter_43 <= _archRefCounterNext_43_T_3;
      end else begin
        refCounter_43 <= archRefCounter_43;
      end
    end else begin
      refCounter_43 <= refCounterNext_43;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 115:25]
      refCounter_44 <= 5'h0; // @[RefCounter.scala 71:{72,86}]
    end else if (redirect) begin
      if (commit_isCommit) begin
        refCounter_44 <= _archRefCounterNext_44_T_3;
      end else begin
        refCounter_44 <= archRefCounter_44;
      end
    end else begin
      refCounter_44 <= refCounterNext_44;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 115:25]
      refCounter_45 <= 5'h0; // @[RefCounter.scala 71:{72,86}]
    end else if (redirect) begin
      if (commit_isCommit) begin
        refCounter_45 <= _archRefCounterNext_45_T_3;
      end else begin
        refCounter_45 <= archRefCounter_45;
      end
    end else begin
      refCounter_45 <= refCounterNext_45;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 115:25]
      refCounter_46 <= 5'h0; // @[RefCounter.scala 71:{72,86}]
    end else if (redirect) begin
      if (commit_isCommit) begin
        refCounter_46 <= _archRefCounterNext_46_T_3;
      end else begin
        refCounter_46 <= archRefCounter_46;
      end
    end else begin
      refCounter_46 <= refCounterNext_46;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 115:25]
      refCounter_47 <= 5'h0; // @[RefCounter.scala 71:{72,86}]
    end else if (redirect) begin
      if (commit_isCommit) begin
        refCounter_47 <= _archRefCounterNext_47_T_3;
      end else begin
        refCounter_47 <= archRefCounter_47;
      end
    end else begin
      refCounter_47 <= refCounterNext_47;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 115:25]
      refCounter_48 <= 5'h0; // @[RefCounter.scala 71:{72,86}]
    end else if (redirect) begin
      if (commit_isCommit) begin
        refCounter_48 <= _archRefCounterNext_48_T_3;
      end else begin
        refCounter_48 <= archRefCounter_48;
      end
    end else begin
      refCounter_48 <= refCounterNext_48;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 115:25]
      refCounter_49 <= 5'h0; // @[RefCounter.scala 71:{72,86}]
    end else if (redirect) begin
      if (commit_isCommit) begin
        refCounter_49 <= _archRefCounterNext_49_T_3;
      end else begin
        refCounter_49 <= archRefCounter_49;
      end
    end else begin
      refCounter_49 <= refCounterNext_49;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 115:25]
      refCounter_50 <= 5'h0; // @[RefCounter.scala 71:{72,86}]
    end else if (redirect) begin
      if (commit_isCommit) begin
        refCounter_50 <= _archRefCounterNext_50_T_3;
      end else begin
        refCounter_50 <= archRefCounter_50;
      end
    end else begin
      refCounter_50 <= refCounterNext_50;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 115:25]
      refCounter_51 <= 5'h0; // @[RefCounter.scala 71:{72,86}]
    end else if (redirect) begin
      if (commit_isCommit) begin
        refCounter_51 <= _archRefCounterNext_51_T_3;
      end else begin
        refCounter_51 <= archRefCounter_51;
      end
    end else begin
      refCounter_51 <= refCounterNext_51;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 115:25]
      refCounter_52 <= 5'h0; // @[RefCounter.scala 71:{72,86}]
    end else if (redirect) begin
      if (commit_isCommit) begin
        refCounter_52 <= _archRefCounterNext_52_T_3;
      end else begin
        refCounter_52 <= archRefCounter_52;
      end
    end else begin
      refCounter_52 <= refCounterNext_52;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 115:25]
      refCounter_53 <= 5'h0; // @[RefCounter.scala 71:{72,86}]
    end else if (redirect) begin
      if (commit_isCommit) begin
        refCounter_53 <= _archRefCounterNext_53_T_3;
      end else begin
        refCounter_53 <= archRefCounter_53;
      end
    end else begin
      refCounter_53 <= refCounterNext_53;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 115:25]
      refCounter_54 <= 5'h0; // @[RefCounter.scala 71:{72,86}]
    end else if (redirect) begin
      if (commit_isCommit) begin
        refCounter_54 <= _archRefCounterNext_54_T_3;
      end else begin
        refCounter_54 <= archRefCounter_54;
      end
    end else begin
      refCounter_54 <= refCounterNext_54;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 115:25]
      refCounter_55 <= 5'h0; // @[RefCounter.scala 71:{72,86}]
    end else if (redirect) begin
      if (commit_isCommit) begin
        refCounter_55 <= _archRefCounterNext_55_T_3;
      end else begin
        refCounter_55 <= archRefCounter_55;
      end
    end else begin
      refCounter_55 <= refCounterNext_55;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 115:25]
      refCounter_56 <= 5'h0; // @[RefCounter.scala 71:{72,86}]
    end else if (redirect) begin
      if (commit_isCommit) begin
        refCounter_56 <= _archRefCounterNext_56_T_3;
      end else begin
        refCounter_56 <= archRefCounter_56;
      end
    end else begin
      refCounter_56 <= refCounterNext_56;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 115:25]
      refCounter_57 <= 5'h0; // @[RefCounter.scala 71:{72,86}]
    end else if (redirect) begin
      if (commit_isCommit) begin
        refCounter_57 <= _archRefCounterNext_57_T_3;
      end else begin
        refCounter_57 <= archRefCounter_57;
      end
    end else begin
      refCounter_57 <= refCounterNext_57;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 115:25]
      refCounter_58 <= 5'h0; // @[RefCounter.scala 71:{72,86}]
    end else if (redirect) begin
      if (commit_isCommit) begin
        refCounter_58 <= _archRefCounterNext_58_T_3;
      end else begin
        refCounter_58 <= archRefCounter_58;
      end
    end else begin
      refCounter_58 <= refCounterNext_58;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 115:25]
      refCounter_59 <= 5'h0; // @[RefCounter.scala 71:{72,86}]
    end else if (redirect) begin
      if (commit_isCommit) begin
        refCounter_59 <= _archRefCounterNext_59_T_3;
      end else begin
        refCounter_59 <= archRefCounter_59;
      end
    end else begin
      refCounter_59 <= refCounterNext_59;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 115:25]
      refCounter_60 <= 5'h0; // @[RefCounter.scala 71:{72,86}]
    end else if (redirect) begin
      if (commit_isCommit) begin
        refCounter_60 <= _archRefCounterNext_60_T_3;
      end else begin
        refCounter_60 <= archRefCounter_60;
      end
    end else begin
      refCounter_60 <= refCounterNext_60;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 115:25]
      refCounter_61 <= 5'h0; // @[RefCounter.scala 71:{72,86}]
    end else if (redirect) begin
      if (commit_isCommit) begin
        refCounter_61 <= _archRefCounterNext_61_T_3;
      end else begin
        refCounter_61 <= archRefCounter_61;
      end
    end else begin
      refCounter_61 <= refCounterNext_61;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 115:25]
      refCounter_62 <= 5'h0; // @[RefCounter.scala 71:{72,86}]
    end else if (redirect) begin
      if (commit_isCommit) begin
        refCounter_62 <= _archRefCounterNext_62_T_3;
      end else begin
        refCounter_62 <= archRefCounter_62;
      end
    end else begin
      refCounter_62 <= refCounterNext_62;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 115:25]
      refCounter_63 <= 5'h0; // @[RefCounter.scala 71:{72,86}]
    end else if (redirect) begin
      if (commit_isCommit) begin
        refCounter_63 <= _archRefCounterNext_63_T_3;
      end else begin
        refCounter_63 <= archRefCounter_63;
      end
    end else begin
      refCounter_63 <= refCounterNext_63;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 71:72]
      archRefCounter_1 <= 5'h0; // @[RefCounter.scala 71:86]
    end else if (commit_isCommit) begin
      archRefCounter_1 <= _archRefCounterNext_1_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 71:72]
      archRefCounter_2 <= 5'h0; // @[RefCounter.scala 71:86]
    end else if (commit_isCommit) begin
      archRefCounter_2 <= _archRefCounterNext_2_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 71:72]
      archRefCounter_3 <= 5'h0; // @[RefCounter.scala 71:86]
    end else if (commit_isCommit) begin
      archRefCounter_3 <= _archRefCounterNext_3_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 71:72]
      archRefCounter_4 <= 5'h0; // @[RefCounter.scala 71:86]
    end else if (commit_isCommit) begin
      archRefCounter_4 <= _archRefCounterNext_4_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 71:72]
      archRefCounter_5 <= 5'h0; // @[RefCounter.scala 71:86]
    end else if (commit_isCommit) begin
      archRefCounter_5 <= _archRefCounterNext_5_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 71:72]
      archRefCounter_6 <= 5'h0; // @[RefCounter.scala 71:86]
    end else if (commit_isCommit) begin
      archRefCounter_6 <= _archRefCounterNext_6_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 71:72]
      archRefCounter_7 <= 5'h0; // @[RefCounter.scala 71:86]
    end else if (commit_isCommit) begin
      archRefCounter_7 <= _archRefCounterNext_7_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 71:72]
      archRefCounter_8 <= 5'h0; // @[RefCounter.scala 71:86]
    end else if (commit_isCommit) begin
      archRefCounter_8 <= _archRefCounterNext_8_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 71:72]
      archRefCounter_9 <= 5'h0; // @[RefCounter.scala 71:86]
    end else if (commit_isCommit) begin
      archRefCounter_9 <= _archRefCounterNext_9_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 71:72]
      archRefCounter_10 <= 5'h0; // @[RefCounter.scala 71:86]
    end else if (commit_isCommit) begin
      archRefCounter_10 <= _archRefCounterNext_10_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 71:72]
      archRefCounter_11 <= 5'h0; // @[RefCounter.scala 71:86]
    end else if (commit_isCommit) begin
      archRefCounter_11 <= _archRefCounterNext_11_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 71:72]
      archRefCounter_12 <= 5'h0; // @[RefCounter.scala 71:86]
    end else if (commit_isCommit) begin
      archRefCounter_12 <= _archRefCounterNext_12_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 71:72]
      archRefCounter_13 <= 5'h0; // @[RefCounter.scala 71:86]
    end else if (commit_isCommit) begin
      archRefCounter_13 <= _archRefCounterNext_13_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 71:72]
      archRefCounter_14 <= 5'h0; // @[RefCounter.scala 71:86]
    end else if (commit_isCommit) begin
      archRefCounter_14 <= _archRefCounterNext_14_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 71:72]
      archRefCounter_15 <= 5'h0; // @[RefCounter.scala 71:86]
    end else if (commit_isCommit) begin
      archRefCounter_15 <= _archRefCounterNext_15_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 71:72]
      archRefCounter_16 <= 5'h0; // @[RefCounter.scala 71:86]
    end else if (commit_isCommit) begin
      archRefCounter_16 <= _archRefCounterNext_16_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 71:72]
      archRefCounter_17 <= 5'h0; // @[RefCounter.scala 71:86]
    end else if (commit_isCommit) begin
      archRefCounter_17 <= _archRefCounterNext_17_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 71:72]
      archRefCounter_18 <= 5'h0; // @[RefCounter.scala 71:86]
    end else if (commit_isCommit) begin
      archRefCounter_18 <= _archRefCounterNext_18_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 71:72]
      archRefCounter_19 <= 5'h0; // @[RefCounter.scala 71:86]
    end else if (commit_isCommit) begin
      archRefCounter_19 <= _archRefCounterNext_19_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 71:72]
      archRefCounter_20 <= 5'h0; // @[RefCounter.scala 71:86]
    end else if (commit_isCommit) begin
      archRefCounter_20 <= _archRefCounterNext_20_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 71:72]
      archRefCounter_21 <= 5'h0; // @[RefCounter.scala 71:86]
    end else if (commit_isCommit) begin
      archRefCounter_21 <= _archRefCounterNext_21_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 71:72]
      archRefCounter_22 <= 5'h0; // @[RefCounter.scala 71:86]
    end else if (commit_isCommit) begin
      archRefCounter_22 <= _archRefCounterNext_22_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 71:72]
      archRefCounter_23 <= 5'h0; // @[RefCounter.scala 71:86]
    end else if (commit_isCommit) begin
      archRefCounter_23 <= _archRefCounterNext_23_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 71:72]
      archRefCounter_24 <= 5'h0; // @[RefCounter.scala 71:86]
    end else if (commit_isCommit) begin
      archRefCounter_24 <= _archRefCounterNext_24_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 71:72]
      archRefCounter_25 <= 5'h0; // @[RefCounter.scala 71:86]
    end else if (commit_isCommit) begin
      archRefCounter_25 <= _archRefCounterNext_25_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 71:72]
      archRefCounter_26 <= 5'h0; // @[RefCounter.scala 71:86]
    end else if (commit_isCommit) begin
      archRefCounter_26 <= _archRefCounterNext_26_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 71:72]
      archRefCounter_27 <= 5'h0; // @[RefCounter.scala 71:86]
    end else if (commit_isCommit) begin
      archRefCounter_27 <= _archRefCounterNext_27_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 71:72]
      archRefCounter_28 <= 5'h0; // @[RefCounter.scala 71:86]
    end else if (commit_isCommit) begin
      archRefCounter_28 <= _archRefCounterNext_28_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 71:72]
      archRefCounter_29 <= 5'h0; // @[RefCounter.scala 71:86]
    end else if (commit_isCommit) begin
      archRefCounter_29 <= _archRefCounterNext_29_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 71:72]
      archRefCounter_30 <= 5'h0; // @[RefCounter.scala 71:86]
    end else if (commit_isCommit) begin
      archRefCounter_30 <= _archRefCounterNext_30_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 71:72]
      archRefCounter_31 <= 5'h0; // @[RefCounter.scala 71:86]
    end else if (commit_isCommit) begin
      archRefCounter_31 <= _archRefCounterNext_31_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 71:72]
      archRefCounter_32 <= 5'h0; // @[RefCounter.scala 71:86]
    end else if (commit_isCommit) begin
      archRefCounter_32 <= _archRefCounterNext_32_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 71:72]
      archRefCounter_33 <= 5'h0; // @[RefCounter.scala 71:86]
    end else if (commit_isCommit) begin
      archRefCounter_33 <= _archRefCounterNext_33_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 71:72]
      archRefCounter_34 <= 5'h0; // @[RefCounter.scala 71:86]
    end else if (commit_isCommit) begin
      archRefCounter_34 <= _archRefCounterNext_34_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 71:72]
      archRefCounter_35 <= 5'h0; // @[RefCounter.scala 71:86]
    end else if (commit_isCommit) begin
      archRefCounter_35 <= _archRefCounterNext_35_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 71:72]
      archRefCounter_36 <= 5'h0; // @[RefCounter.scala 71:86]
    end else if (commit_isCommit) begin
      archRefCounter_36 <= _archRefCounterNext_36_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 71:72]
      archRefCounter_37 <= 5'h0; // @[RefCounter.scala 71:86]
    end else if (commit_isCommit) begin
      archRefCounter_37 <= _archRefCounterNext_37_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 71:72]
      archRefCounter_38 <= 5'h0; // @[RefCounter.scala 71:86]
    end else if (commit_isCommit) begin
      archRefCounter_38 <= _archRefCounterNext_38_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 71:72]
      archRefCounter_39 <= 5'h0; // @[RefCounter.scala 71:86]
    end else if (commit_isCommit) begin
      archRefCounter_39 <= _archRefCounterNext_39_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 71:72]
      archRefCounter_40 <= 5'h0; // @[RefCounter.scala 71:86]
    end else if (commit_isCommit) begin
      archRefCounter_40 <= _archRefCounterNext_40_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 71:72]
      archRefCounter_41 <= 5'h0; // @[RefCounter.scala 71:86]
    end else if (commit_isCommit) begin
      archRefCounter_41 <= _archRefCounterNext_41_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 71:72]
      archRefCounter_42 <= 5'h0; // @[RefCounter.scala 71:86]
    end else if (commit_isCommit) begin
      archRefCounter_42 <= _archRefCounterNext_42_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 71:72]
      archRefCounter_43 <= 5'h0; // @[RefCounter.scala 71:86]
    end else if (commit_isCommit) begin
      archRefCounter_43 <= _archRefCounterNext_43_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 71:72]
      archRefCounter_44 <= 5'h0; // @[RefCounter.scala 71:86]
    end else if (commit_isCommit) begin
      archRefCounter_44 <= _archRefCounterNext_44_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 71:72]
      archRefCounter_45 <= 5'h0; // @[RefCounter.scala 71:86]
    end else if (commit_isCommit) begin
      archRefCounter_45 <= _archRefCounterNext_45_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 71:72]
      archRefCounter_46 <= 5'h0; // @[RefCounter.scala 71:86]
    end else if (commit_isCommit) begin
      archRefCounter_46 <= _archRefCounterNext_46_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 71:72]
      archRefCounter_47 <= 5'h0; // @[RefCounter.scala 71:86]
    end else if (commit_isCommit) begin
      archRefCounter_47 <= _archRefCounterNext_47_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 71:72]
      archRefCounter_48 <= 5'h0; // @[RefCounter.scala 71:86]
    end else if (commit_isCommit) begin
      archRefCounter_48 <= _archRefCounterNext_48_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 71:72]
      archRefCounter_49 <= 5'h0; // @[RefCounter.scala 71:86]
    end else if (commit_isCommit) begin
      archRefCounter_49 <= _archRefCounterNext_49_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 71:72]
      archRefCounter_50 <= 5'h0; // @[RefCounter.scala 71:86]
    end else if (commit_isCommit) begin
      archRefCounter_50 <= _archRefCounterNext_50_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 71:72]
      archRefCounter_51 <= 5'h0; // @[RefCounter.scala 71:86]
    end else if (commit_isCommit) begin
      archRefCounter_51 <= _archRefCounterNext_51_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 71:72]
      archRefCounter_52 <= 5'h0; // @[RefCounter.scala 71:86]
    end else if (commit_isCommit) begin
      archRefCounter_52 <= _archRefCounterNext_52_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 71:72]
      archRefCounter_53 <= 5'h0; // @[RefCounter.scala 71:86]
    end else if (commit_isCommit) begin
      archRefCounter_53 <= _archRefCounterNext_53_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 71:72]
      archRefCounter_54 <= 5'h0; // @[RefCounter.scala 71:86]
    end else if (commit_isCommit) begin
      archRefCounter_54 <= _archRefCounterNext_54_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 71:72]
      archRefCounter_55 <= 5'h0; // @[RefCounter.scala 71:86]
    end else if (commit_isCommit) begin
      archRefCounter_55 <= _archRefCounterNext_55_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 71:72]
      archRefCounter_56 <= 5'h0; // @[RefCounter.scala 71:86]
    end else if (commit_isCommit) begin
      archRefCounter_56 <= _archRefCounterNext_56_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 71:72]
      archRefCounter_57 <= 5'h0; // @[RefCounter.scala 71:86]
    end else if (commit_isCommit) begin
      archRefCounter_57 <= _archRefCounterNext_57_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 71:72]
      archRefCounter_58 <= 5'h0; // @[RefCounter.scala 71:86]
    end else if (commit_isCommit) begin
      archRefCounter_58 <= _archRefCounterNext_58_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 71:72]
      archRefCounter_59 <= 5'h0; // @[RefCounter.scala 71:86]
    end else if (commit_isCommit) begin
      archRefCounter_59 <= _archRefCounterNext_59_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 71:72]
      archRefCounter_60 <= 5'h0; // @[RefCounter.scala 71:86]
    end else if (commit_isCommit) begin
      archRefCounter_60 <= _archRefCounterNext_60_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 71:72]
      archRefCounter_61 <= 5'h0; // @[RefCounter.scala 71:86]
    end else if (commit_isCommit) begin
      archRefCounter_61 <= _archRefCounterNext_61_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 71:72]
      archRefCounter_62 <= 5'h0; // @[RefCounter.scala 71:86]
    end else if (commit_isCommit) begin
      archRefCounter_62 <= _archRefCounterNext_62_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[RefCounter.scala 71:72]
      archRefCounter_63 <= 5'h0; // @[RefCounter.scala 71:86]
    end else if (commit_isCommit) begin
      archRefCounter_63 <= _archRefCounterNext_63_T_3;
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
  allocate_0_valid = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  allocate_0_bits = _RAND_1[5:0];
  _RAND_2 = {1{`RANDOM}};
  allocate_1_valid = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  allocate_1_bits = _RAND_3[5:0];
  _RAND_4 = {1{`RANDOM}};
  deallocate_0_valid = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  deallocate_0_bits = _RAND_5[5:0];
  _RAND_6 = {1{`RANDOM}};
  deallocate_1_valid = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  deallocate_1_bits = _RAND_7[5:0];
  _RAND_8 = {1{`RANDOM}};
  commit_isCommit = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  commit_commitValid_0 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  commit_commitValid_1 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  commit_info_0_rfWen = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  commit_info_0_pdest = _RAND_12[5:0];
  _RAND_13 = {1{`RANDOM}};
  commit_info_0_old_pdest = _RAND_13[5:0];
  _RAND_14 = {1{`RANDOM}};
  commit_info_1_rfWen = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  commit_info_1_pdest = _RAND_15[5:0];
  _RAND_16 = {1{`RANDOM}};
  commit_info_1_old_pdest = _RAND_16[5:0];
  _RAND_17 = {1{`RANDOM}};
  redirect = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  refCounter_1 = _RAND_18[4:0];
  _RAND_19 = {1{`RANDOM}};
  refCounter_2 = _RAND_19[4:0];
  _RAND_20 = {1{`RANDOM}};
  refCounter_3 = _RAND_20[4:0];
  _RAND_21 = {1{`RANDOM}};
  refCounter_4 = _RAND_21[4:0];
  _RAND_22 = {1{`RANDOM}};
  refCounter_5 = _RAND_22[4:0];
  _RAND_23 = {1{`RANDOM}};
  refCounter_6 = _RAND_23[4:0];
  _RAND_24 = {1{`RANDOM}};
  refCounter_7 = _RAND_24[4:0];
  _RAND_25 = {1{`RANDOM}};
  refCounter_8 = _RAND_25[4:0];
  _RAND_26 = {1{`RANDOM}};
  refCounter_9 = _RAND_26[4:0];
  _RAND_27 = {1{`RANDOM}};
  refCounter_10 = _RAND_27[4:0];
  _RAND_28 = {1{`RANDOM}};
  refCounter_11 = _RAND_28[4:0];
  _RAND_29 = {1{`RANDOM}};
  refCounter_12 = _RAND_29[4:0];
  _RAND_30 = {1{`RANDOM}};
  refCounter_13 = _RAND_30[4:0];
  _RAND_31 = {1{`RANDOM}};
  refCounter_14 = _RAND_31[4:0];
  _RAND_32 = {1{`RANDOM}};
  refCounter_15 = _RAND_32[4:0];
  _RAND_33 = {1{`RANDOM}};
  refCounter_16 = _RAND_33[4:0];
  _RAND_34 = {1{`RANDOM}};
  refCounter_17 = _RAND_34[4:0];
  _RAND_35 = {1{`RANDOM}};
  refCounter_18 = _RAND_35[4:0];
  _RAND_36 = {1{`RANDOM}};
  refCounter_19 = _RAND_36[4:0];
  _RAND_37 = {1{`RANDOM}};
  refCounter_20 = _RAND_37[4:0];
  _RAND_38 = {1{`RANDOM}};
  refCounter_21 = _RAND_38[4:0];
  _RAND_39 = {1{`RANDOM}};
  refCounter_22 = _RAND_39[4:0];
  _RAND_40 = {1{`RANDOM}};
  refCounter_23 = _RAND_40[4:0];
  _RAND_41 = {1{`RANDOM}};
  refCounter_24 = _RAND_41[4:0];
  _RAND_42 = {1{`RANDOM}};
  refCounter_25 = _RAND_42[4:0];
  _RAND_43 = {1{`RANDOM}};
  refCounter_26 = _RAND_43[4:0];
  _RAND_44 = {1{`RANDOM}};
  refCounter_27 = _RAND_44[4:0];
  _RAND_45 = {1{`RANDOM}};
  refCounter_28 = _RAND_45[4:0];
  _RAND_46 = {1{`RANDOM}};
  refCounter_29 = _RAND_46[4:0];
  _RAND_47 = {1{`RANDOM}};
  refCounter_30 = _RAND_47[4:0];
  _RAND_48 = {1{`RANDOM}};
  refCounter_31 = _RAND_48[4:0];
  _RAND_49 = {1{`RANDOM}};
  refCounter_32 = _RAND_49[4:0];
  _RAND_50 = {1{`RANDOM}};
  refCounter_33 = _RAND_50[4:0];
  _RAND_51 = {1{`RANDOM}};
  refCounter_34 = _RAND_51[4:0];
  _RAND_52 = {1{`RANDOM}};
  refCounter_35 = _RAND_52[4:0];
  _RAND_53 = {1{`RANDOM}};
  refCounter_36 = _RAND_53[4:0];
  _RAND_54 = {1{`RANDOM}};
  refCounter_37 = _RAND_54[4:0];
  _RAND_55 = {1{`RANDOM}};
  refCounter_38 = _RAND_55[4:0];
  _RAND_56 = {1{`RANDOM}};
  refCounter_39 = _RAND_56[4:0];
  _RAND_57 = {1{`RANDOM}};
  refCounter_40 = _RAND_57[4:0];
  _RAND_58 = {1{`RANDOM}};
  refCounter_41 = _RAND_58[4:0];
  _RAND_59 = {1{`RANDOM}};
  refCounter_42 = _RAND_59[4:0];
  _RAND_60 = {1{`RANDOM}};
  refCounter_43 = _RAND_60[4:0];
  _RAND_61 = {1{`RANDOM}};
  refCounter_44 = _RAND_61[4:0];
  _RAND_62 = {1{`RANDOM}};
  refCounter_45 = _RAND_62[4:0];
  _RAND_63 = {1{`RANDOM}};
  refCounter_46 = _RAND_63[4:0];
  _RAND_64 = {1{`RANDOM}};
  refCounter_47 = _RAND_64[4:0];
  _RAND_65 = {1{`RANDOM}};
  refCounter_48 = _RAND_65[4:0];
  _RAND_66 = {1{`RANDOM}};
  refCounter_49 = _RAND_66[4:0];
  _RAND_67 = {1{`RANDOM}};
  refCounter_50 = _RAND_67[4:0];
  _RAND_68 = {1{`RANDOM}};
  refCounter_51 = _RAND_68[4:0];
  _RAND_69 = {1{`RANDOM}};
  refCounter_52 = _RAND_69[4:0];
  _RAND_70 = {1{`RANDOM}};
  refCounter_53 = _RAND_70[4:0];
  _RAND_71 = {1{`RANDOM}};
  refCounter_54 = _RAND_71[4:0];
  _RAND_72 = {1{`RANDOM}};
  refCounter_55 = _RAND_72[4:0];
  _RAND_73 = {1{`RANDOM}};
  refCounter_56 = _RAND_73[4:0];
  _RAND_74 = {1{`RANDOM}};
  refCounter_57 = _RAND_74[4:0];
  _RAND_75 = {1{`RANDOM}};
  refCounter_58 = _RAND_75[4:0];
  _RAND_76 = {1{`RANDOM}};
  refCounter_59 = _RAND_76[4:0];
  _RAND_77 = {1{`RANDOM}};
  refCounter_60 = _RAND_77[4:0];
  _RAND_78 = {1{`RANDOM}};
  refCounter_61 = _RAND_78[4:0];
  _RAND_79 = {1{`RANDOM}};
  refCounter_62 = _RAND_79[4:0];
  _RAND_80 = {1{`RANDOM}};
  refCounter_63 = _RAND_80[4:0];
  _RAND_81 = {1{`RANDOM}};
  archRefCounter_1 = _RAND_81[4:0];
  _RAND_82 = {1{`RANDOM}};
  archRefCounter_2 = _RAND_82[4:0];
  _RAND_83 = {1{`RANDOM}};
  archRefCounter_3 = _RAND_83[4:0];
  _RAND_84 = {1{`RANDOM}};
  archRefCounter_4 = _RAND_84[4:0];
  _RAND_85 = {1{`RANDOM}};
  archRefCounter_5 = _RAND_85[4:0];
  _RAND_86 = {1{`RANDOM}};
  archRefCounter_6 = _RAND_86[4:0];
  _RAND_87 = {1{`RANDOM}};
  archRefCounter_7 = _RAND_87[4:0];
  _RAND_88 = {1{`RANDOM}};
  archRefCounter_8 = _RAND_88[4:0];
  _RAND_89 = {1{`RANDOM}};
  archRefCounter_9 = _RAND_89[4:0];
  _RAND_90 = {1{`RANDOM}};
  archRefCounter_10 = _RAND_90[4:0];
  _RAND_91 = {1{`RANDOM}};
  archRefCounter_11 = _RAND_91[4:0];
  _RAND_92 = {1{`RANDOM}};
  archRefCounter_12 = _RAND_92[4:0];
  _RAND_93 = {1{`RANDOM}};
  archRefCounter_13 = _RAND_93[4:0];
  _RAND_94 = {1{`RANDOM}};
  archRefCounter_14 = _RAND_94[4:0];
  _RAND_95 = {1{`RANDOM}};
  archRefCounter_15 = _RAND_95[4:0];
  _RAND_96 = {1{`RANDOM}};
  archRefCounter_16 = _RAND_96[4:0];
  _RAND_97 = {1{`RANDOM}};
  archRefCounter_17 = _RAND_97[4:0];
  _RAND_98 = {1{`RANDOM}};
  archRefCounter_18 = _RAND_98[4:0];
  _RAND_99 = {1{`RANDOM}};
  archRefCounter_19 = _RAND_99[4:0];
  _RAND_100 = {1{`RANDOM}};
  archRefCounter_20 = _RAND_100[4:0];
  _RAND_101 = {1{`RANDOM}};
  archRefCounter_21 = _RAND_101[4:0];
  _RAND_102 = {1{`RANDOM}};
  archRefCounter_22 = _RAND_102[4:0];
  _RAND_103 = {1{`RANDOM}};
  archRefCounter_23 = _RAND_103[4:0];
  _RAND_104 = {1{`RANDOM}};
  archRefCounter_24 = _RAND_104[4:0];
  _RAND_105 = {1{`RANDOM}};
  archRefCounter_25 = _RAND_105[4:0];
  _RAND_106 = {1{`RANDOM}};
  archRefCounter_26 = _RAND_106[4:0];
  _RAND_107 = {1{`RANDOM}};
  archRefCounter_27 = _RAND_107[4:0];
  _RAND_108 = {1{`RANDOM}};
  archRefCounter_28 = _RAND_108[4:0];
  _RAND_109 = {1{`RANDOM}};
  archRefCounter_29 = _RAND_109[4:0];
  _RAND_110 = {1{`RANDOM}};
  archRefCounter_30 = _RAND_110[4:0];
  _RAND_111 = {1{`RANDOM}};
  archRefCounter_31 = _RAND_111[4:0];
  _RAND_112 = {1{`RANDOM}};
  archRefCounter_32 = _RAND_112[4:0];
  _RAND_113 = {1{`RANDOM}};
  archRefCounter_33 = _RAND_113[4:0];
  _RAND_114 = {1{`RANDOM}};
  archRefCounter_34 = _RAND_114[4:0];
  _RAND_115 = {1{`RANDOM}};
  archRefCounter_35 = _RAND_115[4:0];
  _RAND_116 = {1{`RANDOM}};
  archRefCounter_36 = _RAND_116[4:0];
  _RAND_117 = {1{`RANDOM}};
  archRefCounter_37 = _RAND_117[4:0];
  _RAND_118 = {1{`RANDOM}};
  archRefCounter_38 = _RAND_118[4:0];
  _RAND_119 = {1{`RANDOM}};
  archRefCounter_39 = _RAND_119[4:0];
  _RAND_120 = {1{`RANDOM}};
  archRefCounter_40 = _RAND_120[4:0];
  _RAND_121 = {1{`RANDOM}};
  archRefCounter_41 = _RAND_121[4:0];
  _RAND_122 = {1{`RANDOM}};
  archRefCounter_42 = _RAND_122[4:0];
  _RAND_123 = {1{`RANDOM}};
  archRefCounter_43 = _RAND_123[4:0];
  _RAND_124 = {1{`RANDOM}};
  archRefCounter_44 = _RAND_124[4:0];
  _RAND_125 = {1{`RANDOM}};
  archRefCounter_45 = _RAND_125[4:0];
  _RAND_126 = {1{`RANDOM}};
  archRefCounter_46 = _RAND_126[4:0];
  _RAND_127 = {1{`RANDOM}};
  archRefCounter_47 = _RAND_127[4:0];
  _RAND_128 = {1{`RANDOM}};
  archRefCounter_48 = _RAND_128[4:0];
  _RAND_129 = {1{`RANDOM}};
  archRefCounter_49 = _RAND_129[4:0];
  _RAND_130 = {1{`RANDOM}};
  archRefCounter_50 = _RAND_130[4:0];
  _RAND_131 = {1{`RANDOM}};
  archRefCounter_51 = _RAND_131[4:0];
  _RAND_132 = {1{`RANDOM}};
  archRefCounter_52 = _RAND_132[4:0];
  _RAND_133 = {1{`RANDOM}};
  archRefCounter_53 = _RAND_133[4:0];
  _RAND_134 = {1{`RANDOM}};
  archRefCounter_54 = _RAND_134[4:0];
  _RAND_135 = {1{`RANDOM}};
  archRefCounter_55 = _RAND_135[4:0];
  _RAND_136 = {1{`RANDOM}};
  archRefCounter_56 = _RAND_136[4:0];
  _RAND_137 = {1{`RANDOM}};
  archRefCounter_57 = _RAND_137[4:0];
  _RAND_138 = {1{`RANDOM}};
  archRefCounter_58 = _RAND_138[4:0];
  _RAND_139 = {1{`RANDOM}};
  archRefCounter_59 = _RAND_139[4:0];
  _RAND_140 = {1{`RANDOM}};
  archRefCounter_60 = _RAND_140[4:0];
  _RAND_141 = {1{`RANDOM}};
  archRefCounter_61 = _RAND_141[4:0];
  _RAND_142 = {1{`RANDOM}};
  archRefCounter_62 = _RAND_142[4:0];
  _RAND_143 = {1{`RANDOM}};
  archRefCounter_63 = _RAND_143[4:0];
  _RAND_144 = {1{`RANDOM}};
  io_freeRegs_0_valid_REG = _RAND_144[0:0];
  _RAND_145 = {1{`RANDOM}};
  io_freeRegs_0_valid_REG_1 = _RAND_145[0:0];
  _RAND_146 = {1{`RANDOM}};
  io_freeRegs_0_bits_REG = _RAND_146[5:0];
  _RAND_147 = {1{`RANDOM}};
  io_freeRegs_1_valid_REG = _RAND_147[0:0];
  _RAND_148 = {1{`RANDOM}};
  io_freeRegs_1_valid_REG_1 = _RAND_148[0:0];
  _RAND_149 = {1{`RANDOM}};
  io_freeRegs_1_bits_REG = _RAND_149[5:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    commit_isCommit = 1'h0;
  end
  if (reset) begin
    commit_commitValid_0 = 1'h0;
  end
  if (reset) begin
    commit_commitValid_1 = 1'h0;
  end
  if (reset) begin
    commit_info_0_rfWen = 1'h0;
  end
  if (reset) begin
    commit_info_0_pdest = 6'h0;
  end
  if (reset) begin
    commit_info_0_old_pdest = 6'h0;
  end
  if (reset) begin
    commit_info_1_rfWen = 1'h0;
  end
  if (reset) begin
    commit_info_1_pdest = 6'h0;
  end
  if (reset) begin
    commit_info_1_old_pdest = 6'h0;
  end
  if (reset) begin
    redirect = 1'h0;
  end
  if (reset) begin
    refCounter_1 = 5'h0;
  end
  if (reset) begin
    refCounter_2 = 5'h0;
  end
  if (reset) begin
    refCounter_3 = 5'h0;
  end
  if (reset) begin
    refCounter_4 = 5'h0;
  end
  if (reset) begin
    refCounter_5 = 5'h0;
  end
  if (reset) begin
    refCounter_6 = 5'h0;
  end
  if (reset) begin
    refCounter_7 = 5'h0;
  end
  if (reset) begin
    refCounter_8 = 5'h0;
  end
  if (reset) begin
    refCounter_9 = 5'h0;
  end
  if (reset) begin
    refCounter_10 = 5'h0;
  end
  if (reset) begin
    refCounter_11 = 5'h0;
  end
  if (reset) begin
    refCounter_12 = 5'h0;
  end
  if (reset) begin
    refCounter_13 = 5'h0;
  end
  if (reset) begin
    refCounter_14 = 5'h0;
  end
  if (reset) begin
    refCounter_15 = 5'h0;
  end
  if (reset) begin
    refCounter_16 = 5'h0;
  end
  if (reset) begin
    refCounter_17 = 5'h0;
  end
  if (reset) begin
    refCounter_18 = 5'h0;
  end
  if (reset) begin
    refCounter_19 = 5'h0;
  end
  if (reset) begin
    refCounter_20 = 5'h0;
  end
  if (reset) begin
    refCounter_21 = 5'h0;
  end
  if (reset) begin
    refCounter_22 = 5'h0;
  end
  if (reset) begin
    refCounter_23 = 5'h0;
  end
  if (reset) begin
    refCounter_24 = 5'h0;
  end
  if (reset) begin
    refCounter_25 = 5'h0;
  end
  if (reset) begin
    refCounter_26 = 5'h0;
  end
  if (reset) begin
    refCounter_27 = 5'h0;
  end
  if (reset) begin
    refCounter_28 = 5'h0;
  end
  if (reset) begin
    refCounter_29 = 5'h0;
  end
  if (reset) begin
    refCounter_30 = 5'h0;
  end
  if (reset) begin
    refCounter_31 = 5'h0;
  end
  if (reset) begin
    refCounter_32 = 5'h0;
  end
  if (reset) begin
    refCounter_33 = 5'h0;
  end
  if (reset) begin
    refCounter_34 = 5'h0;
  end
  if (reset) begin
    refCounter_35 = 5'h0;
  end
  if (reset) begin
    refCounter_36 = 5'h0;
  end
  if (reset) begin
    refCounter_37 = 5'h0;
  end
  if (reset) begin
    refCounter_38 = 5'h0;
  end
  if (reset) begin
    refCounter_39 = 5'h0;
  end
  if (reset) begin
    refCounter_40 = 5'h0;
  end
  if (reset) begin
    refCounter_41 = 5'h0;
  end
  if (reset) begin
    refCounter_42 = 5'h0;
  end
  if (reset) begin
    refCounter_43 = 5'h0;
  end
  if (reset) begin
    refCounter_44 = 5'h0;
  end
  if (reset) begin
    refCounter_45 = 5'h0;
  end
  if (reset) begin
    refCounter_46 = 5'h0;
  end
  if (reset) begin
    refCounter_47 = 5'h0;
  end
  if (reset) begin
    refCounter_48 = 5'h0;
  end
  if (reset) begin
    refCounter_49 = 5'h0;
  end
  if (reset) begin
    refCounter_50 = 5'h0;
  end
  if (reset) begin
    refCounter_51 = 5'h0;
  end
  if (reset) begin
    refCounter_52 = 5'h0;
  end
  if (reset) begin
    refCounter_53 = 5'h0;
  end
  if (reset) begin
    refCounter_54 = 5'h0;
  end
  if (reset) begin
    refCounter_55 = 5'h0;
  end
  if (reset) begin
    refCounter_56 = 5'h0;
  end
  if (reset) begin
    refCounter_57 = 5'h0;
  end
  if (reset) begin
    refCounter_58 = 5'h0;
  end
  if (reset) begin
    refCounter_59 = 5'h0;
  end
  if (reset) begin
    refCounter_60 = 5'h0;
  end
  if (reset) begin
    refCounter_61 = 5'h0;
  end
  if (reset) begin
    refCounter_62 = 5'h0;
  end
  if (reset) begin
    refCounter_63 = 5'h0;
  end
  if (reset) begin
    archRefCounter_1 = 5'h0;
  end
  if (reset) begin
    archRefCounter_2 = 5'h0;
  end
  if (reset) begin
    archRefCounter_3 = 5'h0;
  end
  if (reset) begin
    archRefCounter_4 = 5'h0;
  end
  if (reset) begin
    archRefCounter_5 = 5'h0;
  end
  if (reset) begin
    archRefCounter_6 = 5'h0;
  end
  if (reset) begin
    archRefCounter_7 = 5'h0;
  end
  if (reset) begin
    archRefCounter_8 = 5'h0;
  end
  if (reset) begin
    archRefCounter_9 = 5'h0;
  end
  if (reset) begin
    archRefCounter_10 = 5'h0;
  end
  if (reset) begin
    archRefCounter_11 = 5'h0;
  end
  if (reset) begin
    archRefCounter_12 = 5'h0;
  end
  if (reset) begin
    archRefCounter_13 = 5'h0;
  end
  if (reset) begin
    archRefCounter_14 = 5'h0;
  end
  if (reset) begin
    archRefCounter_15 = 5'h0;
  end
  if (reset) begin
    archRefCounter_16 = 5'h0;
  end
  if (reset) begin
    archRefCounter_17 = 5'h0;
  end
  if (reset) begin
    archRefCounter_18 = 5'h0;
  end
  if (reset) begin
    archRefCounter_19 = 5'h0;
  end
  if (reset) begin
    archRefCounter_20 = 5'h0;
  end
  if (reset) begin
    archRefCounter_21 = 5'h0;
  end
  if (reset) begin
    archRefCounter_22 = 5'h0;
  end
  if (reset) begin
    archRefCounter_23 = 5'h0;
  end
  if (reset) begin
    archRefCounter_24 = 5'h0;
  end
  if (reset) begin
    archRefCounter_25 = 5'h0;
  end
  if (reset) begin
    archRefCounter_26 = 5'h0;
  end
  if (reset) begin
    archRefCounter_27 = 5'h0;
  end
  if (reset) begin
    archRefCounter_28 = 5'h0;
  end
  if (reset) begin
    archRefCounter_29 = 5'h0;
  end
  if (reset) begin
    archRefCounter_30 = 5'h0;
  end
  if (reset) begin
    archRefCounter_31 = 5'h0;
  end
  if (reset) begin
    archRefCounter_32 = 5'h0;
  end
  if (reset) begin
    archRefCounter_33 = 5'h0;
  end
  if (reset) begin
    archRefCounter_34 = 5'h0;
  end
  if (reset) begin
    archRefCounter_35 = 5'h0;
  end
  if (reset) begin
    archRefCounter_36 = 5'h0;
  end
  if (reset) begin
    archRefCounter_37 = 5'h0;
  end
  if (reset) begin
    archRefCounter_38 = 5'h0;
  end
  if (reset) begin
    archRefCounter_39 = 5'h0;
  end
  if (reset) begin
    archRefCounter_40 = 5'h0;
  end
  if (reset) begin
    archRefCounter_41 = 5'h0;
  end
  if (reset) begin
    archRefCounter_42 = 5'h0;
  end
  if (reset) begin
    archRefCounter_43 = 5'h0;
  end
  if (reset) begin
    archRefCounter_44 = 5'h0;
  end
  if (reset) begin
    archRefCounter_45 = 5'h0;
  end
  if (reset) begin
    archRefCounter_46 = 5'h0;
  end
  if (reset) begin
    archRefCounter_47 = 5'h0;
  end
  if (reset) begin
    archRefCounter_48 = 5'h0;
  end
  if (reset) begin
    archRefCounter_49 = 5'h0;
  end
  if (reset) begin
    archRefCounter_50 = 5'h0;
  end
  if (reset) begin
    archRefCounter_51 = 5'h0;
  end
  if (reset) begin
    archRefCounter_52 = 5'h0;
  end
  if (reset) begin
    archRefCounter_53 = 5'h0;
  end
  if (reset) begin
    archRefCounter_54 = 5'h0;
  end
  if (reset) begin
    archRefCounter_55 = 5'h0;
  end
  if (reset) begin
    archRefCounter_56 = 5'h0;
  end
  if (reset) begin
    archRefCounter_57 = 5'h0;
  end
  if (reset) begin
    archRefCounter_58 = 5'h0;
  end
  if (reset) begin
    archRefCounter_59 = 5'h0;
  end
  if (reset) begin
    archRefCounter_60 = 5'h0;
  end
  if (reset) begin
    archRefCounter_61 = 5'h0;
  end
  if (reset) begin
    archRefCounter_62 = 5'h0;
  end
  if (reset) begin
    archRefCounter_63 = 5'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

