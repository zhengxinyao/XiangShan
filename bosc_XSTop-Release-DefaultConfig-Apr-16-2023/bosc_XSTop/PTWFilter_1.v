module PTWFilter_1(
  input         clock,
  input         reset,
  input         io_sfence_valid,
  input         io_csr_satp_changed,
  input         io_tlb_req_0_valid,
  input  [26:0] io_tlb_req_0_bits_vpn,
  input         io_tlb_req_1_valid,
  input  [26:0] io_tlb_req_1_bits_vpn,
  input         io_tlb_req_2_valid,
  input  [26:0] io_tlb_req_2_bits_vpn,
  input         io_tlb_req_3_valid,
  input  [26:0] io_tlb_req_3_bits_vpn,
  output        io_tlb_resp_valid,
  output [26:0] io_tlb_resp_bits_data_entry_tag,
  output [15:0] io_tlb_resp_bits_data_entry_asid,
  output [23:0] io_tlb_resp_bits_data_entry_ppn,
  output        io_tlb_resp_bits_data_entry_perm_d,
  output        io_tlb_resp_bits_data_entry_perm_a,
  output        io_tlb_resp_bits_data_entry_perm_g,
  output        io_tlb_resp_bits_data_entry_perm_u,
  output        io_tlb_resp_bits_data_entry_perm_x,
  output        io_tlb_resp_bits_data_entry_perm_w,
  output        io_tlb_resp_bits_data_entry_perm_r,
  output [1:0]  io_tlb_resp_bits_data_entry_level,
  output        io_tlb_resp_bits_data_pf,
  output        io_tlb_resp_bits_data_af,
  output        io_tlb_resp_bits_vector_0,
  output        io_tlb_resp_bits_vector_1,
  output        io_tlb_resp_bits_vector_2,
  output        io_tlb_resp_bits_vector_3,
  output        io_tlb_resp_bits_vector_4,
  input         io_ptw_req_0_ready,
  output        io_ptw_req_0_valid,
  output [26:0] io_ptw_req_0_bits_vpn,
  output        io_ptw_resp_ready,
  input         io_ptw_resp_valid,
  input  [26:0] io_ptw_resp_bits_entry_tag,
  input  [15:0] io_ptw_resp_bits_entry_asid,
  input  [23:0] io_ptw_resp_bits_entry_ppn,
  input         io_ptw_resp_bits_entry_perm_d,
  input         io_ptw_resp_bits_entry_perm_a,
  input         io_ptw_resp_bits_entry_perm_g,
  input         io_ptw_resp_bits_entry_perm_u,
  input         io_ptw_resp_bits_entry_perm_x,
  input         io_ptw_resp_bits_entry_perm_w,
  input         io_ptw_resp_bits_entry_perm_r,
  input  [1:0]  io_ptw_resp_bits_entry_level,
  input         io_ptw_resp_bits_pf,
  input         io_ptw_resp_bits_af
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
`endif // RANDOMIZE_REG_INIT
  wire  flush_delay_clock; // @[Hold.scala 97:23]
  wire  flush_delay_io_in; // @[Hold.scala 97:23]
  wire  flush_delay_io_out; // @[Hold.scala 97:23]
  reg  v_0; // @[Repeater.scala 157:18]
  reg  v_1; // @[Repeater.scala 157:18]
  reg  v_2; // @[Repeater.scala 157:18]
  reg  v_3; // @[Repeater.scala 157:18]
  reg  v_4; // @[Repeater.scala 157:18]
  reg  v_5; // @[Repeater.scala 157:18]
  reg  v_6; // @[Repeater.scala 157:18]
  reg  v_7; // @[Repeater.scala 157:18]
  reg  ports_0_0; // @[Repeater.scala 158:18]
  reg  ports_0_1; // @[Repeater.scala 158:18]
  reg  ports_0_2; // @[Repeater.scala 158:18]
  reg  ports_0_3; // @[Repeater.scala 158:18]
  reg  ports_0_4; // @[Repeater.scala 158:18]
  reg  ports_1_0; // @[Repeater.scala 158:18]
  reg  ports_1_1; // @[Repeater.scala 158:18]
  reg  ports_1_2; // @[Repeater.scala 158:18]
  reg  ports_1_3; // @[Repeater.scala 158:18]
  reg  ports_1_4; // @[Repeater.scala 158:18]
  reg  ports_2_0; // @[Repeater.scala 158:18]
  reg  ports_2_1; // @[Repeater.scala 158:18]
  reg  ports_2_2; // @[Repeater.scala 158:18]
  reg  ports_2_3; // @[Repeater.scala 158:18]
  reg  ports_2_4; // @[Repeater.scala 158:18]
  reg  ports_3_0; // @[Repeater.scala 158:18]
  reg  ports_3_1; // @[Repeater.scala 158:18]
  reg  ports_3_2; // @[Repeater.scala 158:18]
  reg  ports_3_3; // @[Repeater.scala 158:18]
  reg  ports_3_4; // @[Repeater.scala 158:18]
  reg  ports_4_0; // @[Repeater.scala 158:18]
  reg  ports_4_1; // @[Repeater.scala 158:18]
  reg  ports_4_2; // @[Repeater.scala 158:18]
  reg  ports_4_3; // @[Repeater.scala 158:18]
  reg  ports_4_4; // @[Repeater.scala 158:18]
  reg  ports_5_0; // @[Repeater.scala 158:18]
  reg  ports_5_1; // @[Repeater.scala 158:18]
  reg  ports_5_2; // @[Repeater.scala 158:18]
  reg  ports_5_3; // @[Repeater.scala 158:18]
  reg  ports_5_4; // @[Repeater.scala 158:18]
  reg  ports_6_0; // @[Repeater.scala 158:18]
  reg  ports_6_1; // @[Repeater.scala 158:18]
  reg  ports_6_2; // @[Repeater.scala 158:18]
  reg  ports_6_3; // @[Repeater.scala 158:18]
  reg  ports_6_4; // @[Repeater.scala 158:18]
  reg  ports_7_0; // @[Repeater.scala 158:18]
  reg  ports_7_1; // @[Repeater.scala 158:18]
  reg  ports_7_2; // @[Repeater.scala 158:18]
  reg  ports_7_3; // @[Repeater.scala 158:18]
  reg  ports_7_4; // @[Repeater.scala 158:18]
  reg [26:0] vpn_0; // @[Repeater.scala 159:16]
  reg [26:0] vpn_1; // @[Repeater.scala 159:16]
  reg [26:0] vpn_2; // @[Repeater.scala 159:16]
  reg [26:0] vpn_3; // @[Repeater.scala 159:16]
  reg [26:0] vpn_4; // @[Repeater.scala 159:16]
  reg [26:0] vpn_5; // @[Repeater.scala 159:16]
  reg [26:0] vpn_6; // @[Repeater.scala 159:16]
  reg [26:0] vpn_7; // @[Repeater.scala 159:16]
  reg [2:0] enqPtr; // @[Repeater.scala 161:23]
  reg [2:0] issPtr; // @[Repeater.scala 162:23]
  reg [2:0] deqPtr; // @[Repeater.scala 163:23]
  reg  mayFullDeq; // @[Repeater.scala 164:27]
  reg  mayFullIss; // @[Repeater.scala 165:27]
  reg [3:0] counter; // @[Repeater.scala 166:24]
  reg [3:0] inflight_counter; // @[Repeater.scala 172:33]
  wire  inflight_full = inflight_counter == 4'h8; // @[Repeater.scala 173:40]
  wire  _T = io_ptw_req_0_ready & io_ptw_req_0_valid; // @[Decoupled.scala 50:35]
  wire  _T_1 = io_ptw_resp_ready & io_ptw_resp_valid; // @[Decoupled.scala 50:35]
  wire [3:0] _inflight_counter_T_2 = inflight_counter + 4'h1; // @[Repeater.scala 175:68]
  wire [3:0] _inflight_counter_T_4 = inflight_counter - 4'h1; // @[Repeater.scala 175:92]
  reg [26:0] ptwResp_entry_tag; // @[Reg.scala 16:16]
  reg [15:0] ptwResp_entry_asid; // @[Reg.scala 16:16]
  reg [23:0] ptwResp_entry_ppn; // @[Reg.scala 16:16]
  reg  ptwResp_entry_perm_d; // @[Reg.scala 16:16]
  reg  ptwResp_entry_perm_a; // @[Reg.scala 16:16]
  reg  ptwResp_entry_perm_g; // @[Reg.scala 16:16]
  reg  ptwResp_entry_perm_u; // @[Reg.scala 16:16]
  reg  ptwResp_entry_perm_x; // @[Reg.scala 16:16]
  reg  ptwResp_entry_perm_w; // @[Reg.scala 16:16]
  reg  ptwResp_entry_perm_r; // @[Reg.scala 16:16]
  reg [1:0] ptwResp_entry_level; // @[Reg.scala 16:16]
  reg  ptwResp_pf; // @[Reg.scala 16:16]
  reg  ptwResp_af; // @[Reg.scala 16:16]
  wire  ptwResp_OldMatchVec_hit0 = io_ptw_resp_bits_entry_tag[26:18] == vpn_0[26:18]; // @[MMUBundle.scala 581:48]
  wire  ptwResp_OldMatchVec_hit1 = io_ptw_resp_bits_entry_tag[17:9] == vpn_0[17:9]; // @[MMUBundle.scala 582:48]
  wire  ptwResp_OldMatchVec_hit2 = io_ptw_resp_bits_entry_tag[8:0] == vpn_0[8:0]; // @[MMUBundle.scala 583:50]
  wire  _ptwResp_OldMatchVec_T_5 = io_ptw_resp_bits_entry_level == 2'h1 ? ptwResp_OldMatchVec_hit1 &
    ptwResp_OldMatchVec_hit0 : ptwResp_OldMatchVec_hit0; // @[MMUBundle.scala 585:78]
  wire  _ptwResp_OldMatchVec_T_6 = io_ptw_resp_bits_entry_level == 2'h2 ? ptwResp_OldMatchVec_hit2 &
    ptwResp_OldMatchVec_hit1 & ptwResp_OldMatchVec_hit0 : _ptwResp_OldMatchVec_T_5; // @[MMUBundle.scala 585:22]
  wire  ptwResp_OldMatchVec_0 = v_0 & _ptwResp_OldMatchVec_T_6; // @[Repeater.scala 181:8]
  wire  ptwResp_OldMatchVec_hit0_1 = io_ptw_resp_bits_entry_tag[26:18] == vpn_1[26:18]; // @[MMUBundle.scala 581:48]
  wire  ptwResp_OldMatchVec_hit1_1 = io_ptw_resp_bits_entry_tag[17:9] == vpn_1[17:9]; // @[MMUBundle.scala 582:48]
  wire  ptwResp_OldMatchVec_hit2_1 = io_ptw_resp_bits_entry_tag[8:0] == vpn_1[8:0]; // @[MMUBundle.scala 583:50]
  wire  _ptwResp_OldMatchVec_T_13 = io_ptw_resp_bits_entry_level == 2'h1 ? ptwResp_OldMatchVec_hit1_1 &
    ptwResp_OldMatchVec_hit0_1 : ptwResp_OldMatchVec_hit0_1; // @[MMUBundle.scala 585:78]
  wire  _ptwResp_OldMatchVec_T_14 = io_ptw_resp_bits_entry_level == 2'h2 ? ptwResp_OldMatchVec_hit2_1 &
    ptwResp_OldMatchVec_hit1_1 & ptwResp_OldMatchVec_hit0_1 : _ptwResp_OldMatchVec_T_13; // @[MMUBundle.scala 585:22]
  wire  ptwResp_OldMatchVec_1 = v_1 & _ptwResp_OldMatchVec_T_14; // @[Repeater.scala 181:8]
  wire  ptwResp_OldMatchVec_hit0_2 = io_ptw_resp_bits_entry_tag[26:18] == vpn_2[26:18]; // @[MMUBundle.scala 581:48]
  wire  ptwResp_OldMatchVec_hit1_2 = io_ptw_resp_bits_entry_tag[17:9] == vpn_2[17:9]; // @[MMUBundle.scala 582:48]
  wire  ptwResp_OldMatchVec_hit2_2 = io_ptw_resp_bits_entry_tag[8:0] == vpn_2[8:0]; // @[MMUBundle.scala 583:50]
  wire  _ptwResp_OldMatchVec_T_21 = io_ptw_resp_bits_entry_level == 2'h1 ? ptwResp_OldMatchVec_hit1_2 &
    ptwResp_OldMatchVec_hit0_2 : ptwResp_OldMatchVec_hit0_2; // @[MMUBundle.scala 585:78]
  wire  _ptwResp_OldMatchVec_T_22 = io_ptw_resp_bits_entry_level == 2'h2 ? ptwResp_OldMatchVec_hit2_2 &
    ptwResp_OldMatchVec_hit1_2 & ptwResp_OldMatchVec_hit0_2 : _ptwResp_OldMatchVec_T_21; // @[MMUBundle.scala 585:22]
  wire  ptwResp_OldMatchVec_2 = v_2 & _ptwResp_OldMatchVec_T_22; // @[Repeater.scala 181:8]
  wire  ptwResp_OldMatchVec_hit0_3 = io_ptw_resp_bits_entry_tag[26:18] == vpn_3[26:18]; // @[MMUBundle.scala 581:48]
  wire  ptwResp_OldMatchVec_hit1_3 = io_ptw_resp_bits_entry_tag[17:9] == vpn_3[17:9]; // @[MMUBundle.scala 582:48]
  wire  ptwResp_OldMatchVec_hit2_3 = io_ptw_resp_bits_entry_tag[8:0] == vpn_3[8:0]; // @[MMUBundle.scala 583:50]
  wire  _ptwResp_OldMatchVec_T_29 = io_ptw_resp_bits_entry_level == 2'h1 ? ptwResp_OldMatchVec_hit1_3 &
    ptwResp_OldMatchVec_hit0_3 : ptwResp_OldMatchVec_hit0_3; // @[MMUBundle.scala 585:78]
  wire  _ptwResp_OldMatchVec_T_30 = io_ptw_resp_bits_entry_level == 2'h2 ? ptwResp_OldMatchVec_hit2_3 &
    ptwResp_OldMatchVec_hit1_3 & ptwResp_OldMatchVec_hit0_3 : _ptwResp_OldMatchVec_T_29; // @[MMUBundle.scala 585:22]
  wire  ptwResp_OldMatchVec_3 = v_3 & _ptwResp_OldMatchVec_T_30; // @[Repeater.scala 181:8]
  wire  ptwResp_OldMatchVec_hit0_4 = io_ptw_resp_bits_entry_tag[26:18] == vpn_4[26:18]; // @[MMUBundle.scala 581:48]
  wire  ptwResp_OldMatchVec_hit1_4 = io_ptw_resp_bits_entry_tag[17:9] == vpn_4[17:9]; // @[MMUBundle.scala 582:48]
  wire  ptwResp_OldMatchVec_hit2_4 = io_ptw_resp_bits_entry_tag[8:0] == vpn_4[8:0]; // @[MMUBundle.scala 583:50]
  wire  _ptwResp_OldMatchVec_T_37 = io_ptw_resp_bits_entry_level == 2'h1 ? ptwResp_OldMatchVec_hit1_4 &
    ptwResp_OldMatchVec_hit0_4 : ptwResp_OldMatchVec_hit0_4; // @[MMUBundle.scala 585:78]
  wire  _ptwResp_OldMatchVec_T_38 = io_ptw_resp_bits_entry_level == 2'h2 ? ptwResp_OldMatchVec_hit2_4 &
    ptwResp_OldMatchVec_hit1_4 & ptwResp_OldMatchVec_hit0_4 : _ptwResp_OldMatchVec_T_37; // @[MMUBundle.scala 585:22]
  wire  ptwResp_OldMatchVec_4 = v_4 & _ptwResp_OldMatchVec_T_38; // @[Repeater.scala 181:8]
  wire  ptwResp_OldMatchVec_hit0_5 = io_ptw_resp_bits_entry_tag[26:18] == vpn_5[26:18]; // @[MMUBundle.scala 581:48]
  wire  ptwResp_OldMatchVec_hit1_5 = io_ptw_resp_bits_entry_tag[17:9] == vpn_5[17:9]; // @[MMUBundle.scala 582:48]
  wire  ptwResp_OldMatchVec_hit2_5 = io_ptw_resp_bits_entry_tag[8:0] == vpn_5[8:0]; // @[MMUBundle.scala 583:50]
  wire  _ptwResp_OldMatchVec_T_45 = io_ptw_resp_bits_entry_level == 2'h1 ? ptwResp_OldMatchVec_hit1_5 &
    ptwResp_OldMatchVec_hit0_5 : ptwResp_OldMatchVec_hit0_5; // @[MMUBundle.scala 585:78]
  wire  _ptwResp_OldMatchVec_T_46 = io_ptw_resp_bits_entry_level == 2'h2 ? ptwResp_OldMatchVec_hit2_5 &
    ptwResp_OldMatchVec_hit1_5 & ptwResp_OldMatchVec_hit0_5 : _ptwResp_OldMatchVec_T_45; // @[MMUBundle.scala 585:22]
  wire  ptwResp_OldMatchVec_5 = v_5 & _ptwResp_OldMatchVec_T_46; // @[Repeater.scala 181:8]
  wire  ptwResp_OldMatchVec_hit0_6 = io_ptw_resp_bits_entry_tag[26:18] == vpn_6[26:18]; // @[MMUBundle.scala 581:48]
  wire  ptwResp_OldMatchVec_hit1_6 = io_ptw_resp_bits_entry_tag[17:9] == vpn_6[17:9]; // @[MMUBundle.scala 582:48]
  wire  ptwResp_OldMatchVec_hit2_6 = io_ptw_resp_bits_entry_tag[8:0] == vpn_6[8:0]; // @[MMUBundle.scala 583:50]
  wire  _ptwResp_OldMatchVec_T_53 = io_ptw_resp_bits_entry_level == 2'h1 ? ptwResp_OldMatchVec_hit1_6 &
    ptwResp_OldMatchVec_hit0_6 : ptwResp_OldMatchVec_hit0_6; // @[MMUBundle.scala 585:78]
  wire  _ptwResp_OldMatchVec_T_54 = io_ptw_resp_bits_entry_level == 2'h2 ? ptwResp_OldMatchVec_hit2_6 &
    ptwResp_OldMatchVec_hit1_6 & ptwResp_OldMatchVec_hit0_6 : _ptwResp_OldMatchVec_T_53; // @[MMUBundle.scala 585:22]
  wire  ptwResp_OldMatchVec_6 = v_6 & _ptwResp_OldMatchVec_T_54; // @[Repeater.scala 181:8]
  wire  ptwResp_OldMatchVec_hit0_7 = io_ptw_resp_bits_entry_tag[26:18] == vpn_7[26:18]; // @[MMUBundle.scala 581:48]
  wire  ptwResp_OldMatchVec_hit1_7 = io_ptw_resp_bits_entry_tag[17:9] == vpn_7[17:9]; // @[MMUBundle.scala 582:48]
  wire  ptwResp_OldMatchVec_hit2_7 = io_ptw_resp_bits_entry_tag[8:0] == vpn_7[8:0]; // @[MMUBundle.scala 583:50]
  wire  _ptwResp_OldMatchVec_T_61 = io_ptw_resp_bits_entry_level == 2'h1 ? ptwResp_OldMatchVec_hit1_7 &
    ptwResp_OldMatchVec_hit0_7 : ptwResp_OldMatchVec_hit0_7; // @[MMUBundle.scala 585:78]
  wire  _ptwResp_OldMatchVec_T_62 = io_ptw_resp_bits_entry_level == 2'h2 ? ptwResp_OldMatchVec_hit2_7 &
    ptwResp_OldMatchVec_hit1_7 & ptwResp_OldMatchVec_hit0_7 : _ptwResp_OldMatchVec_T_61; // @[MMUBundle.scala 585:22]
  wire  ptwResp_OldMatchVec_7 = v_7 & _ptwResp_OldMatchVec_T_62; // @[Repeater.scala 181:8]
  wire [7:0] _ptwResp_valid_T_1 = {ptwResp_OldMatchVec_0,ptwResp_OldMatchVec_1,ptwResp_OldMatchVec_2,
    ptwResp_OldMatchVec_3,ptwResp_OldMatchVec_4,ptwResp_OldMatchVec_5,ptwResp_OldMatchVec_6,ptwResp_OldMatchVec_7}; // @[Cat.scala 31:58]
  reg  ptwResp_valid; // @[Repeater.scala 182:30]
  wire  oldMatchVec_early_0_0 = v_0 & vpn_0 == io_tlb_req_0_bits_vpn; // @[Repeater.scala 183:83]
  wire  oldMatchVec_early_0_1 = v_1 & vpn_1 == io_tlb_req_0_bits_vpn; // @[Repeater.scala 183:83]
  wire  oldMatchVec_early_0_2 = v_2 & vpn_2 == io_tlb_req_0_bits_vpn; // @[Repeater.scala 183:83]
  wire  oldMatchVec_early_0_3 = v_3 & vpn_3 == io_tlb_req_0_bits_vpn; // @[Repeater.scala 183:83]
  wire  oldMatchVec_early_0_4 = v_4 & vpn_4 == io_tlb_req_0_bits_vpn; // @[Repeater.scala 183:83]
  wire  oldMatchVec_early_0_5 = v_5 & vpn_5 == io_tlb_req_0_bits_vpn; // @[Repeater.scala 183:83]
  wire  oldMatchVec_early_0_6 = v_6 & vpn_6 == io_tlb_req_0_bits_vpn; // @[Repeater.scala 183:83]
  wire  oldMatchVec_early_0_7 = v_7 & vpn_7 == io_tlb_req_0_bits_vpn; // @[Repeater.scala 183:83]
  wire  oldMatchVec_early_1_0 = v_0 & vpn_0 == io_tlb_req_1_bits_vpn; // @[Repeater.scala 183:83]
  wire  oldMatchVec_early_1_1 = v_1 & vpn_1 == io_tlb_req_1_bits_vpn; // @[Repeater.scala 183:83]
  wire  oldMatchVec_early_1_2 = v_2 & vpn_2 == io_tlb_req_1_bits_vpn; // @[Repeater.scala 183:83]
  wire  oldMatchVec_early_1_3 = v_3 & vpn_3 == io_tlb_req_1_bits_vpn; // @[Repeater.scala 183:83]
  wire  oldMatchVec_early_1_4 = v_4 & vpn_4 == io_tlb_req_1_bits_vpn; // @[Repeater.scala 183:83]
  wire  oldMatchVec_early_1_5 = v_5 & vpn_5 == io_tlb_req_1_bits_vpn; // @[Repeater.scala 183:83]
  wire  oldMatchVec_early_1_6 = v_6 & vpn_6 == io_tlb_req_1_bits_vpn; // @[Repeater.scala 183:83]
  wire  oldMatchVec_early_1_7 = v_7 & vpn_7 == io_tlb_req_1_bits_vpn; // @[Repeater.scala 183:83]
  wire  oldMatchVec_early_2_0 = v_0 & vpn_0 == io_tlb_req_2_bits_vpn; // @[Repeater.scala 183:83]
  wire  oldMatchVec_early_2_1 = v_1 & vpn_1 == io_tlb_req_2_bits_vpn; // @[Repeater.scala 183:83]
  wire  oldMatchVec_early_2_2 = v_2 & vpn_2 == io_tlb_req_2_bits_vpn; // @[Repeater.scala 183:83]
  wire  oldMatchVec_early_2_3 = v_3 & vpn_3 == io_tlb_req_2_bits_vpn; // @[Repeater.scala 183:83]
  wire  oldMatchVec_early_2_4 = v_4 & vpn_4 == io_tlb_req_2_bits_vpn; // @[Repeater.scala 183:83]
  wire  oldMatchVec_early_2_5 = v_5 & vpn_5 == io_tlb_req_2_bits_vpn; // @[Repeater.scala 183:83]
  wire  oldMatchVec_early_2_6 = v_6 & vpn_6 == io_tlb_req_2_bits_vpn; // @[Repeater.scala 183:83]
  wire  oldMatchVec_early_2_7 = v_7 & vpn_7 == io_tlb_req_2_bits_vpn; // @[Repeater.scala 183:83]
  wire  oldMatchVec_early_3_0 = v_0 & vpn_0 == io_tlb_req_3_bits_vpn; // @[Repeater.scala 183:83]
  wire  oldMatchVec_early_3_1 = v_1 & vpn_1 == io_tlb_req_3_bits_vpn; // @[Repeater.scala 183:83]
  wire  oldMatchVec_early_3_2 = v_2 & vpn_2 == io_tlb_req_3_bits_vpn; // @[Repeater.scala 183:83]
  wire  oldMatchVec_early_3_3 = v_3 & vpn_3 == io_tlb_req_3_bits_vpn; // @[Repeater.scala 183:83]
  wire  oldMatchVec_early_3_4 = v_4 & vpn_4 == io_tlb_req_3_bits_vpn; // @[Repeater.scala 183:83]
  wire  oldMatchVec_early_3_5 = v_5 & vpn_5 == io_tlb_req_3_bits_vpn; // @[Repeater.scala 183:83]
  wire  oldMatchVec_early_3_6 = v_6 & vpn_6 == io_tlb_req_3_bits_vpn; // @[Repeater.scala 183:83]
  wire  oldMatchVec_early_3_7 = v_7 & vpn_7 == io_tlb_req_3_bits_vpn; // @[Repeater.scala 183:83]
  reg [26:0] tlb_req_0_bits_rvpn; // @[Reg.scala 16:16]
  reg  tlb_req_0_valid_REG; // @[Repeater.scala 188:32]
  wire  ptwResp_newMatchVec_hit2 = ptwResp_entry_tag[8:0] == tlb_req_0_bits_rvpn[8:0]; // @[MMUBundle.scala 583:50]
  wire  ptwResp_newMatchVec_hit1 = ptwResp_entry_tag[17:9] == tlb_req_0_bits_rvpn[17:9]; // @[MMUBundle.scala 582:48]
  wire  ptwResp_newMatchVec_hit0 = ptwResp_entry_tag[26:18] == tlb_req_0_bits_rvpn[26:18]; // @[MMUBundle.scala 581:48]
  wire  _ptwResp_newMatchVec_T_5 = ptwResp_entry_level == 2'h1 ? ptwResp_newMatchVec_hit1 & ptwResp_newMatchVec_hit0 :
    ptwResp_newMatchVec_hit0; // @[MMUBundle.scala 585:78]
  wire  _ptwResp_newMatchVec_T_6 = ptwResp_entry_level == 2'h2 ? ptwResp_newMatchVec_hit2 & ptwResp_newMatchVec_hit1 &
    ptwResp_newMatchVec_hit0 : _ptwResp_newMatchVec_T_5; // @[MMUBundle.scala 585:22]
  wire  ptwResp_newMatchVec_0 = ptwResp_valid & _ptwResp_newMatchVec_T_6; // @[Repeater.scala 200:19]
  reg  oldMatchVec_0; // @[Repeater.scala 195:55]
  wire  reqs_reqs_merge = ptwResp_newMatchVec_0 | oldMatchVec_0; // @[Repeater.scala 209:32]
  wire  reqs_0_valid = ~reqs_reqs_merge & tlb_req_0_valid_REG; // @[Repeater.scala 218:27]
  reg [26:0] tlb_req_1_bits_rvpn; // @[Reg.scala 16:16]
  wire  ptwResp_newMatchVec_hit2_1 = ptwResp_entry_tag[8:0] == tlb_req_1_bits_rvpn[8:0]; // @[MMUBundle.scala 583:50]
  wire  ptwResp_newMatchVec_hit1_1 = ptwResp_entry_tag[17:9] == tlb_req_1_bits_rvpn[17:9]; // @[MMUBundle.scala 582:48]
  wire  ptwResp_newMatchVec_hit0_1 = ptwResp_entry_tag[26:18] == tlb_req_1_bits_rvpn[26:18]; // @[MMUBundle.scala 581:48]
  wire  _ptwResp_newMatchVec_T_13 = ptwResp_entry_level == 2'h1 ? ptwResp_newMatchVec_hit1_1 &
    ptwResp_newMatchVec_hit0_1 : ptwResp_newMatchVec_hit0_1; // @[MMUBundle.scala 585:78]
  wire  _ptwResp_newMatchVec_T_14 = ptwResp_entry_level == 2'h2 ? ptwResp_newMatchVec_hit2_1 &
    ptwResp_newMatchVec_hit1_1 & ptwResp_newMatchVec_hit0_1 : _ptwResp_newMatchVec_T_13; // @[MMUBundle.scala 585:22]
  wire  ptwResp_newMatchVec_1 = ptwResp_valid & _ptwResp_newMatchVec_T_14; // @[Repeater.scala 200:19]
  reg  oldMatchVec_1; // @[Repeater.scala 195:55]
  reg  newMatchVec_REG_5; // @[Repeater.scala 197:12]
  wire  newMatchVec_1_0 = newMatchVec_REG_5 & tlb_req_0_valid_REG; // @[Repeater.scala 197:38]
  wire  _reqs_reqs_merge_T_3 = |newMatchVec_1_0; // @[Repeater.scala 210:41]
  wire  reqs_reqs_merge_1 = ptwResp_newMatchVec_1 | oldMatchVec_1 | _reqs_reqs_merge_T_3; // @[Repeater.scala 209:54]
  reg  tlb_req_1_valid_REG; // @[Repeater.scala 188:32]
  wire  reqs_1_valid = ~reqs_reqs_merge_1 & tlb_req_1_valid_REG; // @[Repeater.scala 218:27]
  wire [1:0] _enqNum_T = reqs_0_valid + reqs_1_valid; // @[Bitwise.scala 48:55]
  reg [26:0] tlb_req_2_bits_rvpn; // @[Reg.scala 16:16]
  wire  ptwResp_newMatchVec_hit2_2 = ptwResp_entry_tag[8:0] == tlb_req_2_bits_rvpn[8:0]; // @[MMUBundle.scala 583:50]
  wire  ptwResp_newMatchVec_hit1_2 = ptwResp_entry_tag[17:9] == tlb_req_2_bits_rvpn[17:9]; // @[MMUBundle.scala 582:48]
  wire  ptwResp_newMatchVec_hit0_2 = ptwResp_entry_tag[26:18] == tlb_req_2_bits_rvpn[26:18]; // @[MMUBundle.scala 581:48]
  wire  _ptwResp_newMatchVec_T_21 = ptwResp_entry_level == 2'h1 ? ptwResp_newMatchVec_hit1_2 &
    ptwResp_newMatchVec_hit0_2 : ptwResp_newMatchVec_hit0_2; // @[MMUBundle.scala 585:78]
  wire  _ptwResp_newMatchVec_T_22 = ptwResp_entry_level == 2'h2 ? ptwResp_newMatchVec_hit2_2 &
    ptwResp_newMatchVec_hit1_2 & ptwResp_newMatchVec_hit0_2 : _ptwResp_newMatchVec_T_21; // @[MMUBundle.scala 585:22]
  wire  ptwResp_newMatchVec_2 = ptwResp_valid & _ptwResp_newMatchVec_T_22; // @[Repeater.scala 200:19]
  reg  oldMatchVec_2; // @[Repeater.scala 195:55]
  reg  newMatchVec_REG_10; // @[Repeater.scala 197:12]
  wire  newMatchVec_2_0 = newMatchVec_REG_10 & tlb_req_0_valid_REG; // @[Repeater.scala 197:38]
  reg  newMatchVec_REG_11; // @[Repeater.scala 197:12]
  wire  newMatchVec_2_1 = newMatchVec_REG_11 & tlb_req_1_valid_REG; // @[Repeater.scala 197:38]
  wire [1:0] _reqs_reqs_merge_T_5 = {newMatchVec_2_0,newMatchVec_2_1}; // @[Cat.scala 31:58]
  wire  _reqs_reqs_merge_T_6 = |_reqs_reqs_merge_T_5; // @[Repeater.scala 210:41]
  wire  reqs_reqs_merge_2 = ptwResp_newMatchVec_2 | oldMatchVec_2 | _reqs_reqs_merge_T_6; // @[Repeater.scala 209:54]
  reg  tlb_req_2_valid_REG; // @[Repeater.scala 188:32]
  wire  reqs_2_valid = ~reqs_reqs_merge_2 & tlb_req_2_valid_REG; // @[Repeater.scala 218:27]
  reg [26:0] tlb_req_3_bits_rvpn; // @[Reg.scala 16:16]
  wire  ptwResp_newMatchVec_hit2_3 = ptwResp_entry_tag[8:0] == tlb_req_3_bits_rvpn[8:0]; // @[MMUBundle.scala 583:50]
  wire  ptwResp_newMatchVec_hit1_3 = ptwResp_entry_tag[17:9] == tlb_req_3_bits_rvpn[17:9]; // @[MMUBundle.scala 582:48]
  wire  ptwResp_newMatchVec_hit0_3 = ptwResp_entry_tag[26:18] == tlb_req_3_bits_rvpn[26:18]; // @[MMUBundle.scala 581:48]
  wire  _ptwResp_newMatchVec_T_29 = ptwResp_entry_level == 2'h1 ? ptwResp_newMatchVec_hit1_3 &
    ptwResp_newMatchVec_hit0_3 : ptwResp_newMatchVec_hit0_3; // @[MMUBundle.scala 585:78]
  wire  _ptwResp_newMatchVec_T_30 = ptwResp_entry_level == 2'h2 ? ptwResp_newMatchVec_hit2_3 &
    ptwResp_newMatchVec_hit1_3 & ptwResp_newMatchVec_hit0_3 : _ptwResp_newMatchVec_T_29; // @[MMUBundle.scala 585:22]
  wire  ptwResp_newMatchVec_3 = ptwResp_valid & _ptwResp_newMatchVec_T_30; // @[Repeater.scala 200:19]
  reg  oldMatchVec_3; // @[Repeater.scala 195:55]
  reg  newMatchVec_REG_15; // @[Repeater.scala 197:12]
  wire  newMatchVec_3_0 = newMatchVec_REG_15 & tlb_req_0_valid_REG; // @[Repeater.scala 197:38]
  reg  newMatchVec_REG_16; // @[Repeater.scala 197:12]
  wire  newMatchVec_3_1 = newMatchVec_REG_16 & tlb_req_1_valid_REG; // @[Repeater.scala 197:38]
  reg  newMatchVec_REG_17; // @[Repeater.scala 197:12]
  wire  newMatchVec_3_2 = newMatchVec_REG_17 & tlb_req_2_valid_REG; // @[Repeater.scala 197:38]
  wire [2:0] _reqs_reqs_merge_T_8 = {newMatchVec_3_0,newMatchVec_3_1,newMatchVec_3_2}; // @[Cat.scala 31:58]
  wire  _reqs_reqs_merge_T_9 = |_reqs_reqs_merge_T_8; // @[Repeater.scala 210:41]
  wire  reqs_reqs_merge_3 = ptwResp_newMatchVec_3 | oldMatchVec_3 | _reqs_reqs_merge_T_9; // @[Repeater.scala 209:54]
  reg  tlb_req_3_valid_REG; // @[Repeater.scala 188:32]
  wire  reqs_3_valid = ~reqs_reqs_merge_3 & tlb_req_3_valid_REG; // @[Repeater.scala 218:27]
  wire [1:0] _enqNum_T_2 = {{1'd0}, reqs_3_valid}; // @[Bitwise.scala 48:55]
  wire [1:0] _GEN_1010 = {{1'd0}, reqs_2_valid}; // @[Bitwise.scala 48:55]
  wire [2:0] _enqNum_T_4 = _GEN_1010 + _enqNum_T_2; // @[Bitwise.scala 48:55]
  wire [2:0] enqNum = _enqNum_T + _enqNum_T_4[1:0]; // @[Bitwise.scala 48:55]
  wire [3:0] _GEN_1011 = {{1'd0}, enqNum}; // @[Repeater.scala 233:25]
  wire [4:0] _canEnqueue_T = counter + _GEN_1011; // @[Repeater.scala 233:25]
  wire  canEnqueue = _canEnqueue_T <= 5'h8; // @[Repeater.scala 233:35]
  wire  lastReqMatchVec_early_0_0 = tlb_req_0_valid_REG & tlb_req_0_bits_rvpn == io_tlb_req_0_bits_vpn & canEnqueue; // @[Repeater.scala 184:106]
  wire  lastReqMatchVec_early_0_1 = tlb_req_1_valid_REG & tlb_req_1_bits_rvpn == io_tlb_req_0_bits_vpn & canEnqueue; // @[Repeater.scala 184:106]
  wire  lastReqMatchVec_early_0_2 = tlb_req_2_valid_REG & tlb_req_2_bits_rvpn == io_tlb_req_0_bits_vpn & canEnqueue; // @[Repeater.scala 184:106]
  wire  lastReqMatchVec_early_0_3 = tlb_req_3_valid_REG & tlb_req_3_bits_rvpn == io_tlb_req_0_bits_vpn & canEnqueue; // @[Repeater.scala 184:106]
  wire  lastReqMatchVec_early_1_0 = tlb_req_0_valid_REG & tlb_req_0_bits_rvpn == io_tlb_req_1_bits_vpn & canEnqueue; // @[Repeater.scala 184:106]
  wire  lastReqMatchVec_early_1_1 = tlb_req_1_valid_REG & tlb_req_1_bits_rvpn == io_tlb_req_1_bits_vpn & canEnqueue; // @[Repeater.scala 184:106]
  wire  lastReqMatchVec_early_1_2 = tlb_req_2_valid_REG & tlb_req_2_bits_rvpn == io_tlb_req_1_bits_vpn & canEnqueue; // @[Repeater.scala 184:106]
  wire  lastReqMatchVec_early_1_3 = tlb_req_3_valid_REG & tlb_req_3_bits_rvpn == io_tlb_req_1_bits_vpn & canEnqueue; // @[Repeater.scala 184:106]
  wire  lastReqMatchVec_early_2_0 = tlb_req_0_valid_REG & tlb_req_0_bits_rvpn == io_tlb_req_2_bits_vpn & canEnqueue; // @[Repeater.scala 184:106]
  wire  lastReqMatchVec_early_2_1 = tlb_req_1_valid_REG & tlb_req_1_bits_rvpn == io_tlb_req_2_bits_vpn & canEnqueue; // @[Repeater.scala 184:106]
  wire  lastReqMatchVec_early_2_2 = tlb_req_2_valid_REG & tlb_req_2_bits_rvpn == io_tlb_req_2_bits_vpn & canEnqueue; // @[Repeater.scala 184:106]
  wire  lastReqMatchVec_early_2_3 = tlb_req_3_valid_REG & tlb_req_3_bits_rvpn == io_tlb_req_2_bits_vpn & canEnqueue; // @[Repeater.scala 184:106]
  wire  lastReqMatchVec_early_3_0 = tlb_req_0_valid_REG & tlb_req_0_bits_rvpn == io_tlb_req_3_bits_vpn & canEnqueue; // @[Repeater.scala 184:106]
  wire  lastReqMatchVec_early_3_1 = tlb_req_1_valid_REG & tlb_req_1_bits_rvpn == io_tlb_req_3_bits_vpn & canEnqueue; // @[Repeater.scala 184:106]
  wire  lastReqMatchVec_early_3_2 = tlb_req_2_valid_REG & tlb_req_2_bits_rvpn == io_tlb_req_3_bits_vpn & canEnqueue; // @[Repeater.scala 184:106]
  wire  lastReqMatchVec_early_3_3 = tlb_req_3_valid_REG & tlb_req_3_bits_rvpn == io_tlb_req_3_bits_vpn & canEnqueue; // @[Repeater.scala 184:106]
  wire  tlb_req_0_valid_hit0 = ptwResp_entry_tag[26:18] == io_tlb_req_0_bits_vpn[26:18]; // @[MMUBundle.scala 581:48]
  wire  tlb_req_0_valid_hit1 = ptwResp_entry_tag[17:9] == io_tlb_req_0_bits_vpn[17:9]; // @[MMUBundle.scala 582:48]
  wire  tlb_req_0_valid_hit2 = ptwResp_entry_tag[8:0] == io_tlb_req_0_bits_vpn[8:0]; // @[MMUBundle.scala 583:50]
  wire  _tlb_req_0_valid_T_5 = ptwResp_entry_level == 2'h1 ? tlb_req_0_valid_hit1 & tlb_req_0_valid_hit0 :
    tlb_req_0_valid_hit0; // @[MMUBundle.scala 585:78]
  wire  _tlb_req_0_valid_T_6 = ptwResp_entry_level == 2'h2 ? tlb_req_0_valid_hit2 & tlb_req_0_valid_hit1 &
    tlb_req_0_valid_hit0 : _tlb_req_0_valid_T_5; // @[MMUBundle.scala 585:22]
  wire  _tlb_req_0_valid_T_9 = ~(ptwResp_valid & _tlb_req_0_valid_T_6); // @[Repeater.scala 189:7]
  wire  _tlb_req_0_valid_T_10 = io_tlb_req_0_valid & _tlb_req_0_valid_T_9; // @[Repeater.scala 188:53]
  wire [4:0] _tlb_req_0_valid_T_11 = {lastReqMatchVec_early_0_0,lastReqMatchVec_early_0_1,lastReqMatchVec_early_0_2,
    lastReqMatchVec_early_0_3,1'h0}; // @[Cat.scala 31:58]
  wire  _tlb_req_0_valid_T_13 = ~(|_tlb_req_0_valid_T_11); // @[Repeater.scala 190:7]
  wire  tlb_req_1_valid_hit0 = ptwResp_entry_tag[26:18] == io_tlb_req_1_bits_vpn[26:18]; // @[MMUBundle.scala 581:48]
  wire  tlb_req_1_valid_hit1 = ptwResp_entry_tag[17:9] == io_tlb_req_1_bits_vpn[17:9]; // @[MMUBundle.scala 582:48]
  wire  tlb_req_1_valid_hit2 = ptwResp_entry_tag[8:0] == io_tlb_req_1_bits_vpn[8:0]; // @[MMUBundle.scala 583:50]
  wire  _tlb_req_1_valid_T_5 = ptwResp_entry_level == 2'h1 ? tlb_req_1_valid_hit1 & tlb_req_1_valid_hit0 :
    tlb_req_1_valid_hit0; // @[MMUBundle.scala 585:78]
  wire  _tlb_req_1_valid_T_6 = ptwResp_entry_level == 2'h2 ? tlb_req_1_valid_hit2 & tlb_req_1_valid_hit1 &
    tlb_req_1_valid_hit0 : _tlb_req_1_valid_T_5; // @[MMUBundle.scala 585:22]
  wire  _tlb_req_1_valid_T_9 = ~(ptwResp_valid & _tlb_req_1_valid_T_6); // @[Repeater.scala 189:7]
  wire  _tlb_req_1_valid_T_10 = io_tlb_req_1_valid & _tlb_req_1_valid_T_9; // @[Repeater.scala 188:53]
  wire [4:0] _tlb_req_1_valid_T_11 = {lastReqMatchVec_early_1_0,lastReqMatchVec_early_1_1,lastReqMatchVec_early_1_2,
    lastReqMatchVec_early_1_3,1'h0}; // @[Cat.scala 31:58]
  wire  _tlb_req_1_valid_T_13 = ~(|_tlb_req_1_valid_T_11); // @[Repeater.scala 190:7]
  wire  tlb_req_2_valid_hit0 = ptwResp_entry_tag[26:18] == io_tlb_req_2_bits_vpn[26:18]; // @[MMUBundle.scala 581:48]
  wire  tlb_req_2_valid_hit1 = ptwResp_entry_tag[17:9] == io_tlb_req_2_bits_vpn[17:9]; // @[MMUBundle.scala 582:48]
  wire  tlb_req_2_valid_hit2 = ptwResp_entry_tag[8:0] == io_tlb_req_2_bits_vpn[8:0]; // @[MMUBundle.scala 583:50]
  wire  _tlb_req_2_valid_T_5 = ptwResp_entry_level == 2'h1 ? tlb_req_2_valid_hit1 & tlb_req_2_valid_hit0 :
    tlb_req_2_valid_hit0; // @[MMUBundle.scala 585:78]
  wire  _tlb_req_2_valid_T_6 = ptwResp_entry_level == 2'h2 ? tlb_req_2_valid_hit2 & tlb_req_2_valid_hit1 &
    tlb_req_2_valid_hit0 : _tlb_req_2_valid_T_5; // @[MMUBundle.scala 585:22]
  wire  _tlb_req_2_valid_T_9 = ~(ptwResp_valid & _tlb_req_2_valid_T_6); // @[Repeater.scala 189:7]
  wire  _tlb_req_2_valid_T_10 = io_tlb_req_2_valid & _tlb_req_2_valid_T_9; // @[Repeater.scala 188:53]
  wire [4:0] _tlb_req_2_valid_T_11 = {lastReqMatchVec_early_2_0,lastReqMatchVec_early_2_1,lastReqMatchVec_early_2_2,
    lastReqMatchVec_early_2_3,1'h0}; // @[Cat.scala 31:58]
  wire  _tlb_req_2_valid_T_13 = ~(|_tlb_req_2_valid_T_11); // @[Repeater.scala 190:7]
  wire  tlb_req_3_valid_hit0 = ptwResp_entry_tag[26:18] == io_tlb_req_3_bits_vpn[26:18]; // @[MMUBundle.scala 581:48]
  wire  tlb_req_3_valid_hit1 = ptwResp_entry_tag[17:9] == io_tlb_req_3_bits_vpn[17:9]; // @[MMUBundle.scala 582:48]
  wire  tlb_req_3_valid_hit2 = ptwResp_entry_tag[8:0] == io_tlb_req_3_bits_vpn[8:0]; // @[MMUBundle.scala 583:50]
  wire  _tlb_req_3_valid_T_5 = ptwResp_entry_level == 2'h1 ? tlb_req_3_valid_hit1 & tlb_req_3_valid_hit0 :
    tlb_req_3_valid_hit0; // @[MMUBundle.scala 585:78]
  wire  _tlb_req_3_valid_T_6 = ptwResp_entry_level == 2'h2 ? tlb_req_3_valid_hit2 & tlb_req_3_valid_hit1 &
    tlb_req_3_valid_hit0 : _tlb_req_3_valid_T_5; // @[MMUBundle.scala 585:22]
  wire  _tlb_req_3_valid_T_9 = ~(ptwResp_valid & _tlb_req_3_valid_T_6); // @[Repeater.scala 189:7]
  wire  _tlb_req_3_valid_T_10 = io_tlb_req_3_valid & _tlb_req_3_valid_T_9; // @[Repeater.scala 188:53]
  wire [4:0] _tlb_req_3_valid_T_11 = {lastReqMatchVec_early_3_0,lastReqMatchVec_early_3_1,lastReqMatchVec_early_3_2,
    lastReqMatchVec_early_3_3,1'h0}; // @[Cat.scala 31:58]
  wire  _tlb_req_3_valid_T_13 = ~(|_tlb_req_3_valid_T_11); // @[Repeater.scala 190:7]
  wire [7:0] _oldMatchVec_T = {oldMatchVec_early_0_0,oldMatchVec_early_0_1,oldMatchVec_early_0_2,oldMatchVec_early_0_3,
    oldMatchVec_early_0_4,oldMatchVec_early_0_5,oldMatchVec_early_0_6,oldMatchVec_early_0_7}; // @[Cat.scala 31:58]
  wire [7:0] _oldMatchVec_T_2 = {oldMatchVec_early_1_0,oldMatchVec_early_1_1,oldMatchVec_early_1_2,oldMatchVec_early_1_3
    ,oldMatchVec_early_1_4,oldMatchVec_early_1_5,oldMatchVec_early_1_6,oldMatchVec_early_1_7}; // @[Cat.scala 31:58]
  wire [7:0] _oldMatchVec_T_4 = {oldMatchVec_early_2_0,oldMatchVec_early_2_1,oldMatchVec_early_2_2,oldMatchVec_early_2_3
    ,oldMatchVec_early_2_4,oldMatchVec_early_2_5,oldMatchVec_early_2_6,oldMatchVec_early_2_7}; // @[Cat.scala 31:58]
  wire [7:0] _oldMatchVec_T_6 = {oldMatchVec_early_3_0,oldMatchVec_early_3_1,oldMatchVec_early_3_2,oldMatchVec_early_3_3
    ,oldMatchVec_early_3_4,oldMatchVec_early_3_5,oldMatchVec_early_3_6,oldMatchVec_early_3_7}; // @[Cat.scala 31:58]
  reg  newMatchVec_REG_1; // @[Repeater.scala 197:12]
  wire  newMatchVec_0_1 = newMatchVec_REG_1 & tlb_req_1_valid_REG; // @[Repeater.scala 197:38]
  reg  newMatchVec_REG_2; // @[Repeater.scala 197:12]
  wire  newMatchVec_0_2 = newMatchVec_REG_2 & tlb_req_2_valid_REG; // @[Repeater.scala 197:38]
  reg  newMatchVec_REG_3; // @[Repeater.scala 197:12]
  wire  newMatchVec_0_3 = newMatchVec_REG_3 & tlb_req_3_valid_REG; // @[Repeater.scala 197:38]
  reg  newMatchVec_REG_7; // @[Repeater.scala 197:12]
  wire  newMatchVec_1_2 = newMatchVec_REG_7 & tlb_req_2_valid_REG; // @[Repeater.scala 197:38]
  reg  newMatchVec_REG_8; // @[Repeater.scala 197:12]
  wire  newMatchVec_1_3 = newMatchVec_REG_8 & tlb_req_3_valid_REG; // @[Repeater.scala 197:38]
  reg  newMatchVec_REG_13; // @[Repeater.scala 197:12]
  wire  newMatchVec_2_3 = newMatchVec_REG_13 & tlb_req_3_valid_REG; // @[Repeater.scala 197:38]
  reg  oldMatchVec2_REG; // @[Repeater.scala 202:79]
  reg  oldMatchVec2_REG_1; // @[Repeater.scala 202:79]
  reg  oldMatchVec2_REG_2; // @[Repeater.scala 202:79]
  reg  oldMatchVec2_REG_3; // @[Repeater.scala 202:79]
  reg  oldMatchVec2_REG_4; // @[Repeater.scala 202:79]
  reg  oldMatchVec2_REG_5; // @[Repeater.scala 202:79]
  reg  oldMatchVec2_REG_6; // @[Repeater.scala 202:79]
  reg  oldMatchVec2_REG_7; // @[Repeater.scala 202:79]
  wire  oldMatchVec2_0_0 = oldMatchVec2_REG & tlb_req_0_valid_REG; // @[Repeater.scala 202:90]
  wire  oldMatchVec2_0_1 = oldMatchVec2_REG_1 & tlb_req_0_valid_REG; // @[Repeater.scala 202:90]
  wire  oldMatchVec2_0_2 = oldMatchVec2_REG_2 & tlb_req_0_valid_REG; // @[Repeater.scala 202:90]
  wire  oldMatchVec2_0_3 = oldMatchVec2_REG_3 & tlb_req_0_valid_REG; // @[Repeater.scala 202:90]
  wire  oldMatchVec2_0_4 = oldMatchVec2_REG_4 & tlb_req_0_valid_REG; // @[Repeater.scala 202:90]
  wire  oldMatchVec2_0_5 = oldMatchVec2_REG_5 & tlb_req_0_valid_REG; // @[Repeater.scala 202:90]
  wire  oldMatchVec2_0_6 = oldMatchVec2_REG_6 & tlb_req_0_valid_REG; // @[Repeater.scala 202:90]
  wire  oldMatchVec2_0_7 = oldMatchVec2_REG_7 & tlb_req_0_valid_REG; // @[Repeater.scala 202:90]
  reg  oldMatchVec2_REG_8; // @[Repeater.scala 202:79]
  reg  oldMatchVec2_REG_9; // @[Repeater.scala 202:79]
  reg  oldMatchVec2_REG_10; // @[Repeater.scala 202:79]
  reg  oldMatchVec2_REG_11; // @[Repeater.scala 202:79]
  reg  oldMatchVec2_REG_12; // @[Repeater.scala 202:79]
  reg  oldMatchVec2_REG_13; // @[Repeater.scala 202:79]
  reg  oldMatchVec2_REG_14; // @[Repeater.scala 202:79]
  reg  oldMatchVec2_REG_15; // @[Repeater.scala 202:79]
  wire  oldMatchVec2_1_0 = oldMatchVec2_REG_8 & tlb_req_1_valid_REG; // @[Repeater.scala 202:90]
  wire  oldMatchVec2_1_1 = oldMatchVec2_REG_9 & tlb_req_1_valid_REG; // @[Repeater.scala 202:90]
  wire  oldMatchVec2_1_2 = oldMatchVec2_REG_10 & tlb_req_1_valid_REG; // @[Repeater.scala 202:90]
  wire  oldMatchVec2_1_3 = oldMatchVec2_REG_11 & tlb_req_1_valid_REG; // @[Repeater.scala 202:90]
  wire  oldMatchVec2_1_4 = oldMatchVec2_REG_12 & tlb_req_1_valid_REG; // @[Repeater.scala 202:90]
  wire  oldMatchVec2_1_5 = oldMatchVec2_REG_13 & tlb_req_1_valid_REG; // @[Repeater.scala 202:90]
  wire  oldMatchVec2_1_6 = oldMatchVec2_REG_14 & tlb_req_1_valid_REG; // @[Repeater.scala 202:90]
  wire  oldMatchVec2_1_7 = oldMatchVec2_REG_15 & tlb_req_1_valid_REG; // @[Repeater.scala 202:90]
  reg  oldMatchVec2_REG_16; // @[Repeater.scala 202:79]
  reg  oldMatchVec2_REG_17; // @[Repeater.scala 202:79]
  reg  oldMatchVec2_REG_18; // @[Repeater.scala 202:79]
  reg  oldMatchVec2_REG_19; // @[Repeater.scala 202:79]
  reg  oldMatchVec2_REG_20; // @[Repeater.scala 202:79]
  reg  oldMatchVec2_REG_21; // @[Repeater.scala 202:79]
  reg  oldMatchVec2_REG_22; // @[Repeater.scala 202:79]
  reg  oldMatchVec2_REG_23; // @[Repeater.scala 202:79]
  wire  oldMatchVec2_2_0 = oldMatchVec2_REG_16 & tlb_req_2_valid_REG; // @[Repeater.scala 202:90]
  wire  oldMatchVec2_2_1 = oldMatchVec2_REG_17 & tlb_req_2_valid_REG; // @[Repeater.scala 202:90]
  wire  oldMatchVec2_2_2 = oldMatchVec2_REG_18 & tlb_req_2_valid_REG; // @[Repeater.scala 202:90]
  wire  oldMatchVec2_2_3 = oldMatchVec2_REG_19 & tlb_req_2_valid_REG; // @[Repeater.scala 202:90]
  wire  oldMatchVec2_2_4 = oldMatchVec2_REG_20 & tlb_req_2_valid_REG; // @[Repeater.scala 202:90]
  wire  oldMatchVec2_2_5 = oldMatchVec2_REG_21 & tlb_req_2_valid_REG; // @[Repeater.scala 202:90]
  wire  oldMatchVec2_2_6 = oldMatchVec2_REG_22 & tlb_req_2_valid_REG; // @[Repeater.scala 202:90]
  wire  oldMatchVec2_2_7 = oldMatchVec2_REG_23 & tlb_req_2_valid_REG; // @[Repeater.scala 202:90]
  reg  oldMatchVec2_REG_24; // @[Repeater.scala 202:79]
  reg  oldMatchVec2_REG_25; // @[Repeater.scala 202:79]
  reg  oldMatchVec2_REG_26; // @[Repeater.scala 202:79]
  reg  oldMatchVec2_REG_27; // @[Repeater.scala 202:79]
  reg  oldMatchVec2_REG_28; // @[Repeater.scala 202:79]
  reg  oldMatchVec2_REG_29; // @[Repeater.scala 202:79]
  reg  oldMatchVec2_REG_30; // @[Repeater.scala 202:79]
  reg  oldMatchVec2_REG_31; // @[Repeater.scala 202:79]
  wire  oldMatchVec2_3_0 = oldMatchVec2_REG_24 & tlb_req_3_valid_REG; // @[Repeater.scala 202:90]
  wire  oldMatchVec2_3_1 = oldMatchVec2_REG_25 & tlb_req_3_valid_REG; // @[Repeater.scala 202:90]
  wire  oldMatchVec2_3_2 = oldMatchVec2_REG_26 & tlb_req_3_valid_REG; // @[Repeater.scala 202:90]
  wire  oldMatchVec2_3_3 = oldMatchVec2_REG_27 & tlb_req_3_valid_REG; // @[Repeater.scala 202:90]
  wire  oldMatchVec2_3_4 = oldMatchVec2_REG_28 & tlb_req_3_valid_REG; // @[Repeater.scala 202:90]
  wire  oldMatchVec2_3_5 = oldMatchVec2_REG_29 & tlb_req_3_valid_REG; // @[Repeater.scala 202:90]
  wire  oldMatchVec2_3_6 = oldMatchVec2_REG_30 & tlb_req_3_valid_REG; // @[Repeater.scala 202:90]
  wire  oldMatchVec2_3_7 = oldMatchVec2_REG_31 & tlb_req_3_valid_REG; // @[Repeater.scala 202:90]
  wire [4:0] filter_ports_xs_0 = tlb_req_0_valid_REG ? 5'h1 : 5'h0; // @[ParallelMux.scala 64:44]
  wire [4:0] filter_ports_xs_1 = newMatchVec_0_1 ? 5'h2 : 5'h0; // @[ParallelMux.scala 64:44]
  wire [4:0] filter_ports_xs_2 = newMatchVec_0_2 ? 5'h4 : 5'h0; // @[ParallelMux.scala 64:44]
  wire [4:0] filter_ports_xs_3 = newMatchVec_0_3 ? 5'h8 : 5'h0; // @[ParallelMux.scala 64:44]
  wire [4:0] _filter_ports_T = filter_ports_xs_0 | filter_ports_xs_1; // @[ParallelMux.scala 36:53]
  wire [4:0] _filter_ports_T_2 = filter_ports_xs_2 | filter_ports_xs_3; // @[ParallelMux.scala 36:53]
  wire [4:0] filter_ports_0 = _filter_ports_T | _filter_ports_T_2; // @[ParallelMux.scala 36:53]
  wire [4:0] filter_ports_xs_0_1 = tlb_req_1_valid_REG ? 5'h2 : 5'h0; // @[ParallelMux.scala 64:44]
  wire [4:0] filter_ports_xs_1_1 = newMatchVec_1_2 ? 5'h4 : 5'h0; // @[ParallelMux.scala 64:44]
  wire [4:0] filter_ports_xs_2_1 = newMatchVec_1_3 ? 5'h8 : 5'h0; // @[ParallelMux.scala 64:44]
  wire [4:0] _filter_ports_T_4 = filter_ports_xs_0_1 | filter_ports_xs_1_1; // @[ParallelMux.scala 36:53]
  wire [4:0] filter_ports_1 = _filter_ports_T_4 | filter_ports_xs_2_1; // @[ParallelMux.scala 36:53]
  wire [4:0] filter_ports_xs_0_2 = tlb_req_2_valid_REG ? 5'h4 : 5'h0; // @[ParallelMux.scala 64:44]
  wire [4:0] filter_ports_xs_1_2 = newMatchVec_2_3 ? 5'h8 : 5'h0; // @[ParallelMux.scala 64:44]
  wire [4:0] filter_ports_2 = filter_ports_xs_0_2 | filter_ports_xs_1_2; // @[ParallelMux.scala 36:53]
  wire [4:0] filter_ports_xs_0_3 = tlb_req_3_valid_REG ? 5'h8 : 5'h0; // @[ParallelMux.scala 64:44]
  wire  resp_vector_xs_0_0 = ptwResp_OldMatchVec_0 & ports_0_0; // @[ParallelMux.scala 64:44]
  wire  resp_vector_xs_0_1 = ptwResp_OldMatchVec_0 & ports_0_1; // @[ParallelMux.scala 64:44]
  wire  resp_vector_xs_0_2 = ptwResp_OldMatchVec_0 & ports_0_2; // @[ParallelMux.scala 64:44]
  wire  resp_vector_xs_0_3 = ptwResp_OldMatchVec_0 & ports_0_3; // @[ParallelMux.scala 64:44]
  wire  resp_vector_xs_0_4 = ptwResp_OldMatchVec_0 & ports_0_4; // @[ParallelMux.scala 64:44]
  wire  resp_vector_xs_1_0 = ptwResp_OldMatchVec_1 & ports_1_0; // @[ParallelMux.scala 64:44]
  wire  resp_vector_xs_1_1 = ptwResp_OldMatchVec_1 & ports_1_1; // @[ParallelMux.scala 64:44]
  wire  resp_vector_xs_1_2 = ptwResp_OldMatchVec_1 & ports_1_2; // @[ParallelMux.scala 64:44]
  wire  resp_vector_xs_1_3 = ptwResp_OldMatchVec_1 & ports_1_3; // @[ParallelMux.scala 64:44]
  wire  resp_vector_xs_1_4 = ptwResp_OldMatchVec_1 & ports_1_4; // @[ParallelMux.scala 64:44]
  wire  resp_vector_xs_2_0 = ptwResp_OldMatchVec_2 & ports_2_0; // @[ParallelMux.scala 64:44]
  wire  resp_vector_xs_2_1 = ptwResp_OldMatchVec_2 & ports_2_1; // @[ParallelMux.scala 64:44]
  wire  resp_vector_xs_2_2 = ptwResp_OldMatchVec_2 & ports_2_2; // @[ParallelMux.scala 64:44]
  wire  resp_vector_xs_2_3 = ptwResp_OldMatchVec_2 & ports_2_3; // @[ParallelMux.scala 64:44]
  wire  resp_vector_xs_2_4 = ptwResp_OldMatchVec_2 & ports_2_4; // @[ParallelMux.scala 64:44]
  wire  resp_vector_xs_3_0 = ptwResp_OldMatchVec_3 & ports_3_0; // @[ParallelMux.scala 64:44]
  wire  resp_vector_xs_3_1 = ptwResp_OldMatchVec_3 & ports_3_1; // @[ParallelMux.scala 64:44]
  wire  resp_vector_xs_3_2 = ptwResp_OldMatchVec_3 & ports_3_2; // @[ParallelMux.scala 64:44]
  wire  resp_vector_xs_3_3 = ptwResp_OldMatchVec_3 & ports_3_3; // @[ParallelMux.scala 64:44]
  wire  resp_vector_xs_3_4 = ptwResp_OldMatchVec_3 & ports_3_4; // @[ParallelMux.scala 64:44]
  wire  resp_vector_xs_4_0 = ptwResp_OldMatchVec_4 & ports_4_0; // @[ParallelMux.scala 64:44]
  wire  resp_vector_xs_4_1 = ptwResp_OldMatchVec_4 & ports_4_1; // @[ParallelMux.scala 64:44]
  wire  resp_vector_xs_4_2 = ptwResp_OldMatchVec_4 & ports_4_2; // @[ParallelMux.scala 64:44]
  wire  resp_vector_xs_4_3 = ptwResp_OldMatchVec_4 & ports_4_3; // @[ParallelMux.scala 64:44]
  wire  resp_vector_xs_4_4 = ptwResp_OldMatchVec_4 & ports_4_4; // @[ParallelMux.scala 64:44]
  wire  resp_vector_xs_5_0 = ptwResp_OldMatchVec_5 & ports_5_0; // @[ParallelMux.scala 64:44]
  wire  resp_vector_xs_5_1 = ptwResp_OldMatchVec_5 & ports_5_1; // @[ParallelMux.scala 64:44]
  wire  resp_vector_xs_5_2 = ptwResp_OldMatchVec_5 & ports_5_2; // @[ParallelMux.scala 64:44]
  wire  resp_vector_xs_5_3 = ptwResp_OldMatchVec_5 & ports_5_3; // @[ParallelMux.scala 64:44]
  wire  resp_vector_xs_5_4 = ptwResp_OldMatchVec_5 & ports_5_4; // @[ParallelMux.scala 64:44]
  wire  resp_vector_xs_6_0 = ptwResp_OldMatchVec_6 & ports_6_0; // @[ParallelMux.scala 64:44]
  wire  resp_vector_xs_6_1 = ptwResp_OldMatchVec_6 & ports_6_1; // @[ParallelMux.scala 64:44]
  wire  resp_vector_xs_6_2 = ptwResp_OldMatchVec_6 & ports_6_2; // @[ParallelMux.scala 64:44]
  wire  resp_vector_xs_6_3 = ptwResp_OldMatchVec_6 & ports_6_3; // @[ParallelMux.scala 64:44]
  wire  resp_vector_xs_6_4 = ptwResp_OldMatchVec_6 & ports_6_4; // @[ParallelMux.scala 64:44]
  wire  resp_vector_xs_7_0 = ptwResp_OldMatchVec_7 & ports_7_0; // @[ParallelMux.scala 64:44]
  wire  resp_vector_xs_7_1 = ptwResp_OldMatchVec_7 & ports_7_1; // @[ParallelMux.scala 64:44]
  wire  resp_vector_xs_7_2 = ptwResp_OldMatchVec_7 & ports_7_2; // @[ParallelMux.scala 64:44]
  wire  resp_vector_xs_7_3 = ptwResp_OldMatchVec_7 & ports_7_3; // @[ParallelMux.scala 64:44]
  wire  resp_vector_xs_7_4 = ptwResp_OldMatchVec_7 & ports_7_4; // @[ParallelMux.scala 64:44]
  wire [4:0] _resp_vector_T = {resp_vector_xs_0_4,resp_vector_xs_0_3,resp_vector_xs_0_2,resp_vector_xs_0_1,
    resp_vector_xs_0_0}; // @[ParallelMux.scala 36:46]
  wire [4:0] _resp_vector_T_1 = {resp_vector_xs_1_4,resp_vector_xs_1_3,resp_vector_xs_1_2,resp_vector_xs_1_1,
    resp_vector_xs_1_0}; // @[ParallelMux.scala 36:57]
  wire [4:0] _resp_vector_T_2 = _resp_vector_T | _resp_vector_T_1; // @[ParallelMux.scala 36:53]
  wire [4:0] _resp_vector_T_8 = {resp_vector_xs_2_4,resp_vector_xs_2_3,resp_vector_xs_2_2,resp_vector_xs_2_1,
    resp_vector_xs_2_0}; // @[ParallelMux.scala 36:46]
  wire [4:0] _resp_vector_T_9 = {resp_vector_xs_3_4,resp_vector_xs_3_3,resp_vector_xs_3_2,resp_vector_xs_3_1,
    resp_vector_xs_3_0}; // @[ParallelMux.scala 36:57]
  wire [4:0] _resp_vector_T_10 = _resp_vector_T_8 | _resp_vector_T_9; // @[ParallelMux.scala 36:53]
  wire [4:0] _resp_vector_T_16 = {_resp_vector_T_2[4],_resp_vector_T_2[3],_resp_vector_T_2[2],_resp_vector_T_2[1],
    _resp_vector_T_2[0]}; // @[ParallelMux.scala 36:46]
  wire [4:0] _resp_vector_T_17 = {_resp_vector_T_10[4],_resp_vector_T_10[3],_resp_vector_T_10[2],_resp_vector_T_10[1],
    _resp_vector_T_10[0]}; // @[ParallelMux.scala 36:57]
  wire [4:0] _resp_vector_T_18 = _resp_vector_T_16 | _resp_vector_T_17; // @[ParallelMux.scala 36:53]
  wire [4:0] _resp_vector_T_24 = {resp_vector_xs_4_4,resp_vector_xs_4_3,resp_vector_xs_4_2,resp_vector_xs_4_1,
    resp_vector_xs_4_0}; // @[ParallelMux.scala 36:46]
  wire [4:0] _resp_vector_T_25 = {resp_vector_xs_5_4,resp_vector_xs_5_3,resp_vector_xs_5_2,resp_vector_xs_5_1,
    resp_vector_xs_5_0}; // @[ParallelMux.scala 36:57]
  wire [4:0] _resp_vector_T_26 = _resp_vector_T_24 | _resp_vector_T_25; // @[ParallelMux.scala 36:53]
  wire [4:0] _resp_vector_T_32 = {resp_vector_xs_6_4,resp_vector_xs_6_3,resp_vector_xs_6_2,resp_vector_xs_6_1,
    resp_vector_xs_6_0}; // @[ParallelMux.scala 36:46]
  wire [4:0] _resp_vector_T_33 = {resp_vector_xs_7_4,resp_vector_xs_7_3,resp_vector_xs_7_2,resp_vector_xs_7_1,
    resp_vector_xs_7_0}; // @[ParallelMux.scala 36:57]
  wire [4:0] _resp_vector_T_34 = _resp_vector_T_32 | _resp_vector_T_33; // @[ParallelMux.scala 36:53]
  wire [4:0] _resp_vector_T_40 = {_resp_vector_T_26[4],_resp_vector_T_26[3],_resp_vector_T_26[2],_resp_vector_T_26[1],
    _resp_vector_T_26[0]}; // @[ParallelMux.scala 36:46]
  wire [4:0] _resp_vector_T_41 = {_resp_vector_T_34[4],_resp_vector_T_34[3],_resp_vector_T_34[2],_resp_vector_T_34[1],
    _resp_vector_T_34[0]}; // @[ParallelMux.scala 36:57]
  wire [4:0] _resp_vector_T_42 = _resp_vector_T_40 | _resp_vector_T_41; // @[ParallelMux.scala 36:53]
  wire [4:0] _resp_vector_T_48 = {_resp_vector_T_18[4],_resp_vector_T_18[3],_resp_vector_T_18[2],_resp_vector_T_18[1],
    _resp_vector_T_18[0]}; // @[ParallelMux.scala 36:46]
  wire [4:0] _resp_vector_T_49 = {_resp_vector_T_42[4],_resp_vector_T_42[3],_resp_vector_T_42[2],_resp_vector_T_42[1],
    _resp_vector_T_42[0]}; // @[ParallelMux.scala 36:57]
  wire [4:0] _resp_vector_T_50 = _resp_vector_T_48 | _resp_vector_T_49; // @[ParallelMux.scala 36:53]
  reg  resp_vector_0; // @[Reg.scala 16:16]
  reg  resp_vector_1; // @[Reg.scala 16:16]
  reg  resp_vector_2; // @[Reg.scala 16:16]
  reg  resp_vector_3; // @[Reg.scala 16:16]
  reg  resp_vector_4; // @[Reg.scala 16:16]
  wire  _isFull_T = enqPtr == deqPtr; // @[Repeater.scala 226:23]
  wire  isEmptyDeq = _isFull_T & ~mayFullDeq; // @[Repeater.scala 227:38]
  wire  isEmptyIss = enqPtr == issPtr & ~mayFullIss; // @[Repeater.scala 228:38]
  wire [1:0] _accumEnqNum_T_1 = reqs_1_valid + reqs_2_valid; // @[Bitwise.scala 48:55]
  wire [1:0] _GEN_1012 = {{1'd0}, reqs_0_valid}; // @[Bitwise.scala 48:55]
  wire [2:0] _accumEnqNum_T_3 = _GEN_1012 + _accumEnqNum_T_1; // @[Bitwise.scala 48:55]
  wire [1:0] accumEnqNum_3 = _accumEnqNum_T_3[1:0]; // @[Bitwise.scala 48:55]
  wire [3:0] _enqPtrVecInit_T = {{1'd0}, enqPtr}; // @[Repeater.scala 230:63]
  wire [2:0] enqPtrVecInit_0 = _enqPtrVecInit_T[2:0]; // @[Repeater.scala 230:63]
  wire [2:0] enqPtrVecInit_1 = enqPtr + 3'h1; // @[Repeater.scala 230:63]
  wire [2:0] enqPtrVecInit_2 = enqPtr + 3'h2; // @[Repeater.scala 230:63]
  wire [2:0] enqPtrVecInit_3 = enqPtr + 3'h3; // @[Repeater.scala 230:63]
  wire [2:0] enqPtrVecInit_4 = enqPtr + 3'h4; // @[Repeater.scala 230:63]
  wire [2:0] _GEN_42 = reqs_0_valid ? enqPtrVecInit_1 : enqPtrVecInit_0; // @[Repeater.scala 231:{26,26}]
  wire [2:0] _GEN_43 = 2'h2 == _GEN_1012 ? enqPtrVecInit_2 : _GEN_42; // @[Repeater.scala 231:{26,26}]
  wire [2:0] _GEN_44 = 2'h3 == _GEN_1012 ? enqPtrVecInit_3 : _GEN_43; // @[Repeater.scala 231:{26,26}]
  wire [2:0] _GEN_1015 = {{2'd0}, reqs_0_valid}; // @[Repeater.scala 231:{26,26}]
  wire [2:0] enqPtrVec_1 = 3'h4 == _GEN_1015 ? enqPtrVecInit_4 : _GEN_44; // @[Repeater.scala 231:{26,26}]
  wire [2:0] _GEN_47 = 2'h1 == _enqNum_T ? enqPtrVecInit_1 : enqPtrVecInit_0; // @[Repeater.scala 231:{26,26}]
  wire [2:0] _GEN_48 = 2'h2 == _enqNum_T ? enqPtrVecInit_2 : _GEN_47; // @[Repeater.scala 231:{26,26}]
  wire [2:0] _GEN_49 = 2'h3 == _enqNum_T ? enqPtrVecInit_3 : _GEN_48; // @[Repeater.scala 231:{26,26}]
  wire [2:0] _GEN_1016 = {{1'd0}, _enqNum_T}; // @[Repeater.scala 231:{26,26}]
  wire [2:0] enqPtrVec_2 = 3'h4 == _GEN_1016 ? enqPtrVecInit_4 : _GEN_49; // @[Repeater.scala 231:{26,26}]
  wire [2:0] _GEN_52 = 2'h1 == accumEnqNum_3 ? enqPtrVecInit_1 : enqPtrVecInit_0; // @[Repeater.scala 231:{26,26}]
  wire [2:0] _GEN_53 = 2'h2 == accumEnqNum_3 ? enqPtrVecInit_2 : _GEN_52; // @[Repeater.scala 231:{26,26}]
  wire [2:0] _GEN_54 = 2'h3 == accumEnqNum_3 ? enqPtrVecInit_3 : _GEN_53; // @[Repeater.scala 231:{26,26}]
  wire [2:0] _GEN_1017 = {{1'd0}, accumEnqNum_3}; // @[Repeater.scala 231:{26,26}]
  wire [2:0] enqPtrVec_3 = 3'h4 == _GEN_1017 ? enqPtrVecInit_4 : _GEN_54; // @[Repeater.scala 231:{26,26}]
  wire  tlb_req_flushed_hit0 = io_ptw_resp_bits_entry_tag[26:18] == tlb_req_0_bits_rvpn[26:18]; // @[MMUBundle.scala 581:48]
  wire  tlb_req_flushed_hit1 = io_ptw_resp_bits_entry_tag[17:9] == tlb_req_0_bits_rvpn[17:9]; // @[MMUBundle.scala 582:48]
  wire  tlb_req_flushed_hit2 = io_ptw_resp_bits_entry_tag[8:0] == tlb_req_0_bits_rvpn[8:0]; // @[MMUBundle.scala 583:50]
  wire  _tlb_req_flushed_T_5 = io_ptw_resp_bits_entry_level == 2'h1 ? tlb_req_flushed_hit1 & tlb_req_flushed_hit0 :
    tlb_req_flushed_hit0; // @[MMUBundle.scala 585:78]
  wire  _tlb_req_flushed_T_6 = io_ptw_resp_bits_entry_level == 2'h2 ? tlb_req_flushed_hit2 & tlb_req_flushed_hit1 &
    tlb_req_flushed_hit0 : _tlb_req_flushed_T_5; // @[MMUBundle.scala 585:22]
  wire  tlb_req_flushed_0 = io_ptw_resp_valid & _tlb_req_flushed_T_6; // @[Repeater.scala 242:57]
  wire  tlb_req_flushed_hit0_1 = io_ptw_resp_bits_entry_tag[26:18] == tlb_req_1_bits_rvpn[26:18]; // @[MMUBundle.scala 581:48]
  wire  tlb_req_flushed_hit1_1 = io_ptw_resp_bits_entry_tag[17:9] == tlb_req_1_bits_rvpn[17:9]; // @[MMUBundle.scala 582:48]
  wire  tlb_req_flushed_hit2_1 = io_ptw_resp_bits_entry_tag[8:0] == tlb_req_1_bits_rvpn[8:0]; // @[MMUBundle.scala 583:50]
  wire  _tlb_req_flushed_T_13 = io_ptw_resp_bits_entry_level == 2'h1 ? tlb_req_flushed_hit1_1 & tlb_req_flushed_hit0_1
     : tlb_req_flushed_hit0_1; // @[MMUBundle.scala 585:78]
  wire  _tlb_req_flushed_T_14 = io_ptw_resp_bits_entry_level == 2'h2 ? tlb_req_flushed_hit2_1 & tlb_req_flushed_hit1_1
     & tlb_req_flushed_hit0_1 : _tlb_req_flushed_T_13; // @[MMUBundle.scala 585:22]
  wire  tlb_req_flushed_1 = io_ptw_resp_valid & _tlb_req_flushed_T_14; // @[Repeater.scala 242:57]
  wire  tlb_req_flushed_hit0_2 = io_ptw_resp_bits_entry_tag[26:18] == tlb_req_2_bits_rvpn[26:18]; // @[MMUBundle.scala 581:48]
  wire  tlb_req_flushed_hit1_2 = io_ptw_resp_bits_entry_tag[17:9] == tlb_req_2_bits_rvpn[17:9]; // @[MMUBundle.scala 582:48]
  wire  tlb_req_flushed_hit2_2 = io_ptw_resp_bits_entry_tag[8:0] == tlb_req_2_bits_rvpn[8:0]; // @[MMUBundle.scala 583:50]
  wire  _tlb_req_flushed_T_21 = io_ptw_resp_bits_entry_level == 2'h1 ? tlb_req_flushed_hit1_2 & tlb_req_flushed_hit0_2
     : tlb_req_flushed_hit0_2; // @[MMUBundle.scala 585:78]
  wire  _tlb_req_flushed_T_22 = io_ptw_resp_bits_entry_level == 2'h2 ? tlb_req_flushed_hit2_2 & tlb_req_flushed_hit1_2
     & tlb_req_flushed_hit0_2 : _tlb_req_flushed_T_21; // @[MMUBundle.scala 585:22]
  wire  tlb_req_flushed_2 = io_ptw_resp_valid & _tlb_req_flushed_T_22; // @[Repeater.scala 242:57]
  wire  tlb_req_flushed_hit0_3 = io_ptw_resp_bits_entry_tag[26:18] == tlb_req_3_bits_rvpn[26:18]; // @[MMUBundle.scala 581:48]
  wire  tlb_req_flushed_hit1_3 = io_ptw_resp_bits_entry_tag[17:9] == tlb_req_3_bits_rvpn[17:9]; // @[MMUBundle.scala 582:48]
  wire  tlb_req_flushed_hit2_3 = io_ptw_resp_bits_entry_tag[8:0] == tlb_req_3_bits_rvpn[8:0]; // @[MMUBundle.scala 583:50]
  wire  _tlb_req_flushed_T_29 = io_ptw_resp_bits_entry_level == 2'h1 ? tlb_req_flushed_hit1_3 & tlb_req_flushed_hit0_3
     : tlb_req_flushed_hit0_3; // @[MMUBundle.scala 585:78]
  wire  _tlb_req_flushed_T_30 = io_ptw_resp_bits_entry_level == 2'h2 ? tlb_req_flushed_hit2_3 & tlb_req_flushed_hit1_3
     & tlb_req_flushed_hit0_3 : _tlb_req_flushed_T_29; // @[MMUBundle.scala 585:22]
  wire  tlb_req_flushed_3 = io_ptw_resp_valid & _tlb_req_flushed_T_30; // @[Repeater.scala 242:57]
  wire  _issue_valid_T = ~isEmptyIss; // @[Repeater.scala 251:34]
  wire  _GEN_86 = 3'h1 == issPtr ? v_1 : v_0; // @[Repeater.scala 251:{31,31}]
  wire  _GEN_87 = 3'h2 == issPtr ? v_2 : _GEN_86; // @[Repeater.scala 251:{31,31}]
  wire  _GEN_88 = 3'h3 == issPtr ? v_3 : _GEN_87; // @[Repeater.scala 251:{31,31}]
  wire  _GEN_89 = 3'h4 == issPtr ? v_4 : _GEN_88; // @[Repeater.scala 251:{31,31}]
  wire  _GEN_90 = 3'h5 == issPtr ? v_5 : _GEN_89; // @[Repeater.scala 251:{31,31}]
  wire  _GEN_91 = 3'h6 == issPtr ? v_6 : _GEN_90; // @[Repeater.scala 251:{31,31}]
  wire  _GEN_92 = 3'h7 == issPtr ? v_7 : _GEN_91; // @[Repeater.scala 251:{31,31}]
  wire  issue_valid = _GEN_92 & ~isEmptyIss & ~inflight_full; // @[Repeater.scala 251:46]
  wire  issue_filtered_hit0 = ptwResp_entry_tag[26:18] == io_ptw_req_0_bits_vpn[26:18]; // @[MMUBundle.scala 581:48]
  wire  issue_filtered_hit1 = ptwResp_entry_tag[17:9] == io_ptw_req_0_bits_vpn[17:9]; // @[MMUBundle.scala 582:48]
  wire  issue_filtered_hit2 = ptwResp_entry_tag[8:0] == io_ptw_req_0_bits_vpn[8:0]; // @[MMUBundle.scala 583:50]
  wire  _issue_filtered_T_5 = ptwResp_entry_level == 2'h1 ? issue_filtered_hit1 & issue_filtered_hit0 :
    issue_filtered_hit0; // @[MMUBundle.scala 585:78]
  wire  _issue_filtered_T_6 = ptwResp_entry_level == 2'h2 ? issue_filtered_hit2 & issue_filtered_hit1 &
    issue_filtered_hit0 : _issue_filtered_T_5; // @[MMUBundle.scala 585:22]
  wire  issue_filtered = ptwResp_valid & _issue_filtered_T_6; // @[Repeater.scala 252:38]
  wire  issue_fire_fake = issue_valid & io_ptw_req_0_ready; // @[Repeater.scala 253:37]
  wire [26:0] _GEN_94 = 3'h1 == issPtr ? vpn_1 : vpn_0; // @[Repeater.scala 255:{26,26}]
  wire [26:0] _GEN_95 = 3'h2 == issPtr ? vpn_2 : _GEN_94; // @[Repeater.scala 255:{26,26}]
  wire [26:0] _GEN_96 = 3'h3 == issPtr ? vpn_3 : _GEN_95; // @[Repeater.scala 255:{26,26}]
  wire [26:0] _GEN_97 = 3'h4 == issPtr ? vpn_4 : _GEN_96; // @[Repeater.scala 255:{26,26}]
  wire [26:0] _GEN_98 = 3'h5 == issPtr ? vpn_5 : _GEN_97; // @[Repeater.scala 255:{26,26}]
  wire [26:0] _GEN_99 = 3'h6 == issPtr ? vpn_6 : _GEN_98; // @[Repeater.scala 255:{26,26}]
  wire  _GEN_101 = 3'h0 == enqPtrVecInit_0 ? ~tlb_req_flushed_0 : v_0; // @[Repeater.scala 157:18 261:{25,25}]
  wire  _GEN_102 = 3'h1 == enqPtrVecInit_0 ? ~tlb_req_flushed_0 : v_1; // @[Repeater.scala 157:18 261:{25,25}]
  wire  _GEN_103 = 3'h2 == enqPtrVecInit_0 ? ~tlb_req_flushed_0 : v_2; // @[Repeater.scala 157:18 261:{25,25}]
  wire  _GEN_104 = 3'h3 == enqPtrVecInit_0 ? ~tlb_req_flushed_0 : v_3; // @[Repeater.scala 157:18 261:{25,25}]
  wire  _GEN_105 = 3'h4 == enqPtrVecInit_0 ? ~tlb_req_flushed_0 : v_4; // @[Repeater.scala 157:18 261:{25,25}]
  wire  _GEN_106 = 3'h5 == enqPtrVecInit_0 ? ~tlb_req_flushed_0 : v_5; // @[Repeater.scala 157:18 261:{25,25}]
  wire  _GEN_107 = 3'h6 == enqPtrVecInit_0 ? ~tlb_req_flushed_0 : v_6; // @[Repeater.scala 157:18 261:{25,25}]
  wire  _GEN_108 = 3'h7 == enqPtrVecInit_0 ? ~tlb_req_flushed_0 : v_7; // @[Repeater.scala 157:18 261:{25,25}]
  wire [26:0] _GEN_109 = 3'h0 == enqPtrVecInit_0 ? tlb_req_0_bits_rvpn : vpn_0; // @[Repeater.scala 159:16 262:{27,27}]
  wire [26:0] _GEN_110 = 3'h1 == enqPtrVecInit_0 ? tlb_req_0_bits_rvpn : vpn_1; // @[Repeater.scala 159:16 262:{27,27}]
  wire [26:0] _GEN_111 = 3'h2 == enqPtrVecInit_0 ? tlb_req_0_bits_rvpn : vpn_2; // @[Repeater.scala 159:16 262:{27,27}]
  wire [26:0] _GEN_112 = 3'h3 == enqPtrVecInit_0 ? tlb_req_0_bits_rvpn : vpn_3; // @[Repeater.scala 159:16 262:{27,27}]
  wire [26:0] _GEN_113 = 3'h4 == enqPtrVecInit_0 ? tlb_req_0_bits_rvpn : vpn_4; // @[Repeater.scala 159:16 262:{27,27}]
  wire [26:0] _GEN_114 = 3'h5 == enqPtrVecInit_0 ? tlb_req_0_bits_rvpn : vpn_5; // @[Repeater.scala 159:16 262:{27,27}]
  wire [26:0] _GEN_115 = 3'h6 == enqPtrVecInit_0 ? tlb_req_0_bits_rvpn : vpn_6; // @[Repeater.scala 159:16 262:{27,27}]
  wire [26:0] _GEN_116 = 3'h7 == enqPtrVecInit_0 ? tlb_req_0_bits_rvpn : vpn_7; // @[Repeater.scala 159:16 262:{27,27}]
  wire  _GEN_141 = 3'h0 == enqPtrVecInit_0 ? filter_ports_0[0] : ports_0_0; // @[Repeater.scala 158:18 264:{29,29}]
  wire  _GEN_142 = 3'h1 == enqPtrVecInit_0 ? filter_ports_0[0] : ports_1_0; // @[Repeater.scala 158:18 264:{29,29}]
  wire  _GEN_143 = 3'h2 == enqPtrVecInit_0 ? filter_ports_0[0] : ports_2_0; // @[Repeater.scala 158:18 264:{29,29}]
  wire  _GEN_144 = 3'h3 == enqPtrVecInit_0 ? filter_ports_0[0] : ports_3_0; // @[Repeater.scala 158:18 264:{29,29}]
  wire  _GEN_145 = 3'h4 == enqPtrVecInit_0 ? filter_ports_0[0] : ports_4_0; // @[Repeater.scala 158:18 264:{29,29}]
  wire  _GEN_146 = 3'h5 == enqPtrVecInit_0 ? filter_ports_0[0] : ports_5_0; // @[Repeater.scala 158:18 264:{29,29}]
  wire  _GEN_147 = 3'h6 == enqPtrVecInit_0 ? filter_ports_0[0] : ports_6_0; // @[Repeater.scala 158:18 264:{29,29}]
  wire  _GEN_148 = 3'h7 == enqPtrVecInit_0 ? filter_ports_0[0] : ports_7_0; // @[Repeater.scala 158:18 264:{29,29}]
  wire  _GEN_149 = 3'h0 == enqPtrVecInit_0 ? filter_ports_0[1] : ports_0_1; // @[Repeater.scala 158:18 264:{29,29}]
  wire  _GEN_150 = 3'h1 == enqPtrVecInit_0 ? filter_ports_0[1] : ports_1_1; // @[Repeater.scala 158:18 264:{29,29}]
  wire  _GEN_151 = 3'h2 == enqPtrVecInit_0 ? filter_ports_0[1] : ports_2_1; // @[Repeater.scala 158:18 264:{29,29}]
  wire  _GEN_152 = 3'h3 == enqPtrVecInit_0 ? filter_ports_0[1] : ports_3_1; // @[Repeater.scala 158:18 264:{29,29}]
  wire  _GEN_153 = 3'h4 == enqPtrVecInit_0 ? filter_ports_0[1] : ports_4_1; // @[Repeater.scala 158:18 264:{29,29}]
  wire  _GEN_154 = 3'h5 == enqPtrVecInit_0 ? filter_ports_0[1] : ports_5_1; // @[Repeater.scala 158:18 264:{29,29}]
  wire  _GEN_155 = 3'h6 == enqPtrVecInit_0 ? filter_ports_0[1] : ports_6_1; // @[Repeater.scala 158:18 264:{29,29}]
  wire  _GEN_156 = 3'h7 == enqPtrVecInit_0 ? filter_ports_0[1] : ports_7_1; // @[Repeater.scala 158:18 264:{29,29}]
  wire  _GEN_157 = 3'h0 == enqPtrVecInit_0 ? filter_ports_0[2] : ports_0_2; // @[Repeater.scala 158:18 264:{29,29}]
  wire  _GEN_158 = 3'h1 == enqPtrVecInit_0 ? filter_ports_0[2] : ports_1_2; // @[Repeater.scala 158:18 264:{29,29}]
  wire  _GEN_159 = 3'h2 == enqPtrVecInit_0 ? filter_ports_0[2] : ports_2_2; // @[Repeater.scala 158:18 264:{29,29}]
  wire  _GEN_160 = 3'h3 == enqPtrVecInit_0 ? filter_ports_0[2] : ports_3_2; // @[Repeater.scala 158:18 264:{29,29}]
  wire  _GEN_161 = 3'h4 == enqPtrVecInit_0 ? filter_ports_0[2] : ports_4_2; // @[Repeater.scala 158:18 264:{29,29}]
  wire  _GEN_162 = 3'h5 == enqPtrVecInit_0 ? filter_ports_0[2] : ports_5_2; // @[Repeater.scala 158:18 264:{29,29}]
  wire  _GEN_163 = 3'h6 == enqPtrVecInit_0 ? filter_ports_0[2] : ports_6_2; // @[Repeater.scala 158:18 264:{29,29}]
  wire  _GEN_164 = 3'h7 == enqPtrVecInit_0 ? filter_ports_0[2] : ports_7_2; // @[Repeater.scala 158:18 264:{29,29}]
  wire  _GEN_165 = 3'h0 == enqPtrVecInit_0 ? filter_ports_0[3] : ports_0_3; // @[Repeater.scala 158:18 264:{29,29}]
  wire  _GEN_166 = 3'h1 == enqPtrVecInit_0 ? filter_ports_0[3] : ports_1_3; // @[Repeater.scala 158:18 264:{29,29}]
  wire  _GEN_167 = 3'h2 == enqPtrVecInit_0 ? filter_ports_0[3] : ports_2_3; // @[Repeater.scala 158:18 264:{29,29}]
  wire  _GEN_168 = 3'h3 == enqPtrVecInit_0 ? filter_ports_0[3] : ports_3_3; // @[Repeater.scala 158:18 264:{29,29}]
  wire  _GEN_169 = 3'h4 == enqPtrVecInit_0 ? filter_ports_0[3] : ports_4_3; // @[Repeater.scala 158:18 264:{29,29}]
  wire  _GEN_170 = 3'h5 == enqPtrVecInit_0 ? filter_ports_0[3] : ports_5_3; // @[Repeater.scala 158:18 264:{29,29}]
  wire  _GEN_171 = 3'h6 == enqPtrVecInit_0 ? filter_ports_0[3] : ports_6_3; // @[Repeater.scala 158:18 264:{29,29}]
  wire  _GEN_172 = 3'h7 == enqPtrVecInit_0 ? filter_ports_0[3] : ports_7_3; // @[Repeater.scala 158:18 264:{29,29}]
  wire  _GEN_173 = 3'h0 == enqPtrVecInit_0 ? filter_ports_0[4] : ports_0_4; // @[Repeater.scala 158:18 264:{29,29}]
  wire  _GEN_174 = 3'h1 == enqPtrVecInit_0 ? filter_ports_0[4] : ports_1_4; // @[Repeater.scala 158:18 264:{29,29}]
  wire  _GEN_175 = 3'h2 == enqPtrVecInit_0 ? filter_ports_0[4] : ports_2_4; // @[Repeater.scala 158:18 264:{29,29}]
  wire  _GEN_176 = 3'h3 == enqPtrVecInit_0 ? filter_ports_0[4] : ports_3_4; // @[Repeater.scala 158:18 264:{29,29}]
  wire  _GEN_177 = 3'h4 == enqPtrVecInit_0 ? filter_ports_0[4] : ports_4_4; // @[Repeater.scala 158:18 264:{29,29}]
  wire  _GEN_178 = 3'h5 == enqPtrVecInit_0 ? filter_ports_0[4] : ports_5_4; // @[Repeater.scala 158:18 264:{29,29}]
  wire  _GEN_179 = 3'h6 == enqPtrVecInit_0 ? filter_ports_0[4] : ports_6_4; // @[Repeater.scala 158:18 264:{29,29}]
  wire  _GEN_180 = 3'h7 == enqPtrVecInit_0 ? filter_ports_0[4] : ports_7_4; // @[Repeater.scala 158:18 264:{29,29}]
  wire  _GEN_181 = reqs_0_valid & canEnqueue ? _GEN_101 : v_0; // @[Repeater.scala 157:18 260:38]
  wire  _GEN_182 = reqs_0_valid & canEnqueue ? _GEN_102 : v_1; // @[Repeater.scala 157:18 260:38]
  wire  _GEN_183 = reqs_0_valid & canEnqueue ? _GEN_103 : v_2; // @[Repeater.scala 157:18 260:38]
  wire  _GEN_184 = reqs_0_valid & canEnqueue ? _GEN_104 : v_3; // @[Repeater.scala 157:18 260:38]
  wire  _GEN_185 = reqs_0_valid & canEnqueue ? _GEN_105 : v_4; // @[Repeater.scala 157:18 260:38]
  wire  _GEN_186 = reqs_0_valid & canEnqueue ? _GEN_106 : v_5; // @[Repeater.scala 157:18 260:38]
  wire  _GEN_187 = reqs_0_valid & canEnqueue ? _GEN_107 : v_6; // @[Repeater.scala 157:18 260:38]
  wire  _GEN_188 = reqs_0_valid & canEnqueue ? _GEN_108 : v_7; // @[Repeater.scala 157:18 260:38]
  wire [26:0] _GEN_189 = reqs_0_valid & canEnqueue ? _GEN_109 : vpn_0; // @[Repeater.scala 159:16 260:38]
  wire [26:0] _GEN_190 = reqs_0_valid & canEnqueue ? _GEN_110 : vpn_1; // @[Repeater.scala 159:16 260:38]
  wire [26:0] _GEN_191 = reqs_0_valid & canEnqueue ? _GEN_111 : vpn_2; // @[Repeater.scala 159:16 260:38]
  wire [26:0] _GEN_192 = reqs_0_valid & canEnqueue ? _GEN_112 : vpn_3; // @[Repeater.scala 159:16 260:38]
  wire [26:0] _GEN_193 = reqs_0_valid & canEnqueue ? _GEN_113 : vpn_4; // @[Repeater.scala 159:16 260:38]
  wire [26:0] _GEN_194 = reqs_0_valid & canEnqueue ? _GEN_114 : vpn_5; // @[Repeater.scala 159:16 260:38]
  wire [26:0] _GEN_195 = reqs_0_valid & canEnqueue ? _GEN_115 : vpn_6; // @[Repeater.scala 159:16 260:38]
  wire [26:0] _GEN_196 = reqs_0_valid & canEnqueue ? _GEN_116 : vpn_7; // @[Repeater.scala 159:16 260:38]
  wire  _GEN_221 = reqs_0_valid & canEnqueue ? _GEN_141 : ports_0_0; // @[Repeater.scala 158:18 260:38]
  wire  _GEN_222 = reqs_0_valid & canEnqueue ? _GEN_142 : ports_1_0; // @[Repeater.scala 158:18 260:38]
  wire  _GEN_223 = reqs_0_valid & canEnqueue ? _GEN_143 : ports_2_0; // @[Repeater.scala 158:18 260:38]
  wire  _GEN_224 = reqs_0_valid & canEnqueue ? _GEN_144 : ports_3_0; // @[Repeater.scala 158:18 260:38]
  wire  _GEN_225 = reqs_0_valid & canEnqueue ? _GEN_145 : ports_4_0; // @[Repeater.scala 158:18 260:38]
  wire  _GEN_226 = reqs_0_valid & canEnqueue ? _GEN_146 : ports_5_0; // @[Repeater.scala 158:18 260:38]
  wire  _GEN_227 = reqs_0_valid & canEnqueue ? _GEN_147 : ports_6_0; // @[Repeater.scala 158:18 260:38]
  wire  _GEN_228 = reqs_0_valid & canEnqueue ? _GEN_148 : ports_7_0; // @[Repeater.scala 158:18 260:38]
  wire  _GEN_229 = reqs_0_valid & canEnqueue ? _GEN_149 : ports_0_1; // @[Repeater.scala 158:18 260:38]
  wire  _GEN_230 = reqs_0_valid & canEnqueue ? _GEN_150 : ports_1_1; // @[Repeater.scala 158:18 260:38]
  wire  _GEN_231 = reqs_0_valid & canEnqueue ? _GEN_151 : ports_2_1; // @[Repeater.scala 158:18 260:38]
  wire  _GEN_232 = reqs_0_valid & canEnqueue ? _GEN_152 : ports_3_1; // @[Repeater.scala 158:18 260:38]
  wire  _GEN_233 = reqs_0_valid & canEnqueue ? _GEN_153 : ports_4_1; // @[Repeater.scala 158:18 260:38]
  wire  _GEN_234 = reqs_0_valid & canEnqueue ? _GEN_154 : ports_5_1; // @[Repeater.scala 158:18 260:38]
  wire  _GEN_235 = reqs_0_valid & canEnqueue ? _GEN_155 : ports_6_1; // @[Repeater.scala 158:18 260:38]
  wire  _GEN_236 = reqs_0_valid & canEnqueue ? _GEN_156 : ports_7_1; // @[Repeater.scala 158:18 260:38]
  wire  _GEN_237 = reqs_0_valid & canEnqueue ? _GEN_157 : ports_0_2; // @[Repeater.scala 158:18 260:38]
  wire  _GEN_238 = reqs_0_valid & canEnqueue ? _GEN_158 : ports_1_2; // @[Repeater.scala 158:18 260:38]
  wire  _GEN_239 = reqs_0_valid & canEnqueue ? _GEN_159 : ports_2_2; // @[Repeater.scala 158:18 260:38]
  wire  _GEN_240 = reqs_0_valid & canEnqueue ? _GEN_160 : ports_3_2; // @[Repeater.scala 158:18 260:38]
  wire  _GEN_241 = reqs_0_valid & canEnqueue ? _GEN_161 : ports_4_2; // @[Repeater.scala 158:18 260:38]
  wire  _GEN_242 = reqs_0_valid & canEnqueue ? _GEN_162 : ports_5_2; // @[Repeater.scala 158:18 260:38]
  wire  _GEN_243 = reqs_0_valid & canEnqueue ? _GEN_163 : ports_6_2; // @[Repeater.scala 158:18 260:38]
  wire  _GEN_244 = reqs_0_valid & canEnqueue ? _GEN_164 : ports_7_2; // @[Repeater.scala 158:18 260:38]
  wire  _GEN_245 = reqs_0_valid & canEnqueue ? _GEN_165 : ports_0_3; // @[Repeater.scala 158:18 260:38]
  wire  _GEN_246 = reqs_0_valid & canEnqueue ? _GEN_166 : ports_1_3; // @[Repeater.scala 158:18 260:38]
  wire  _GEN_247 = reqs_0_valid & canEnqueue ? _GEN_167 : ports_2_3; // @[Repeater.scala 158:18 260:38]
  wire  _GEN_248 = reqs_0_valid & canEnqueue ? _GEN_168 : ports_3_3; // @[Repeater.scala 158:18 260:38]
  wire  _GEN_249 = reqs_0_valid & canEnqueue ? _GEN_169 : ports_4_3; // @[Repeater.scala 158:18 260:38]
  wire  _GEN_250 = reqs_0_valid & canEnqueue ? _GEN_170 : ports_5_3; // @[Repeater.scala 158:18 260:38]
  wire  _GEN_251 = reqs_0_valid & canEnqueue ? _GEN_171 : ports_6_3; // @[Repeater.scala 158:18 260:38]
  wire  _GEN_252 = reqs_0_valid & canEnqueue ? _GEN_172 : ports_7_3; // @[Repeater.scala 158:18 260:38]
  wire  _GEN_253 = reqs_0_valid & canEnqueue ? _GEN_173 : ports_0_4; // @[Repeater.scala 158:18 260:38]
  wire  _GEN_254 = reqs_0_valid & canEnqueue ? _GEN_174 : ports_1_4; // @[Repeater.scala 158:18 260:38]
  wire  _GEN_255 = reqs_0_valid & canEnqueue ? _GEN_175 : ports_2_4; // @[Repeater.scala 158:18 260:38]
  wire  _GEN_256 = reqs_0_valid & canEnqueue ? _GEN_176 : ports_3_4; // @[Repeater.scala 158:18 260:38]
  wire  _GEN_257 = reqs_0_valid & canEnqueue ? _GEN_177 : ports_4_4; // @[Repeater.scala 158:18 260:38]
  wire  _GEN_258 = reqs_0_valid & canEnqueue ? _GEN_178 : ports_5_4; // @[Repeater.scala 158:18 260:38]
  wire  _GEN_259 = reqs_0_valid & canEnqueue ? _GEN_179 : ports_6_4; // @[Repeater.scala 158:18 260:38]
  wire  _GEN_260 = reqs_0_valid & canEnqueue ? _GEN_180 : ports_7_4; // @[Repeater.scala 158:18 260:38]
  wire  _GEN_261 = 3'h0 == enqPtrVec_1 ? ~tlb_req_flushed_1 : _GEN_181; // @[Repeater.scala 261:{25,25}]
  wire  _GEN_262 = 3'h1 == enqPtrVec_1 ? ~tlb_req_flushed_1 : _GEN_182; // @[Repeater.scala 261:{25,25}]
  wire  _GEN_263 = 3'h2 == enqPtrVec_1 ? ~tlb_req_flushed_1 : _GEN_183; // @[Repeater.scala 261:{25,25}]
  wire  _GEN_264 = 3'h3 == enqPtrVec_1 ? ~tlb_req_flushed_1 : _GEN_184; // @[Repeater.scala 261:{25,25}]
  wire  _GEN_265 = 3'h4 == enqPtrVec_1 ? ~tlb_req_flushed_1 : _GEN_185; // @[Repeater.scala 261:{25,25}]
  wire  _GEN_266 = 3'h5 == enqPtrVec_1 ? ~tlb_req_flushed_1 : _GEN_186; // @[Repeater.scala 261:{25,25}]
  wire  _GEN_267 = 3'h6 == enqPtrVec_1 ? ~tlb_req_flushed_1 : _GEN_187; // @[Repeater.scala 261:{25,25}]
  wire  _GEN_268 = 3'h7 == enqPtrVec_1 ? ~tlb_req_flushed_1 : _GEN_188; // @[Repeater.scala 261:{25,25}]
  wire [26:0] _GEN_269 = 3'h0 == enqPtrVec_1 ? tlb_req_1_bits_rvpn : _GEN_189; // @[Repeater.scala 262:{27,27}]
  wire [26:0] _GEN_270 = 3'h1 == enqPtrVec_1 ? tlb_req_1_bits_rvpn : _GEN_190; // @[Repeater.scala 262:{27,27}]
  wire [26:0] _GEN_271 = 3'h2 == enqPtrVec_1 ? tlb_req_1_bits_rvpn : _GEN_191; // @[Repeater.scala 262:{27,27}]
  wire [26:0] _GEN_272 = 3'h3 == enqPtrVec_1 ? tlb_req_1_bits_rvpn : _GEN_192; // @[Repeater.scala 262:{27,27}]
  wire [26:0] _GEN_273 = 3'h4 == enqPtrVec_1 ? tlb_req_1_bits_rvpn : _GEN_193; // @[Repeater.scala 262:{27,27}]
  wire [26:0] _GEN_274 = 3'h5 == enqPtrVec_1 ? tlb_req_1_bits_rvpn : _GEN_194; // @[Repeater.scala 262:{27,27}]
  wire [26:0] _GEN_275 = 3'h6 == enqPtrVec_1 ? tlb_req_1_bits_rvpn : _GEN_195; // @[Repeater.scala 262:{27,27}]
  wire [26:0] _GEN_276 = 3'h7 == enqPtrVec_1 ? tlb_req_1_bits_rvpn : _GEN_196; // @[Repeater.scala 262:{27,27}]
  wire  _GEN_301 = 3'h0 == enqPtrVec_1 ? filter_ports_1[0] : _GEN_221; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_302 = 3'h1 == enqPtrVec_1 ? filter_ports_1[0] : _GEN_222; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_303 = 3'h2 == enqPtrVec_1 ? filter_ports_1[0] : _GEN_223; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_304 = 3'h3 == enqPtrVec_1 ? filter_ports_1[0] : _GEN_224; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_305 = 3'h4 == enqPtrVec_1 ? filter_ports_1[0] : _GEN_225; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_306 = 3'h5 == enqPtrVec_1 ? filter_ports_1[0] : _GEN_226; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_307 = 3'h6 == enqPtrVec_1 ? filter_ports_1[0] : _GEN_227; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_308 = 3'h7 == enqPtrVec_1 ? filter_ports_1[0] : _GEN_228; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_309 = 3'h0 == enqPtrVec_1 ? filter_ports_1[1] : _GEN_229; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_310 = 3'h1 == enqPtrVec_1 ? filter_ports_1[1] : _GEN_230; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_311 = 3'h2 == enqPtrVec_1 ? filter_ports_1[1] : _GEN_231; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_312 = 3'h3 == enqPtrVec_1 ? filter_ports_1[1] : _GEN_232; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_313 = 3'h4 == enqPtrVec_1 ? filter_ports_1[1] : _GEN_233; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_314 = 3'h5 == enqPtrVec_1 ? filter_ports_1[1] : _GEN_234; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_315 = 3'h6 == enqPtrVec_1 ? filter_ports_1[1] : _GEN_235; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_316 = 3'h7 == enqPtrVec_1 ? filter_ports_1[1] : _GEN_236; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_317 = 3'h0 == enqPtrVec_1 ? filter_ports_1[2] : _GEN_237; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_318 = 3'h1 == enqPtrVec_1 ? filter_ports_1[2] : _GEN_238; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_319 = 3'h2 == enqPtrVec_1 ? filter_ports_1[2] : _GEN_239; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_320 = 3'h3 == enqPtrVec_1 ? filter_ports_1[2] : _GEN_240; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_321 = 3'h4 == enqPtrVec_1 ? filter_ports_1[2] : _GEN_241; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_322 = 3'h5 == enqPtrVec_1 ? filter_ports_1[2] : _GEN_242; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_323 = 3'h6 == enqPtrVec_1 ? filter_ports_1[2] : _GEN_243; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_324 = 3'h7 == enqPtrVec_1 ? filter_ports_1[2] : _GEN_244; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_325 = 3'h0 == enqPtrVec_1 ? filter_ports_1[3] : _GEN_245; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_326 = 3'h1 == enqPtrVec_1 ? filter_ports_1[3] : _GEN_246; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_327 = 3'h2 == enqPtrVec_1 ? filter_ports_1[3] : _GEN_247; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_328 = 3'h3 == enqPtrVec_1 ? filter_ports_1[3] : _GEN_248; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_329 = 3'h4 == enqPtrVec_1 ? filter_ports_1[3] : _GEN_249; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_330 = 3'h5 == enqPtrVec_1 ? filter_ports_1[3] : _GEN_250; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_331 = 3'h6 == enqPtrVec_1 ? filter_ports_1[3] : _GEN_251; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_332 = 3'h7 == enqPtrVec_1 ? filter_ports_1[3] : _GEN_252; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_333 = 3'h0 == enqPtrVec_1 ? filter_ports_1[4] : _GEN_253; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_334 = 3'h1 == enqPtrVec_1 ? filter_ports_1[4] : _GEN_254; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_335 = 3'h2 == enqPtrVec_1 ? filter_ports_1[4] : _GEN_255; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_336 = 3'h3 == enqPtrVec_1 ? filter_ports_1[4] : _GEN_256; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_337 = 3'h4 == enqPtrVec_1 ? filter_ports_1[4] : _GEN_257; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_338 = 3'h5 == enqPtrVec_1 ? filter_ports_1[4] : _GEN_258; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_339 = 3'h6 == enqPtrVec_1 ? filter_ports_1[4] : _GEN_259; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_340 = 3'h7 == enqPtrVec_1 ? filter_ports_1[4] : _GEN_260; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_341 = reqs_1_valid & canEnqueue ? _GEN_261 : _GEN_181; // @[Repeater.scala 260:38]
  wire  _GEN_342 = reqs_1_valid & canEnqueue ? _GEN_262 : _GEN_182; // @[Repeater.scala 260:38]
  wire  _GEN_343 = reqs_1_valid & canEnqueue ? _GEN_263 : _GEN_183; // @[Repeater.scala 260:38]
  wire  _GEN_344 = reqs_1_valid & canEnqueue ? _GEN_264 : _GEN_184; // @[Repeater.scala 260:38]
  wire  _GEN_345 = reqs_1_valid & canEnqueue ? _GEN_265 : _GEN_185; // @[Repeater.scala 260:38]
  wire  _GEN_346 = reqs_1_valid & canEnqueue ? _GEN_266 : _GEN_186; // @[Repeater.scala 260:38]
  wire  _GEN_347 = reqs_1_valid & canEnqueue ? _GEN_267 : _GEN_187; // @[Repeater.scala 260:38]
  wire  _GEN_348 = reqs_1_valid & canEnqueue ? _GEN_268 : _GEN_188; // @[Repeater.scala 260:38]
  wire [26:0] _GEN_349 = reqs_1_valid & canEnqueue ? _GEN_269 : _GEN_189; // @[Repeater.scala 260:38]
  wire [26:0] _GEN_350 = reqs_1_valid & canEnqueue ? _GEN_270 : _GEN_190; // @[Repeater.scala 260:38]
  wire [26:0] _GEN_351 = reqs_1_valid & canEnqueue ? _GEN_271 : _GEN_191; // @[Repeater.scala 260:38]
  wire [26:0] _GEN_352 = reqs_1_valid & canEnqueue ? _GEN_272 : _GEN_192; // @[Repeater.scala 260:38]
  wire [26:0] _GEN_353 = reqs_1_valid & canEnqueue ? _GEN_273 : _GEN_193; // @[Repeater.scala 260:38]
  wire [26:0] _GEN_354 = reqs_1_valid & canEnqueue ? _GEN_274 : _GEN_194; // @[Repeater.scala 260:38]
  wire [26:0] _GEN_355 = reqs_1_valid & canEnqueue ? _GEN_275 : _GEN_195; // @[Repeater.scala 260:38]
  wire [26:0] _GEN_356 = reqs_1_valid & canEnqueue ? _GEN_276 : _GEN_196; // @[Repeater.scala 260:38]
  wire  _GEN_381 = reqs_1_valid & canEnqueue ? _GEN_301 : _GEN_221; // @[Repeater.scala 260:38]
  wire  _GEN_382 = reqs_1_valid & canEnqueue ? _GEN_302 : _GEN_222; // @[Repeater.scala 260:38]
  wire  _GEN_383 = reqs_1_valid & canEnqueue ? _GEN_303 : _GEN_223; // @[Repeater.scala 260:38]
  wire  _GEN_384 = reqs_1_valid & canEnqueue ? _GEN_304 : _GEN_224; // @[Repeater.scala 260:38]
  wire  _GEN_385 = reqs_1_valid & canEnqueue ? _GEN_305 : _GEN_225; // @[Repeater.scala 260:38]
  wire  _GEN_386 = reqs_1_valid & canEnqueue ? _GEN_306 : _GEN_226; // @[Repeater.scala 260:38]
  wire  _GEN_387 = reqs_1_valid & canEnqueue ? _GEN_307 : _GEN_227; // @[Repeater.scala 260:38]
  wire  _GEN_388 = reqs_1_valid & canEnqueue ? _GEN_308 : _GEN_228; // @[Repeater.scala 260:38]
  wire  _GEN_389 = reqs_1_valid & canEnqueue ? _GEN_309 : _GEN_229; // @[Repeater.scala 260:38]
  wire  _GEN_390 = reqs_1_valid & canEnqueue ? _GEN_310 : _GEN_230; // @[Repeater.scala 260:38]
  wire  _GEN_391 = reqs_1_valid & canEnqueue ? _GEN_311 : _GEN_231; // @[Repeater.scala 260:38]
  wire  _GEN_392 = reqs_1_valid & canEnqueue ? _GEN_312 : _GEN_232; // @[Repeater.scala 260:38]
  wire  _GEN_393 = reqs_1_valid & canEnqueue ? _GEN_313 : _GEN_233; // @[Repeater.scala 260:38]
  wire  _GEN_394 = reqs_1_valid & canEnqueue ? _GEN_314 : _GEN_234; // @[Repeater.scala 260:38]
  wire  _GEN_395 = reqs_1_valid & canEnqueue ? _GEN_315 : _GEN_235; // @[Repeater.scala 260:38]
  wire  _GEN_396 = reqs_1_valid & canEnqueue ? _GEN_316 : _GEN_236; // @[Repeater.scala 260:38]
  wire  _GEN_397 = reqs_1_valid & canEnqueue ? _GEN_317 : _GEN_237; // @[Repeater.scala 260:38]
  wire  _GEN_398 = reqs_1_valid & canEnqueue ? _GEN_318 : _GEN_238; // @[Repeater.scala 260:38]
  wire  _GEN_399 = reqs_1_valid & canEnqueue ? _GEN_319 : _GEN_239; // @[Repeater.scala 260:38]
  wire  _GEN_400 = reqs_1_valid & canEnqueue ? _GEN_320 : _GEN_240; // @[Repeater.scala 260:38]
  wire  _GEN_401 = reqs_1_valid & canEnqueue ? _GEN_321 : _GEN_241; // @[Repeater.scala 260:38]
  wire  _GEN_402 = reqs_1_valid & canEnqueue ? _GEN_322 : _GEN_242; // @[Repeater.scala 260:38]
  wire  _GEN_403 = reqs_1_valid & canEnqueue ? _GEN_323 : _GEN_243; // @[Repeater.scala 260:38]
  wire  _GEN_404 = reqs_1_valid & canEnqueue ? _GEN_324 : _GEN_244; // @[Repeater.scala 260:38]
  wire  _GEN_405 = reqs_1_valid & canEnqueue ? _GEN_325 : _GEN_245; // @[Repeater.scala 260:38]
  wire  _GEN_406 = reqs_1_valid & canEnqueue ? _GEN_326 : _GEN_246; // @[Repeater.scala 260:38]
  wire  _GEN_407 = reqs_1_valid & canEnqueue ? _GEN_327 : _GEN_247; // @[Repeater.scala 260:38]
  wire  _GEN_408 = reqs_1_valid & canEnqueue ? _GEN_328 : _GEN_248; // @[Repeater.scala 260:38]
  wire  _GEN_409 = reqs_1_valid & canEnqueue ? _GEN_329 : _GEN_249; // @[Repeater.scala 260:38]
  wire  _GEN_410 = reqs_1_valid & canEnqueue ? _GEN_330 : _GEN_250; // @[Repeater.scala 260:38]
  wire  _GEN_411 = reqs_1_valid & canEnqueue ? _GEN_331 : _GEN_251; // @[Repeater.scala 260:38]
  wire  _GEN_412 = reqs_1_valid & canEnqueue ? _GEN_332 : _GEN_252; // @[Repeater.scala 260:38]
  wire  _GEN_413 = reqs_1_valid & canEnqueue ? _GEN_333 : _GEN_253; // @[Repeater.scala 260:38]
  wire  _GEN_414 = reqs_1_valid & canEnqueue ? _GEN_334 : _GEN_254; // @[Repeater.scala 260:38]
  wire  _GEN_415 = reqs_1_valid & canEnqueue ? _GEN_335 : _GEN_255; // @[Repeater.scala 260:38]
  wire  _GEN_416 = reqs_1_valid & canEnqueue ? _GEN_336 : _GEN_256; // @[Repeater.scala 260:38]
  wire  _GEN_417 = reqs_1_valid & canEnqueue ? _GEN_337 : _GEN_257; // @[Repeater.scala 260:38]
  wire  _GEN_418 = reqs_1_valid & canEnqueue ? _GEN_338 : _GEN_258; // @[Repeater.scala 260:38]
  wire  _GEN_419 = reqs_1_valid & canEnqueue ? _GEN_339 : _GEN_259; // @[Repeater.scala 260:38]
  wire  _GEN_420 = reqs_1_valid & canEnqueue ? _GEN_340 : _GEN_260; // @[Repeater.scala 260:38]
  wire  _GEN_421 = 3'h0 == enqPtrVec_2 ? ~tlb_req_flushed_2 : _GEN_341; // @[Repeater.scala 261:{25,25}]
  wire  _GEN_422 = 3'h1 == enqPtrVec_2 ? ~tlb_req_flushed_2 : _GEN_342; // @[Repeater.scala 261:{25,25}]
  wire  _GEN_423 = 3'h2 == enqPtrVec_2 ? ~tlb_req_flushed_2 : _GEN_343; // @[Repeater.scala 261:{25,25}]
  wire  _GEN_424 = 3'h3 == enqPtrVec_2 ? ~tlb_req_flushed_2 : _GEN_344; // @[Repeater.scala 261:{25,25}]
  wire  _GEN_425 = 3'h4 == enqPtrVec_2 ? ~tlb_req_flushed_2 : _GEN_345; // @[Repeater.scala 261:{25,25}]
  wire  _GEN_426 = 3'h5 == enqPtrVec_2 ? ~tlb_req_flushed_2 : _GEN_346; // @[Repeater.scala 261:{25,25}]
  wire  _GEN_427 = 3'h6 == enqPtrVec_2 ? ~tlb_req_flushed_2 : _GEN_347; // @[Repeater.scala 261:{25,25}]
  wire  _GEN_428 = 3'h7 == enqPtrVec_2 ? ~tlb_req_flushed_2 : _GEN_348; // @[Repeater.scala 261:{25,25}]
  wire [26:0] _GEN_429 = 3'h0 == enqPtrVec_2 ? tlb_req_2_bits_rvpn : _GEN_349; // @[Repeater.scala 262:{27,27}]
  wire [26:0] _GEN_430 = 3'h1 == enqPtrVec_2 ? tlb_req_2_bits_rvpn : _GEN_350; // @[Repeater.scala 262:{27,27}]
  wire [26:0] _GEN_431 = 3'h2 == enqPtrVec_2 ? tlb_req_2_bits_rvpn : _GEN_351; // @[Repeater.scala 262:{27,27}]
  wire [26:0] _GEN_432 = 3'h3 == enqPtrVec_2 ? tlb_req_2_bits_rvpn : _GEN_352; // @[Repeater.scala 262:{27,27}]
  wire [26:0] _GEN_433 = 3'h4 == enqPtrVec_2 ? tlb_req_2_bits_rvpn : _GEN_353; // @[Repeater.scala 262:{27,27}]
  wire [26:0] _GEN_434 = 3'h5 == enqPtrVec_2 ? tlb_req_2_bits_rvpn : _GEN_354; // @[Repeater.scala 262:{27,27}]
  wire [26:0] _GEN_435 = 3'h6 == enqPtrVec_2 ? tlb_req_2_bits_rvpn : _GEN_355; // @[Repeater.scala 262:{27,27}]
  wire [26:0] _GEN_436 = 3'h7 == enqPtrVec_2 ? tlb_req_2_bits_rvpn : _GEN_356; // @[Repeater.scala 262:{27,27}]
  wire  _GEN_461 = 3'h0 == enqPtrVec_2 ? filter_ports_2[0] : _GEN_381; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_462 = 3'h1 == enqPtrVec_2 ? filter_ports_2[0] : _GEN_382; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_463 = 3'h2 == enqPtrVec_2 ? filter_ports_2[0] : _GEN_383; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_464 = 3'h3 == enqPtrVec_2 ? filter_ports_2[0] : _GEN_384; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_465 = 3'h4 == enqPtrVec_2 ? filter_ports_2[0] : _GEN_385; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_466 = 3'h5 == enqPtrVec_2 ? filter_ports_2[0] : _GEN_386; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_467 = 3'h6 == enqPtrVec_2 ? filter_ports_2[0] : _GEN_387; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_468 = 3'h7 == enqPtrVec_2 ? filter_ports_2[0] : _GEN_388; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_469 = 3'h0 == enqPtrVec_2 ? filter_ports_2[1] : _GEN_389; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_470 = 3'h1 == enqPtrVec_2 ? filter_ports_2[1] : _GEN_390; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_471 = 3'h2 == enqPtrVec_2 ? filter_ports_2[1] : _GEN_391; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_472 = 3'h3 == enqPtrVec_2 ? filter_ports_2[1] : _GEN_392; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_473 = 3'h4 == enqPtrVec_2 ? filter_ports_2[1] : _GEN_393; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_474 = 3'h5 == enqPtrVec_2 ? filter_ports_2[1] : _GEN_394; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_475 = 3'h6 == enqPtrVec_2 ? filter_ports_2[1] : _GEN_395; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_476 = 3'h7 == enqPtrVec_2 ? filter_ports_2[1] : _GEN_396; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_477 = 3'h0 == enqPtrVec_2 ? filter_ports_2[2] : _GEN_397; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_478 = 3'h1 == enqPtrVec_2 ? filter_ports_2[2] : _GEN_398; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_479 = 3'h2 == enqPtrVec_2 ? filter_ports_2[2] : _GEN_399; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_480 = 3'h3 == enqPtrVec_2 ? filter_ports_2[2] : _GEN_400; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_481 = 3'h4 == enqPtrVec_2 ? filter_ports_2[2] : _GEN_401; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_482 = 3'h5 == enqPtrVec_2 ? filter_ports_2[2] : _GEN_402; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_483 = 3'h6 == enqPtrVec_2 ? filter_ports_2[2] : _GEN_403; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_484 = 3'h7 == enqPtrVec_2 ? filter_ports_2[2] : _GEN_404; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_485 = 3'h0 == enqPtrVec_2 ? filter_ports_2[3] : _GEN_405; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_486 = 3'h1 == enqPtrVec_2 ? filter_ports_2[3] : _GEN_406; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_487 = 3'h2 == enqPtrVec_2 ? filter_ports_2[3] : _GEN_407; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_488 = 3'h3 == enqPtrVec_2 ? filter_ports_2[3] : _GEN_408; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_489 = 3'h4 == enqPtrVec_2 ? filter_ports_2[3] : _GEN_409; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_490 = 3'h5 == enqPtrVec_2 ? filter_ports_2[3] : _GEN_410; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_491 = 3'h6 == enqPtrVec_2 ? filter_ports_2[3] : _GEN_411; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_492 = 3'h7 == enqPtrVec_2 ? filter_ports_2[3] : _GEN_412; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_493 = 3'h0 == enqPtrVec_2 ? filter_ports_2[4] : _GEN_413; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_494 = 3'h1 == enqPtrVec_2 ? filter_ports_2[4] : _GEN_414; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_495 = 3'h2 == enqPtrVec_2 ? filter_ports_2[4] : _GEN_415; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_496 = 3'h3 == enqPtrVec_2 ? filter_ports_2[4] : _GEN_416; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_497 = 3'h4 == enqPtrVec_2 ? filter_ports_2[4] : _GEN_417; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_498 = 3'h5 == enqPtrVec_2 ? filter_ports_2[4] : _GEN_418; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_499 = 3'h6 == enqPtrVec_2 ? filter_ports_2[4] : _GEN_419; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_500 = 3'h7 == enqPtrVec_2 ? filter_ports_2[4] : _GEN_420; // @[Repeater.scala 264:{29,29}]
  wire  _GEN_501 = reqs_2_valid & canEnqueue ? _GEN_421 : _GEN_341; // @[Repeater.scala 260:38]
  wire  _GEN_502 = reqs_2_valid & canEnqueue ? _GEN_422 : _GEN_342; // @[Repeater.scala 260:38]
  wire  _GEN_503 = reqs_2_valid & canEnqueue ? _GEN_423 : _GEN_343; // @[Repeater.scala 260:38]
  wire  _GEN_504 = reqs_2_valid & canEnqueue ? _GEN_424 : _GEN_344; // @[Repeater.scala 260:38]
  wire  _GEN_505 = reqs_2_valid & canEnqueue ? _GEN_425 : _GEN_345; // @[Repeater.scala 260:38]
  wire  _GEN_506 = reqs_2_valid & canEnqueue ? _GEN_426 : _GEN_346; // @[Repeater.scala 260:38]
  wire  _GEN_507 = reqs_2_valid & canEnqueue ? _GEN_427 : _GEN_347; // @[Repeater.scala 260:38]
  wire  _GEN_508 = reqs_2_valid & canEnqueue ? _GEN_428 : _GEN_348; // @[Repeater.scala 260:38]
  wire [26:0] _GEN_509 = reqs_2_valid & canEnqueue ? _GEN_429 : _GEN_349; // @[Repeater.scala 260:38]
  wire [26:0] _GEN_510 = reqs_2_valid & canEnqueue ? _GEN_430 : _GEN_350; // @[Repeater.scala 260:38]
  wire [26:0] _GEN_511 = reqs_2_valid & canEnqueue ? _GEN_431 : _GEN_351; // @[Repeater.scala 260:38]
  wire [26:0] _GEN_512 = reqs_2_valid & canEnqueue ? _GEN_432 : _GEN_352; // @[Repeater.scala 260:38]
  wire [26:0] _GEN_513 = reqs_2_valid & canEnqueue ? _GEN_433 : _GEN_353; // @[Repeater.scala 260:38]
  wire [26:0] _GEN_514 = reqs_2_valid & canEnqueue ? _GEN_434 : _GEN_354; // @[Repeater.scala 260:38]
  wire [26:0] _GEN_515 = reqs_2_valid & canEnqueue ? _GEN_435 : _GEN_355; // @[Repeater.scala 260:38]
  wire [26:0] _GEN_516 = reqs_2_valid & canEnqueue ? _GEN_436 : _GEN_356; // @[Repeater.scala 260:38]
  wire  _GEN_541 = reqs_2_valid & canEnqueue ? _GEN_461 : _GEN_381; // @[Repeater.scala 260:38]
  wire  _GEN_542 = reqs_2_valid & canEnqueue ? _GEN_462 : _GEN_382; // @[Repeater.scala 260:38]
  wire  _GEN_543 = reqs_2_valid & canEnqueue ? _GEN_463 : _GEN_383; // @[Repeater.scala 260:38]
  wire  _GEN_544 = reqs_2_valid & canEnqueue ? _GEN_464 : _GEN_384; // @[Repeater.scala 260:38]
  wire  _GEN_545 = reqs_2_valid & canEnqueue ? _GEN_465 : _GEN_385; // @[Repeater.scala 260:38]
  wire  _GEN_546 = reqs_2_valid & canEnqueue ? _GEN_466 : _GEN_386; // @[Repeater.scala 260:38]
  wire  _GEN_547 = reqs_2_valid & canEnqueue ? _GEN_467 : _GEN_387; // @[Repeater.scala 260:38]
  wire  _GEN_548 = reqs_2_valid & canEnqueue ? _GEN_468 : _GEN_388; // @[Repeater.scala 260:38]
  wire  _GEN_549 = reqs_2_valid & canEnqueue ? _GEN_469 : _GEN_389; // @[Repeater.scala 260:38]
  wire  _GEN_550 = reqs_2_valid & canEnqueue ? _GEN_470 : _GEN_390; // @[Repeater.scala 260:38]
  wire  _GEN_551 = reqs_2_valid & canEnqueue ? _GEN_471 : _GEN_391; // @[Repeater.scala 260:38]
  wire  _GEN_552 = reqs_2_valid & canEnqueue ? _GEN_472 : _GEN_392; // @[Repeater.scala 260:38]
  wire  _GEN_553 = reqs_2_valid & canEnqueue ? _GEN_473 : _GEN_393; // @[Repeater.scala 260:38]
  wire  _GEN_554 = reqs_2_valid & canEnqueue ? _GEN_474 : _GEN_394; // @[Repeater.scala 260:38]
  wire  _GEN_555 = reqs_2_valid & canEnqueue ? _GEN_475 : _GEN_395; // @[Repeater.scala 260:38]
  wire  _GEN_556 = reqs_2_valid & canEnqueue ? _GEN_476 : _GEN_396; // @[Repeater.scala 260:38]
  wire  _GEN_557 = reqs_2_valid & canEnqueue ? _GEN_477 : _GEN_397; // @[Repeater.scala 260:38]
  wire  _GEN_558 = reqs_2_valid & canEnqueue ? _GEN_478 : _GEN_398; // @[Repeater.scala 260:38]
  wire  _GEN_559 = reqs_2_valid & canEnqueue ? _GEN_479 : _GEN_399; // @[Repeater.scala 260:38]
  wire  _GEN_560 = reqs_2_valid & canEnqueue ? _GEN_480 : _GEN_400; // @[Repeater.scala 260:38]
  wire  _GEN_561 = reqs_2_valid & canEnqueue ? _GEN_481 : _GEN_401; // @[Repeater.scala 260:38]
  wire  _GEN_562 = reqs_2_valid & canEnqueue ? _GEN_482 : _GEN_402; // @[Repeater.scala 260:38]
  wire  _GEN_563 = reqs_2_valid & canEnqueue ? _GEN_483 : _GEN_403; // @[Repeater.scala 260:38]
  wire  _GEN_564 = reqs_2_valid & canEnqueue ? _GEN_484 : _GEN_404; // @[Repeater.scala 260:38]
  wire  _GEN_565 = reqs_2_valid & canEnqueue ? _GEN_485 : _GEN_405; // @[Repeater.scala 260:38]
  wire  _GEN_566 = reqs_2_valid & canEnqueue ? _GEN_486 : _GEN_406; // @[Repeater.scala 260:38]
  wire  _GEN_567 = reqs_2_valid & canEnqueue ? _GEN_487 : _GEN_407; // @[Repeater.scala 260:38]
  wire  _GEN_568 = reqs_2_valid & canEnqueue ? _GEN_488 : _GEN_408; // @[Repeater.scala 260:38]
  wire  _GEN_569 = reqs_2_valid & canEnqueue ? _GEN_489 : _GEN_409; // @[Repeater.scala 260:38]
  wire  _GEN_570 = reqs_2_valid & canEnqueue ? _GEN_490 : _GEN_410; // @[Repeater.scala 260:38]
  wire  _GEN_571 = reqs_2_valid & canEnqueue ? _GEN_491 : _GEN_411; // @[Repeater.scala 260:38]
  wire  _GEN_572 = reqs_2_valid & canEnqueue ? _GEN_492 : _GEN_412; // @[Repeater.scala 260:38]
  wire  _GEN_573 = reqs_2_valid & canEnqueue ? _GEN_493 : _GEN_413; // @[Repeater.scala 260:38]
  wire  _GEN_574 = reqs_2_valid & canEnqueue ? _GEN_494 : _GEN_414; // @[Repeater.scala 260:38]
  wire  _GEN_575 = reqs_2_valid & canEnqueue ? _GEN_495 : _GEN_415; // @[Repeater.scala 260:38]
  wire  _GEN_576 = reqs_2_valid & canEnqueue ? _GEN_496 : _GEN_416; // @[Repeater.scala 260:38]
  wire  _GEN_577 = reqs_2_valid & canEnqueue ? _GEN_497 : _GEN_417; // @[Repeater.scala 260:38]
  wire  _GEN_578 = reqs_2_valid & canEnqueue ? _GEN_498 : _GEN_418; // @[Repeater.scala 260:38]
  wire  _GEN_579 = reqs_2_valid & canEnqueue ? _GEN_499 : _GEN_419; // @[Repeater.scala 260:38]
  wire  _GEN_580 = reqs_2_valid & canEnqueue ? _GEN_500 : _GEN_420; // @[Repeater.scala 260:38]
  wire  _GEN_581 = 3'h0 == enqPtrVec_3 ? ~tlb_req_flushed_3 : _GEN_501; // @[Repeater.scala 261:{25,25}]
  wire  _GEN_582 = 3'h1 == enqPtrVec_3 ? ~tlb_req_flushed_3 : _GEN_502; // @[Repeater.scala 261:{25,25}]
  wire  _GEN_583 = 3'h2 == enqPtrVec_3 ? ~tlb_req_flushed_3 : _GEN_503; // @[Repeater.scala 261:{25,25}]
  wire  _GEN_584 = 3'h3 == enqPtrVec_3 ? ~tlb_req_flushed_3 : _GEN_504; // @[Repeater.scala 261:{25,25}]
  wire  _GEN_585 = 3'h4 == enqPtrVec_3 ? ~tlb_req_flushed_3 : _GEN_505; // @[Repeater.scala 261:{25,25}]
  wire  _GEN_586 = 3'h5 == enqPtrVec_3 ? ~tlb_req_flushed_3 : _GEN_506; // @[Repeater.scala 261:{25,25}]
  wire  _GEN_587 = 3'h6 == enqPtrVec_3 ? ~tlb_req_flushed_3 : _GEN_507; // @[Repeater.scala 261:{25,25}]
  wire  _GEN_588 = 3'h7 == enqPtrVec_3 ? ~tlb_req_flushed_3 : _GEN_508; // @[Repeater.scala 261:{25,25}]
  wire  _GEN_661 = reqs_3_valid & canEnqueue ? _GEN_581 : _GEN_501; // @[Repeater.scala 260:38]
  wire  _GEN_662 = reqs_3_valid & canEnqueue ? _GEN_582 : _GEN_502; // @[Repeater.scala 260:38]
  wire  _GEN_663 = reqs_3_valid & canEnqueue ? _GEN_583 : _GEN_503; // @[Repeater.scala 260:38]
  wire  _GEN_664 = reqs_3_valid & canEnqueue ? _GEN_584 : _GEN_504; // @[Repeater.scala 260:38]
  wire  _GEN_665 = reqs_3_valid & canEnqueue ? _GEN_585 : _GEN_505; // @[Repeater.scala 260:38]
  wire  _GEN_666 = reqs_3_valid & canEnqueue ? _GEN_586 : _GEN_506; // @[Repeater.scala 260:38]
  wire  _GEN_667 = reqs_3_valid & canEnqueue ? _GEN_587 : _GEN_507; // @[Repeater.scala 260:38]
  wire  _GEN_668 = reqs_3_valid & canEnqueue ? _GEN_588 : _GEN_508; // @[Repeater.scala 260:38]
  wire [4:0] _do_enq_T = {reqs_0_valid,reqs_1_valid,reqs_2_valid,reqs_3_valid,1'h0}; // @[Cat.scala 31:58]
  wire  do_enq = canEnqueue & |_do_enq_T; // @[Repeater.scala 273:27]
  wire  _GEN_942 = 3'h1 == deqPtr ? v_1 : v_0; // @[Repeater.scala 274:{17,17}]
  wire  _GEN_943 = 3'h2 == deqPtr ? v_2 : _GEN_942; // @[Repeater.scala 274:{17,17}]
  wire  _GEN_944 = 3'h3 == deqPtr ? v_3 : _GEN_943; // @[Repeater.scala 274:{17,17}]
  wire  _GEN_945 = 3'h4 == deqPtr ? v_4 : _GEN_944; // @[Repeater.scala 274:{17,17}]
  wire  _GEN_946 = 3'h5 == deqPtr ? v_5 : _GEN_945; // @[Repeater.scala 274:{17,17}]
  wire  _GEN_947 = 3'h6 == deqPtr ? v_6 : _GEN_946; // @[Repeater.scala 274:{17,17}]
  wire  _GEN_948 = 3'h7 == deqPtr ? v_7 : _GEN_947; // @[Repeater.scala 274:{17,17}]
  wire  do_deq = ~_GEN_948 & ~isEmptyDeq; // @[Repeater.scala 274:28]
  wire  do_iss = issue_fire_fake | ~_GEN_92 & _issue_valid_T; // @[Repeater.scala 275:32]
  wire [2:0] _enqPtr_T_1 = enqPtr + enqNum; // @[Repeater.scala 277:22]
  wire [2:0] _deqPtr_T_1 = deqPtr + 3'h1; // @[Repeater.scala 280:22]
  wire [2:0] _issPtr_T_1 = issPtr + 3'h1; // @[Repeater.scala 283:22]
  wire  _GEN_952 = 3'h0 == issPtr ? 1'h0 : _GEN_661; // @[Repeater.scala 286:{15,15}]
  wire  _GEN_953 = 3'h1 == issPtr ? 1'h0 : _GEN_662; // @[Repeater.scala 286:{15,15}]
  wire  _GEN_954 = 3'h2 == issPtr ? 1'h0 : _GEN_663; // @[Repeater.scala 286:{15,15}]
  wire  _GEN_955 = 3'h3 == issPtr ? 1'h0 : _GEN_664; // @[Repeater.scala 286:{15,15}]
  wire  _GEN_956 = 3'h4 == issPtr ? 1'h0 : _GEN_665; // @[Repeater.scala 286:{15,15}]
  wire  _GEN_957 = 3'h5 == issPtr ? 1'h0 : _GEN_666; // @[Repeater.scala 286:{15,15}]
  wire  _GEN_958 = 3'h6 == issPtr ? 1'h0 : _GEN_667; // @[Repeater.scala 286:{15,15}]
  wire  _GEN_959 = 3'h7 == issPtr ? 1'h0 : _GEN_668; // @[Repeater.scala 286:{15,15}]
  wire  _GEN_960 = issue_fire_fake & issue_filtered ? _GEN_952 : _GEN_661; // @[Repeater.scala 285:44]
  wire  _GEN_961 = issue_fire_fake & issue_filtered ? _GEN_953 : _GEN_662; // @[Repeater.scala 285:44]
  wire  _GEN_962 = issue_fire_fake & issue_filtered ? _GEN_954 : _GEN_663; // @[Repeater.scala 285:44]
  wire  _GEN_963 = issue_fire_fake & issue_filtered ? _GEN_955 : _GEN_664; // @[Repeater.scala 285:44]
  wire  _GEN_964 = issue_fire_fake & issue_filtered ? _GEN_956 : _GEN_665; // @[Repeater.scala 285:44]
  wire  _GEN_965 = issue_fire_fake & issue_filtered ? _GEN_957 : _GEN_666; // @[Repeater.scala 285:44]
  wire  _GEN_966 = issue_fire_fake & issue_filtered ? _GEN_958 : _GEN_667; // @[Repeater.scala 285:44]
  wire  _GEN_967 = issue_fire_fake & issue_filtered ? _GEN_959 : _GEN_668; // @[Repeater.scala 285:44]
  wire [3:0] _GEN_1044 = {{3'd0}, do_deq}; // @[Repeater.scala 299:22]
  wire [3:0] _counter_T_1 = counter - _GEN_1044; // @[Repeater.scala 299:22]
  wire [2:0] _counter_T_2 = do_enq ? enqNum : 3'h0; // @[Repeater.scala 299:36]
  wire [3:0] _GEN_1045 = {{1'd0}, _counter_T_2}; // @[Repeater.scala 299:31]
  wire [3:0] _counter_T_4 = _counter_T_1 + _GEN_1045; // @[Repeater.scala 299:31]
  DelayN_6 flush_delay ( // @[Hold.scala 97:23]
    .clock(flush_delay_clock),
    .io_in(flush_delay_io_in),
    .io_out(flush_delay_io_out)
  );
  assign io_tlb_resp_valid = ptwResp_valid; // @[Repeater.scala 244:21]
  assign io_tlb_resp_bits_data_entry_tag = ptwResp_entry_tag; // @[Repeater.scala 245:31]
  assign io_tlb_resp_bits_data_entry_asid = ptwResp_entry_asid; // @[Repeater.scala 245:31]
  assign io_tlb_resp_bits_data_entry_ppn = ptwResp_entry_ppn; // @[Repeater.scala 245:31]
  assign io_tlb_resp_bits_data_entry_perm_d = ptwResp_entry_perm_d; // @[Repeater.scala 245:31]
  assign io_tlb_resp_bits_data_entry_perm_a = ptwResp_entry_perm_a; // @[Repeater.scala 245:31]
  assign io_tlb_resp_bits_data_entry_perm_g = ptwResp_entry_perm_g; // @[Repeater.scala 245:31]
  assign io_tlb_resp_bits_data_entry_perm_u = ptwResp_entry_perm_u; // @[Repeater.scala 245:31]
  assign io_tlb_resp_bits_data_entry_perm_x = ptwResp_entry_perm_x; // @[Repeater.scala 245:31]
  assign io_tlb_resp_bits_data_entry_perm_w = ptwResp_entry_perm_w; // @[Repeater.scala 245:31]
  assign io_tlb_resp_bits_data_entry_perm_r = ptwResp_entry_perm_r; // @[Repeater.scala 245:31]
  assign io_tlb_resp_bits_data_entry_level = ptwResp_entry_level; // @[Repeater.scala 245:31]
  assign io_tlb_resp_bits_data_pf = ptwResp_pf; // @[Repeater.scala 246:28]
  assign io_tlb_resp_bits_data_af = ptwResp_af; // @[Repeater.scala 247:28]
  assign io_tlb_resp_bits_vector_0 = resp_vector_0; // @[Repeater.scala 249:27]
  assign io_tlb_resp_bits_vector_1 = resp_vector_1; // @[Repeater.scala 249:27]
  assign io_tlb_resp_bits_vector_2 = resp_vector_2; // @[Repeater.scala 249:27]
  assign io_tlb_resp_bits_vector_3 = resp_vector_3; // @[Repeater.scala 249:27]
  assign io_tlb_resp_bits_vector_4 = resp_vector_4; // @[Repeater.scala 249:27]
  assign io_ptw_req_0_valid = issue_valid & ~issue_filtered; // @[Repeater.scala 254:38]
  assign io_ptw_req_0_bits_vpn = 3'h7 == issPtr ? vpn_7 : _GEN_99; // @[Repeater.scala 255:{26,26}]
  assign io_ptw_resp_ready = 1'h1; // @[Repeater.scala 256:21]
  assign flush_delay_clock = clock;
  assign flush_delay_io_in = io_sfence_valid | io_csr_satp_changed; // @[Repeater.scala 168:38]
  always @(posedge clock) begin
    if (v_0) begin // @[Repeater.scala 268:17]
      ports_0_0 <= ports_0_0 | oldMatchVec2_0_0; // @[Repeater.scala 269:16]
    end else if (reqs_3_valid & canEnqueue) begin // @[Repeater.scala 260:38]
      if (3'h0 == enqPtrVec_3) begin // @[Repeater.scala 264:29]
        ports_0_0 <= filter_ports_xs_0_3[0]; // @[Repeater.scala 264:29]
      end else begin
        ports_0_0 <= _GEN_541;
      end
    end else begin
      ports_0_0 <= _GEN_541;
    end
    if (v_0) begin // @[Repeater.scala 268:17]
      ports_0_1 <= ports_0_1 | oldMatchVec2_1_0; // @[Repeater.scala 269:16]
    end else if (reqs_3_valid & canEnqueue) begin // @[Repeater.scala 260:38]
      if (3'h0 == enqPtrVec_3) begin // @[Repeater.scala 264:29]
        ports_0_1 <= filter_ports_xs_0_3[1]; // @[Repeater.scala 264:29]
      end else begin
        ports_0_1 <= _GEN_549;
      end
    end else begin
      ports_0_1 <= _GEN_549;
    end
    if (v_0) begin // @[Repeater.scala 268:17]
      ports_0_2 <= ports_0_2 | oldMatchVec2_2_0; // @[Repeater.scala 269:16]
    end else if (reqs_3_valid & canEnqueue) begin // @[Repeater.scala 260:38]
      if (3'h0 == enqPtrVec_3) begin // @[Repeater.scala 264:29]
        ports_0_2 <= filter_ports_xs_0_3[2]; // @[Repeater.scala 264:29]
      end else begin
        ports_0_2 <= _GEN_557;
      end
    end else begin
      ports_0_2 <= _GEN_557;
    end
    if (v_0) begin // @[Repeater.scala 268:17]
      ports_0_3 <= ports_0_3 | oldMatchVec2_3_0; // @[Repeater.scala 269:16]
    end else if (reqs_3_valid & canEnqueue) begin // @[Repeater.scala 260:38]
      if (3'h0 == enqPtrVec_3) begin // @[Repeater.scala 264:29]
        ports_0_3 <= filter_ports_xs_0_3[3]; // @[Repeater.scala 264:29]
      end else begin
        ports_0_3 <= _GEN_565;
      end
    end else begin
      ports_0_3 <= _GEN_565;
    end
    if (!(v_0)) begin // @[Repeater.scala 268:17]
      if (reqs_3_valid & canEnqueue) begin // @[Repeater.scala 260:38]
        if (3'h0 == enqPtrVec_3) begin // @[Repeater.scala 264:29]
          ports_0_4 <= filter_ports_xs_0_3[4]; // @[Repeater.scala 264:29]
        end else begin
          ports_0_4 <= _GEN_573;
        end
      end else begin
        ports_0_4 <= _GEN_573;
      end
    end
    if (v_1) begin // @[Repeater.scala 268:17]
      ports_1_0 <= ports_1_0 | oldMatchVec2_0_1; // @[Repeater.scala 269:16]
    end else if (reqs_3_valid & canEnqueue) begin // @[Repeater.scala 260:38]
      if (3'h1 == enqPtrVec_3) begin // @[Repeater.scala 264:29]
        ports_1_0 <= filter_ports_xs_0_3[0]; // @[Repeater.scala 264:29]
      end else begin
        ports_1_0 <= _GEN_542;
      end
    end else begin
      ports_1_0 <= _GEN_542;
    end
    if (v_1) begin // @[Repeater.scala 268:17]
      ports_1_1 <= ports_1_1 | oldMatchVec2_1_1; // @[Repeater.scala 269:16]
    end else if (reqs_3_valid & canEnqueue) begin // @[Repeater.scala 260:38]
      if (3'h1 == enqPtrVec_3) begin // @[Repeater.scala 264:29]
        ports_1_1 <= filter_ports_xs_0_3[1]; // @[Repeater.scala 264:29]
      end else begin
        ports_1_1 <= _GEN_550;
      end
    end else begin
      ports_1_1 <= _GEN_550;
    end
    if (v_1) begin // @[Repeater.scala 268:17]
      ports_1_2 <= ports_1_2 | oldMatchVec2_2_1; // @[Repeater.scala 269:16]
    end else if (reqs_3_valid & canEnqueue) begin // @[Repeater.scala 260:38]
      if (3'h1 == enqPtrVec_3) begin // @[Repeater.scala 264:29]
        ports_1_2 <= filter_ports_xs_0_3[2]; // @[Repeater.scala 264:29]
      end else begin
        ports_1_2 <= _GEN_558;
      end
    end else begin
      ports_1_2 <= _GEN_558;
    end
    if (v_1) begin // @[Repeater.scala 268:17]
      ports_1_3 <= ports_1_3 | oldMatchVec2_3_1; // @[Repeater.scala 269:16]
    end else if (reqs_3_valid & canEnqueue) begin // @[Repeater.scala 260:38]
      if (3'h1 == enqPtrVec_3) begin // @[Repeater.scala 264:29]
        ports_1_3 <= filter_ports_xs_0_3[3]; // @[Repeater.scala 264:29]
      end else begin
        ports_1_3 <= _GEN_566;
      end
    end else begin
      ports_1_3 <= _GEN_566;
    end
    if (!(v_1)) begin // @[Repeater.scala 268:17]
      if (reqs_3_valid & canEnqueue) begin // @[Repeater.scala 260:38]
        if (3'h1 == enqPtrVec_3) begin // @[Repeater.scala 264:29]
          ports_1_4 <= filter_ports_xs_0_3[4]; // @[Repeater.scala 264:29]
        end else begin
          ports_1_4 <= _GEN_574;
        end
      end else begin
        ports_1_4 <= _GEN_574;
      end
    end
    if (v_2) begin // @[Repeater.scala 268:17]
      ports_2_0 <= ports_2_0 | oldMatchVec2_0_2; // @[Repeater.scala 269:16]
    end else if (reqs_3_valid & canEnqueue) begin // @[Repeater.scala 260:38]
      if (3'h2 == enqPtrVec_3) begin // @[Repeater.scala 264:29]
        ports_2_0 <= filter_ports_xs_0_3[0]; // @[Repeater.scala 264:29]
      end else begin
        ports_2_0 <= _GEN_543;
      end
    end else begin
      ports_2_0 <= _GEN_543;
    end
    if (v_2) begin // @[Repeater.scala 268:17]
      ports_2_1 <= ports_2_1 | oldMatchVec2_1_2; // @[Repeater.scala 269:16]
    end else if (reqs_3_valid & canEnqueue) begin // @[Repeater.scala 260:38]
      if (3'h2 == enqPtrVec_3) begin // @[Repeater.scala 264:29]
        ports_2_1 <= filter_ports_xs_0_3[1]; // @[Repeater.scala 264:29]
      end else begin
        ports_2_1 <= _GEN_551;
      end
    end else begin
      ports_2_1 <= _GEN_551;
    end
    if (v_2) begin // @[Repeater.scala 268:17]
      ports_2_2 <= ports_2_2 | oldMatchVec2_2_2; // @[Repeater.scala 269:16]
    end else if (reqs_3_valid & canEnqueue) begin // @[Repeater.scala 260:38]
      if (3'h2 == enqPtrVec_3) begin // @[Repeater.scala 264:29]
        ports_2_2 <= filter_ports_xs_0_3[2]; // @[Repeater.scala 264:29]
      end else begin
        ports_2_2 <= _GEN_559;
      end
    end else begin
      ports_2_2 <= _GEN_559;
    end
    if (v_2) begin // @[Repeater.scala 268:17]
      ports_2_3 <= ports_2_3 | oldMatchVec2_3_2; // @[Repeater.scala 269:16]
    end else if (reqs_3_valid & canEnqueue) begin // @[Repeater.scala 260:38]
      if (3'h2 == enqPtrVec_3) begin // @[Repeater.scala 264:29]
        ports_2_3 <= filter_ports_xs_0_3[3]; // @[Repeater.scala 264:29]
      end else begin
        ports_2_3 <= _GEN_567;
      end
    end else begin
      ports_2_3 <= _GEN_567;
    end
    if (!(v_2)) begin // @[Repeater.scala 268:17]
      if (reqs_3_valid & canEnqueue) begin // @[Repeater.scala 260:38]
        if (3'h2 == enqPtrVec_3) begin // @[Repeater.scala 264:29]
          ports_2_4 <= filter_ports_xs_0_3[4]; // @[Repeater.scala 264:29]
        end else begin
          ports_2_4 <= _GEN_575;
        end
      end else begin
        ports_2_4 <= _GEN_575;
      end
    end
    if (v_3) begin // @[Repeater.scala 268:17]
      ports_3_0 <= ports_3_0 | oldMatchVec2_0_3; // @[Repeater.scala 269:16]
    end else if (reqs_3_valid & canEnqueue) begin // @[Repeater.scala 260:38]
      if (3'h3 == enqPtrVec_3) begin // @[Repeater.scala 264:29]
        ports_3_0 <= filter_ports_xs_0_3[0]; // @[Repeater.scala 264:29]
      end else begin
        ports_3_0 <= _GEN_544;
      end
    end else begin
      ports_3_0 <= _GEN_544;
    end
    if (v_3) begin // @[Repeater.scala 268:17]
      ports_3_1 <= ports_3_1 | oldMatchVec2_1_3; // @[Repeater.scala 269:16]
    end else if (reqs_3_valid & canEnqueue) begin // @[Repeater.scala 260:38]
      if (3'h3 == enqPtrVec_3) begin // @[Repeater.scala 264:29]
        ports_3_1 <= filter_ports_xs_0_3[1]; // @[Repeater.scala 264:29]
      end else begin
        ports_3_1 <= _GEN_552;
      end
    end else begin
      ports_3_1 <= _GEN_552;
    end
    if (v_3) begin // @[Repeater.scala 268:17]
      ports_3_2 <= ports_3_2 | oldMatchVec2_2_3; // @[Repeater.scala 269:16]
    end else if (reqs_3_valid & canEnqueue) begin // @[Repeater.scala 260:38]
      if (3'h3 == enqPtrVec_3) begin // @[Repeater.scala 264:29]
        ports_3_2 <= filter_ports_xs_0_3[2]; // @[Repeater.scala 264:29]
      end else begin
        ports_3_2 <= _GEN_560;
      end
    end else begin
      ports_3_2 <= _GEN_560;
    end
    if (v_3) begin // @[Repeater.scala 268:17]
      ports_3_3 <= ports_3_3 | oldMatchVec2_3_3; // @[Repeater.scala 269:16]
    end else if (reqs_3_valid & canEnqueue) begin // @[Repeater.scala 260:38]
      if (3'h3 == enqPtrVec_3) begin // @[Repeater.scala 264:29]
        ports_3_3 <= filter_ports_xs_0_3[3]; // @[Repeater.scala 264:29]
      end else begin
        ports_3_3 <= _GEN_568;
      end
    end else begin
      ports_3_3 <= _GEN_568;
    end
    if (!(v_3)) begin // @[Repeater.scala 268:17]
      if (reqs_3_valid & canEnqueue) begin // @[Repeater.scala 260:38]
        if (3'h3 == enqPtrVec_3) begin // @[Repeater.scala 264:29]
          ports_3_4 <= filter_ports_xs_0_3[4]; // @[Repeater.scala 264:29]
        end else begin
          ports_3_4 <= _GEN_576;
        end
      end else begin
        ports_3_4 <= _GEN_576;
      end
    end
    if (v_4) begin // @[Repeater.scala 268:17]
      ports_4_0 <= ports_4_0 | oldMatchVec2_0_4; // @[Repeater.scala 269:16]
    end else if (reqs_3_valid & canEnqueue) begin // @[Repeater.scala 260:38]
      if (3'h4 == enqPtrVec_3) begin // @[Repeater.scala 264:29]
        ports_4_0 <= filter_ports_xs_0_3[0]; // @[Repeater.scala 264:29]
      end else begin
        ports_4_0 <= _GEN_545;
      end
    end else begin
      ports_4_0 <= _GEN_545;
    end
    if (v_4) begin // @[Repeater.scala 268:17]
      ports_4_1 <= ports_4_1 | oldMatchVec2_1_4; // @[Repeater.scala 269:16]
    end else if (reqs_3_valid & canEnqueue) begin // @[Repeater.scala 260:38]
      if (3'h4 == enqPtrVec_3) begin // @[Repeater.scala 264:29]
        ports_4_1 <= filter_ports_xs_0_3[1]; // @[Repeater.scala 264:29]
      end else begin
        ports_4_1 <= _GEN_553;
      end
    end else begin
      ports_4_1 <= _GEN_553;
    end
    if (v_4) begin // @[Repeater.scala 268:17]
      ports_4_2 <= ports_4_2 | oldMatchVec2_2_4; // @[Repeater.scala 269:16]
    end else if (reqs_3_valid & canEnqueue) begin // @[Repeater.scala 260:38]
      if (3'h4 == enqPtrVec_3) begin // @[Repeater.scala 264:29]
        ports_4_2 <= filter_ports_xs_0_3[2]; // @[Repeater.scala 264:29]
      end else begin
        ports_4_2 <= _GEN_561;
      end
    end else begin
      ports_4_2 <= _GEN_561;
    end
    if (v_4) begin // @[Repeater.scala 268:17]
      ports_4_3 <= ports_4_3 | oldMatchVec2_3_4; // @[Repeater.scala 269:16]
    end else if (reqs_3_valid & canEnqueue) begin // @[Repeater.scala 260:38]
      if (3'h4 == enqPtrVec_3) begin // @[Repeater.scala 264:29]
        ports_4_3 <= filter_ports_xs_0_3[3]; // @[Repeater.scala 264:29]
      end else begin
        ports_4_3 <= _GEN_569;
      end
    end else begin
      ports_4_3 <= _GEN_569;
    end
    if (!(v_4)) begin // @[Repeater.scala 268:17]
      if (reqs_3_valid & canEnqueue) begin // @[Repeater.scala 260:38]
        if (3'h4 == enqPtrVec_3) begin // @[Repeater.scala 264:29]
          ports_4_4 <= filter_ports_xs_0_3[4]; // @[Repeater.scala 264:29]
        end else begin
          ports_4_4 <= _GEN_577;
        end
      end else begin
        ports_4_4 <= _GEN_577;
      end
    end
    if (v_5) begin // @[Repeater.scala 268:17]
      ports_5_0 <= ports_5_0 | oldMatchVec2_0_5; // @[Repeater.scala 269:16]
    end else if (reqs_3_valid & canEnqueue) begin // @[Repeater.scala 260:38]
      if (3'h5 == enqPtrVec_3) begin // @[Repeater.scala 264:29]
        ports_5_0 <= filter_ports_xs_0_3[0]; // @[Repeater.scala 264:29]
      end else begin
        ports_5_0 <= _GEN_546;
      end
    end else begin
      ports_5_0 <= _GEN_546;
    end
    if (v_5) begin // @[Repeater.scala 268:17]
      ports_5_1 <= ports_5_1 | oldMatchVec2_1_5; // @[Repeater.scala 269:16]
    end else if (reqs_3_valid & canEnqueue) begin // @[Repeater.scala 260:38]
      if (3'h5 == enqPtrVec_3) begin // @[Repeater.scala 264:29]
        ports_5_1 <= filter_ports_xs_0_3[1]; // @[Repeater.scala 264:29]
      end else begin
        ports_5_1 <= _GEN_554;
      end
    end else begin
      ports_5_1 <= _GEN_554;
    end
    if (v_5) begin // @[Repeater.scala 268:17]
      ports_5_2 <= ports_5_2 | oldMatchVec2_2_5; // @[Repeater.scala 269:16]
    end else if (reqs_3_valid & canEnqueue) begin // @[Repeater.scala 260:38]
      if (3'h5 == enqPtrVec_3) begin // @[Repeater.scala 264:29]
        ports_5_2 <= filter_ports_xs_0_3[2]; // @[Repeater.scala 264:29]
      end else begin
        ports_5_2 <= _GEN_562;
      end
    end else begin
      ports_5_2 <= _GEN_562;
    end
    if (v_5) begin // @[Repeater.scala 268:17]
      ports_5_3 <= ports_5_3 | oldMatchVec2_3_5; // @[Repeater.scala 269:16]
    end else if (reqs_3_valid & canEnqueue) begin // @[Repeater.scala 260:38]
      if (3'h5 == enqPtrVec_3) begin // @[Repeater.scala 264:29]
        ports_5_3 <= filter_ports_xs_0_3[3]; // @[Repeater.scala 264:29]
      end else begin
        ports_5_3 <= _GEN_570;
      end
    end else begin
      ports_5_3 <= _GEN_570;
    end
    if (!(v_5)) begin // @[Repeater.scala 268:17]
      if (reqs_3_valid & canEnqueue) begin // @[Repeater.scala 260:38]
        if (3'h5 == enqPtrVec_3) begin // @[Repeater.scala 264:29]
          ports_5_4 <= filter_ports_xs_0_3[4]; // @[Repeater.scala 264:29]
        end else begin
          ports_5_4 <= _GEN_578;
        end
      end else begin
        ports_5_4 <= _GEN_578;
      end
    end
    if (v_6) begin // @[Repeater.scala 268:17]
      ports_6_0 <= ports_6_0 | oldMatchVec2_0_6; // @[Repeater.scala 269:16]
    end else if (reqs_3_valid & canEnqueue) begin // @[Repeater.scala 260:38]
      if (3'h6 == enqPtrVec_3) begin // @[Repeater.scala 264:29]
        ports_6_0 <= filter_ports_xs_0_3[0]; // @[Repeater.scala 264:29]
      end else begin
        ports_6_0 <= _GEN_547;
      end
    end else begin
      ports_6_0 <= _GEN_547;
    end
    if (v_6) begin // @[Repeater.scala 268:17]
      ports_6_1 <= ports_6_1 | oldMatchVec2_1_6; // @[Repeater.scala 269:16]
    end else if (reqs_3_valid & canEnqueue) begin // @[Repeater.scala 260:38]
      if (3'h6 == enqPtrVec_3) begin // @[Repeater.scala 264:29]
        ports_6_1 <= filter_ports_xs_0_3[1]; // @[Repeater.scala 264:29]
      end else begin
        ports_6_1 <= _GEN_555;
      end
    end else begin
      ports_6_1 <= _GEN_555;
    end
    if (v_6) begin // @[Repeater.scala 268:17]
      ports_6_2 <= ports_6_2 | oldMatchVec2_2_6; // @[Repeater.scala 269:16]
    end else if (reqs_3_valid & canEnqueue) begin // @[Repeater.scala 260:38]
      if (3'h6 == enqPtrVec_3) begin // @[Repeater.scala 264:29]
        ports_6_2 <= filter_ports_xs_0_3[2]; // @[Repeater.scala 264:29]
      end else begin
        ports_6_2 <= _GEN_563;
      end
    end else begin
      ports_6_2 <= _GEN_563;
    end
    if (v_6) begin // @[Repeater.scala 268:17]
      ports_6_3 <= ports_6_3 | oldMatchVec2_3_6; // @[Repeater.scala 269:16]
    end else if (reqs_3_valid & canEnqueue) begin // @[Repeater.scala 260:38]
      if (3'h6 == enqPtrVec_3) begin // @[Repeater.scala 264:29]
        ports_6_3 <= filter_ports_xs_0_3[3]; // @[Repeater.scala 264:29]
      end else begin
        ports_6_3 <= _GEN_571;
      end
    end else begin
      ports_6_3 <= _GEN_571;
    end
    if (!(v_6)) begin // @[Repeater.scala 268:17]
      if (reqs_3_valid & canEnqueue) begin // @[Repeater.scala 260:38]
        if (3'h6 == enqPtrVec_3) begin // @[Repeater.scala 264:29]
          ports_6_4 <= filter_ports_xs_0_3[4]; // @[Repeater.scala 264:29]
        end else begin
          ports_6_4 <= _GEN_579;
        end
      end else begin
        ports_6_4 <= _GEN_579;
      end
    end
    if (v_7) begin // @[Repeater.scala 268:17]
      ports_7_0 <= ports_7_0 | oldMatchVec2_0_7; // @[Repeater.scala 269:16]
    end else if (reqs_3_valid & canEnqueue) begin // @[Repeater.scala 260:38]
      if (3'h7 == enqPtrVec_3) begin // @[Repeater.scala 264:29]
        ports_7_0 <= filter_ports_xs_0_3[0]; // @[Repeater.scala 264:29]
      end else begin
        ports_7_0 <= _GEN_548;
      end
    end else begin
      ports_7_0 <= _GEN_548;
    end
    if (v_7) begin // @[Repeater.scala 268:17]
      ports_7_1 <= ports_7_1 | oldMatchVec2_1_7; // @[Repeater.scala 269:16]
    end else if (reqs_3_valid & canEnqueue) begin // @[Repeater.scala 260:38]
      if (3'h7 == enqPtrVec_3) begin // @[Repeater.scala 264:29]
        ports_7_1 <= filter_ports_xs_0_3[1]; // @[Repeater.scala 264:29]
      end else begin
        ports_7_1 <= _GEN_556;
      end
    end else begin
      ports_7_1 <= _GEN_556;
    end
    if (v_7) begin // @[Repeater.scala 268:17]
      ports_7_2 <= ports_7_2 | oldMatchVec2_2_7; // @[Repeater.scala 269:16]
    end else if (reqs_3_valid & canEnqueue) begin // @[Repeater.scala 260:38]
      if (3'h7 == enqPtrVec_3) begin // @[Repeater.scala 264:29]
        ports_7_2 <= filter_ports_xs_0_3[2]; // @[Repeater.scala 264:29]
      end else begin
        ports_7_2 <= _GEN_564;
      end
    end else begin
      ports_7_2 <= _GEN_564;
    end
    if (v_7) begin // @[Repeater.scala 268:17]
      ports_7_3 <= ports_7_3 | oldMatchVec2_3_7; // @[Repeater.scala 269:16]
    end else if (reqs_3_valid & canEnqueue) begin // @[Repeater.scala 260:38]
      if (3'h7 == enqPtrVec_3) begin // @[Repeater.scala 264:29]
        ports_7_3 <= filter_ports_xs_0_3[3]; // @[Repeater.scala 264:29]
      end else begin
        ports_7_3 <= _GEN_572;
      end
    end else begin
      ports_7_3 <= _GEN_572;
    end
    if (!(v_7)) begin // @[Repeater.scala 268:17]
      if (reqs_3_valid & canEnqueue) begin // @[Repeater.scala 260:38]
        if (3'h7 == enqPtrVec_3) begin // @[Repeater.scala 264:29]
          ports_7_4 <= filter_ports_xs_0_3[4]; // @[Repeater.scala 264:29]
        end else begin
          ports_7_4 <= _GEN_580;
        end
      end else begin
        ports_7_4 <= _GEN_580;
      end
    end
    if (reqs_3_valid & canEnqueue) begin // @[Repeater.scala 260:38]
      if (3'h0 == enqPtrVec_3) begin // @[Repeater.scala 262:27]
        vpn_0 <= tlb_req_3_bits_rvpn; // @[Repeater.scala 262:27]
      end else begin
        vpn_0 <= _GEN_509;
      end
    end else begin
      vpn_0 <= _GEN_509;
    end
    if (reqs_3_valid & canEnqueue) begin // @[Repeater.scala 260:38]
      if (3'h1 == enqPtrVec_3) begin // @[Repeater.scala 262:27]
        vpn_1 <= tlb_req_3_bits_rvpn; // @[Repeater.scala 262:27]
      end else begin
        vpn_1 <= _GEN_510;
      end
    end else begin
      vpn_1 <= _GEN_510;
    end
    if (reqs_3_valid & canEnqueue) begin // @[Repeater.scala 260:38]
      if (3'h2 == enqPtrVec_3) begin // @[Repeater.scala 262:27]
        vpn_2 <= tlb_req_3_bits_rvpn; // @[Repeater.scala 262:27]
      end else begin
        vpn_2 <= _GEN_511;
      end
    end else begin
      vpn_2 <= _GEN_511;
    end
    if (reqs_3_valid & canEnqueue) begin // @[Repeater.scala 260:38]
      if (3'h3 == enqPtrVec_3) begin // @[Repeater.scala 262:27]
        vpn_3 <= tlb_req_3_bits_rvpn; // @[Repeater.scala 262:27]
      end else begin
        vpn_3 <= _GEN_512;
      end
    end else begin
      vpn_3 <= _GEN_512;
    end
    if (reqs_3_valid & canEnqueue) begin // @[Repeater.scala 260:38]
      if (3'h4 == enqPtrVec_3) begin // @[Repeater.scala 262:27]
        vpn_4 <= tlb_req_3_bits_rvpn; // @[Repeater.scala 262:27]
      end else begin
        vpn_4 <= _GEN_513;
      end
    end else begin
      vpn_4 <= _GEN_513;
    end
    if (reqs_3_valid & canEnqueue) begin // @[Repeater.scala 260:38]
      if (3'h5 == enqPtrVec_3) begin // @[Repeater.scala 262:27]
        vpn_5 <= tlb_req_3_bits_rvpn; // @[Repeater.scala 262:27]
      end else begin
        vpn_5 <= _GEN_514;
      end
    end else begin
      vpn_5 <= _GEN_514;
    end
    if (reqs_3_valid & canEnqueue) begin // @[Repeater.scala 260:38]
      if (3'h6 == enqPtrVec_3) begin // @[Repeater.scala 262:27]
        vpn_6 <= tlb_req_3_bits_rvpn; // @[Repeater.scala 262:27]
      end else begin
        vpn_6 <= _GEN_515;
      end
    end else begin
      vpn_6 <= _GEN_515;
    end
    if (reqs_3_valid & canEnqueue) begin // @[Repeater.scala 260:38]
      if (3'h7 == enqPtrVec_3) begin // @[Repeater.scala 262:27]
        vpn_7 <= tlb_req_3_bits_rvpn; // @[Repeater.scala 262:27]
      end else begin
        vpn_7 <= _GEN_516;
      end
    end else begin
      vpn_7 <= _GEN_516;
    end
    if (_T_1) begin // @[Reg.scala 17:18]
      ptwResp_entry_tag <= io_ptw_resp_bits_entry_tag; // @[Reg.scala 17:22]
    end
    if (_T_1) begin // @[Reg.scala 17:18]
      ptwResp_entry_asid <= io_ptw_resp_bits_entry_asid; // @[Reg.scala 17:22]
    end
    if (_T_1) begin // @[Reg.scala 17:18]
      ptwResp_entry_ppn <= io_ptw_resp_bits_entry_ppn; // @[Reg.scala 17:22]
    end
    if (_T_1) begin // @[Reg.scala 17:18]
      ptwResp_entry_perm_d <= io_ptw_resp_bits_entry_perm_d; // @[Reg.scala 17:22]
    end
    if (_T_1) begin // @[Reg.scala 17:18]
      ptwResp_entry_perm_a <= io_ptw_resp_bits_entry_perm_a; // @[Reg.scala 17:22]
    end
    if (_T_1) begin // @[Reg.scala 17:18]
      ptwResp_entry_perm_g <= io_ptw_resp_bits_entry_perm_g; // @[Reg.scala 17:22]
    end
    if (_T_1) begin // @[Reg.scala 17:18]
      ptwResp_entry_perm_u <= io_ptw_resp_bits_entry_perm_u; // @[Reg.scala 17:22]
    end
    if (_T_1) begin // @[Reg.scala 17:18]
      ptwResp_entry_perm_x <= io_ptw_resp_bits_entry_perm_x; // @[Reg.scala 17:22]
    end
    if (_T_1) begin // @[Reg.scala 17:18]
      ptwResp_entry_perm_w <= io_ptw_resp_bits_entry_perm_w; // @[Reg.scala 17:22]
    end
    if (_T_1) begin // @[Reg.scala 17:18]
      ptwResp_entry_perm_r <= io_ptw_resp_bits_entry_perm_r; // @[Reg.scala 17:22]
    end
    if (_T_1) begin // @[Reg.scala 17:18]
      ptwResp_entry_level <= io_ptw_resp_bits_entry_level; // @[Reg.scala 17:22]
    end
    if (_T_1) begin // @[Reg.scala 17:18]
      ptwResp_pf <= io_ptw_resp_bits_pf; // @[Reg.scala 17:22]
    end
    if (_T_1) begin // @[Reg.scala 17:18]
      ptwResp_af <= io_ptw_resp_bits_af; // @[Reg.scala 17:22]
    end
    if (io_tlb_req_0_valid) begin // @[Reg.scala 17:18]
      tlb_req_0_bits_rvpn <= io_tlb_req_0_bits_vpn; // @[Reg.scala 17:22]
    end
    oldMatchVec_0 <= |_oldMatchVec_T; // @[Repeater.scala 195:63]
    if (io_tlb_req_1_valid) begin // @[Reg.scala 17:18]
      tlb_req_1_bits_rvpn <= io_tlb_req_1_bits_vpn; // @[Reg.scala 17:22]
    end
    oldMatchVec_1 <= |_oldMatchVec_T_2; // @[Repeater.scala 195:63]
    newMatchVec_REG_5 <= io_tlb_req_1_bits_vpn == io_tlb_req_0_bits_vpn; // @[Repeater.scala 185:78]
    if (io_tlb_req_2_valid) begin // @[Reg.scala 17:18]
      tlb_req_2_bits_rvpn <= io_tlb_req_2_bits_vpn; // @[Reg.scala 17:22]
    end
    oldMatchVec_2 <= |_oldMatchVec_T_4; // @[Repeater.scala 195:63]
    newMatchVec_REG_10 <= io_tlb_req_2_bits_vpn == io_tlb_req_0_bits_vpn; // @[Repeater.scala 185:78]
    newMatchVec_REG_11 <= io_tlb_req_2_bits_vpn == io_tlb_req_1_bits_vpn; // @[Repeater.scala 185:78]
    if (io_tlb_req_3_valid) begin // @[Reg.scala 17:18]
      tlb_req_3_bits_rvpn <= io_tlb_req_3_bits_vpn; // @[Reg.scala 17:22]
    end
    oldMatchVec_3 <= |_oldMatchVec_T_6; // @[Repeater.scala 195:63]
    newMatchVec_REG_15 <= io_tlb_req_3_bits_vpn == io_tlb_req_0_bits_vpn; // @[Repeater.scala 185:78]
    newMatchVec_REG_16 <= io_tlb_req_3_bits_vpn == io_tlb_req_1_bits_vpn; // @[Repeater.scala 185:78]
    newMatchVec_REG_17 <= io_tlb_req_3_bits_vpn == io_tlb_req_2_bits_vpn; // @[Repeater.scala 185:78]
    newMatchVec_REG_1 <= io_tlb_req_0_bits_vpn == io_tlb_req_1_bits_vpn; // @[Repeater.scala 185:78]
    newMatchVec_REG_2 <= io_tlb_req_0_bits_vpn == io_tlb_req_2_bits_vpn; // @[Repeater.scala 185:78]
    newMatchVec_REG_3 <= io_tlb_req_0_bits_vpn == io_tlb_req_3_bits_vpn; // @[Repeater.scala 185:78]
    newMatchVec_REG_7 <= io_tlb_req_1_bits_vpn == io_tlb_req_2_bits_vpn; // @[Repeater.scala 185:78]
    newMatchVec_REG_8 <= io_tlb_req_1_bits_vpn == io_tlb_req_3_bits_vpn; // @[Repeater.scala 185:78]
    newMatchVec_REG_13 <= io_tlb_req_2_bits_vpn == io_tlb_req_3_bits_vpn; // @[Repeater.scala 185:78]
    oldMatchVec2_REG <= v_0 & vpn_0 == io_tlb_req_0_bits_vpn; // @[Repeater.scala 183:83]
    oldMatchVec2_REG_1 <= v_1 & vpn_1 == io_tlb_req_0_bits_vpn; // @[Repeater.scala 183:83]
    oldMatchVec2_REG_2 <= v_2 & vpn_2 == io_tlb_req_0_bits_vpn; // @[Repeater.scala 183:83]
    oldMatchVec2_REG_3 <= v_3 & vpn_3 == io_tlb_req_0_bits_vpn; // @[Repeater.scala 183:83]
    oldMatchVec2_REG_4 <= v_4 & vpn_4 == io_tlb_req_0_bits_vpn; // @[Repeater.scala 183:83]
    oldMatchVec2_REG_5 <= v_5 & vpn_5 == io_tlb_req_0_bits_vpn; // @[Repeater.scala 183:83]
    oldMatchVec2_REG_6 <= v_6 & vpn_6 == io_tlb_req_0_bits_vpn; // @[Repeater.scala 183:83]
    oldMatchVec2_REG_7 <= v_7 & vpn_7 == io_tlb_req_0_bits_vpn; // @[Repeater.scala 183:83]
    oldMatchVec2_REG_8 <= v_0 & vpn_0 == io_tlb_req_1_bits_vpn; // @[Repeater.scala 183:83]
    oldMatchVec2_REG_9 <= v_1 & vpn_1 == io_tlb_req_1_bits_vpn; // @[Repeater.scala 183:83]
    oldMatchVec2_REG_10 <= v_2 & vpn_2 == io_tlb_req_1_bits_vpn; // @[Repeater.scala 183:83]
    oldMatchVec2_REG_11 <= v_3 & vpn_3 == io_tlb_req_1_bits_vpn; // @[Repeater.scala 183:83]
    oldMatchVec2_REG_12 <= v_4 & vpn_4 == io_tlb_req_1_bits_vpn; // @[Repeater.scala 183:83]
    oldMatchVec2_REG_13 <= v_5 & vpn_5 == io_tlb_req_1_bits_vpn; // @[Repeater.scala 183:83]
    oldMatchVec2_REG_14 <= v_6 & vpn_6 == io_tlb_req_1_bits_vpn; // @[Repeater.scala 183:83]
    oldMatchVec2_REG_15 <= v_7 & vpn_7 == io_tlb_req_1_bits_vpn; // @[Repeater.scala 183:83]
    oldMatchVec2_REG_16 <= v_0 & vpn_0 == io_tlb_req_2_bits_vpn; // @[Repeater.scala 183:83]
    oldMatchVec2_REG_17 <= v_1 & vpn_1 == io_tlb_req_2_bits_vpn; // @[Repeater.scala 183:83]
    oldMatchVec2_REG_18 <= v_2 & vpn_2 == io_tlb_req_2_bits_vpn; // @[Repeater.scala 183:83]
    oldMatchVec2_REG_19 <= v_3 & vpn_3 == io_tlb_req_2_bits_vpn; // @[Repeater.scala 183:83]
    oldMatchVec2_REG_20 <= v_4 & vpn_4 == io_tlb_req_2_bits_vpn; // @[Repeater.scala 183:83]
    oldMatchVec2_REG_21 <= v_5 & vpn_5 == io_tlb_req_2_bits_vpn; // @[Repeater.scala 183:83]
    oldMatchVec2_REG_22 <= v_6 & vpn_6 == io_tlb_req_2_bits_vpn; // @[Repeater.scala 183:83]
    oldMatchVec2_REG_23 <= v_7 & vpn_7 == io_tlb_req_2_bits_vpn; // @[Repeater.scala 183:83]
    oldMatchVec2_REG_24 <= v_0 & vpn_0 == io_tlb_req_3_bits_vpn; // @[Repeater.scala 183:83]
    oldMatchVec2_REG_25 <= v_1 & vpn_1 == io_tlb_req_3_bits_vpn; // @[Repeater.scala 183:83]
    oldMatchVec2_REG_26 <= v_2 & vpn_2 == io_tlb_req_3_bits_vpn; // @[Repeater.scala 183:83]
    oldMatchVec2_REG_27 <= v_3 & vpn_3 == io_tlb_req_3_bits_vpn; // @[Repeater.scala 183:83]
    oldMatchVec2_REG_28 <= v_4 & vpn_4 == io_tlb_req_3_bits_vpn; // @[Repeater.scala 183:83]
    oldMatchVec2_REG_29 <= v_5 & vpn_5 == io_tlb_req_3_bits_vpn; // @[Repeater.scala 183:83]
    oldMatchVec2_REG_30 <= v_6 & vpn_6 == io_tlb_req_3_bits_vpn; // @[Repeater.scala 183:83]
    oldMatchVec2_REG_31 <= v_7 & vpn_7 == io_tlb_req_3_bits_vpn; // @[Repeater.scala 183:83]
    if (_T_1) begin // @[Reg.scala 17:18]
      resp_vector_0 <= _resp_vector_T_50[0]; // @[Reg.scala 17:22]
    end
    if (_T_1) begin // @[Reg.scala 17:18]
      resp_vector_1 <= _resp_vector_T_50[1]; // @[Reg.scala 17:22]
    end
    if (_T_1) begin // @[Reg.scala 17:18]
      resp_vector_2 <= _resp_vector_T_50[2]; // @[Reg.scala 17:22]
    end
    if (_T_1) begin // @[Reg.scala 17:18]
      resp_vector_3 <= _resp_vector_T_50[3]; // @[Reg.scala 17:22]
    end
    if (_T_1) begin // @[Reg.scala 17:18]
      resp_vector_4 <= _resp_vector_T_50[4]; // @[Reg.scala 17:22]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Repeater.scala 310:16]
      v_0 <= 1'h0; // @[Repeater.scala 311:13]
    end else if (flush_delay_io_out) begin // @[Repeater.scala 295:29]
      v_0 <= 1'h0; // @[Repeater.scala 296:{64,69}]
    end else if (_T_1) begin
      if (ptwResp_OldMatchVec_0) begin
        v_0 <= 1'h0;
      end else begin
        v_0 <= _GEN_960;
      end
    end else begin
      v_0 <= _GEN_960;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Repeater.scala 310:16]
      v_1 <= 1'h0; // @[Repeater.scala 311:13]
    end else if (flush_delay_io_out) begin // @[Repeater.scala 295:29]
      v_1 <= 1'h0; // @[Repeater.scala 296:{64,69}]
    end else if (_T_1) begin
      if (ptwResp_OldMatchVec_1) begin
        v_1 <= 1'h0;
      end else begin
        v_1 <= _GEN_961;
      end
    end else begin
      v_1 <= _GEN_961;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Repeater.scala 310:16]
      v_2 <= 1'h0; // @[Repeater.scala 311:13]
    end else if (flush_delay_io_out) begin // @[Repeater.scala 295:29]
      v_2 <= 1'h0; // @[Repeater.scala 296:{64,69}]
    end else if (_T_1) begin
      if (ptwResp_OldMatchVec_2) begin
        v_2 <= 1'h0;
      end else begin
        v_2 <= _GEN_962;
      end
    end else begin
      v_2 <= _GEN_962;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Repeater.scala 310:16]
      v_3 <= 1'h0; // @[Repeater.scala 311:13]
    end else if (flush_delay_io_out) begin // @[Repeater.scala 295:29]
      v_3 <= 1'h0; // @[Repeater.scala 296:{64,69}]
    end else if (_T_1) begin
      if (ptwResp_OldMatchVec_3) begin
        v_3 <= 1'h0;
      end else begin
        v_3 <= _GEN_963;
      end
    end else begin
      v_3 <= _GEN_963;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Repeater.scala 310:16]
      v_4 <= 1'h0; // @[Repeater.scala 311:13]
    end else if (flush_delay_io_out) begin // @[Repeater.scala 295:29]
      v_4 <= 1'h0; // @[Repeater.scala 296:{64,69}]
    end else if (_T_1) begin
      if (ptwResp_OldMatchVec_4) begin
        v_4 <= 1'h0;
      end else begin
        v_4 <= _GEN_964;
      end
    end else begin
      v_4 <= _GEN_964;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Repeater.scala 310:16]
      v_5 <= 1'h0; // @[Repeater.scala 311:13]
    end else if (flush_delay_io_out) begin // @[Repeater.scala 295:29]
      v_5 <= 1'h0; // @[Repeater.scala 296:{64,69}]
    end else if (_T_1) begin
      if (ptwResp_OldMatchVec_5) begin
        v_5 <= 1'h0;
      end else begin
        v_5 <= _GEN_965;
      end
    end else begin
      v_5 <= _GEN_965;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Repeater.scala 310:16]
      v_6 <= 1'h0; // @[Repeater.scala 311:13]
    end else if (flush_delay_io_out) begin // @[Repeater.scala 295:29]
      v_6 <= 1'h0; // @[Repeater.scala 296:{64,69}]
    end else if (_T_1) begin
      if (ptwResp_OldMatchVec_6) begin
        v_6 <= 1'h0;
      end else begin
        v_6 <= _GEN_966;
      end
    end else begin
      v_6 <= _GEN_966;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Repeater.scala 310:16]
      v_7 <= 1'h0; // @[Repeater.scala 311:13]
    end else if (flush_delay_io_out) begin // @[Repeater.scala 295:29]
      v_7 <= 1'h0; // @[Repeater.scala 296:{64,69}]
    end else if (_T_1) begin
      if (ptwResp_OldMatchVec_7) begin
        v_7 <= 1'h0;
      end else begin
        v_7 <= _GEN_967;
      end
    end else begin
      v_7 <= _GEN_967;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Repeater.scala 310:16]
      enqPtr <= 3'h0; // @[Repeater.scala 313:12]
    end else if (flush_delay_io_out) begin // @[Repeater.scala 276:17]
      enqPtr <= 3'h0; // @[Repeater.scala 277:12]
    end else if (do_enq) begin // @[Repeater.scala 161:23]
      enqPtr <= _enqPtr_T_1;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Repeater.scala 310:16]
      issPtr <= 3'h0; // @[Repeater.scala 314:12]
    end else if (flush_delay_io_out) begin // @[Repeater.scala 282:17]
      issPtr <= 3'h0; // @[Repeater.scala 283:12]
    end else if (do_iss) begin // @[Repeater.scala 162:23]
      issPtr <= _issPtr_T_1;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Repeater.scala 310:16]
      deqPtr <= 3'h0; // @[Repeater.scala 312:12]
    end else if (flush_delay_io_out) begin // @[Repeater.scala 279:17]
      deqPtr <= 3'h0; // @[Repeater.scala 280:12]
    end else if (do_deq) begin // @[Repeater.scala 163:23]
      deqPtr <= _deqPtr_T_1;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Repeater.scala 310:16]
      mayFullDeq <= 1'h0; // @[Repeater.scala 316:16]
    end else if (flush_delay_io_out) begin // @[Repeater.scala 288:28]
      mayFullDeq <= 1'h0; // @[Repeater.scala 289:16]
    end else if (do_enq != do_deq) begin // @[Repeater.scala 164:27]
      mayFullDeq <= do_enq;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Repeater.scala 310:16]
      mayFullIss <= 1'h0; // @[Repeater.scala 317:16]
    end else if (flush_delay_io_out) begin // @[Repeater.scala 291:28]
      mayFullIss <= 1'h0; // @[Repeater.scala 292:16]
    end else if (do_enq != do_iss) begin // @[Repeater.scala 165:27]
      mayFullIss <= do_enq;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Repeater.scala 310:16]
      counter <= 4'h0; // @[Repeater.scala 318:13]
    end else if (flush_delay_io_out) begin // @[Repeater.scala 299:11]
      counter <= 4'h0;
    end else begin
      counter <= _counter_T_4;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Repeater.scala 310:16]
      inflight_counter <= 4'h0; // @[Repeater.scala 319:22]
    end else if (flush_delay_io_out) begin // @[Repeater.scala 174:54]
      inflight_counter <= 4'h0; // @[Repeater.scala 175:28]
    end else if (_T != _T_1) begin // @[Repeater.scala 172:33]
      if (_T) begin
        inflight_counter <= _inflight_counter_T_2;
      end else begin
        inflight_counter <= _inflight_counter_T_4;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Repeater.scala 310:16]
      ptwResp_valid <= 1'h0; // @[Repeater.scala 315:19]
    end else if (flush_delay_io_out) begin // @[Repeater.scala 182:30]
      ptwResp_valid <= 1'h0;
    end else begin
      ptwResp_valid <= _T_1 & |_ptwResp_valid_T_1;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Repeater.scala 189:86]
      tlb_req_0_valid_REG <= 1'h0;
    end else begin
      tlb_req_0_valid_REG <= _tlb_req_0_valid_T_10 & _tlb_req_0_valid_T_13;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Repeater.scala 189:86]
      tlb_req_1_valid_REG <= 1'h0;
    end else begin
      tlb_req_1_valid_REG <= _tlb_req_1_valid_T_10 & _tlb_req_1_valid_T_13;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Repeater.scala 189:86]
      tlb_req_2_valid_REG <= 1'h0;
    end else begin
      tlb_req_2_valid_REG <= _tlb_req_2_valid_T_10 & _tlb_req_2_valid_T_13;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Repeater.scala 189:86]
      tlb_req_3_valid_REG <= 1'h0;
    end else begin
      tlb_req_3_valid_REG <= _tlb_req_3_valid_T_10 & _tlb_req_3_valid_T_13;
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
  v_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  v_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  v_2 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  v_3 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  v_4 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  v_5 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  v_6 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  v_7 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  ports_0_0 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  ports_0_1 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  ports_0_2 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  ports_0_3 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  ports_0_4 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  ports_1_0 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  ports_1_1 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  ports_1_2 = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  ports_1_3 = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  ports_1_4 = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  ports_2_0 = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  ports_2_1 = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  ports_2_2 = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  ports_2_3 = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  ports_2_4 = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  ports_3_0 = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  ports_3_1 = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  ports_3_2 = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  ports_3_3 = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  ports_3_4 = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  ports_4_0 = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  ports_4_1 = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  ports_4_2 = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  ports_4_3 = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  ports_4_4 = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  ports_5_0 = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  ports_5_1 = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  ports_5_2 = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  ports_5_3 = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  ports_5_4 = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  ports_6_0 = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  ports_6_1 = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  ports_6_2 = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  ports_6_3 = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  ports_6_4 = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  ports_7_0 = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  ports_7_1 = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  ports_7_2 = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  ports_7_3 = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  ports_7_4 = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  vpn_0 = _RAND_48[26:0];
  _RAND_49 = {1{`RANDOM}};
  vpn_1 = _RAND_49[26:0];
  _RAND_50 = {1{`RANDOM}};
  vpn_2 = _RAND_50[26:0];
  _RAND_51 = {1{`RANDOM}};
  vpn_3 = _RAND_51[26:0];
  _RAND_52 = {1{`RANDOM}};
  vpn_4 = _RAND_52[26:0];
  _RAND_53 = {1{`RANDOM}};
  vpn_5 = _RAND_53[26:0];
  _RAND_54 = {1{`RANDOM}};
  vpn_6 = _RAND_54[26:0];
  _RAND_55 = {1{`RANDOM}};
  vpn_7 = _RAND_55[26:0];
  _RAND_56 = {1{`RANDOM}};
  enqPtr = _RAND_56[2:0];
  _RAND_57 = {1{`RANDOM}};
  issPtr = _RAND_57[2:0];
  _RAND_58 = {1{`RANDOM}};
  deqPtr = _RAND_58[2:0];
  _RAND_59 = {1{`RANDOM}};
  mayFullDeq = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  mayFullIss = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  counter = _RAND_61[3:0];
  _RAND_62 = {1{`RANDOM}};
  inflight_counter = _RAND_62[3:0];
  _RAND_63 = {1{`RANDOM}};
  ptwResp_entry_tag = _RAND_63[26:0];
  _RAND_64 = {1{`RANDOM}};
  ptwResp_entry_asid = _RAND_64[15:0];
  _RAND_65 = {1{`RANDOM}};
  ptwResp_entry_ppn = _RAND_65[23:0];
  _RAND_66 = {1{`RANDOM}};
  ptwResp_entry_perm_d = _RAND_66[0:0];
  _RAND_67 = {1{`RANDOM}};
  ptwResp_entry_perm_a = _RAND_67[0:0];
  _RAND_68 = {1{`RANDOM}};
  ptwResp_entry_perm_g = _RAND_68[0:0];
  _RAND_69 = {1{`RANDOM}};
  ptwResp_entry_perm_u = _RAND_69[0:0];
  _RAND_70 = {1{`RANDOM}};
  ptwResp_entry_perm_x = _RAND_70[0:0];
  _RAND_71 = {1{`RANDOM}};
  ptwResp_entry_perm_w = _RAND_71[0:0];
  _RAND_72 = {1{`RANDOM}};
  ptwResp_entry_perm_r = _RAND_72[0:0];
  _RAND_73 = {1{`RANDOM}};
  ptwResp_entry_level = _RAND_73[1:0];
  _RAND_74 = {1{`RANDOM}};
  ptwResp_pf = _RAND_74[0:0];
  _RAND_75 = {1{`RANDOM}};
  ptwResp_af = _RAND_75[0:0];
  _RAND_76 = {1{`RANDOM}};
  ptwResp_valid = _RAND_76[0:0];
  _RAND_77 = {1{`RANDOM}};
  tlb_req_0_bits_rvpn = _RAND_77[26:0];
  _RAND_78 = {1{`RANDOM}};
  tlb_req_0_valid_REG = _RAND_78[0:0];
  _RAND_79 = {1{`RANDOM}};
  oldMatchVec_0 = _RAND_79[0:0];
  _RAND_80 = {1{`RANDOM}};
  tlb_req_1_bits_rvpn = _RAND_80[26:0];
  _RAND_81 = {1{`RANDOM}};
  oldMatchVec_1 = _RAND_81[0:0];
  _RAND_82 = {1{`RANDOM}};
  newMatchVec_REG_5 = _RAND_82[0:0];
  _RAND_83 = {1{`RANDOM}};
  tlb_req_1_valid_REG = _RAND_83[0:0];
  _RAND_84 = {1{`RANDOM}};
  tlb_req_2_bits_rvpn = _RAND_84[26:0];
  _RAND_85 = {1{`RANDOM}};
  oldMatchVec_2 = _RAND_85[0:0];
  _RAND_86 = {1{`RANDOM}};
  newMatchVec_REG_10 = _RAND_86[0:0];
  _RAND_87 = {1{`RANDOM}};
  newMatchVec_REG_11 = _RAND_87[0:0];
  _RAND_88 = {1{`RANDOM}};
  tlb_req_2_valid_REG = _RAND_88[0:0];
  _RAND_89 = {1{`RANDOM}};
  tlb_req_3_bits_rvpn = _RAND_89[26:0];
  _RAND_90 = {1{`RANDOM}};
  oldMatchVec_3 = _RAND_90[0:0];
  _RAND_91 = {1{`RANDOM}};
  newMatchVec_REG_15 = _RAND_91[0:0];
  _RAND_92 = {1{`RANDOM}};
  newMatchVec_REG_16 = _RAND_92[0:0];
  _RAND_93 = {1{`RANDOM}};
  newMatchVec_REG_17 = _RAND_93[0:0];
  _RAND_94 = {1{`RANDOM}};
  tlb_req_3_valid_REG = _RAND_94[0:0];
  _RAND_95 = {1{`RANDOM}};
  newMatchVec_REG_1 = _RAND_95[0:0];
  _RAND_96 = {1{`RANDOM}};
  newMatchVec_REG_2 = _RAND_96[0:0];
  _RAND_97 = {1{`RANDOM}};
  newMatchVec_REG_3 = _RAND_97[0:0];
  _RAND_98 = {1{`RANDOM}};
  newMatchVec_REG_7 = _RAND_98[0:0];
  _RAND_99 = {1{`RANDOM}};
  newMatchVec_REG_8 = _RAND_99[0:0];
  _RAND_100 = {1{`RANDOM}};
  newMatchVec_REG_13 = _RAND_100[0:0];
  _RAND_101 = {1{`RANDOM}};
  oldMatchVec2_REG = _RAND_101[0:0];
  _RAND_102 = {1{`RANDOM}};
  oldMatchVec2_REG_1 = _RAND_102[0:0];
  _RAND_103 = {1{`RANDOM}};
  oldMatchVec2_REG_2 = _RAND_103[0:0];
  _RAND_104 = {1{`RANDOM}};
  oldMatchVec2_REG_3 = _RAND_104[0:0];
  _RAND_105 = {1{`RANDOM}};
  oldMatchVec2_REG_4 = _RAND_105[0:0];
  _RAND_106 = {1{`RANDOM}};
  oldMatchVec2_REG_5 = _RAND_106[0:0];
  _RAND_107 = {1{`RANDOM}};
  oldMatchVec2_REG_6 = _RAND_107[0:0];
  _RAND_108 = {1{`RANDOM}};
  oldMatchVec2_REG_7 = _RAND_108[0:0];
  _RAND_109 = {1{`RANDOM}};
  oldMatchVec2_REG_8 = _RAND_109[0:0];
  _RAND_110 = {1{`RANDOM}};
  oldMatchVec2_REG_9 = _RAND_110[0:0];
  _RAND_111 = {1{`RANDOM}};
  oldMatchVec2_REG_10 = _RAND_111[0:0];
  _RAND_112 = {1{`RANDOM}};
  oldMatchVec2_REG_11 = _RAND_112[0:0];
  _RAND_113 = {1{`RANDOM}};
  oldMatchVec2_REG_12 = _RAND_113[0:0];
  _RAND_114 = {1{`RANDOM}};
  oldMatchVec2_REG_13 = _RAND_114[0:0];
  _RAND_115 = {1{`RANDOM}};
  oldMatchVec2_REG_14 = _RAND_115[0:0];
  _RAND_116 = {1{`RANDOM}};
  oldMatchVec2_REG_15 = _RAND_116[0:0];
  _RAND_117 = {1{`RANDOM}};
  oldMatchVec2_REG_16 = _RAND_117[0:0];
  _RAND_118 = {1{`RANDOM}};
  oldMatchVec2_REG_17 = _RAND_118[0:0];
  _RAND_119 = {1{`RANDOM}};
  oldMatchVec2_REG_18 = _RAND_119[0:0];
  _RAND_120 = {1{`RANDOM}};
  oldMatchVec2_REG_19 = _RAND_120[0:0];
  _RAND_121 = {1{`RANDOM}};
  oldMatchVec2_REG_20 = _RAND_121[0:0];
  _RAND_122 = {1{`RANDOM}};
  oldMatchVec2_REG_21 = _RAND_122[0:0];
  _RAND_123 = {1{`RANDOM}};
  oldMatchVec2_REG_22 = _RAND_123[0:0];
  _RAND_124 = {1{`RANDOM}};
  oldMatchVec2_REG_23 = _RAND_124[0:0];
  _RAND_125 = {1{`RANDOM}};
  oldMatchVec2_REG_24 = _RAND_125[0:0];
  _RAND_126 = {1{`RANDOM}};
  oldMatchVec2_REG_25 = _RAND_126[0:0];
  _RAND_127 = {1{`RANDOM}};
  oldMatchVec2_REG_26 = _RAND_127[0:0];
  _RAND_128 = {1{`RANDOM}};
  oldMatchVec2_REG_27 = _RAND_128[0:0];
  _RAND_129 = {1{`RANDOM}};
  oldMatchVec2_REG_28 = _RAND_129[0:0];
  _RAND_130 = {1{`RANDOM}};
  oldMatchVec2_REG_29 = _RAND_130[0:0];
  _RAND_131 = {1{`RANDOM}};
  oldMatchVec2_REG_30 = _RAND_131[0:0];
  _RAND_132 = {1{`RANDOM}};
  oldMatchVec2_REG_31 = _RAND_132[0:0];
  _RAND_133 = {1{`RANDOM}};
  resp_vector_0 = _RAND_133[0:0];
  _RAND_134 = {1{`RANDOM}};
  resp_vector_1 = _RAND_134[0:0];
  _RAND_135 = {1{`RANDOM}};
  resp_vector_2 = _RAND_135[0:0];
  _RAND_136 = {1{`RANDOM}};
  resp_vector_3 = _RAND_136[0:0];
  _RAND_137 = {1{`RANDOM}};
  resp_vector_4 = _RAND_137[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    v_0 = 1'h0;
  end
  if (reset) begin
    v_1 = 1'h0;
  end
  if (reset) begin
    v_2 = 1'h0;
  end
  if (reset) begin
    v_3 = 1'h0;
  end
  if (reset) begin
    v_4 = 1'h0;
  end
  if (reset) begin
    v_5 = 1'h0;
  end
  if (reset) begin
    v_6 = 1'h0;
  end
  if (reset) begin
    v_7 = 1'h0;
  end
  if (reset) begin
    enqPtr = 3'h0;
  end
  if (reset) begin
    issPtr = 3'h0;
  end
  if (reset) begin
    deqPtr = 3'h0;
  end
  if (reset) begin
    mayFullDeq = 1'h0;
  end
  if (reset) begin
    mayFullIss = 1'h0;
  end
  if (reset) begin
    counter = 4'h0;
  end
  if (reset) begin
    inflight_counter = 4'h0;
  end
  if (reset) begin
    ptwResp_valid = 1'h0;
  end
  if (reset) begin
    tlb_req_0_valid_REG = 1'h0;
  end
  if (reset) begin
    tlb_req_1_valid_REG = 1'h0;
  end
  if (reset) begin
    tlb_req_2_valid_REG = 1'h0;
  end
  if (reset) begin
    tlb_req_3_valid_REG = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

