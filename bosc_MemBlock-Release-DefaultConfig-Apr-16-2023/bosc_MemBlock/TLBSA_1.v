module TLBSA_1(
  input         clock,
  input         reset,
  input         io_sfence_valid,
  input         io_sfence_bits_rs1,
  input  [38:0] io_sfence_bits_addr,
  input  [15:0] io_csr_satp_asid,
  output        io_rreq_0_ready,
  input         io_rreq_0_valid,
  input  [26:0] io_rreq_0_bits_vpn,
  output        io_rreq_1_ready,
  input         io_rreq_1_valid,
  input  [26:0] io_rreq_1_bits_vpn,
  output        io_rresp_0_bits_hit,
  output [23:0] io_rresp_0_bits_ppn_0,
  output        io_rresp_0_bits_perm_0_pf,
  output        io_rresp_0_bits_perm_0_af,
  output        io_rresp_0_bits_perm_0_d,
  output        io_rresp_0_bits_perm_0_a,
  output        io_rresp_0_bits_perm_0_u,
  output        io_rresp_0_bits_perm_0_w,
  output        io_rresp_0_bits_perm_0_pm_w,
  output        io_rresp_0_bits_perm_0_pm_c,
  output        io_rresp_1_bits_hit,
  output [23:0] io_rresp_1_bits_ppn_0,
  output        io_rresp_1_bits_perm_0_pf,
  output        io_rresp_1_bits_perm_0_af,
  output        io_rresp_1_bits_perm_0_d,
  output        io_rresp_1_bits_perm_0_a,
  output        io_rresp_1_bits_perm_0_u,
  output        io_rresp_1_bits_perm_0_w,
  output        io_rresp_1_bits_perm_0_pm_w,
  output        io_rresp_1_bits_perm_0_pm_c,
  input         io_victim_in_valid,
  input  [26:0] io_victim_in_bits_entry_tag,
  input  [15:0] io_victim_in_bits_entry_asid,
  input  [23:0] io_victim_in_bits_entry_ppn,
  input         io_victim_in_bits_entry_perm_pf,
  input         io_victim_in_bits_entry_perm_af,
  input         io_victim_in_bits_entry_perm_d,
  input         io_victim_in_bits_entry_perm_a,
  input         io_victim_in_bits_entry_perm_u,
  input         io_victim_in_bits_entry_perm_w,
  input         io_victim_in_bits_entry_perm_pm_w,
  input         io_victim_in_bits_entry_perm_pm_c
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
`endif // RANDOMIZE_REG_INIT
  wire  entries_clock; // @[TLBStorage.scala 237:23]
  wire [3:0] entries_io_raddr_0; // @[TLBStorage.scala 237:23]
  wire [3:0] entries_io_raddr_1; // @[TLBStorage.scala 237:23]
  wire [26:0] entries_io_rdata_0_0_tag; // @[TLBStorage.scala 237:23]
  wire [15:0] entries_io_rdata_0_0_asid; // @[TLBStorage.scala 237:23]
  wire [23:0] entries_io_rdata_0_0_ppn; // @[TLBStorage.scala 237:23]
  wire  entries_io_rdata_0_0_perm_pf; // @[TLBStorage.scala 237:23]
  wire  entries_io_rdata_0_0_perm_af; // @[TLBStorage.scala 237:23]
  wire  entries_io_rdata_0_0_perm_d; // @[TLBStorage.scala 237:23]
  wire  entries_io_rdata_0_0_perm_a; // @[TLBStorage.scala 237:23]
  wire  entries_io_rdata_0_0_perm_u; // @[TLBStorage.scala 237:23]
  wire  entries_io_rdata_0_0_perm_w; // @[TLBStorage.scala 237:23]
  wire  entries_io_rdata_0_0_perm_pm_w; // @[TLBStorage.scala 237:23]
  wire  entries_io_rdata_0_0_perm_pm_c; // @[TLBStorage.scala 237:23]
  wire [26:0] entries_io_rdata_1_0_tag; // @[TLBStorage.scala 237:23]
  wire [15:0] entries_io_rdata_1_0_asid; // @[TLBStorage.scala 237:23]
  wire [23:0] entries_io_rdata_1_0_ppn; // @[TLBStorage.scala 237:23]
  wire  entries_io_rdata_1_0_perm_pf; // @[TLBStorage.scala 237:23]
  wire  entries_io_rdata_1_0_perm_af; // @[TLBStorage.scala 237:23]
  wire  entries_io_rdata_1_0_perm_d; // @[TLBStorage.scala 237:23]
  wire  entries_io_rdata_1_0_perm_a; // @[TLBStorage.scala 237:23]
  wire  entries_io_rdata_1_0_perm_u; // @[TLBStorage.scala 237:23]
  wire  entries_io_rdata_1_0_perm_w; // @[TLBStorage.scala 237:23]
  wire  entries_io_rdata_1_0_perm_pm_w; // @[TLBStorage.scala 237:23]
  wire  entries_io_rdata_1_0_perm_pm_c; // @[TLBStorage.scala 237:23]
  wire  entries_io_wen; // @[TLBStorage.scala 237:23]
  wire [3:0] entries_io_waddr; // @[TLBStorage.scala 237:23]
  wire [26:0] entries_io_wdata_tag; // @[TLBStorage.scala 237:23]
  wire [15:0] entries_io_wdata_asid; // @[TLBStorage.scala 237:23]
  wire [23:0] entries_io_wdata_ppn; // @[TLBStorage.scala 237:23]
  wire  entries_io_wdata_perm_pf; // @[TLBStorage.scala 237:23]
  wire  entries_io_wdata_perm_af; // @[TLBStorage.scala 237:23]
  wire  entries_io_wdata_perm_d; // @[TLBStorage.scala 237:23]
  wire  entries_io_wdata_perm_a; // @[TLBStorage.scala 237:23]
  wire  entries_io_wdata_perm_u; // @[TLBStorage.scala 237:23]
  wire  entries_io_wdata_perm_w; // @[TLBStorage.scala 237:23]
  wire  entries_io_wdata_perm_pm_w; // @[TLBStorage.scala 237:23]
  wire  entries_io_wdata_perm_pm_c; // @[TLBStorage.scala 237:23]
  reg  v_0_0; // @[TLBStorage.scala 236:18]
  reg  v_1_0; // @[TLBStorage.scala 236:18]
  reg  v_2_0; // @[TLBStorage.scala 236:18]
  reg  v_3_0; // @[TLBStorage.scala 236:18]
  reg  v_4_0; // @[TLBStorage.scala 236:18]
  reg  v_5_0; // @[TLBStorage.scala 236:18]
  reg  v_6_0; // @[TLBStorage.scala 236:18]
  reg  v_7_0; // @[TLBStorage.scala 236:18]
  reg  v_8_0; // @[TLBStorage.scala 236:18]
  reg  v_9_0; // @[TLBStorage.scala 236:18]
  reg  v_10_0; // @[TLBStorage.scala 236:18]
  reg  v_11_0; // @[TLBStorage.scala 236:18]
  reg  v_12_0; // @[TLBStorage.scala 236:18]
  reg  v_13_0; // @[TLBStorage.scala 236:18]
  reg  v_14_0; // @[TLBStorage.scala 236:18]
  reg  v_15_0; // @[TLBStorage.scala 236:18]
  wire  _vpn_reg_T = io_rreq_0_ready & io_rreq_0_valid; // @[Decoupled.scala 50:35]
  reg [26:0] vpn_reg; // @[Reg.scala 16:16]
  wire [3:0] ridx = io_rreq_0_bits_vpn[3:0]; // @[MMUConst.scala 111:8]
  wire [7:0] v_resize_lo = {v_7_0,v_6_0,v_5_0,v_4_0,v_3_0,v_2_0,v_1_0,v_0_0}; // @[TLBStorage.scala 248:30]
  wire [15:0] _v_resize_T = {v_15_0,v_14_0,v_13_0,v_12_0,v_11_0,v_10_0,v_9_0,v_8_0,v_resize_lo}; // @[TLBStorage.scala 248:30]
  wire  v_resize__0_0 = _v_resize_T[0]; // @[TLBStorage.scala 248:30]
  wire  v_resize__0_1 = _v_resize_T[1]; // @[TLBStorage.scala 248:30]
  wire  v_resize__1_0 = _v_resize_T[2]; // @[TLBStorage.scala 248:30]
  wire  v_resize__1_1 = _v_resize_T[3]; // @[TLBStorage.scala 248:30]
  wire  v_resize__2_0 = _v_resize_T[4]; // @[TLBStorage.scala 248:30]
  wire  v_resize__2_1 = _v_resize_T[5]; // @[TLBStorage.scala 248:30]
  wire  v_resize__3_0 = _v_resize_T[6]; // @[TLBStorage.scala 248:30]
  wire  v_resize__3_1 = _v_resize_T[7]; // @[TLBStorage.scala 248:30]
  wire  v_resize__4_0 = _v_resize_T[8]; // @[TLBStorage.scala 248:30]
  wire  v_resize__4_1 = _v_resize_T[9]; // @[TLBStorage.scala 248:30]
  wire  v_resize__5_0 = _v_resize_T[10]; // @[TLBStorage.scala 248:30]
  wire  v_resize__5_1 = _v_resize_T[11]; // @[TLBStorage.scala 248:30]
  wire  v_resize__6_0 = _v_resize_T[12]; // @[TLBStorage.scala 248:30]
  wire  v_resize__6_1 = _v_resize_T[13]; // @[TLBStorage.scala 248:30]
  wire  v_resize__7_0 = _v_resize_T[14]; // @[TLBStorage.scala 248:30]
  wire  v_resize__7_1 = _v_resize_T[15]; // @[TLBStorage.scala 248:30]
  reg  vidx_resize__0; // @[TLBStorage.scala 249:30]
  reg  vidx_resize__1; // @[TLBStorage.scala 249:30]
  wire  _GEN_2 = 3'h1 == io_rreq_0_bits_vpn[3:1] ? v_resize__1_0 : v_resize__0_0; // @[TLBStorage.scala 249:{30,30}]
  wire  _GEN_3 = 3'h2 == io_rreq_0_bits_vpn[3:1] ? v_resize__2_0 : _GEN_2; // @[TLBStorage.scala 249:{30,30}]
  wire  _GEN_4 = 3'h3 == io_rreq_0_bits_vpn[3:1] ? v_resize__3_0 : _GEN_3; // @[TLBStorage.scala 249:{30,30}]
  wire  _GEN_10 = 3'h1 == io_rreq_0_bits_vpn[3:1] ? v_resize__1_1 : v_resize__0_1; // @[TLBStorage.scala 249:{30,30}]
  wire  _GEN_11 = 3'h2 == io_rreq_0_bits_vpn[3:1] ? v_resize__2_1 : _GEN_10; // @[TLBStorage.scala 249:{30,30}]
  wire  _GEN_12 = 3'h3 == io_rreq_0_bits_vpn[3:1] ? v_resize__3_1 : _GEN_11; // @[TLBStorage.scala 249:{30,30}]
  wire  _GEN_18 = vpn_reg[0] ? vidx_resize__1 : vidx_resize__0; // @[TLBStorage.scala 250:{64,64}]
  reg  vidx_REG; // @[TLBStorage.scala 250:88]
  wire  vidx_0 = _GEN_18 & vidx_REG; // @[TLBStorage.scala 250:78]
  reg  vidx_bypass; // @[TLBStorage.scala 251:30]
  wire  hit_asid_hit = entries_io_rdata_0_0_asid == io_csr_satp_asid; // @[MMUBundle.scala 160:59]
  wire  _hit_T_2 = vpn_reg[26:4] == entries_io_rdata_0_0_tag[26:4]; // @[MMUConst.scala 126:33]
  wire  _hit_T_3 = hit_asid_hit & _hit_T_2; // @[MMUBundle.scala 164:30]
  wire  _vpn_reg_T_1 = io_rreq_1_ready & io_rreq_1_valid; // @[Decoupled.scala 50:35]
  reg [26:0] vpn_reg_1; // @[Reg.scala 16:16]
  wire [3:0] ridx_1 = io_rreq_1_bits_vpn[3:0]; // @[MMUConst.scala 111:8]
  reg  vidx_resize_1_0; // @[TLBStorage.scala 249:30]
  reg  vidx_resize_1_1; // @[TLBStorage.scala 249:30]
  wire  _GEN_21 = 3'h1 == io_rreq_1_bits_vpn[3:1] ? v_resize__1_0 : v_resize__0_0; // @[TLBStorage.scala 249:{30,30}]
  wire  _GEN_22 = 3'h2 == io_rreq_1_bits_vpn[3:1] ? v_resize__2_0 : _GEN_21; // @[TLBStorage.scala 249:{30,30}]
  wire  _GEN_23 = 3'h3 == io_rreq_1_bits_vpn[3:1] ? v_resize__3_0 : _GEN_22; // @[TLBStorage.scala 249:{30,30}]
  wire  _GEN_29 = 3'h1 == io_rreq_1_bits_vpn[3:1] ? v_resize__1_1 : v_resize__0_1; // @[TLBStorage.scala 249:{30,30}]
  wire  _GEN_30 = 3'h2 == io_rreq_1_bits_vpn[3:1] ? v_resize__2_1 : _GEN_29; // @[TLBStorage.scala 249:{30,30}]
  wire  _GEN_31 = 3'h3 == io_rreq_1_bits_vpn[3:1] ? v_resize__3_1 : _GEN_30; // @[TLBStorage.scala 249:{30,30}]
  wire  _GEN_37 = vpn_reg_1[0] ? vidx_resize_1_1 : vidx_resize_1_0; // @[TLBStorage.scala 250:{64,64}]
  reg  vidx_REG_1; // @[TLBStorage.scala 250:88]
  wire  vidx_0_1 = _GEN_37 & vidx_REG_1; // @[TLBStorage.scala 250:78]
  reg  vidx_bypass_1; // @[TLBStorage.scala 251:30]
  wire  hit_asid_hit_1 = entries_io_rdata_1_0_asid == io_csr_satp_asid; // @[MMUBundle.scala 160:59]
  wire  _hit_T_7 = vpn_reg_1[26:4] == entries_io_rdata_1_0_tag[26:4]; // @[MMUConst.scala 126:33]
  wire  _hit_T_8 = hit_asid_hit_1 & _hit_T_7; // @[MMUBundle.scala 164:30]
  wire  _GEN_38 = 4'h0 == io_victim_in_bits_entry_tag[3:0] | v_0_0; // @[TLBStorage.scala 236:18 282:{74,74}]
  wire  _GEN_39 = 4'h1 == io_victim_in_bits_entry_tag[3:0] | v_1_0; // @[TLBStorage.scala 236:18 282:{74,74}]
  wire  _GEN_40 = 4'h2 == io_victim_in_bits_entry_tag[3:0] | v_2_0; // @[TLBStorage.scala 236:18 282:{74,74}]
  wire  _GEN_41 = 4'h3 == io_victim_in_bits_entry_tag[3:0] | v_3_0; // @[TLBStorage.scala 236:18 282:{74,74}]
  wire  _GEN_42 = 4'h4 == io_victim_in_bits_entry_tag[3:0] | v_4_0; // @[TLBStorage.scala 236:18 282:{74,74}]
  wire  _GEN_43 = 4'h5 == io_victim_in_bits_entry_tag[3:0] | v_5_0; // @[TLBStorage.scala 236:18 282:{74,74}]
  wire  _GEN_44 = 4'h6 == io_victim_in_bits_entry_tag[3:0] | v_6_0; // @[TLBStorage.scala 236:18 282:{74,74}]
  wire  _GEN_45 = 4'h7 == io_victim_in_bits_entry_tag[3:0] | v_7_0; // @[TLBStorage.scala 236:18 282:{74,74}]
  wire  _GEN_46 = 4'h8 == io_victim_in_bits_entry_tag[3:0] | v_8_0; // @[TLBStorage.scala 236:18 282:{74,74}]
  wire  _GEN_47 = 4'h9 == io_victim_in_bits_entry_tag[3:0] | v_9_0; // @[TLBStorage.scala 236:18 282:{74,74}]
  wire  _GEN_48 = 4'ha == io_victim_in_bits_entry_tag[3:0] | v_10_0; // @[TLBStorage.scala 236:18 282:{74,74}]
  wire  _GEN_49 = 4'hb == io_victim_in_bits_entry_tag[3:0] | v_11_0; // @[TLBStorage.scala 236:18 282:{74,74}]
  wire  _GEN_50 = 4'hc == io_victim_in_bits_entry_tag[3:0] | v_12_0; // @[TLBStorage.scala 236:18 282:{74,74}]
  wire  _GEN_51 = 4'hd == io_victim_in_bits_entry_tag[3:0] | v_13_0; // @[TLBStorage.scala 236:18 282:{74,74}]
  wire  _GEN_52 = 4'he == io_victim_in_bits_entry_tag[3:0] | v_14_0; // @[TLBStorage.scala 236:18 282:{74,74}]
  wire  _GEN_53 = 4'hf == io_victim_in_bits_entry_tag[3:0] | v_15_0; // @[TLBStorage.scala 236:18 282:{74,74}]
  wire  _GEN_54 = io_victim_in_valid ? _GEN_38 : v_0_0; // @[TLBStorage.scala 236:18 281:29]
  wire  _GEN_55 = io_victim_in_valid ? _GEN_39 : v_1_0; // @[TLBStorage.scala 236:18 281:29]
  wire  _GEN_56 = io_victim_in_valid ? _GEN_40 : v_2_0; // @[TLBStorage.scala 236:18 281:29]
  wire  _GEN_57 = io_victim_in_valid ? _GEN_41 : v_3_0; // @[TLBStorage.scala 236:18 281:29]
  wire  _GEN_58 = io_victim_in_valid ? _GEN_42 : v_4_0; // @[TLBStorage.scala 236:18 281:29]
  wire  _GEN_59 = io_victim_in_valid ? _GEN_43 : v_5_0; // @[TLBStorage.scala 236:18 281:29]
  wire  _GEN_60 = io_victim_in_valid ? _GEN_44 : v_6_0; // @[TLBStorage.scala 236:18 281:29]
  wire  _GEN_61 = io_victim_in_valid ? _GEN_45 : v_7_0; // @[TLBStorage.scala 236:18 281:29]
  wire  _GEN_62 = io_victim_in_valid ? _GEN_46 : v_8_0; // @[TLBStorage.scala 236:18 281:29]
  wire  _GEN_63 = io_victim_in_valid ? _GEN_47 : v_9_0; // @[TLBStorage.scala 236:18 281:29]
  wire  _GEN_64 = io_victim_in_valid ? _GEN_48 : v_10_0; // @[TLBStorage.scala 236:18 281:29]
  wire  _GEN_65 = io_victim_in_valid ? _GEN_49 : v_11_0; // @[TLBStorage.scala 236:18 281:29]
  wire  _GEN_66 = io_victim_in_valid ? _GEN_50 : v_12_0; // @[TLBStorage.scala 236:18 281:29]
  wire  _GEN_67 = io_victim_in_valid ? _GEN_51 : v_13_0; // @[TLBStorage.scala 236:18 281:29]
  wire  _GEN_68 = io_victim_in_valid ? _GEN_52 : v_14_0; // @[TLBStorage.scala 236:18 281:29]
  wire  _GEN_69 = io_victim_in_valid ? _GEN_53 : v_15_0; // @[TLBStorage.scala 236:18 281:29]
  BankedAsyncDataModuleTemplateWithDup_1 entries ( // @[TLBStorage.scala 237:23]
    .clock(entries_clock),
    .io_raddr_0(entries_io_raddr_0),
    .io_raddr_1(entries_io_raddr_1),
    .io_rdata_0_0_tag(entries_io_rdata_0_0_tag),
    .io_rdata_0_0_asid(entries_io_rdata_0_0_asid),
    .io_rdata_0_0_ppn(entries_io_rdata_0_0_ppn),
    .io_rdata_0_0_perm_pf(entries_io_rdata_0_0_perm_pf),
    .io_rdata_0_0_perm_af(entries_io_rdata_0_0_perm_af),
    .io_rdata_0_0_perm_d(entries_io_rdata_0_0_perm_d),
    .io_rdata_0_0_perm_a(entries_io_rdata_0_0_perm_a),
    .io_rdata_0_0_perm_u(entries_io_rdata_0_0_perm_u),
    .io_rdata_0_0_perm_w(entries_io_rdata_0_0_perm_w),
    .io_rdata_0_0_perm_pm_w(entries_io_rdata_0_0_perm_pm_w),
    .io_rdata_0_0_perm_pm_c(entries_io_rdata_0_0_perm_pm_c),
    .io_rdata_1_0_tag(entries_io_rdata_1_0_tag),
    .io_rdata_1_0_asid(entries_io_rdata_1_0_asid),
    .io_rdata_1_0_ppn(entries_io_rdata_1_0_ppn),
    .io_rdata_1_0_perm_pf(entries_io_rdata_1_0_perm_pf),
    .io_rdata_1_0_perm_af(entries_io_rdata_1_0_perm_af),
    .io_rdata_1_0_perm_d(entries_io_rdata_1_0_perm_d),
    .io_rdata_1_0_perm_a(entries_io_rdata_1_0_perm_a),
    .io_rdata_1_0_perm_u(entries_io_rdata_1_0_perm_u),
    .io_rdata_1_0_perm_w(entries_io_rdata_1_0_perm_w),
    .io_rdata_1_0_perm_pm_w(entries_io_rdata_1_0_perm_pm_w),
    .io_rdata_1_0_perm_pm_c(entries_io_rdata_1_0_perm_pm_c),
    .io_wen(entries_io_wen),
    .io_waddr(entries_io_waddr),
    .io_wdata_tag(entries_io_wdata_tag),
    .io_wdata_asid(entries_io_wdata_asid),
    .io_wdata_ppn(entries_io_wdata_ppn),
    .io_wdata_perm_pf(entries_io_wdata_perm_pf),
    .io_wdata_perm_af(entries_io_wdata_perm_af),
    .io_wdata_perm_d(entries_io_wdata_perm_d),
    .io_wdata_perm_a(entries_io_wdata_perm_a),
    .io_wdata_perm_u(entries_io_wdata_perm_u),
    .io_wdata_perm_w(entries_io_wdata_perm_w),
    .io_wdata_perm_pm_w(entries_io_wdata_perm_pm_w),
    .io_wdata_perm_pm_c(entries_io_wdata_perm_pm_c)
  );
  assign io_rreq_0_ready = 1'h1; // @[TLBStorage.scala 235:24]
  assign io_rreq_1_ready = 1'h1; // @[TLBStorage.scala 235:24]
  assign io_rresp_0_bits_hit = _hit_T_3 & (vidx_0 | vidx_bypass); // @[TLBStorage.scala 255:61]
  assign io_rresp_0_bits_ppn_0 = entries_io_rdata_0_0_ppn; // @[TLBStorage.scala 258:24]
  assign io_rresp_0_bits_perm_0_pf = entries_io_rdata_0_0_perm_pf; // @[TLBStorage.scala 259:25]
  assign io_rresp_0_bits_perm_0_af = entries_io_rdata_0_0_perm_af; // @[TLBStorage.scala 259:25]
  assign io_rresp_0_bits_perm_0_d = entries_io_rdata_0_0_perm_d; // @[TLBStorage.scala 259:25]
  assign io_rresp_0_bits_perm_0_a = entries_io_rdata_0_0_perm_a; // @[TLBStorage.scala 259:25]
  assign io_rresp_0_bits_perm_0_u = entries_io_rdata_0_0_perm_u; // @[TLBStorage.scala 259:25]
  assign io_rresp_0_bits_perm_0_w = entries_io_rdata_0_0_perm_w; // @[TLBStorage.scala 259:25]
  assign io_rresp_0_bits_perm_0_pm_w = entries_io_rdata_0_0_perm_pm_w; // @[TLBStorage.scala 259:25]
  assign io_rresp_0_bits_perm_0_pm_c = entries_io_rdata_0_0_perm_pm_c; // @[TLBStorage.scala 259:25]
  assign io_rresp_1_bits_hit = _hit_T_8 & (vidx_0_1 | vidx_bypass_1); // @[TLBStorage.scala 255:61]
  assign io_rresp_1_bits_ppn_0 = entries_io_rdata_1_0_ppn; // @[TLBStorage.scala 258:24]
  assign io_rresp_1_bits_perm_0_pf = entries_io_rdata_1_0_perm_pf; // @[TLBStorage.scala 259:25]
  assign io_rresp_1_bits_perm_0_af = entries_io_rdata_1_0_perm_af; // @[TLBStorage.scala 259:25]
  assign io_rresp_1_bits_perm_0_d = entries_io_rdata_1_0_perm_d; // @[TLBStorage.scala 259:25]
  assign io_rresp_1_bits_perm_0_a = entries_io_rdata_1_0_perm_a; // @[TLBStorage.scala 259:25]
  assign io_rresp_1_bits_perm_0_u = entries_io_rdata_1_0_perm_u; // @[TLBStorage.scala 259:25]
  assign io_rresp_1_bits_perm_0_w = entries_io_rdata_1_0_perm_w; // @[TLBStorage.scala 259:25]
  assign io_rresp_1_bits_perm_0_pm_w = entries_io_rdata_1_0_perm_pm_w; // @[TLBStorage.scala 259:25]
  assign io_rresp_1_bits_perm_0_pm_c = entries_io_rdata_1_0_perm_pm_c; // @[TLBStorage.scala 259:25]
  assign entries_clock = clock;
  assign entries_io_raddr_0 = io_rreq_0_bits_vpn[3:0]; // @[MMUConst.scala 111:8]
  assign entries_io_raddr_1 = io_rreq_1_bits_vpn[3:0]; // @[MMUConst.scala 111:8]
  assign entries_io_wen = io_victim_in_valid; // @[TLBStorage.scala 273:32]
  assign entries_io_waddr = io_victim_in_bits_entry_tag[3:0]; // @[MMUConst.scala 111:8]
  assign entries_io_wdata_tag = io_victim_in_bits_entry_tag; // @[TLBStorage.scala 277:26]
  assign entries_io_wdata_asid = io_victim_in_bits_entry_asid; // @[TLBStorage.scala 277:26]
  assign entries_io_wdata_ppn = io_victim_in_bits_entry_ppn; // @[TLBStorage.scala 277:26]
  assign entries_io_wdata_perm_pf = io_victim_in_bits_entry_perm_pf; // @[TLBStorage.scala 277:26]
  assign entries_io_wdata_perm_af = io_victim_in_bits_entry_perm_af; // @[TLBStorage.scala 277:26]
  assign entries_io_wdata_perm_d = io_victim_in_bits_entry_perm_d; // @[TLBStorage.scala 277:26]
  assign entries_io_wdata_perm_a = io_victim_in_bits_entry_perm_a; // @[TLBStorage.scala 277:26]
  assign entries_io_wdata_perm_u = io_victim_in_bits_entry_perm_u; // @[TLBStorage.scala 277:26]
  assign entries_io_wdata_perm_w = io_victim_in_bits_entry_perm_w; // @[TLBStorage.scala 277:26]
  assign entries_io_wdata_perm_pm_w = io_victim_in_bits_entry_perm_pm_w; // @[TLBStorage.scala 277:26]
  assign entries_io_wdata_perm_pm_c = io_victim_in_bits_entry_perm_pm_c; // @[TLBStorage.scala 277:26]
  always @(posedge clock) begin
    if (_vpn_reg_T) begin // @[Reg.scala 17:18]
      vpn_reg <= io_rreq_0_bits_vpn; // @[Reg.scala 17:22]
    end
    if (3'h7 == io_rreq_0_bits_vpn[3:1]) begin // @[TLBStorage.scala 249:30]
      vidx_resize__0 <= v_resize__7_0; // @[TLBStorage.scala 249:30]
    end else if (3'h6 == io_rreq_0_bits_vpn[3:1]) begin // @[TLBStorage.scala 249:30]
      vidx_resize__0 <= v_resize__6_0; // @[TLBStorage.scala 249:30]
    end else if (3'h5 == io_rreq_0_bits_vpn[3:1]) begin // @[TLBStorage.scala 249:30]
      vidx_resize__0 <= v_resize__5_0; // @[TLBStorage.scala 249:30]
    end else if (3'h4 == io_rreq_0_bits_vpn[3:1]) begin // @[TLBStorage.scala 249:30]
      vidx_resize__0 <= v_resize__4_0; // @[TLBStorage.scala 249:30]
    end else begin
      vidx_resize__0 <= _GEN_4;
    end
    if (3'h7 == io_rreq_0_bits_vpn[3:1]) begin // @[TLBStorage.scala 249:30]
      vidx_resize__1 <= v_resize__7_1; // @[TLBStorage.scala 249:30]
    end else if (3'h6 == io_rreq_0_bits_vpn[3:1]) begin // @[TLBStorage.scala 249:30]
      vidx_resize__1 <= v_resize__6_1; // @[TLBStorage.scala 249:30]
    end else if (3'h5 == io_rreq_0_bits_vpn[3:1]) begin // @[TLBStorage.scala 249:30]
      vidx_resize__1 <= v_resize__5_1; // @[TLBStorage.scala 249:30]
    end else if (3'h4 == io_rreq_0_bits_vpn[3:1]) begin // @[TLBStorage.scala 249:30]
      vidx_resize__1 <= v_resize__4_1; // @[TLBStorage.scala 249:30]
    end else begin
      vidx_resize__1 <= _GEN_12;
    end
    vidx_REG <= io_rreq_0_ready & io_rreq_0_valid; // @[Decoupled.scala 50:35]
    vidx_bypass <= entries_io_waddr == ridx & entries_io_wen; // @[TLBStorage.scala 251:59]
    if (_vpn_reg_T_1) begin // @[Reg.scala 17:18]
      vpn_reg_1 <= io_rreq_1_bits_vpn; // @[Reg.scala 17:22]
    end
    if (3'h7 == io_rreq_1_bits_vpn[3:1]) begin // @[TLBStorage.scala 249:30]
      vidx_resize_1_0 <= v_resize__7_0; // @[TLBStorage.scala 249:30]
    end else if (3'h6 == io_rreq_1_bits_vpn[3:1]) begin // @[TLBStorage.scala 249:30]
      vidx_resize_1_0 <= v_resize__6_0; // @[TLBStorage.scala 249:30]
    end else if (3'h5 == io_rreq_1_bits_vpn[3:1]) begin // @[TLBStorage.scala 249:30]
      vidx_resize_1_0 <= v_resize__5_0; // @[TLBStorage.scala 249:30]
    end else if (3'h4 == io_rreq_1_bits_vpn[3:1]) begin // @[TLBStorage.scala 249:30]
      vidx_resize_1_0 <= v_resize__4_0; // @[TLBStorage.scala 249:30]
    end else begin
      vidx_resize_1_0 <= _GEN_23;
    end
    if (3'h7 == io_rreq_1_bits_vpn[3:1]) begin // @[TLBStorage.scala 249:30]
      vidx_resize_1_1 <= v_resize__7_1; // @[TLBStorage.scala 249:30]
    end else if (3'h6 == io_rreq_1_bits_vpn[3:1]) begin // @[TLBStorage.scala 249:30]
      vidx_resize_1_1 <= v_resize__6_1; // @[TLBStorage.scala 249:30]
    end else if (3'h5 == io_rreq_1_bits_vpn[3:1]) begin // @[TLBStorage.scala 249:30]
      vidx_resize_1_1 <= v_resize__5_1; // @[TLBStorage.scala 249:30]
    end else if (3'h4 == io_rreq_1_bits_vpn[3:1]) begin // @[TLBStorage.scala 249:30]
      vidx_resize_1_1 <= v_resize__4_1; // @[TLBStorage.scala 249:30]
    end else begin
      vidx_resize_1_1 <= _GEN_31;
    end
    vidx_REG_1 <= io_rreq_1_ready & io_rreq_1_valid; // @[Decoupled.scala 50:35]
    vidx_bypass_1 <= entries_io_waddr == ridx_1 & entries_io_wen; // @[TLBStorage.scala 251:59]
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[TLBStorage.scala 301:26]
      v_0_0 <= 1'h0; // @[TLBStorage.scala 302:28 303:33 306:{49,49}]
    end else if (io_sfence_valid) begin
      if (io_sfence_bits_rs1) begin
        v_0_0 <= 1'h0;
      end else if (4'h0 == io_sfence_bits_addr[15:12]) begin
        v_0_0 <= 1'h0;
      end else begin
        v_0_0 <= _GEN_54;
      end
    end else begin
      v_0_0 <= _GEN_54;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[TLBStorage.scala 301:26]
      v_1_0 <= 1'h0; // @[TLBStorage.scala 302:28 303:33 306:{49,49}]
    end else if (io_sfence_valid) begin
      if (io_sfence_bits_rs1) begin
        v_1_0 <= 1'h0;
      end else if (4'h1 == io_sfence_bits_addr[15:12]) begin
        v_1_0 <= 1'h0;
      end else begin
        v_1_0 <= _GEN_55;
      end
    end else begin
      v_1_0 <= _GEN_55;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[TLBStorage.scala 301:26]
      v_2_0 <= 1'h0; // @[TLBStorage.scala 302:28 303:33 306:{49,49}]
    end else if (io_sfence_valid) begin
      if (io_sfence_bits_rs1) begin
        v_2_0 <= 1'h0;
      end else if (4'h2 == io_sfence_bits_addr[15:12]) begin
        v_2_0 <= 1'h0;
      end else begin
        v_2_0 <= _GEN_56;
      end
    end else begin
      v_2_0 <= _GEN_56;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[TLBStorage.scala 301:26]
      v_3_0 <= 1'h0; // @[TLBStorage.scala 302:28 303:33 306:{49,49}]
    end else if (io_sfence_valid) begin
      if (io_sfence_bits_rs1) begin
        v_3_0 <= 1'h0;
      end else if (4'h3 == io_sfence_bits_addr[15:12]) begin
        v_3_0 <= 1'h0;
      end else begin
        v_3_0 <= _GEN_57;
      end
    end else begin
      v_3_0 <= _GEN_57;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[TLBStorage.scala 301:26]
      v_4_0 <= 1'h0; // @[TLBStorage.scala 302:28 303:33 306:{49,49}]
    end else if (io_sfence_valid) begin
      if (io_sfence_bits_rs1) begin
        v_4_0 <= 1'h0;
      end else if (4'h4 == io_sfence_bits_addr[15:12]) begin
        v_4_0 <= 1'h0;
      end else begin
        v_4_0 <= _GEN_58;
      end
    end else begin
      v_4_0 <= _GEN_58;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[TLBStorage.scala 301:26]
      v_5_0 <= 1'h0; // @[TLBStorage.scala 302:28 303:33 306:{49,49}]
    end else if (io_sfence_valid) begin
      if (io_sfence_bits_rs1) begin
        v_5_0 <= 1'h0;
      end else if (4'h5 == io_sfence_bits_addr[15:12]) begin
        v_5_0 <= 1'h0;
      end else begin
        v_5_0 <= _GEN_59;
      end
    end else begin
      v_5_0 <= _GEN_59;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[TLBStorage.scala 301:26]
      v_6_0 <= 1'h0; // @[TLBStorage.scala 302:28 303:33 306:{49,49}]
    end else if (io_sfence_valid) begin
      if (io_sfence_bits_rs1) begin
        v_6_0 <= 1'h0;
      end else if (4'h6 == io_sfence_bits_addr[15:12]) begin
        v_6_0 <= 1'h0;
      end else begin
        v_6_0 <= _GEN_60;
      end
    end else begin
      v_6_0 <= _GEN_60;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[TLBStorage.scala 301:26]
      v_7_0 <= 1'h0; // @[TLBStorage.scala 302:28 303:33 306:{49,49}]
    end else if (io_sfence_valid) begin
      if (io_sfence_bits_rs1) begin
        v_7_0 <= 1'h0;
      end else if (4'h7 == io_sfence_bits_addr[15:12]) begin
        v_7_0 <= 1'h0;
      end else begin
        v_7_0 <= _GEN_61;
      end
    end else begin
      v_7_0 <= _GEN_61;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[TLBStorage.scala 301:26]
      v_8_0 <= 1'h0; // @[TLBStorage.scala 302:28 303:33 306:{49,49}]
    end else if (io_sfence_valid) begin
      if (io_sfence_bits_rs1) begin
        v_8_0 <= 1'h0;
      end else if (4'h8 == io_sfence_bits_addr[15:12]) begin
        v_8_0 <= 1'h0;
      end else begin
        v_8_0 <= _GEN_62;
      end
    end else begin
      v_8_0 <= _GEN_62;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[TLBStorage.scala 301:26]
      v_9_0 <= 1'h0; // @[TLBStorage.scala 302:28 303:33 306:{49,49}]
    end else if (io_sfence_valid) begin
      if (io_sfence_bits_rs1) begin
        v_9_0 <= 1'h0;
      end else if (4'h9 == io_sfence_bits_addr[15:12]) begin
        v_9_0 <= 1'h0;
      end else begin
        v_9_0 <= _GEN_63;
      end
    end else begin
      v_9_0 <= _GEN_63;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[TLBStorage.scala 301:26]
      v_10_0 <= 1'h0; // @[TLBStorage.scala 302:28 303:33 306:{49,49}]
    end else if (io_sfence_valid) begin
      if (io_sfence_bits_rs1) begin
        v_10_0 <= 1'h0;
      end else if (4'ha == io_sfence_bits_addr[15:12]) begin
        v_10_0 <= 1'h0;
      end else begin
        v_10_0 <= _GEN_64;
      end
    end else begin
      v_10_0 <= _GEN_64;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[TLBStorage.scala 301:26]
      v_11_0 <= 1'h0; // @[TLBStorage.scala 302:28 303:33 306:{49,49}]
    end else if (io_sfence_valid) begin
      if (io_sfence_bits_rs1) begin
        v_11_0 <= 1'h0;
      end else if (4'hb == io_sfence_bits_addr[15:12]) begin
        v_11_0 <= 1'h0;
      end else begin
        v_11_0 <= _GEN_65;
      end
    end else begin
      v_11_0 <= _GEN_65;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[TLBStorage.scala 301:26]
      v_12_0 <= 1'h0; // @[TLBStorage.scala 302:28 303:33 306:{49,49}]
    end else if (io_sfence_valid) begin
      if (io_sfence_bits_rs1) begin
        v_12_0 <= 1'h0;
      end else if (4'hc == io_sfence_bits_addr[15:12]) begin
        v_12_0 <= 1'h0;
      end else begin
        v_12_0 <= _GEN_66;
      end
    end else begin
      v_12_0 <= _GEN_66;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[TLBStorage.scala 301:26]
      v_13_0 <= 1'h0; // @[TLBStorage.scala 302:28 303:33 306:{49,49}]
    end else if (io_sfence_valid) begin
      if (io_sfence_bits_rs1) begin
        v_13_0 <= 1'h0;
      end else if (4'hd == io_sfence_bits_addr[15:12]) begin
        v_13_0 <= 1'h0;
      end else begin
        v_13_0 <= _GEN_67;
      end
    end else begin
      v_13_0 <= _GEN_67;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[TLBStorage.scala 301:26]
      v_14_0 <= 1'h0; // @[TLBStorage.scala 302:28 303:33 306:{49,49}]
    end else if (io_sfence_valid) begin
      if (io_sfence_bits_rs1) begin
        v_14_0 <= 1'h0;
      end else if (4'he == io_sfence_bits_addr[15:12]) begin
        v_14_0 <= 1'h0;
      end else begin
        v_14_0 <= _GEN_68;
      end
    end else begin
      v_14_0 <= _GEN_68;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[TLBStorage.scala 301:26]
      v_15_0 <= 1'h0; // @[TLBStorage.scala 302:28 303:33 306:{49,49}]
    end else if (io_sfence_valid) begin
      if (io_sfence_bits_rs1) begin
        v_15_0 <= 1'h0;
      end else if (4'hf == io_sfence_bits_addr[15:12]) begin
        v_15_0 <= 1'h0;
      end else begin
        v_15_0 <= _GEN_69;
      end
    end else begin
      v_15_0 <= _GEN_69;
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
  v_0_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  v_1_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  v_2_0 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  v_3_0 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  v_4_0 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  v_5_0 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  v_6_0 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  v_7_0 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  v_8_0 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  v_9_0 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  v_10_0 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  v_11_0 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  v_12_0 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  v_13_0 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  v_14_0 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  v_15_0 = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  vpn_reg = _RAND_16[26:0];
  _RAND_17 = {1{`RANDOM}};
  vidx_resize__0 = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  vidx_resize__1 = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  vidx_REG = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  vidx_bypass = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  vpn_reg_1 = _RAND_21[26:0];
  _RAND_22 = {1{`RANDOM}};
  vidx_resize_1_0 = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  vidx_resize_1_1 = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  vidx_REG_1 = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  vidx_bypass_1 = _RAND_25[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    v_0_0 = 1'h0;
  end
  if (reset) begin
    v_1_0 = 1'h0;
  end
  if (reset) begin
    v_2_0 = 1'h0;
  end
  if (reset) begin
    v_3_0 = 1'h0;
  end
  if (reset) begin
    v_4_0 = 1'h0;
  end
  if (reset) begin
    v_5_0 = 1'h0;
  end
  if (reset) begin
    v_6_0 = 1'h0;
  end
  if (reset) begin
    v_7_0 = 1'h0;
  end
  if (reset) begin
    v_8_0 = 1'h0;
  end
  if (reset) begin
    v_9_0 = 1'h0;
  end
  if (reset) begin
    v_10_0 = 1'h0;
  end
  if (reset) begin
    v_11_0 = 1'h0;
  end
  if (reset) begin
    v_12_0 = 1'h0;
  end
  if (reset) begin
    v_13_0 = 1'h0;
  end
  if (reset) begin
    v_14_0 = 1'h0;
  end
  if (reset) begin
    v_15_0 = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

