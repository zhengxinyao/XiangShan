module DCacheWPU(
  input         clock,
  input         reset,
  input  [35:0] io_req_bits_vaddr,
  input  [7:0]  io_req_bits_replayCarry_real_way_en,
  input         io_req_bits_replayCarry_valid,
  output        io_resp_valid,
  input         io_check_valid,
  input  [29:0] io_check_bits_s1_tag_resp_0,
  input  [29:0] io_check_bits_s1_tag_resp_1,
  input  [29:0] io_check_bits_s1_tag_resp_2,
  input  [29:0] io_check_bits_s1_tag_resp_3,
  input  [29:0] io_check_bits_s1_tag_resp_4,
  input  [29:0] io_check_bits_s1_tag_resp_5,
  input  [29:0] io_check_bits_s1_tag_resp_6,
  input  [29:0] io_check_bits_s1_tag_resp_7,
  input  [1:0]  io_check_bits_s1_meta_resp_0_coh_state,
  input  [1:0]  io_check_bits_s1_meta_resp_1_coh_state,
  input  [1:0]  io_check_bits_s1_meta_resp_2_coh_state,
  input  [1:0]  io_check_bits_s1_meta_resp_3_coh_state,
  input  [1:0]  io_check_bits_s1_meta_resp_4_coh_state,
  input  [1:0]  io_check_bits_s1_meta_resp_5_coh_state,
  input  [1:0]  io_check_bits_s1_meta_resp_6_coh_state,
  input  [1:0]  io_check_bits_s1_meta_resp_7_coh_state,
  input  [29:0] io_check_bits_s1_real_tag,
  output        io_s2_pred_fail,
  output [7:0]  io_s2_real_way_en
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
`endif // RANDOMIZE_REG_INIT
  reg [2:0] predict_regs_0; // @[DCacheWPU.scala 57:29]
  reg [2:0] predict_regs_1; // @[DCacheWPU.scala 57:29]
  reg [2:0] predict_regs_2; // @[DCacheWPU.scala 57:29]
  reg [2:0] predict_regs_3; // @[DCacheWPU.scala 57:29]
  reg [2:0] predict_regs_4; // @[DCacheWPU.scala 57:29]
  reg [2:0] predict_regs_5; // @[DCacheWPU.scala 57:29]
  reg [2:0] predict_regs_6; // @[DCacheWPU.scala 57:29]
  reg [2:0] predict_regs_7; // @[DCacheWPU.scala 57:29]
  reg [2:0] predict_regs_8; // @[DCacheWPU.scala 57:29]
  reg [2:0] predict_regs_9; // @[DCacheWPU.scala 57:29]
  reg [2:0] predict_regs_10; // @[DCacheWPU.scala 57:29]
  reg [2:0] predict_regs_11; // @[DCacheWPU.scala 57:29]
  reg [2:0] predict_regs_12; // @[DCacheWPU.scala 57:29]
  reg [2:0] predict_regs_13; // @[DCacheWPU.scala 57:29]
  reg [2:0] predict_regs_14; // @[DCacheWPU.scala 57:29]
  reg [2:0] predict_regs_15; // @[DCacheWPU.scala 57:29]
  reg [2:0] predict_regs_16; // @[DCacheWPU.scala 57:29]
  reg [2:0] predict_regs_17; // @[DCacheWPU.scala 57:29]
  reg [2:0] predict_regs_18; // @[DCacheWPU.scala 57:29]
  reg [2:0] predict_regs_19; // @[DCacheWPU.scala 57:29]
  reg [2:0] predict_regs_20; // @[DCacheWPU.scala 57:29]
  reg [2:0] predict_regs_21; // @[DCacheWPU.scala 57:29]
  reg [2:0] predict_regs_22; // @[DCacheWPU.scala 57:29]
  reg [2:0] predict_regs_23; // @[DCacheWPU.scala 57:29]
  reg [2:0] predict_regs_24; // @[DCacheWPU.scala 57:29]
  reg [2:0] predict_regs_25; // @[DCacheWPU.scala 57:29]
  reg [2:0] predict_regs_26; // @[DCacheWPU.scala 57:29]
  reg [2:0] predict_regs_27; // @[DCacheWPU.scala 57:29]
  reg [2:0] predict_regs_28; // @[DCacheWPU.scala 57:29]
  reg [2:0] predict_regs_29; // @[DCacheWPU.scala 57:29]
  reg [2:0] predict_regs_30; // @[DCacheWPU.scala 57:29]
  reg [2:0] predict_regs_31; // @[DCacheWPU.scala 57:29]
  reg [2:0] predict_regs_32; // @[DCacheWPU.scala 57:29]
  reg [2:0] predict_regs_33; // @[DCacheWPU.scala 57:29]
  reg [2:0] predict_regs_34; // @[DCacheWPU.scala 57:29]
  reg [2:0] predict_regs_35; // @[DCacheWPU.scala 57:29]
  reg [2:0] predict_regs_36; // @[DCacheWPU.scala 57:29]
  reg [2:0] predict_regs_37; // @[DCacheWPU.scala 57:29]
  reg [2:0] predict_regs_38; // @[DCacheWPU.scala 57:29]
  reg [2:0] predict_regs_39; // @[DCacheWPU.scala 57:29]
  reg [2:0] predict_regs_40; // @[DCacheWPU.scala 57:29]
  reg [2:0] predict_regs_41; // @[DCacheWPU.scala 57:29]
  reg [2:0] predict_regs_42; // @[DCacheWPU.scala 57:29]
  reg [2:0] predict_regs_43; // @[DCacheWPU.scala 57:29]
  reg [2:0] predict_regs_44; // @[DCacheWPU.scala 57:29]
  reg [2:0] predict_regs_45; // @[DCacheWPU.scala 57:29]
  reg [2:0] predict_regs_46; // @[DCacheWPU.scala 57:29]
  reg [2:0] predict_regs_47; // @[DCacheWPU.scala 57:29]
  reg [2:0] predict_regs_48; // @[DCacheWPU.scala 57:29]
  reg [2:0] predict_regs_49; // @[DCacheWPU.scala 57:29]
  reg [2:0] predict_regs_50; // @[DCacheWPU.scala 57:29]
  reg [2:0] predict_regs_51; // @[DCacheWPU.scala 57:29]
  reg [2:0] predict_regs_52; // @[DCacheWPU.scala 57:29]
  reg [2:0] predict_regs_53; // @[DCacheWPU.scala 57:29]
  reg [2:0] predict_regs_54; // @[DCacheWPU.scala 57:29]
  reg [2:0] predict_regs_55; // @[DCacheWPU.scala 57:29]
  reg [2:0] predict_regs_56; // @[DCacheWPU.scala 57:29]
  reg [2:0] predict_regs_57; // @[DCacheWPU.scala 57:29]
  reg [2:0] predict_regs_58; // @[DCacheWPU.scala 57:29]
  reg [2:0] predict_regs_59; // @[DCacheWPU.scala 57:29]
  reg [2:0] predict_regs_60; // @[DCacheWPU.scala 57:29]
  reg [2:0] predict_regs_61; // @[DCacheWPU.scala 57:29]
  reg [2:0] predict_regs_62; // @[DCacheWPU.scala 57:29]
  reg [2:0] predict_regs_63; // @[DCacheWPU.scala 57:29]
  wire [5:0] idx = io_req_bits_vaddr[11:6]; // @[DCacheWrapper.scala 191:9]
  wire [2:0] _GEN_1 = 6'h1 == idx ? predict_regs_1 : predict_regs_0; // @[DCacheWPU.scala 67:{19,19}]
  wire [2:0] _GEN_2 = 6'h2 == idx ? predict_regs_2 : _GEN_1; // @[DCacheWPU.scala 67:{19,19}]
  wire [2:0] _GEN_3 = 6'h3 == idx ? predict_regs_3 : _GEN_2; // @[DCacheWPU.scala 67:{19,19}]
  wire [2:0] _GEN_4 = 6'h4 == idx ? predict_regs_4 : _GEN_3; // @[DCacheWPU.scala 67:{19,19}]
  wire [2:0] _GEN_5 = 6'h5 == idx ? predict_regs_5 : _GEN_4; // @[DCacheWPU.scala 67:{19,19}]
  wire [2:0] _GEN_6 = 6'h6 == idx ? predict_regs_6 : _GEN_5; // @[DCacheWPU.scala 67:{19,19}]
  wire [2:0] _GEN_7 = 6'h7 == idx ? predict_regs_7 : _GEN_6; // @[DCacheWPU.scala 67:{19,19}]
  wire [2:0] _GEN_8 = 6'h8 == idx ? predict_regs_8 : _GEN_7; // @[DCacheWPU.scala 67:{19,19}]
  wire [2:0] _GEN_9 = 6'h9 == idx ? predict_regs_9 : _GEN_8; // @[DCacheWPU.scala 67:{19,19}]
  wire [2:0] _GEN_10 = 6'ha == idx ? predict_regs_10 : _GEN_9; // @[DCacheWPU.scala 67:{19,19}]
  wire [2:0] _GEN_11 = 6'hb == idx ? predict_regs_11 : _GEN_10; // @[DCacheWPU.scala 67:{19,19}]
  wire [2:0] _GEN_12 = 6'hc == idx ? predict_regs_12 : _GEN_11; // @[DCacheWPU.scala 67:{19,19}]
  wire [2:0] _GEN_13 = 6'hd == idx ? predict_regs_13 : _GEN_12; // @[DCacheWPU.scala 67:{19,19}]
  wire [2:0] _GEN_14 = 6'he == idx ? predict_regs_14 : _GEN_13; // @[DCacheWPU.scala 67:{19,19}]
  wire [2:0] _GEN_15 = 6'hf == idx ? predict_regs_15 : _GEN_14; // @[DCacheWPU.scala 67:{19,19}]
  wire [2:0] _GEN_16 = 6'h10 == idx ? predict_regs_16 : _GEN_15; // @[DCacheWPU.scala 67:{19,19}]
  wire [2:0] _GEN_17 = 6'h11 == idx ? predict_regs_17 : _GEN_16; // @[DCacheWPU.scala 67:{19,19}]
  wire [2:0] _GEN_18 = 6'h12 == idx ? predict_regs_18 : _GEN_17; // @[DCacheWPU.scala 67:{19,19}]
  wire [2:0] _GEN_19 = 6'h13 == idx ? predict_regs_19 : _GEN_18; // @[DCacheWPU.scala 67:{19,19}]
  wire [2:0] _GEN_20 = 6'h14 == idx ? predict_regs_20 : _GEN_19; // @[DCacheWPU.scala 67:{19,19}]
  wire [2:0] _GEN_21 = 6'h15 == idx ? predict_regs_21 : _GEN_20; // @[DCacheWPU.scala 67:{19,19}]
  wire [2:0] _GEN_22 = 6'h16 == idx ? predict_regs_22 : _GEN_21; // @[DCacheWPU.scala 67:{19,19}]
  wire [2:0] _GEN_23 = 6'h17 == idx ? predict_regs_23 : _GEN_22; // @[DCacheWPU.scala 67:{19,19}]
  wire [2:0] _GEN_24 = 6'h18 == idx ? predict_regs_24 : _GEN_23; // @[DCacheWPU.scala 67:{19,19}]
  wire [2:0] _GEN_25 = 6'h19 == idx ? predict_regs_25 : _GEN_24; // @[DCacheWPU.scala 67:{19,19}]
  wire [2:0] _GEN_26 = 6'h1a == idx ? predict_regs_26 : _GEN_25; // @[DCacheWPU.scala 67:{19,19}]
  wire [2:0] _GEN_27 = 6'h1b == idx ? predict_regs_27 : _GEN_26; // @[DCacheWPU.scala 67:{19,19}]
  wire [2:0] _GEN_28 = 6'h1c == idx ? predict_regs_28 : _GEN_27; // @[DCacheWPU.scala 67:{19,19}]
  wire [2:0] _GEN_29 = 6'h1d == idx ? predict_regs_29 : _GEN_28; // @[DCacheWPU.scala 67:{19,19}]
  wire [2:0] _GEN_30 = 6'h1e == idx ? predict_regs_30 : _GEN_29; // @[DCacheWPU.scala 67:{19,19}]
  wire [2:0] _GEN_31 = 6'h1f == idx ? predict_regs_31 : _GEN_30; // @[DCacheWPU.scala 67:{19,19}]
  wire [2:0] _GEN_32 = 6'h20 == idx ? predict_regs_32 : _GEN_31; // @[DCacheWPU.scala 67:{19,19}]
  wire [2:0] _GEN_33 = 6'h21 == idx ? predict_regs_33 : _GEN_32; // @[DCacheWPU.scala 67:{19,19}]
  wire [2:0] _GEN_34 = 6'h22 == idx ? predict_regs_34 : _GEN_33; // @[DCacheWPU.scala 67:{19,19}]
  wire [2:0] _GEN_35 = 6'h23 == idx ? predict_regs_35 : _GEN_34; // @[DCacheWPU.scala 67:{19,19}]
  wire [2:0] _GEN_36 = 6'h24 == idx ? predict_regs_36 : _GEN_35; // @[DCacheWPU.scala 67:{19,19}]
  wire [2:0] _GEN_37 = 6'h25 == idx ? predict_regs_37 : _GEN_36; // @[DCacheWPU.scala 67:{19,19}]
  wire [2:0] _GEN_38 = 6'h26 == idx ? predict_regs_38 : _GEN_37; // @[DCacheWPU.scala 67:{19,19}]
  wire [2:0] _GEN_39 = 6'h27 == idx ? predict_regs_39 : _GEN_38; // @[DCacheWPU.scala 67:{19,19}]
  wire [2:0] _GEN_40 = 6'h28 == idx ? predict_regs_40 : _GEN_39; // @[DCacheWPU.scala 67:{19,19}]
  wire [2:0] _GEN_41 = 6'h29 == idx ? predict_regs_41 : _GEN_40; // @[DCacheWPU.scala 67:{19,19}]
  wire [2:0] _GEN_42 = 6'h2a == idx ? predict_regs_42 : _GEN_41; // @[DCacheWPU.scala 67:{19,19}]
  wire [2:0] _GEN_43 = 6'h2b == idx ? predict_regs_43 : _GEN_42; // @[DCacheWPU.scala 67:{19,19}]
  wire [2:0] _GEN_44 = 6'h2c == idx ? predict_regs_44 : _GEN_43; // @[DCacheWPU.scala 67:{19,19}]
  wire [2:0] _GEN_45 = 6'h2d == idx ? predict_regs_45 : _GEN_44; // @[DCacheWPU.scala 67:{19,19}]
  wire [2:0] _GEN_46 = 6'h2e == idx ? predict_regs_46 : _GEN_45; // @[DCacheWPU.scala 67:{19,19}]
  wire [2:0] _GEN_47 = 6'h2f == idx ? predict_regs_47 : _GEN_46; // @[DCacheWPU.scala 67:{19,19}]
  wire [2:0] _GEN_48 = 6'h30 == idx ? predict_regs_48 : _GEN_47; // @[DCacheWPU.scala 67:{19,19}]
  wire [2:0] _GEN_49 = 6'h31 == idx ? predict_regs_49 : _GEN_48; // @[DCacheWPU.scala 67:{19,19}]
  wire [2:0] _GEN_50 = 6'h32 == idx ? predict_regs_50 : _GEN_49; // @[DCacheWPU.scala 67:{19,19}]
  wire [2:0] _GEN_51 = 6'h33 == idx ? predict_regs_51 : _GEN_50; // @[DCacheWPU.scala 67:{19,19}]
  wire [2:0] _GEN_52 = 6'h34 == idx ? predict_regs_52 : _GEN_51; // @[DCacheWPU.scala 67:{19,19}]
  wire [2:0] _GEN_53 = 6'h35 == idx ? predict_regs_53 : _GEN_52; // @[DCacheWPU.scala 67:{19,19}]
  wire [2:0] _GEN_54 = 6'h36 == idx ? predict_regs_54 : _GEN_53; // @[DCacheWPU.scala 67:{19,19}]
  wire [2:0] _GEN_55 = 6'h37 == idx ? predict_regs_55 : _GEN_54; // @[DCacheWPU.scala 67:{19,19}]
  wire [2:0] _GEN_56 = 6'h38 == idx ? predict_regs_56 : _GEN_55; // @[DCacheWPU.scala 67:{19,19}]
  wire [2:0] _GEN_57 = 6'h39 == idx ? predict_regs_57 : _GEN_56; // @[DCacheWPU.scala 67:{19,19}]
  wire [2:0] _GEN_58 = 6'h3a == idx ? predict_regs_58 : _GEN_57; // @[DCacheWPU.scala 67:{19,19}]
  wire [2:0] _GEN_59 = 6'h3b == idx ? predict_regs_59 : _GEN_58; // @[DCacheWPU.scala 67:{19,19}]
  wire [2:0] _GEN_60 = 6'h3c == idx ? predict_regs_60 : _GEN_59; // @[DCacheWPU.scala 67:{19,19}]
  wire [2:0] _GEN_61 = 6'h3d == idx ? predict_regs_61 : _GEN_60; // @[DCacheWPU.scala 67:{19,19}]
  wire [2:0] _GEN_62 = 6'h3e == idx ? predict_regs_62 : _GEN_61; // @[DCacheWPU.scala 67:{19,19}]
  wire [2:0] _GEN_63 = 6'h3f == idx ? predict_regs_63 : _GEN_62; // @[DCacheWPU.scala 67:{19,19}]
  reg [7:0] s1_pred_way_en; // @[DCacheWPU.scala 74:27]
  wire  _real_way_en_T_1 = io_check_bits_s1_meta_resp_0_coh_state > 2'h0; // @[Metadata.scala 49:45]
  wire  _real_way_en_T_2 = io_check_bits_s1_tag_resp_0 == io_check_bits_s1_real_tag & _real_way_en_T_1; // @[DCacheWPU.scala 87:66]
  wire  _real_way_en_T_4 = io_check_bits_s1_meta_resp_1_coh_state > 2'h0; // @[Metadata.scala 49:45]
  wire  _real_way_en_T_5 = io_check_bits_s1_tag_resp_1 == io_check_bits_s1_real_tag & _real_way_en_T_4; // @[DCacheWPU.scala 87:66]
  wire  _real_way_en_T_7 = io_check_bits_s1_meta_resp_2_coh_state > 2'h0; // @[Metadata.scala 49:45]
  wire  _real_way_en_T_8 = io_check_bits_s1_tag_resp_2 == io_check_bits_s1_real_tag & _real_way_en_T_7; // @[DCacheWPU.scala 87:66]
  wire  _real_way_en_T_10 = io_check_bits_s1_meta_resp_3_coh_state > 2'h0; // @[Metadata.scala 49:45]
  wire  _real_way_en_T_11 = io_check_bits_s1_tag_resp_3 == io_check_bits_s1_real_tag & _real_way_en_T_10; // @[DCacheWPU.scala 87:66]
  wire  _real_way_en_T_13 = io_check_bits_s1_meta_resp_4_coh_state > 2'h0; // @[Metadata.scala 49:45]
  wire  _real_way_en_T_14 = io_check_bits_s1_tag_resp_4 == io_check_bits_s1_real_tag & _real_way_en_T_13; // @[DCacheWPU.scala 87:66]
  wire  _real_way_en_T_16 = io_check_bits_s1_meta_resp_5_coh_state > 2'h0; // @[Metadata.scala 49:45]
  wire  _real_way_en_T_17 = io_check_bits_s1_tag_resp_5 == io_check_bits_s1_real_tag & _real_way_en_T_16; // @[DCacheWPU.scala 87:66]
  wire  _real_way_en_T_19 = io_check_bits_s1_meta_resp_6_coh_state > 2'h0; // @[Metadata.scala 49:45]
  wire  _real_way_en_T_20 = io_check_bits_s1_tag_resp_6 == io_check_bits_s1_real_tag & _real_way_en_T_19; // @[DCacheWPU.scala 87:66]
  wire  _real_way_en_T_22 = io_check_bits_s1_meta_resp_7_coh_state > 2'h0; // @[Metadata.scala 49:45]
  wire  _real_way_en_T_23 = io_check_bits_s1_tag_resp_7 == io_check_bits_s1_real_tag & _real_way_en_T_22; // @[DCacheWPU.scala 87:66]
  wire [3:0] real_way_en_lo = {_real_way_en_T_11,_real_way_en_T_8,_real_way_en_T_5,_real_way_en_T_2}; // @[DCacheWPU.scala 88:6]
  wire [3:0] real_way_en_hi = {_real_way_en_T_23,_real_way_en_T_20,_real_way_en_T_17,_real_way_en_T_14}; // @[DCacheWPU.scala 88:6]
  wire [7:0] real_way_en = {_real_way_en_T_23,_real_way_en_T_20,_real_way_en_T_17,_real_way_en_T_14,_real_way_en_T_11,
    _real_way_en_T_8,_real_way_en_T_5,_real_way_en_T_2}; // @[DCacheWPU.scala 88:6]
  reg [5:0] REG_1; // @[DCacheWPU.scala 91:27]
  reg  s2_pred_fail; // @[DCacheWPU.scala 97:29]
  reg [7:0] s2_real_way_en; // @[DCacheWPU.scala 98:27]
  assign io_resp_valid = 1'h0; // @[DCacheWPU.scala 81:19]
  assign io_s2_pred_fail = s2_pred_fail; // @[DCacheWPU.scala 102:19]
  assign io_s2_real_way_en = s2_real_way_en; // @[DCacheWPU.scala 103:21]
  always @(posedge clock) begin
    if (io_req_bits_replayCarry_valid) begin // @[DCacheWPU.scala 64:41]
      s1_pred_way_en <= io_req_bits_replayCarry_real_way_en; // @[DCacheWPU.scala 65:19]
    end else begin
      s1_pred_way_en <= {{5'd0}, _GEN_63}; // @[DCacheWPU.scala 67:19]
    end
    REG_1 <= io_req_bits_vaddr[11:6]; // @[DCacheWrapper.scala 191:9]
    s2_pred_fail <= s1_pred_way_en != real_way_en & io_resp_valid; // @[DCacheWPU.scala 97:61]
    s2_real_way_en <= {real_way_en_hi,real_way_en_lo}; // @[DCacheWPU.scala 88:6]
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWPU.scala 89:24]
      predict_regs_0 <= 3'h0; // @[DCacheWPU.scala 90:26 57:{29,29} 91:{34,34}]
    end else if (io_check_valid) begin // @[DCacheWPU.scala 57:29]
      if (|real_way_en) begin
        if (6'h0 == REG_1) begin
          predict_regs_0 <= real_way_en[2:0];
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWPU.scala 89:24]
      predict_regs_1 <= 3'h0; // @[DCacheWPU.scala 90:26 57:{29,29} 91:{34,34}]
    end else if (io_check_valid) begin // @[DCacheWPU.scala 57:29]
      if (|real_way_en) begin
        if (6'h1 == REG_1) begin
          predict_regs_1 <= real_way_en[2:0];
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWPU.scala 89:24]
      predict_regs_2 <= 3'h0; // @[DCacheWPU.scala 90:26 57:{29,29} 91:{34,34}]
    end else if (io_check_valid) begin // @[DCacheWPU.scala 57:29]
      if (|real_way_en) begin
        if (6'h2 == REG_1) begin
          predict_regs_2 <= real_way_en[2:0];
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWPU.scala 89:24]
      predict_regs_3 <= 3'h0; // @[DCacheWPU.scala 90:26 57:{29,29} 91:{34,34}]
    end else if (io_check_valid) begin // @[DCacheWPU.scala 57:29]
      if (|real_way_en) begin
        if (6'h3 == REG_1) begin
          predict_regs_3 <= real_way_en[2:0];
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWPU.scala 89:24]
      predict_regs_4 <= 3'h0; // @[DCacheWPU.scala 90:26 57:{29,29} 91:{34,34}]
    end else if (io_check_valid) begin // @[DCacheWPU.scala 57:29]
      if (|real_way_en) begin
        if (6'h4 == REG_1) begin
          predict_regs_4 <= real_way_en[2:0];
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWPU.scala 89:24]
      predict_regs_5 <= 3'h0; // @[DCacheWPU.scala 90:26 57:{29,29} 91:{34,34}]
    end else if (io_check_valid) begin // @[DCacheWPU.scala 57:29]
      if (|real_way_en) begin
        if (6'h5 == REG_1) begin
          predict_regs_5 <= real_way_en[2:0];
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWPU.scala 89:24]
      predict_regs_6 <= 3'h0; // @[DCacheWPU.scala 90:26 57:{29,29} 91:{34,34}]
    end else if (io_check_valid) begin // @[DCacheWPU.scala 57:29]
      if (|real_way_en) begin
        if (6'h6 == REG_1) begin
          predict_regs_6 <= real_way_en[2:0];
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWPU.scala 89:24]
      predict_regs_7 <= 3'h0; // @[DCacheWPU.scala 90:26 57:{29,29} 91:{34,34}]
    end else if (io_check_valid) begin // @[DCacheWPU.scala 57:29]
      if (|real_way_en) begin
        if (6'h7 == REG_1) begin
          predict_regs_7 <= real_way_en[2:0];
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWPU.scala 89:24]
      predict_regs_8 <= 3'h0; // @[DCacheWPU.scala 90:26 57:{29,29} 91:{34,34}]
    end else if (io_check_valid) begin // @[DCacheWPU.scala 57:29]
      if (|real_way_en) begin
        if (6'h8 == REG_1) begin
          predict_regs_8 <= real_way_en[2:0];
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWPU.scala 89:24]
      predict_regs_9 <= 3'h0; // @[DCacheWPU.scala 90:26 57:{29,29} 91:{34,34}]
    end else if (io_check_valid) begin // @[DCacheWPU.scala 57:29]
      if (|real_way_en) begin
        if (6'h9 == REG_1) begin
          predict_regs_9 <= real_way_en[2:0];
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWPU.scala 89:24]
      predict_regs_10 <= 3'h0; // @[DCacheWPU.scala 90:26 57:{29,29} 91:{34,34}]
    end else if (io_check_valid) begin // @[DCacheWPU.scala 57:29]
      if (|real_way_en) begin
        if (6'ha == REG_1) begin
          predict_regs_10 <= real_way_en[2:0];
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWPU.scala 89:24]
      predict_regs_11 <= 3'h0; // @[DCacheWPU.scala 90:26 57:{29,29} 91:{34,34}]
    end else if (io_check_valid) begin // @[DCacheWPU.scala 57:29]
      if (|real_way_en) begin
        if (6'hb == REG_1) begin
          predict_regs_11 <= real_way_en[2:0];
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWPU.scala 89:24]
      predict_regs_12 <= 3'h0; // @[DCacheWPU.scala 90:26 57:{29,29} 91:{34,34}]
    end else if (io_check_valid) begin // @[DCacheWPU.scala 57:29]
      if (|real_way_en) begin
        if (6'hc == REG_1) begin
          predict_regs_12 <= real_way_en[2:0];
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWPU.scala 89:24]
      predict_regs_13 <= 3'h0; // @[DCacheWPU.scala 90:26 57:{29,29} 91:{34,34}]
    end else if (io_check_valid) begin // @[DCacheWPU.scala 57:29]
      if (|real_way_en) begin
        if (6'hd == REG_1) begin
          predict_regs_13 <= real_way_en[2:0];
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWPU.scala 89:24]
      predict_regs_14 <= 3'h0; // @[DCacheWPU.scala 90:26 57:{29,29} 91:{34,34}]
    end else if (io_check_valid) begin // @[DCacheWPU.scala 57:29]
      if (|real_way_en) begin
        if (6'he == REG_1) begin
          predict_regs_14 <= real_way_en[2:0];
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWPU.scala 89:24]
      predict_regs_15 <= 3'h0; // @[DCacheWPU.scala 90:26 57:{29,29} 91:{34,34}]
    end else if (io_check_valid) begin // @[DCacheWPU.scala 57:29]
      if (|real_way_en) begin
        if (6'hf == REG_1) begin
          predict_regs_15 <= real_way_en[2:0];
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWPU.scala 89:24]
      predict_regs_16 <= 3'h0; // @[DCacheWPU.scala 90:26 57:{29,29} 91:{34,34}]
    end else if (io_check_valid) begin // @[DCacheWPU.scala 57:29]
      if (|real_way_en) begin
        if (6'h10 == REG_1) begin
          predict_regs_16 <= real_way_en[2:0];
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWPU.scala 89:24]
      predict_regs_17 <= 3'h0; // @[DCacheWPU.scala 90:26 57:{29,29} 91:{34,34}]
    end else if (io_check_valid) begin // @[DCacheWPU.scala 57:29]
      if (|real_way_en) begin
        if (6'h11 == REG_1) begin
          predict_regs_17 <= real_way_en[2:0];
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWPU.scala 89:24]
      predict_regs_18 <= 3'h0; // @[DCacheWPU.scala 90:26 57:{29,29} 91:{34,34}]
    end else if (io_check_valid) begin // @[DCacheWPU.scala 57:29]
      if (|real_way_en) begin
        if (6'h12 == REG_1) begin
          predict_regs_18 <= real_way_en[2:0];
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWPU.scala 89:24]
      predict_regs_19 <= 3'h0; // @[DCacheWPU.scala 90:26 57:{29,29} 91:{34,34}]
    end else if (io_check_valid) begin // @[DCacheWPU.scala 57:29]
      if (|real_way_en) begin
        if (6'h13 == REG_1) begin
          predict_regs_19 <= real_way_en[2:0];
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWPU.scala 89:24]
      predict_regs_20 <= 3'h0; // @[DCacheWPU.scala 90:26 57:{29,29} 91:{34,34}]
    end else if (io_check_valid) begin // @[DCacheWPU.scala 57:29]
      if (|real_way_en) begin
        if (6'h14 == REG_1) begin
          predict_regs_20 <= real_way_en[2:0];
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWPU.scala 89:24]
      predict_regs_21 <= 3'h0; // @[DCacheWPU.scala 90:26 57:{29,29} 91:{34,34}]
    end else if (io_check_valid) begin // @[DCacheWPU.scala 57:29]
      if (|real_way_en) begin
        if (6'h15 == REG_1) begin
          predict_regs_21 <= real_way_en[2:0];
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWPU.scala 89:24]
      predict_regs_22 <= 3'h0; // @[DCacheWPU.scala 90:26 57:{29,29} 91:{34,34}]
    end else if (io_check_valid) begin // @[DCacheWPU.scala 57:29]
      if (|real_way_en) begin
        if (6'h16 == REG_1) begin
          predict_regs_22 <= real_way_en[2:0];
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWPU.scala 89:24]
      predict_regs_23 <= 3'h0; // @[DCacheWPU.scala 90:26 57:{29,29} 91:{34,34}]
    end else if (io_check_valid) begin // @[DCacheWPU.scala 57:29]
      if (|real_way_en) begin
        if (6'h17 == REG_1) begin
          predict_regs_23 <= real_way_en[2:0];
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWPU.scala 89:24]
      predict_regs_24 <= 3'h0; // @[DCacheWPU.scala 90:26 57:{29,29} 91:{34,34}]
    end else if (io_check_valid) begin // @[DCacheWPU.scala 57:29]
      if (|real_way_en) begin
        if (6'h18 == REG_1) begin
          predict_regs_24 <= real_way_en[2:0];
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWPU.scala 89:24]
      predict_regs_25 <= 3'h0; // @[DCacheWPU.scala 90:26 57:{29,29} 91:{34,34}]
    end else if (io_check_valid) begin // @[DCacheWPU.scala 57:29]
      if (|real_way_en) begin
        if (6'h19 == REG_1) begin
          predict_regs_25 <= real_way_en[2:0];
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWPU.scala 89:24]
      predict_regs_26 <= 3'h0; // @[DCacheWPU.scala 90:26 57:{29,29} 91:{34,34}]
    end else if (io_check_valid) begin // @[DCacheWPU.scala 57:29]
      if (|real_way_en) begin
        if (6'h1a == REG_1) begin
          predict_regs_26 <= real_way_en[2:0];
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWPU.scala 89:24]
      predict_regs_27 <= 3'h0; // @[DCacheWPU.scala 90:26 57:{29,29} 91:{34,34}]
    end else if (io_check_valid) begin // @[DCacheWPU.scala 57:29]
      if (|real_way_en) begin
        if (6'h1b == REG_1) begin
          predict_regs_27 <= real_way_en[2:0];
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWPU.scala 89:24]
      predict_regs_28 <= 3'h0; // @[DCacheWPU.scala 90:26 57:{29,29} 91:{34,34}]
    end else if (io_check_valid) begin // @[DCacheWPU.scala 57:29]
      if (|real_way_en) begin
        if (6'h1c == REG_1) begin
          predict_regs_28 <= real_way_en[2:0];
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWPU.scala 89:24]
      predict_regs_29 <= 3'h0; // @[DCacheWPU.scala 90:26 57:{29,29} 91:{34,34}]
    end else if (io_check_valid) begin // @[DCacheWPU.scala 57:29]
      if (|real_way_en) begin
        if (6'h1d == REG_1) begin
          predict_regs_29 <= real_way_en[2:0];
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWPU.scala 89:24]
      predict_regs_30 <= 3'h0; // @[DCacheWPU.scala 90:26 57:{29,29} 91:{34,34}]
    end else if (io_check_valid) begin // @[DCacheWPU.scala 57:29]
      if (|real_way_en) begin
        if (6'h1e == REG_1) begin
          predict_regs_30 <= real_way_en[2:0];
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWPU.scala 89:24]
      predict_regs_31 <= 3'h0; // @[DCacheWPU.scala 90:26 57:{29,29} 91:{34,34}]
    end else if (io_check_valid) begin // @[DCacheWPU.scala 57:29]
      if (|real_way_en) begin
        if (6'h1f == REG_1) begin
          predict_regs_31 <= real_way_en[2:0];
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWPU.scala 89:24]
      predict_regs_32 <= 3'h0; // @[DCacheWPU.scala 90:26 57:{29,29} 91:{34,34}]
    end else if (io_check_valid) begin // @[DCacheWPU.scala 57:29]
      if (|real_way_en) begin
        if (6'h20 == REG_1) begin
          predict_regs_32 <= real_way_en[2:0];
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWPU.scala 89:24]
      predict_regs_33 <= 3'h0; // @[DCacheWPU.scala 90:26 57:{29,29} 91:{34,34}]
    end else if (io_check_valid) begin // @[DCacheWPU.scala 57:29]
      if (|real_way_en) begin
        if (6'h21 == REG_1) begin
          predict_regs_33 <= real_way_en[2:0];
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWPU.scala 89:24]
      predict_regs_34 <= 3'h0; // @[DCacheWPU.scala 90:26 57:{29,29} 91:{34,34}]
    end else if (io_check_valid) begin // @[DCacheWPU.scala 57:29]
      if (|real_way_en) begin
        if (6'h22 == REG_1) begin
          predict_regs_34 <= real_way_en[2:0];
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWPU.scala 89:24]
      predict_regs_35 <= 3'h0; // @[DCacheWPU.scala 90:26 57:{29,29} 91:{34,34}]
    end else if (io_check_valid) begin // @[DCacheWPU.scala 57:29]
      if (|real_way_en) begin
        if (6'h23 == REG_1) begin
          predict_regs_35 <= real_way_en[2:0];
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWPU.scala 89:24]
      predict_regs_36 <= 3'h0; // @[DCacheWPU.scala 90:26 57:{29,29} 91:{34,34}]
    end else if (io_check_valid) begin // @[DCacheWPU.scala 57:29]
      if (|real_way_en) begin
        if (6'h24 == REG_1) begin
          predict_regs_36 <= real_way_en[2:0];
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWPU.scala 89:24]
      predict_regs_37 <= 3'h0; // @[DCacheWPU.scala 90:26 57:{29,29} 91:{34,34}]
    end else if (io_check_valid) begin // @[DCacheWPU.scala 57:29]
      if (|real_way_en) begin
        if (6'h25 == REG_1) begin
          predict_regs_37 <= real_way_en[2:0];
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWPU.scala 89:24]
      predict_regs_38 <= 3'h0; // @[DCacheWPU.scala 90:26 57:{29,29} 91:{34,34}]
    end else if (io_check_valid) begin // @[DCacheWPU.scala 57:29]
      if (|real_way_en) begin
        if (6'h26 == REG_1) begin
          predict_regs_38 <= real_way_en[2:0];
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWPU.scala 89:24]
      predict_regs_39 <= 3'h0; // @[DCacheWPU.scala 90:26 57:{29,29} 91:{34,34}]
    end else if (io_check_valid) begin // @[DCacheWPU.scala 57:29]
      if (|real_way_en) begin
        if (6'h27 == REG_1) begin
          predict_regs_39 <= real_way_en[2:0];
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWPU.scala 89:24]
      predict_regs_40 <= 3'h0; // @[DCacheWPU.scala 90:26 57:{29,29} 91:{34,34}]
    end else if (io_check_valid) begin // @[DCacheWPU.scala 57:29]
      if (|real_way_en) begin
        if (6'h28 == REG_1) begin
          predict_regs_40 <= real_way_en[2:0];
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWPU.scala 89:24]
      predict_regs_41 <= 3'h0; // @[DCacheWPU.scala 90:26 57:{29,29} 91:{34,34}]
    end else if (io_check_valid) begin // @[DCacheWPU.scala 57:29]
      if (|real_way_en) begin
        if (6'h29 == REG_1) begin
          predict_regs_41 <= real_way_en[2:0];
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWPU.scala 89:24]
      predict_regs_42 <= 3'h0; // @[DCacheWPU.scala 90:26 57:{29,29} 91:{34,34}]
    end else if (io_check_valid) begin // @[DCacheWPU.scala 57:29]
      if (|real_way_en) begin
        if (6'h2a == REG_1) begin
          predict_regs_42 <= real_way_en[2:0];
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWPU.scala 89:24]
      predict_regs_43 <= 3'h0; // @[DCacheWPU.scala 90:26 57:{29,29} 91:{34,34}]
    end else if (io_check_valid) begin // @[DCacheWPU.scala 57:29]
      if (|real_way_en) begin
        if (6'h2b == REG_1) begin
          predict_regs_43 <= real_way_en[2:0];
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWPU.scala 89:24]
      predict_regs_44 <= 3'h0; // @[DCacheWPU.scala 90:26 57:{29,29} 91:{34,34}]
    end else if (io_check_valid) begin // @[DCacheWPU.scala 57:29]
      if (|real_way_en) begin
        if (6'h2c == REG_1) begin
          predict_regs_44 <= real_way_en[2:0];
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWPU.scala 89:24]
      predict_regs_45 <= 3'h0; // @[DCacheWPU.scala 90:26 57:{29,29} 91:{34,34}]
    end else if (io_check_valid) begin // @[DCacheWPU.scala 57:29]
      if (|real_way_en) begin
        if (6'h2d == REG_1) begin
          predict_regs_45 <= real_way_en[2:0];
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWPU.scala 89:24]
      predict_regs_46 <= 3'h0; // @[DCacheWPU.scala 90:26 57:{29,29} 91:{34,34}]
    end else if (io_check_valid) begin // @[DCacheWPU.scala 57:29]
      if (|real_way_en) begin
        if (6'h2e == REG_1) begin
          predict_regs_46 <= real_way_en[2:0];
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWPU.scala 89:24]
      predict_regs_47 <= 3'h0; // @[DCacheWPU.scala 90:26 57:{29,29} 91:{34,34}]
    end else if (io_check_valid) begin // @[DCacheWPU.scala 57:29]
      if (|real_way_en) begin
        if (6'h2f == REG_1) begin
          predict_regs_47 <= real_way_en[2:0];
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWPU.scala 89:24]
      predict_regs_48 <= 3'h0; // @[DCacheWPU.scala 90:26 57:{29,29} 91:{34,34}]
    end else if (io_check_valid) begin // @[DCacheWPU.scala 57:29]
      if (|real_way_en) begin
        if (6'h30 == REG_1) begin
          predict_regs_48 <= real_way_en[2:0];
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWPU.scala 89:24]
      predict_regs_49 <= 3'h0; // @[DCacheWPU.scala 90:26 57:{29,29} 91:{34,34}]
    end else if (io_check_valid) begin // @[DCacheWPU.scala 57:29]
      if (|real_way_en) begin
        if (6'h31 == REG_1) begin
          predict_regs_49 <= real_way_en[2:0];
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWPU.scala 89:24]
      predict_regs_50 <= 3'h0; // @[DCacheWPU.scala 90:26 57:{29,29} 91:{34,34}]
    end else if (io_check_valid) begin // @[DCacheWPU.scala 57:29]
      if (|real_way_en) begin
        if (6'h32 == REG_1) begin
          predict_regs_50 <= real_way_en[2:0];
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWPU.scala 89:24]
      predict_regs_51 <= 3'h0; // @[DCacheWPU.scala 90:26 57:{29,29} 91:{34,34}]
    end else if (io_check_valid) begin // @[DCacheWPU.scala 57:29]
      if (|real_way_en) begin
        if (6'h33 == REG_1) begin
          predict_regs_51 <= real_way_en[2:0];
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWPU.scala 89:24]
      predict_regs_52 <= 3'h0; // @[DCacheWPU.scala 90:26 57:{29,29} 91:{34,34}]
    end else if (io_check_valid) begin // @[DCacheWPU.scala 57:29]
      if (|real_way_en) begin
        if (6'h34 == REG_1) begin
          predict_regs_52 <= real_way_en[2:0];
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWPU.scala 89:24]
      predict_regs_53 <= 3'h0; // @[DCacheWPU.scala 90:26 57:{29,29} 91:{34,34}]
    end else if (io_check_valid) begin // @[DCacheWPU.scala 57:29]
      if (|real_way_en) begin
        if (6'h35 == REG_1) begin
          predict_regs_53 <= real_way_en[2:0];
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWPU.scala 89:24]
      predict_regs_54 <= 3'h0; // @[DCacheWPU.scala 90:26 57:{29,29} 91:{34,34}]
    end else if (io_check_valid) begin // @[DCacheWPU.scala 57:29]
      if (|real_way_en) begin
        if (6'h36 == REG_1) begin
          predict_regs_54 <= real_way_en[2:0];
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWPU.scala 89:24]
      predict_regs_55 <= 3'h0; // @[DCacheWPU.scala 90:26 57:{29,29} 91:{34,34}]
    end else if (io_check_valid) begin // @[DCacheWPU.scala 57:29]
      if (|real_way_en) begin
        if (6'h37 == REG_1) begin
          predict_regs_55 <= real_way_en[2:0];
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWPU.scala 89:24]
      predict_regs_56 <= 3'h0; // @[DCacheWPU.scala 90:26 57:{29,29} 91:{34,34}]
    end else if (io_check_valid) begin // @[DCacheWPU.scala 57:29]
      if (|real_way_en) begin
        if (6'h38 == REG_1) begin
          predict_regs_56 <= real_way_en[2:0];
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWPU.scala 89:24]
      predict_regs_57 <= 3'h0; // @[DCacheWPU.scala 90:26 57:{29,29} 91:{34,34}]
    end else if (io_check_valid) begin // @[DCacheWPU.scala 57:29]
      if (|real_way_en) begin
        if (6'h39 == REG_1) begin
          predict_regs_57 <= real_way_en[2:0];
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWPU.scala 89:24]
      predict_regs_58 <= 3'h0; // @[DCacheWPU.scala 90:26 57:{29,29} 91:{34,34}]
    end else if (io_check_valid) begin // @[DCacheWPU.scala 57:29]
      if (|real_way_en) begin
        if (6'h3a == REG_1) begin
          predict_regs_58 <= real_way_en[2:0];
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWPU.scala 89:24]
      predict_regs_59 <= 3'h0; // @[DCacheWPU.scala 90:26 57:{29,29} 91:{34,34}]
    end else if (io_check_valid) begin // @[DCacheWPU.scala 57:29]
      if (|real_way_en) begin
        if (6'h3b == REG_1) begin
          predict_regs_59 <= real_way_en[2:0];
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWPU.scala 89:24]
      predict_regs_60 <= 3'h0; // @[DCacheWPU.scala 90:26 57:{29,29} 91:{34,34}]
    end else if (io_check_valid) begin // @[DCacheWPU.scala 57:29]
      if (|real_way_en) begin
        if (6'h3c == REG_1) begin
          predict_regs_60 <= real_way_en[2:0];
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWPU.scala 89:24]
      predict_regs_61 <= 3'h0; // @[DCacheWPU.scala 90:26 57:{29,29} 91:{34,34}]
    end else if (io_check_valid) begin // @[DCacheWPU.scala 57:29]
      if (|real_way_en) begin
        if (6'h3d == REG_1) begin
          predict_regs_61 <= real_way_en[2:0];
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWPU.scala 89:24]
      predict_regs_62 <= 3'h0; // @[DCacheWPU.scala 90:26 57:{29,29} 91:{34,34}]
    end else if (io_check_valid) begin // @[DCacheWPU.scala 57:29]
      if (|real_way_en) begin
        if (6'h3e == REG_1) begin
          predict_regs_62 <= real_way_en[2:0];
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWPU.scala 89:24]
      predict_regs_63 <= 3'h0; // @[DCacheWPU.scala 90:26 57:{29,29} 91:{34,34}]
    end else if (io_check_valid) begin // @[DCacheWPU.scala 57:29]
      if (|real_way_en) begin
        if (6'h3f == REG_1) begin
          predict_regs_63 <= real_way_en[2:0];
        end
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
  predict_regs_0 = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  predict_regs_1 = _RAND_1[2:0];
  _RAND_2 = {1{`RANDOM}};
  predict_regs_2 = _RAND_2[2:0];
  _RAND_3 = {1{`RANDOM}};
  predict_regs_3 = _RAND_3[2:0];
  _RAND_4 = {1{`RANDOM}};
  predict_regs_4 = _RAND_4[2:0];
  _RAND_5 = {1{`RANDOM}};
  predict_regs_5 = _RAND_5[2:0];
  _RAND_6 = {1{`RANDOM}};
  predict_regs_6 = _RAND_6[2:0];
  _RAND_7 = {1{`RANDOM}};
  predict_regs_7 = _RAND_7[2:0];
  _RAND_8 = {1{`RANDOM}};
  predict_regs_8 = _RAND_8[2:0];
  _RAND_9 = {1{`RANDOM}};
  predict_regs_9 = _RAND_9[2:0];
  _RAND_10 = {1{`RANDOM}};
  predict_regs_10 = _RAND_10[2:0];
  _RAND_11 = {1{`RANDOM}};
  predict_regs_11 = _RAND_11[2:0];
  _RAND_12 = {1{`RANDOM}};
  predict_regs_12 = _RAND_12[2:0];
  _RAND_13 = {1{`RANDOM}};
  predict_regs_13 = _RAND_13[2:0];
  _RAND_14 = {1{`RANDOM}};
  predict_regs_14 = _RAND_14[2:0];
  _RAND_15 = {1{`RANDOM}};
  predict_regs_15 = _RAND_15[2:0];
  _RAND_16 = {1{`RANDOM}};
  predict_regs_16 = _RAND_16[2:0];
  _RAND_17 = {1{`RANDOM}};
  predict_regs_17 = _RAND_17[2:0];
  _RAND_18 = {1{`RANDOM}};
  predict_regs_18 = _RAND_18[2:0];
  _RAND_19 = {1{`RANDOM}};
  predict_regs_19 = _RAND_19[2:0];
  _RAND_20 = {1{`RANDOM}};
  predict_regs_20 = _RAND_20[2:0];
  _RAND_21 = {1{`RANDOM}};
  predict_regs_21 = _RAND_21[2:0];
  _RAND_22 = {1{`RANDOM}};
  predict_regs_22 = _RAND_22[2:0];
  _RAND_23 = {1{`RANDOM}};
  predict_regs_23 = _RAND_23[2:0];
  _RAND_24 = {1{`RANDOM}};
  predict_regs_24 = _RAND_24[2:0];
  _RAND_25 = {1{`RANDOM}};
  predict_regs_25 = _RAND_25[2:0];
  _RAND_26 = {1{`RANDOM}};
  predict_regs_26 = _RAND_26[2:0];
  _RAND_27 = {1{`RANDOM}};
  predict_regs_27 = _RAND_27[2:0];
  _RAND_28 = {1{`RANDOM}};
  predict_regs_28 = _RAND_28[2:0];
  _RAND_29 = {1{`RANDOM}};
  predict_regs_29 = _RAND_29[2:0];
  _RAND_30 = {1{`RANDOM}};
  predict_regs_30 = _RAND_30[2:0];
  _RAND_31 = {1{`RANDOM}};
  predict_regs_31 = _RAND_31[2:0];
  _RAND_32 = {1{`RANDOM}};
  predict_regs_32 = _RAND_32[2:0];
  _RAND_33 = {1{`RANDOM}};
  predict_regs_33 = _RAND_33[2:0];
  _RAND_34 = {1{`RANDOM}};
  predict_regs_34 = _RAND_34[2:0];
  _RAND_35 = {1{`RANDOM}};
  predict_regs_35 = _RAND_35[2:0];
  _RAND_36 = {1{`RANDOM}};
  predict_regs_36 = _RAND_36[2:0];
  _RAND_37 = {1{`RANDOM}};
  predict_regs_37 = _RAND_37[2:0];
  _RAND_38 = {1{`RANDOM}};
  predict_regs_38 = _RAND_38[2:0];
  _RAND_39 = {1{`RANDOM}};
  predict_regs_39 = _RAND_39[2:0];
  _RAND_40 = {1{`RANDOM}};
  predict_regs_40 = _RAND_40[2:0];
  _RAND_41 = {1{`RANDOM}};
  predict_regs_41 = _RAND_41[2:0];
  _RAND_42 = {1{`RANDOM}};
  predict_regs_42 = _RAND_42[2:0];
  _RAND_43 = {1{`RANDOM}};
  predict_regs_43 = _RAND_43[2:0];
  _RAND_44 = {1{`RANDOM}};
  predict_regs_44 = _RAND_44[2:0];
  _RAND_45 = {1{`RANDOM}};
  predict_regs_45 = _RAND_45[2:0];
  _RAND_46 = {1{`RANDOM}};
  predict_regs_46 = _RAND_46[2:0];
  _RAND_47 = {1{`RANDOM}};
  predict_regs_47 = _RAND_47[2:0];
  _RAND_48 = {1{`RANDOM}};
  predict_regs_48 = _RAND_48[2:0];
  _RAND_49 = {1{`RANDOM}};
  predict_regs_49 = _RAND_49[2:0];
  _RAND_50 = {1{`RANDOM}};
  predict_regs_50 = _RAND_50[2:0];
  _RAND_51 = {1{`RANDOM}};
  predict_regs_51 = _RAND_51[2:0];
  _RAND_52 = {1{`RANDOM}};
  predict_regs_52 = _RAND_52[2:0];
  _RAND_53 = {1{`RANDOM}};
  predict_regs_53 = _RAND_53[2:0];
  _RAND_54 = {1{`RANDOM}};
  predict_regs_54 = _RAND_54[2:0];
  _RAND_55 = {1{`RANDOM}};
  predict_regs_55 = _RAND_55[2:0];
  _RAND_56 = {1{`RANDOM}};
  predict_regs_56 = _RAND_56[2:0];
  _RAND_57 = {1{`RANDOM}};
  predict_regs_57 = _RAND_57[2:0];
  _RAND_58 = {1{`RANDOM}};
  predict_regs_58 = _RAND_58[2:0];
  _RAND_59 = {1{`RANDOM}};
  predict_regs_59 = _RAND_59[2:0];
  _RAND_60 = {1{`RANDOM}};
  predict_regs_60 = _RAND_60[2:0];
  _RAND_61 = {1{`RANDOM}};
  predict_regs_61 = _RAND_61[2:0];
  _RAND_62 = {1{`RANDOM}};
  predict_regs_62 = _RAND_62[2:0];
  _RAND_63 = {1{`RANDOM}};
  predict_regs_63 = _RAND_63[2:0];
  _RAND_64 = {1{`RANDOM}};
  s1_pred_way_en = _RAND_64[7:0];
  _RAND_65 = {1{`RANDOM}};
  REG_1 = _RAND_65[5:0];
  _RAND_66 = {1{`RANDOM}};
  s2_pred_fail = _RAND_66[0:0];
  _RAND_67 = {1{`RANDOM}};
  s2_real_way_en = _RAND_67[7:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    predict_regs_0 = 3'h0;
  end
  if (reset) begin
    predict_regs_1 = 3'h0;
  end
  if (reset) begin
    predict_regs_2 = 3'h0;
  end
  if (reset) begin
    predict_regs_3 = 3'h0;
  end
  if (reset) begin
    predict_regs_4 = 3'h0;
  end
  if (reset) begin
    predict_regs_5 = 3'h0;
  end
  if (reset) begin
    predict_regs_6 = 3'h0;
  end
  if (reset) begin
    predict_regs_7 = 3'h0;
  end
  if (reset) begin
    predict_regs_8 = 3'h0;
  end
  if (reset) begin
    predict_regs_9 = 3'h0;
  end
  if (reset) begin
    predict_regs_10 = 3'h0;
  end
  if (reset) begin
    predict_regs_11 = 3'h0;
  end
  if (reset) begin
    predict_regs_12 = 3'h0;
  end
  if (reset) begin
    predict_regs_13 = 3'h0;
  end
  if (reset) begin
    predict_regs_14 = 3'h0;
  end
  if (reset) begin
    predict_regs_15 = 3'h0;
  end
  if (reset) begin
    predict_regs_16 = 3'h0;
  end
  if (reset) begin
    predict_regs_17 = 3'h0;
  end
  if (reset) begin
    predict_regs_18 = 3'h0;
  end
  if (reset) begin
    predict_regs_19 = 3'h0;
  end
  if (reset) begin
    predict_regs_20 = 3'h0;
  end
  if (reset) begin
    predict_regs_21 = 3'h0;
  end
  if (reset) begin
    predict_regs_22 = 3'h0;
  end
  if (reset) begin
    predict_regs_23 = 3'h0;
  end
  if (reset) begin
    predict_regs_24 = 3'h0;
  end
  if (reset) begin
    predict_regs_25 = 3'h0;
  end
  if (reset) begin
    predict_regs_26 = 3'h0;
  end
  if (reset) begin
    predict_regs_27 = 3'h0;
  end
  if (reset) begin
    predict_regs_28 = 3'h0;
  end
  if (reset) begin
    predict_regs_29 = 3'h0;
  end
  if (reset) begin
    predict_regs_30 = 3'h0;
  end
  if (reset) begin
    predict_regs_31 = 3'h0;
  end
  if (reset) begin
    predict_regs_32 = 3'h0;
  end
  if (reset) begin
    predict_regs_33 = 3'h0;
  end
  if (reset) begin
    predict_regs_34 = 3'h0;
  end
  if (reset) begin
    predict_regs_35 = 3'h0;
  end
  if (reset) begin
    predict_regs_36 = 3'h0;
  end
  if (reset) begin
    predict_regs_37 = 3'h0;
  end
  if (reset) begin
    predict_regs_38 = 3'h0;
  end
  if (reset) begin
    predict_regs_39 = 3'h0;
  end
  if (reset) begin
    predict_regs_40 = 3'h0;
  end
  if (reset) begin
    predict_regs_41 = 3'h0;
  end
  if (reset) begin
    predict_regs_42 = 3'h0;
  end
  if (reset) begin
    predict_regs_43 = 3'h0;
  end
  if (reset) begin
    predict_regs_44 = 3'h0;
  end
  if (reset) begin
    predict_regs_45 = 3'h0;
  end
  if (reset) begin
    predict_regs_46 = 3'h0;
  end
  if (reset) begin
    predict_regs_47 = 3'h0;
  end
  if (reset) begin
    predict_regs_48 = 3'h0;
  end
  if (reset) begin
    predict_regs_49 = 3'h0;
  end
  if (reset) begin
    predict_regs_50 = 3'h0;
  end
  if (reset) begin
    predict_regs_51 = 3'h0;
  end
  if (reset) begin
    predict_regs_52 = 3'h0;
  end
  if (reset) begin
    predict_regs_53 = 3'h0;
  end
  if (reset) begin
    predict_regs_54 = 3'h0;
  end
  if (reset) begin
    predict_regs_55 = 3'h0;
  end
  if (reset) begin
    predict_regs_56 = 3'h0;
  end
  if (reset) begin
    predict_regs_57 = 3'h0;
  end
  if (reset) begin
    predict_regs_58 = 3'h0;
  end
  if (reset) begin
    predict_regs_59 = 3'h0;
  end
  if (reset) begin
    predict_regs_60 = 3'h0;
  end
  if (reset) begin
    predict_regs_61 = 3'h0;
  end
  if (reset) begin
    predict_regs_62 = 3'h0;
  end
  if (reset) begin
    predict_regs_63 = 3'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

