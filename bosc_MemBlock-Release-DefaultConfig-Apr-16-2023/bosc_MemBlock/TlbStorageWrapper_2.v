module TlbStorageWrapper_2(
  input         clock,
  input         reset,
  input         io_sfence_valid,
  input         io_sfence_bits_rs1,
  input         io_sfence_bits_rs2,
  input  [38:0] io_sfence_bits_addr,
  input  [15:0] io_sfence_bits_asid,
  input  [15:0] io_csr_satp_asid,
  input         io_rreq_0_valid,
  input  [26:0] io_rreq_0_bits_vpn,
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
  output        io_rresp_0_bits_super_hit,
  output [23:0] io_rresp_0_bits_super_ppn,
  output        io_rresp_0_bits_spm_w,
  output        io_rresp_0_bits_spm_c,
  output        io_rresp_1_bits_hit,
  output [23:0] io_rresp_1_bits_ppn_0,
  output        io_rresp_1_bits_perm_0_pf,
  output        io_rresp_1_bits_perm_0_af,
  output        io_rresp_1_bits_perm_0_d,
  output        io_rresp_1_bits_perm_0_a,
  output        io_rresp_1_bits_perm_0_u,
  output        io_rresp_1_bits_perm_0_w,
  output        io_rresp_1_bits_super_hit,
  output [23:0] io_rresp_1_bits_super_ppn,
  output        io_rresp_1_bits_spm_w,
  output        io_rresp_1_bits_spm_c,
  input         io_wvalid,
  input  [26:0] io_wdata_entry_tag,
  input  [23:0] io_wdata_entry_ppn,
  input         io_wdata_entry_perm_d,
  input         io_wdata_entry_perm_a,
  input         io_wdata_entry_perm_g,
  input         io_wdata_entry_perm_u,
  input         io_wdata_entry_perm_x,
  input         io_wdata_entry_perm_w,
  input         io_wdata_entry_perm_r,
  input  [1:0]  io_wdata_entry_level,
  input         io_wdata_pf,
  input         io_wdata_af,
  input         io_wdata_replenish_c,
  input         io_wdata_replenish_atomic,
  input         io_wdata_replenish_x,
  input         io_wdata_replenish_w,
  input         io_wdata_replenish_r
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  normalPage_sttlb_np_storage_sa_clock; // @[TLBStorage.scala 443:29]
  wire  normalPage_sttlb_np_storage_sa_reset; // @[TLBStorage.scala 443:29]
  wire  normalPage_sttlb_np_storage_sa_io_sfence_valid; // @[TLBStorage.scala 443:29]
  wire  normalPage_sttlb_np_storage_sa_io_sfence_bits_rs1; // @[TLBStorage.scala 443:29]
  wire [38:0] normalPage_sttlb_np_storage_sa_io_sfence_bits_addr; // @[TLBStorage.scala 443:29]
  wire [15:0] normalPage_sttlb_np_storage_sa_io_csr_satp_asid; // @[TLBStorage.scala 443:29]
  wire  normalPage_sttlb_np_storage_sa_io_rreq_0_ready; // @[TLBStorage.scala 443:29]
  wire  normalPage_sttlb_np_storage_sa_io_rreq_0_valid; // @[TLBStorage.scala 443:29]
  wire [26:0] normalPage_sttlb_np_storage_sa_io_rreq_0_bits_vpn; // @[TLBStorage.scala 443:29]
  wire  normalPage_sttlb_np_storage_sa_io_rreq_1_ready; // @[TLBStorage.scala 443:29]
  wire  normalPage_sttlb_np_storage_sa_io_rreq_1_valid; // @[TLBStorage.scala 443:29]
  wire [26:0] normalPage_sttlb_np_storage_sa_io_rreq_1_bits_vpn; // @[TLBStorage.scala 443:29]
  wire  normalPage_sttlb_np_storage_sa_io_rresp_0_bits_hit; // @[TLBStorage.scala 443:29]
  wire [23:0] normalPage_sttlb_np_storage_sa_io_rresp_0_bits_ppn_0; // @[TLBStorage.scala 443:29]
  wire  normalPage_sttlb_np_storage_sa_io_rresp_0_bits_perm_0_pf; // @[TLBStorage.scala 443:29]
  wire  normalPage_sttlb_np_storage_sa_io_rresp_0_bits_perm_0_af; // @[TLBStorage.scala 443:29]
  wire  normalPage_sttlb_np_storage_sa_io_rresp_0_bits_perm_0_d; // @[TLBStorage.scala 443:29]
  wire  normalPage_sttlb_np_storage_sa_io_rresp_0_bits_perm_0_a; // @[TLBStorage.scala 443:29]
  wire  normalPage_sttlb_np_storage_sa_io_rresp_0_bits_perm_0_u; // @[TLBStorage.scala 443:29]
  wire  normalPage_sttlb_np_storage_sa_io_rresp_0_bits_perm_0_w; // @[TLBStorage.scala 443:29]
  wire  normalPage_sttlb_np_storage_sa_io_rresp_0_bits_perm_0_pm_w; // @[TLBStorage.scala 443:29]
  wire  normalPage_sttlb_np_storage_sa_io_rresp_0_bits_perm_0_pm_c; // @[TLBStorage.scala 443:29]
  wire  normalPage_sttlb_np_storage_sa_io_rresp_1_bits_hit; // @[TLBStorage.scala 443:29]
  wire [23:0] normalPage_sttlb_np_storage_sa_io_rresp_1_bits_ppn_0; // @[TLBStorage.scala 443:29]
  wire  normalPage_sttlb_np_storage_sa_io_rresp_1_bits_perm_0_pf; // @[TLBStorage.scala 443:29]
  wire  normalPage_sttlb_np_storage_sa_io_rresp_1_bits_perm_0_af; // @[TLBStorage.scala 443:29]
  wire  normalPage_sttlb_np_storage_sa_io_rresp_1_bits_perm_0_d; // @[TLBStorage.scala 443:29]
  wire  normalPage_sttlb_np_storage_sa_io_rresp_1_bits_perm_0_a; // @[TLBStorage.scala 443:29]
  wire  normalPage_sttlb_np_storage_sa_io_rresp_1_bits_perm_0_u; // @[TLBStorage.scala 443:29]
  wire  normalPage_sttlb_np_storage_sa_io_rresp_1_bits_perm_0_w; // @[TLBStorage.scala 443:29]
  wire  normalPage_sttlb_np_storage_sa_io_rresp_1_bits_perm_0_pm_w; // @[TLBStorage.scala 443:29]
  wire  normalPage_sttlb_np_storage_sa_io_rresp_1_bits_perm_0_pm_c; // @[TLBStorage.scala 443:29]
  wire  normalPage_sttlb_np_storage_sa_io_victim_in_valid; // @[TLBStorage.scala 443:29]
  wire [26:0] normalPage_sttlb_np_storage_sa_io_victim_in_bits_entry_tag; // @[TLBStorage.scala 443:29]
  wire [15:0] normalPage_sttlb_np_storage_sa_io_victim_in_bits_entry_asid; // @[TLBStorage.scala 443:29]
  wire [23:0] normalPage_sttlb_np_storage_sa_io_victim_in_bits_entry_ppn; // @[TLBStorage.scala 443:29]
  wire  normalPage_sttlb_np_storage_sa_io_victim_in_bits_entry_perm_pf; // @[TLBStorage.scala 443:29]
  wire  normalPage_sttlb_np_storage_sa_io_victim_in_bits_entry_perm_af; // @[TLBStorage.scala 443:29]
  wire  normalPage_sttlb_np_storage_sa_io_victim_in_bits_entry_perm_d; // @[TLBStorage.scala 443:29]
  wire  normalPage_sttlb_np_storage_sa_io_victim_in_bits_entry_perm_a; // @[TLBStorage.scala 443:29]
  wire  normalPage_sttlb_np_storage_sa_io_victim_in_bits_entry_perm_u; // @[TLBStorage.scala 443:29]
  wire  normalPage_sttlb_np_storage_sa_io_victim_in_bits_entry_perm_w; // @[TLBStorage.scala 443:29]
  wire  normalPage_sttlb_np_storage_sa_io_victim_in_bits_entry_perm_pm_w; // @[TLBStorage.scala 443:29]
  wire  normalPage_sttlb_np_storage_sa_io_victim_in_bits_entry_perm_pm_c; // @[TLBStorage.scala 443:29]
  wire  superPage_sttlb_sp_storage_fa_clock; // @[TLBStorage.scala 439:29]
  wire  superPage_sttlb_sp_storage_fa_reset; // @[TLBStorage.scala 439:29]
  wire  superPage_sttlb_sp_storage_fa_io_sfence_valid; // @[TLBStorage.scala 439:29]
  wire  superPage_sttlb_sp_storage_fa_io_sfence_bits_rs1; // @[TLBStorage.scala 439:29]
  wire  superPage_sttlb_sp_storage_fa_io_sfence_bits_rs2; // @[TLBStorage.scala 439:29]
  wire [38:0] superPage_sttlb_sp_storage_fa_io_sfence_bits_addr; // @[TLBStorage.scala 439:29]
  wire [15:0] superPage_sttlb_sp_storage_fa_io_sfence_bits_asid; // @[TLBStorage.scala 439:29]
  wire [15:0] superPage_sttlb_sp_storage_fa_io_csr_satp_asid; // @[TLBStorage.scala 439:29]
  wire  superPage_sttlb_sp_storage_fa_io_rreq_0_ready; // @[TLBStorage.scala 439:29]
  wire  superPage_sttlb_sp_storage_fa_io_rreq_0_valid; // @[TLBStorage.scala 439:29]
  wire [26:0] superPage_sttlb_sp_storage_fa_io_rreq_0_bits_vpn; // @[TLBStorage.scala 439:29]
  wire  superPage_sttlb_sp_storage_fa_io_rreq_1_ready; // @[TLBStorage.scala 439:29]
  wire  superPage_sttlb_sp_storage_fa_io_rreq_1_valid; // @[TLBStorage.scala 439:29]
  wire [26:0] superPage_sttlb_sp_storage_fa_io_rreq_1_bits_vpn; // @[TLBStorage.scala 439:29]
  wire  superPage_sttlb_sp_storage_fa_io_rresp_0_valid; // @[TLBStorage.scala 439:29]
  wire  superPage_sttlb_sp_storage_fa_io_rresp_0_bits_hit; // @[TLBStorage.scala 439:29]
  wire [23:0] superPage_sttlb_sp_storage_fa_io_rresp_0_bits_ppn_0; // @[TLBStorage.scala 439:29]
  wire  superPage_sttlb_sp_storage_fa_io_rresp_0_bits_perm_0_pf; // @[TLBStorage.scala 439:29]
  wire  superPage_sttlb_sp_storage_fa_io_rresp_0_bits_perm_0_af; // @[TLBStorage.scala 439:29]
  wire  superPage_sttlb_sp_storage_fa_io_rresp_0_bits_perm_0_d; // @[TLBStorage.scala 439:29]
  wire  superPage_sttlb_sp_storage_fa_io_rresp_0_bits_perm_0_a; // @[TLBStorage.scala 439:29]
  wire  superPage_sttlb_sp_storage_fa_io_rresp_0_bits_perm_0_u; // @[TLBStorage.scala 439:29]
  wire  superPage_sttlb_sp_storage_fa_io_rresp_0_bits_perm_0_x; // @[TLBStorage.scala 439:29]
  wire  superPage_sttlb_sp_storage_fa_io_rresp_0_bits_perm_0_w; // @[TLBStorage.scala 439:29]
  wire  superPage_sttlb_sp_storage_fa_io_rresp_0_bits_perm_0_r; // @[TLBStorage.scala 439:29]
  wire  superPage_sttlb_sp_storage_fa_io_rresp_1_valid; // @[TLBStorage.scala 439:29]
  wire  superPage_sttlb_sp_storage_fa_io_rresp_1_bits_hit; // @[TLBStorage.scala 439:29]
  wire [23:0] superPage_sttlb_sp_storage_fa_io_rresp_1_bits_ppn_0; // @[TLBStorage.scala 439:29]
  wire  superPage_sttlb_sp_storage_fa_io_rresp_1_bits_perm_0_pf; // @[TLBStorage.scala 439:29]
  wire  superPage_sttlb_sp_storage_fa_io_rresp_1_bits_perm_0_af; // @[TLBStorage.scala 439:29]
  wire  superPage_sttlb_sp_storage_fa_io_rresp_1_bits_perm_0_d; // @[TLBStorage.scala 439:29]
  wire  superPage_sttlb_sp_storage_fa_io_rresp_1_bits_perm_0_a; // @[TLBStorage.scala 439:29]
  wire  superPage_sttlb_sp_storage_fa_io_rresp_1_bits_perm_0_u; // @[TLBStorage.scala 439:29]
  wire  superPage_sttlb_sp_storage_fa_io_rresp_1_bits_perm_0_x; // @[TLBStorage.scala 439:29]
  wire  superPage_sttlb_sp_storage_fa_io_rresp_1_bits_perm_0_w; // @[TLBStorage.scala 439:29]
  wire  superPage_sttlb_sp_storage_fa_io_rresp_1_bits_perm_0_r; // @[TLBStorage.scala 439:29]
  wire  superPage_sttlb_sp_storage_fa_io_wvalid; // @[TLBStorage.scala 439:29]
  wire [1:0] superPage_sttlb_sp_storage_fa_io_wwayIdx; // @[TLBStorage.scala 439:29]
  wire [26:0] superPage_sttlb_sp_storage_fa_io_wdata_entry_tag; // @[TLBStorage.scala 439:29]
  wire [23:0] superPage_sttlb_sp_storage_fa_io_wdata_entry_ppn; // @[TLBStorage.scala 439:29]
  wire  superPage_sttlb_sp_storage_fa_io_wdata_entry_perm_d; // @[TLBStorage.scala 439:29]
  wire  superPage_sttlb_sp_storage_fa_io_wdata_entry_perm_a; // @[TLBStorage.scala 439:29]
  wire  superPage_sttlb_sp_storage_fa_io_wdata_entry_perm_g; // @[TLBStorage.scala 439:29]
  wire  superPage_sttlb_sp_storage_fa_io_wdata_entry_perm_u; // @[TLBStorage.scala 439:29]
  wire  superPage_sttlb_sp_storage_fa_io_wdata_entry_perm_x; // @[TLBStorage.scala 439:29]
  wire  superPage_sttlb_sp_storage_fa_io_wdata_entry_perm_w; // @[TLBStorage.scala 439:29]
  wire  superPage_sttlb_sp_storage_fa_io_wdata_entry_perm_r; // @[TLBStorage.scala 439:29]
  wire [1:0] superPage_sttlb_sp_storage_fa_io_wdata_entry_level; // @[TLBStorage.scala 439:29]
  wire  superPage_sttlb_sp_storage_fa_io_wdata_pf; // @[TLBStorage.scala 439:29]
  wire  superPage_sttlb_sp_storage_fa_io_wdata_af; // @[TLBStorage.scala 439:29]
  wire  superPage_sttlb_sp_storage_fa_io_wdata_replenish_c; // @[TLBStorage.scala 439:29]
  wire  superPage_sttlb_sp_storage_fa_io_wdata_replenish_atomic; // @[TLBStorage.scala 439:29]
  wire  superPage_sttlb_sp_storage_fa_io_wdata_replenish_x; // @[TLBStorage.scala 439:29]
  wire  superPage_sttlb_sp_storage_fa_io_wdata_replenish_w; // @[TLBStorage.scala 439:29]
  wire  superPage_sttlb_sp_storage_fa_io_wdata_replenish_r; // @[TLBStorage.scala 439:29]
  wire  superPage_sttlb_sp_storage_fa_io_victim_out_valid; // @[TLBStorage.scala 439:29]
  wire [26:0] superPage_sttlb_sp_storage_fa_io_victim_out_bits_entry_tag; // @[TLBStorage.scala 439:29]
  wire [15:0] superPage_sttlb_sp_storage_fa_io_victim_out_bits_entry_asid; // @[TLBStorage.scala 439:29]
  wire [23:0] superPage_sttlb_sp_storage_fa_io_victim_out_bits_entry_ppn; // @[TLBStorage.scala 439:29]
  wire  superPage_sttlb_sp_storage_fa_io_victim_out_bits_entry_perm_pf; // @[TLBStorage.scala 439:29]
  wire  superPage_sttlb_sp_storage_fa_io_victim_out_bits_entry_perm_af; // @[TLBStorage.scala 439:29]
  wire  superPage_sttlb_sp_storage_fa_io_victim_out_bits_entry_perm_d; // @[TLBStorage.scala 439:29]
  wire  superPage_sttlb_sp_storage_fa_io_victim_out_bits_entry_perm_a; // @[TLBStorage.scala 439:29]
  wire  superPage_sttlb_sp_storage_fa_io_victim_out_bits_entry_perm_u; // @[TLBStorage.scala 439:29]
  wire  superPage_sttlb_sp_storage_fa_io_victim_out_bits_entry_perm_x; // @[TLBStorage.scala 439:29]
  wire  superPage_sttlb_sp_storage_fa_io_victim_out_bits_entry_perm_w; // @[TLBStorage.scala 439:29]
  wire  superPage_sttlb_sp_storage_fa_io_victim_out_bits_entry_perm_r; // @[TLBStorage.scala 439:29]
  wire  superPage_sttlb_sp_storage_fa_io_victim_out_bits_entry_perm_pm_r; // @[TLBStorage.scala 439:29]
  wire  superPage_sttlb_sp_storage_fa_io_victim_out_bits_entry_perm_pm_w; // @[TLBStorage.scala 439:29]
  wire  superPage_sttlb_sp_storage_fa_io_victim_out_bits_entry_perm_pm_c; // @[TLBStorage.scala 439:29]
  wire  superPage_sttlb_sp_storage_fa_io_access_0_touch_ways_valid; // @[TLBStorage.scala 439:29]
  wire [1:0] superPage_sttlb_sp_storage_fa_io_access_0_touch_ways_bits; // @[TLBStorage.scala 439:29]
  wire  superPage_sttlb_sp_storage_fa_io_access_1_touch_ways_valid; // @[TLBStorage.scala 439:29]
  wire [1:0] superPage_sttlb_sp_storage_fa_io_access_1_touch_ways_bits; // @[TLBStorage.scala 439:29]
  reg [2:0] super_refill_idx_state_reg; // @[Replacement.scala 168:70]
  wire  _super_refill_idx_T = superPage_sttlb_sp_storage_fa_io_access_0_touch_ways_valid |
    superPage_sttlb_sp_storage_fa_io_access_1_touch_ways_valid; // @[package.scala 72:59]
  wire [1:0] super_refill_idx_state_reg_touch_way_sized = superPage_sttlb_sp_storage_fa_io_access_0_touch_ways_bits; // @[package.scala 154:13]
  wire  super_refill_idx_state_reg_set_left_older = ~super_refill_idx_state_reg_touch_way_sized[1]; // @[Replacement.scala 196:33]
  wire  super_refill_idx_state_reg_left_subtree_state = super_refill_idx_state_reg[1]; // @[package.scala 154:13]
  wire  super_refill_idx_state_reg_right_subtree_state = super_refill_idx_state_reg[0]; // @[Replacement.scala 198:38]
  wire  _super_refill_idx_state_reg_T_2 = ~super_refill_idx_state_reg_touch_way_sized[0]; // @[Replacement.scala 218:7]
  wire  _super_refill_idx_state_reg_T_3 = super_refill_idx_state_reg_set_left_older ?
    super_refill_idx_state_reg_left_subtree_state : _super_refill_idx_state_reg_T_2; // @[Replacement.scala 203:16]
  wire  _super_refill_idx_state_reg_T_7 = super_refill_idx_state_reg_set_left_older ? _super_refill_idx_state_reg_T_2 :
    super_refill_idx_state_reg_right_subtree_state; // @[Replacement.scala 206:16]
  wire [2:0] _super_refill_idx_state_reg_T_8 = {super_refill_idx_state_reg_set_left_older,
    _super_refill_idx_state_reg_T_3,_super_refill_idx_state_reg_T_7}; // @[Cat.scala 31:58]
  wire [2:0] _super_refill_idx_state_reg_T_9 = superPage_sttlb_sp_storage_fa_io_access_0_touch_ways_valid ?
    _super_refill_idx_state_reg_T_8 : super_refill_idx_state_reg; // @[Replacement.scala 22:56]
  wire [1:0] super_refill_idx_state_reg_touch_way_sized_1 = superPage_sttlb_sp_storage_fa_io_access_1_touch_ways_bits; // @[package.scala 154:13]
  wire  super_refill_idx_state_reg_set_left_older_1 = ~super_refill_idx_state_reg_touch_way_sized_1[1]; // @[Replacement.scala 196:33]
  wire  super_refill_idx_state_reg_left_subtree_state_1 = _super_refill_idx_state_reg_T_9[1]; // @[package.scala 154:13]
  wire  super_refill_idx_state_reg_right_subtree_state_1 = _super_refill_idx_state_reg_T_9[0]; // @[Replacement.scala 198:38]
  wire  _super_refill_idx_state_reg_T_12 = ~super_refill_idx_state_reg_touch_way_sized_1[0]; // @[Replacement.scala 218:7]
  wire  _super_refill_idx_state_reg_T_13 = super_refill_idx_state_reg_set_left_older_1 ?
    super_refill_idx_state_reg_left_subtree_state_1 : _super_refill_idx_state_reg_T_12; // @[Replacement.scala 203:16]
  wire  _super_refill_idx_state_reg_T_17 = super_refill_idx_state_reg_set_left_older_1 ?
    _super_refill_idx_state_reg_T_12 : super_refill_idx_state_reg_right_subtree_state_1; // @[Replacement.scala 206:16]
  wire [2:0] _super_refill_idx_state_reg_T_18 = {super_refill_idx_state_reg_set_left_older_1,
    _super_refill_idx_state_reg_T_13,_super_refill_idx_state_reg_T_17}; // @[Cat.scala 31:58]
  wire  super_refill_idx_left_subtree_older = super_refill_idx_state_reg[2]; // @[Replacement.scala 243:38]
  wire  _super_refill_idx_T_6 = super_refill_idx_left_subtree_older ? super_refill_idx_state_reg_left_subtree_state :
    super_refill_idx_state_reg_right_subtree_state; // @[Replacement.scala 250:16]
  TLBSA_1 normalPage_sttlb_np_storage_sa ( // @[TLBStorage.scala 443:29]
    .clock(normalPage_sttlb_np_storage_sa_clock),
    .reset(normalPage_sttlb_np_storage_sa_reset),
    .io_sfence_valid(normalPage_sttlb_np_storage_sa_io_sfence_valid),
    .io_sfence_bits_rs1(normalPage_sttlb_np_storage_sa_io_sfence_bits_rs1),
    .io_sfence_bits_addr(normalPage_sttlb_np_storage_sa_io_sfence_bits_addr),
    .io_csr_satp_asid(normalPage_sttlb_np_storage_sa_io_csr_satp_asid),
    .io_rreq_0_ready(normalPage_sttlb_np_storage_sa_io_rreq_0_ready),
    .io_rreq_0_valid(normalPage_sttlb_np_storage_sa_io_rreq_0_valid),
    .io_rreq_0_bits_vpn(normalPage_sttlb_np_storage_sa_io_rreq_0_bits_vpn),
    .io_rreq_1_ready(normalPage_sttlb_np_storage_sa_io_rreq_1_ready),
    .io_rreq_1_valid(normalPage_sttlb_np_storage_sa_io_rreq_1_valid),
    .io_rreq_1_bits_vpn(normalPage_sttlb_np_storage_sa_io_rreq_1_bits_vpn),
    .io_rresp_0_bits_hit(normalPage_sttlb_np_storage_sa_io_rresp_0_bits_hit),
    .io_rresp_0_bits_ppn_0(normalPage_sttlb_np_storage_sa_io_rresp_0_bits_ppn_0),
    .io_rresp_0_bits_perm_0_pf(normalPage_sttlb_np_storage_sa_io_rresp_0_bits_perm_0_pf),
    .io_rresp_0_bits_perm_0_af(normalPage_sttlb_np_storage_sa_io_rresp_0_bits_perm_0_af),
    .io_rresp_0_bits_perm_0_d(normalPage_sttlb_np_storage_sa_io_rresp_0_bits_perm_0_d),
    .io_rresp_0_bits_perm_0_a(normalPage_sttlb_np_storage_sa_io_rresp_0_bits_perm_0_a),
    .io_rresp_0_bits_perm_0_u(normalPage_sttlb_np_storage_sa_io_rresp_0_bits_perm_0_u),
    .io_rresp_0_bits_perm_0_w(normalPage_sttlb_np_storage_sa_io_rresp_0_bits_perm_0_w),
    .io_rresp_0_bits_perm_0_pm_w(normalPage_sttlb_np_storage_sa_io_rresp_0_bits_perm_0_pm_w),
    .io_rresp_0_bits_perm_0_pm_c(normalPage_sttlb_np_storage_sa_io_rresp_0_bits_perm_0_pm_c),
    .io_rresp_1_bits_hit(normalPage_sttlb_np_storage_sa_io_rresp_1_bits_hit),
    .io_rresp_1_bits_ppn_0(normalPage_sttlb_np_storage_sa_io_rresp_1_bits_ppn_0),
    .io_rresp_1_bits_perm_0_pf(normalPage_sttlb_np_storage_sa_io_rresp_1_bits_perm_0_pf),
    .io_rresp_1_bits_perm_0_af(normalPage_sttlb_np_storage_sa_io_rresp_1_bits_perm_0_af),
    .io_rresp_1_bits_perm_0_d(normalPage_sttlb_np_storage_sa_io_rresp_1_bits_perm_0_d),
    .io_rresp_1_bits_perm_0_a(normalPage_sttlb_np_storage_sa_io_rresp_1_bits_perm_0_a),
    .io_rresp_1_bits_perm_0_u(normalPage_sttlb_np_storage_sa_io_rresp_1_bits_perm_0_u),
    .io_rresp_1_bits_perm_0_w(normalPage_sttlb_np_storage_sa_io_rresp_1_bits_perm_0_w),
    .io_rresp_1_bits_perm_0_pm_w(normalPage_sttlb_np_storage_sa_io_rresp_1_bits_perm_0_pm_w),
    .io_rresp_1_bits_perm_0_pm_c(normalPage_sttlb_np_storage_sa_io_rresp_1_bits_perm_0_pm_c),
    .io_victim_in_valid(normalPage_sttlb_np_storage_sa_io_victim_in_valid),
    .io_victim_in_bits_entry_tag(normalPage_sttlb_np_storage_sa_io_victim_in_bits_entry_tag),
    .io_victim_in_bits_entry_asid(normalPage_sttlb_np_storage_sa_io_victim_in_bits_entry_asid),
    .io_victim_in_bits_entry_ppn(normalPage_sttlb_np_storage_sa_io_victim_in_bits_entry_ppn),
    .io_victim_in_bits_entry_perm_pf(normalPage_sttlb_np_storage_sa_io_victim_in_bits_entry_perm_pf),
    .io_victim_in_bits_entry_perm_af(normalPage_sttlb_np_storage_sa_io_victim_in_bits_entry_perm_af),
    .io_victim_in_bits_entry_perm_d(normalPage_sttlb_np_storage_sa_io_victim_in_bits_entry_perm_d),
    .io_victim_in_bits_entry_perm_a(normalPage_sttlb_np_storage_sa_io_victim_in_bits_entry_perm_a),
    .io_victim_in_bits_entry_perm_u(normalPage_sttlb_np_storage_sa_io_victim_in_bits_entry_perm_u),
    .io_victim_in_bits_entry_perm_w(normalPage_sttlb_np_storage_sa_io_victim_in_bits_entry_perm_w),
    .io_victim_in_bits_entry_perm_pm_w(normalPage_sttlb_np_storage_sa_io_victim_in_bits_entry_perm_pm_w),
    .io_victim_in_bits_entry_perm_pm_c(normalPage_sttlb_np_storage_sa_io_victim_in_bits_entry_perm_pm_c)
  );
  TLBFA_2 superPage_sttlb_sp_storage_fa ( // @[TLBStorage.scala 439:29]
    .clock(superPage_sttlb_sp_storage_fa_clock),
    .reset(superPage_sttlb_sp_storage_fa_reset),
    .io_sfence_valid(superPage_sttlb_sp_storage_fa_io_sfence_valid),
    .io_sfence_bits_rs1(superPage_sttlb_sp_storage_fa_io_sfence_bits_rs1),
    .io_sfence_bits_rs2(superPage_sttlb_sp_storage_fa_io_sfence_bits_rs2),
    .io_sfence_bits_addr(superPage_sttlb_sp_storage_fa_io_sfence_bits_addr),
    .io_sfence_bits_asid(superPage_sttlb_sp_storage_fa_io_sfence_bits_asid),
    .io_csr_satp_asid(superPage_sttlb_sp_storage_fa_io_csr_satp_asid),
    .io_rreq_0_ready(superPage_sttlb_sp_storage_fa_io_rreq_0_ready),
    .io_rreq_0_valid(superPage_sttlb_sp_storage_fa_io_rreq_0_valid),
    .io_rreq_0_bits_vpn(superPage_sttlb_sp_storage_fa_io_rreq_0_bits_vpn),
    .io_rreq_1_ready(superPage_sttlb_sp_storage_fa_io_rreq_1_ready),
    .io_rreq_1_valid(superPage_sttlb_sp_storage_fa_io_rreq_1_valid),
    .io_rreq_1_bits_vpn(superPage_sttlb_sp_storage_fa_io_rreq_1_bits_vpn),
    .io_rresp_0_valid(superPage_sttlb_sp_storage_fa_io_rresp_0_valid),
    .io_rresp_0_bits_hit(superPage_sttlb_sp_storage_fa_io_rresp_0_bits_hit),
    .io_rresp_0_bits_ppn_0(superPage_sttlb_sp_storage_fa_io_rresp_0_bits_ppn_0),
    .io_rresp_0_bits_perm_0_pf(superPage_sttlb_sp_storage_fa_io_rresp_0_bits_perm_0_pf),
    .io_rresp_0_bits_perm_0_af(superPage_sttlb_sp_storage_fa_io_rresp_0_bits_perm_0_af),
    .io_rresp_0_bits_perm_0_d(superPage_sttlb_sp_storage_fa_io_rresp_0_bits_perm_0_d),
    .io_rresp_0_bits_perm_0_a(superPage_sttlb_sp_storage_fa_io_rresp_0_bits_perm_0_a),
    .io_rresp_0_bits_perm_0_u(superPage_sttlb_sp_storage_fa_io_rresp_0_bits_perm_0_u),
    .io_rresp_0_bits_perm_0_x(superPage_sttlb_sp_storage_fa_io_rresp_0_bits_perm_0_x),
    .io_rresp_0_bits_perm_0_w(superPage_sttlb_sp_storage_fa_io_rresp_0_bits_perm_0_w),
    .io_rresp_0_bits_perm_0_r(superPage_sttlb_sp_storage_fa_io_rresp_0_bits_perm_0_r),
    .io_rresp_1_valid(superPage_sttlb_sp_storage_fa_io_rresp_1_valid),
    .io_rresp_1_bits_hit(superPage_sttlb_sp_storage_fa_io_rresp_1_bits_hit),
    .io_rresp_1_bits_ppn_0(superPage_sttlb_sp_storage_fa_io_rresp_1_bits_ppn_0),
    .io_rresp_1_bits_perm_0_pf(superPage_sttlb_sp_storage_fa_io_rresp_1_bits_perm_0_pf),
    .io_rresp_1_bits_perm_0_af(superPage_sttlb_sp_storage_fa_io_rresp_1_bits_perm_0_af),
    .io_rresp_1_bits_perm_0_d(superPage_sttlb_sp_storage_fa_io_rresp_1_bits_perm_0_d),
    .io_rresp_1_bits_perm_0_a(superPage_sttlb_sp_storage_fa_io_rresp_1_bits_perm_0_a),
    .io_rresp_1_bits_perm_0_u(superPage_sttlb_sp_storage_fa_io_rresp_1_bits_perm_0_u),
    .io_rresp_1_bits_perm_0_x(superPage_sttlb_sp_storage_fa_io_rresp_1_bits_perm_0_x),
    .io_rresp_1_bits_perm_0_w(superPage_sttlb_sp_storage_fa_io_rresp_1_bits_perm_0_w),
    .io_rresp_1_bits_perm_0_r(superPage_sttlb_sp_storage_fa_io_rresp_1_bits_perm_0_r),
    .io_wvalid(superPage_sttlb_sp_storage_fa_io_wvalid),
    .io_wwayIdx(superPage_sttlb_sp_storage_fa_io_wwayIdx),
    .io_wdata_entry_tag(superPage_sttlb_sp_storage_fa_io_wdata_entry_tag),
    .io_wdata_entry_ppn(superPage_sttlb_sp_storage_fa_io_wdata_entry_ppn),
    .io_wdata_entry_perm_d(superPage_sttlb_sp_storage_fa_io_wdata_entry_perm_d),
    .io_wdata_entry_perm_a(superPage_sttlb_sp_storage_fa_io_wdata_entry_perm_a),
    .io_wdata_entry_perm_g(superPage_sttlb_sp_storage_fa_io_wdata_entry_perm_g),
    .io_wdata_entry_perm_u(superPage_sttlb_sp_storage_fa_io_wdata_entry_perm_u),
    .io_wdata_entry_perm_x(superPage_sttlb_sp_storage_fa_io_wdata_entry_perm_x),
    .io_wdata_entry_perm_w(superPage_sttlb_sp_storage_fa_io_wdata_entry_perm_w),
    .io_wdata_entry_perm_r(superPage_sttlb_sp_storage_fa_io_wdata_entry_perm_r),
    .io_wdata_entry_level(superPage_sttlb_sp_storage_fa_io_wdata_entry_level),
    .io_wdata_pf(superPage_sttlb_sp_storage_fa_io_wdata_pf),
    .io_wdata_af(superPage_sttlb_sp_storage_fa_io_wdata_af),
    .io_wdata_replenish_c(superPage_sttlb_sp_storage_fa_io_wdata_replenish_c),
    .io_wdata_replenish_atomic(superPage_sttlb_sp_storage_fa_io_wdata_replenish_atomic),
    .io_wdata_replenish_x(superPage_sttlb_sp_storage_fa_io_wdata_replenish_x),
    .io_wdata_replenish_w(superPage_sttlb_sp_storage_fa_io_wdata_replenish_w),
    .io_wdata_replenish_r(superPage_sttlb_sp_storage_fa_io_wdata_replenish_r),
    .io_victim_out_valid(superPage_sttlb_sp_storage_fa_io_victim_out_valid),
    .io_victim_out_bits_entry_tag(superPage_sttlb_sp_storage_fa_io_victim_out_bits_entry_tag),
    .io_victim_out_bits_entry_asid(superPage_sttlb_sp_storage_fa_io_victim_out_bits_entry_asid),
    .io_victim_out_bits_entry_ppn(superPage_sttlb_sp_storage_fa_io_victim_out_bits_entry_ppn),
    .io_victim_out_bits_entry_perm_pf(superPage_sttlb_sp_storage_fa_io_victim_out_bits_entry_perm_pf),
    .io_victim_out_bits_entry_perm_af(superPage_sttlb_sp_storage_fa_io_victim_out_bits_entry_perm_af),
    .io_victim_out_bits_entry_perm_d(superPage_sttlb_sp_storage_fa_io_victim_out_bits_entry_perm_d),
    .io_victim_out_bits_entry_perm_a(superPage_sttlb_sp_storage_fa_io_victim_out_bits_entry_perm_a),
    .io_victim_out_bits_entry_perm_u(superPage_sttlb_sp_storage_fa_io_victim_out_bits_entry_perm_u),
    .io_victim_out_bits_entry_perm_x(superPage_sttlb_sp_storage_fa_io_victim_out_bits_entry_perm_x),
    .io_victim_out_bits_entry_perm_w(superPage_sttlb_sp_storage_fa_io_victim_out_bits_entry_perm_w),
    .io_victim_out_bits_entry_perm_r(superPage_sttlb_sp_storage_fa_io_victim_out_bits_entry_perm_r),
    .io_victim_out_bits_entry_perm_pm_r(superPage_sttlb_sp_storage_fa_io_victim_out_bits_entry_perm_pm_r),
    .io_victim_out_bits_entry_perm_pm_w(superPage_sttlb_sp_storage_fa_io_victim_out_bits_entry_perm_pm_w),
    .io_victim_out_bits_entry_perm_pm_c(superPage_sttlb_sp_storage_fa_io_victim_out_bits_entry_perm_pm_c),
    .io_access_0_touch_ways_valid(superPage_sttlb_sp_storage_fa_io_access_0_touch_ways_valid),
    .io_access_0_touch_ways_bits(superPage_sttlb_sp_storage_fa_io_access_0_touch_ways_bits),
    .io_access_1_touch_ways_valid(superPage_sttlb_sp_storage_fa_io_access_1_touch_ways_valid),
    .io_access_1_touch_ways_bits(superPage_sttlb_sp_storage_fa_io_access_1_touch_ways_bits)
  );
  assign io_rresp_0_bits_hit = normalPage_sttlb_np_storage_sa_io_rresp_0_bits_hit |
    superPage_sttlb_sp_storage_fa_io_rresp_0_bits_hit; // @[TLBStorage.scala 502:32]
  assign io_rresp_0_bits_ppn_0 = superPage_sttlb_sp_storage_fa_io_rresp_0_bits_hit ?
    superPage_sttlb_sp_storage_fa_io_rresp_0_bits_ppn_0 : normalPage_sttlb_np_storage_sa_io_rresp_0_bits_ppn_0; // @[TLBStorage.scala 504:28]
  assign io_rresp_0_bits_perm_0_pf = superPage_sttlb_sp_storage_fa_io_rresp_0_bits_hit ?
    superPage_sttlb_sp_storage_fa_io_rresp_0_bits_perm_0_pf : normalPage_sttlb_np_storage_sa_io_rresp_0_bits_perm_0_pf
    ; // @[TLBStorage.scala 505:29]
  assign io_rresp_0_bits_perm_0_af = superPage_sttlb_sp_storage_fa_io_rresp_0_bits_hit ?
    superPage_sttlb_sp_storage_fa_io_rresp_0_bits_perm_0_af : normalPage_sttlb_np_storage_sa_io_rresp_0_bits_perm_0_af
    ; // @[TLBStorage.scala 505:29]
  assign io_rresp_0_bits_perm_0_d = superPage_sttlb_sp_storage_fa_io_rresp_0_bits_hit ?
    superPage_sttlb_sp_storage_fa_io_rresp_0_bits_perm_0_d : normalPage_sttlb_np_storage_sa_io_rresp_0_bits_perm_0_d; // @[TLBStorage.scala 505:29]
  assign io_rresp_0_bits_perm_0_a = superPage_sttlb_sp_storage_fa_io_rresp_0_bits_hit ?
    superPage_sttlb_sp_storage_fa_io_rresp_0_bits_perm_0_a : normalPage_sttlb_np_storage_sa_io_rresp_0_bits_perm_0_a; // @[TLBStorage.scala 505:29]
  assign io_rresp_0_bits_perm_0_u = superPage_sttlb_sp_storage_fa_io_rresp_0_bits_hit ?
    superPage_sttlb_sp_storage_fa_io_rresp_0_bits_perm_0_u : normalPage_sttlb_np_storage_sa_io_rresp_0_bits_perm_0_u; // @[TLBStorage.scala 505:29]
  assign io_rresp_0_bits_perm_0_w = superPage_sttlb_sp_storage_fa_io_rresp_0_bits_hit ?
    superPage_sttlb_sp_storage_fa_io_rresp_0_bits_perm_0_w : normalPage_sttlb_np_storage_sa_io_rresp_0_bits_perm_0_w; // @[TLBStorage.scala 505:29]
  assign io_rresp_0_bits_super_hit = superPage_sttlb_sp_storage_fa_io_rresp_0_bits_hit; // @[TLBStorage.scala 507:23]
  assign io_rresp_0_bits_super_ppn = superPage_sttlb_sp_storage_fa_io_rresp_0_bits_ppn_0; // @[TLBStorage.scala 508:23]
  assign io_rresp_0_bits_spm_w = normalPage_sttlb_np_storage_sa_io_rresp_0_bits_perm_0_pm_w; // @[TLBStorage.scala 509:17]
  assign io_rresp_0_bits_spm_c = normalPage_sttlb_np_storage_sa_io_rresp_0_bits_perm_0_pm_c; // @[TLBStorage.scala 509:17]
  assign io_rresp_1_bits_hit = normalPage_sttlb_np_storage_sa_io_rresp_1_bits_hit |
    superPage_sttlb_sp_storage_fa_io_rresp_1_bits_hit; // @[TLBStorage.scala 502:32]
  assign io_rresp_1_bits_ppn_0 = superPage_sttlb_sp_storage_fa_io_rresp_1_bits_hit ?
    superPage_sttlb_sp_storage_fa_io_rresp_1_bits_ppn_0 : normalPage_sttlb_np_storage_sa_io_rresp_1_bits_ppn_0; // @[TLBStorage.scala 504:28]
  assign io_rresp_1_bits_perm_0_pf = superPage_sttlb_sp_storage_fa_io_rresp_1_bits_hit ?
    superPage_sttlb_sp_storage_fa_io_rresp_1_bits_perm_0_pf : normalPage_sttlb_np_storage_sa_io_rresp_1_bits_perm_0_pf
    ; // @[TLBStorage.scala 505:29]
  assign io_rresp_1_bits_perm_0_af = superPage_sttlb_sp_storage_fa_io_rresp_1_bits_hit ?
    superPage_sttlb_sp_storage_fa_io_rresp_1_bits_perm_0_af : normalPage_sttlb_np_storage_sa_io_rresp_1_bits_perm_0_af
    ; // @[TLBStorage.scala 505:29]
  assign io_rresp_1_bits_perm_0_d = superPage_sttlb_sp_storage_fa_io_rresp_1_bits_hit ?
    superPage_sttlb_sp_storage_fa_io_rresp_1_bits_perm_0_d : normalPage_sttlb_np_storage_sa_io_rresp_1_bits_perm_0_d; // @[TLBStorage.scala 505:29]
  assign io_rresp_1_bits_perm_0_a = superPage_sttlb_sp_storage_fa_io_rresp_1_bits_hit ?
    superPage_sttlb_sp_storage_fa_io_rresp_1_bits_perm_0_a : normalPage_sttlb_np_storage_sa_io_rresp_1_bits_perm_0_a; // @[TLBStorage.scala 505:29]
  assign io_rresp_1_bits_perm_0_u = superPage_sttlb_sp_storage_fa_io_rresp_1_bits_hit ?
    superPage_sttlb_sp_storage_fa_io_rresp_1_bits_perm_0_u : normalPage_sttlb_np_storage_sa_io_rresp_1_bits_perm_0_u; // @[TLBStorage.scala 505:29]
  assign io_rresp_1_bits_perm_0_w = superPage_sttlb_sp_storage_fa_io_rresp_1_bits_hit ?
    superPage_sttlb_sp_storage_fa_io_rresp_1_bits_perm_0_w : normalPage_sttlb_np_storage_sa_io_rresp_1_bits_perm_0_w; // @[TLBStorage.scala 505:29]
  assign io_rresp_1_bits_super_hit = superPage_sttlb_sp_storage_fa_io_rresp_1_bits_hit; // @[TLBStorage.scala 507:23]
  assign io_rresp_1_bits_super_ppn = superPage_sttlb_sp_storage_fa_io_rresp_1_bits_ppn_0; // @[TLBStorage.scala 508:23]
  assign io_rresp_1_bits_spm_w = normalPage_sttlb_np_storage_sa_io_rresp_1_bits_perm_0_pm_w; // @[TLBStorage.scala 509:17]
  assign io_rresp_1_bits_spm_c = normalPage_sttlb_np_storage_sa_io_rresp_1_bits_perm_0_pm_c; // @[TLBStorage.scala 509:17]
  assign normalPage_sttlb_np_storage_sa_clock = clock;
  assign normalPage_sttlb_np_storage_sa_reset = reset;
  assign normalPage_sttlb_np_storage_sa_io_sfence_valid = io_sfence_valid; // @[TLBStorage.scala 515:21]
  assign normalPage_sttlb_np_storage_sa_io_sfence_bits_rs1 = io_sfence_bits_rs1; // @[TLBStorage.scala 515:21]
  assign normalPage_sttlb_np_storage_sa_io_sfence_bits_addr = io_sfence_bits_addr; // @[TLBStorage.scala 515:21]
  assign normalPage_sttlb_np_storage_sa_io_csr_satp_asid = io_csr_satp_asid; // @[TLBStorage.scala 517:18]
  assign normalPage_sttlb_np_storage_sa_io_rreq_0_valid = io_rreq_0_valid; // @[MMUBundle.scala 269:25]
  assign normalPage_sttlb_np_storage_sa_io_rreq_0_bits_vpn = io_rreq_0_bits_vpn; // @[MMUBundle.scala 270:28]
  assign normalPage_sttlb_np_storage_sa_io_rreq_1_valid = io_rreq_1_valid; // @[MMUBundle.scala 269:25]
  assign normalPage_sttlb_np_storage_sa_io_rreq_1_bits_vpn = io_rreq_1_bits_vpn; // @[MMUBundle.scala 270:28]
  assign normalPage_sttlb_np_storage_sa_io_victim_in_valid = superPage_sttlb_sp_storage_fa_io_victim_out_valid; // @[TLBStorage.scala 513:24]
  assign normalPage_sttlb_np_storage_sa_io_victim_in_bits_entry_tag =
    superPage_sttlb_sp_storage_fa_io_victim_out_bits_entry_tag; // @[TLBStorage.scala 513:24]
  assign normalPage_sttlb_np_storage_sa_io_victim_in_bits_entry_asid =
    superPage_sttlb_sp_storage_fa_io_victim_out_bits_entry_asid; // @[TLBStorage.scala 513:24]
  assign normalPage_sttlb_np_storage_sa_io_victim_in_bits_entry_ppn =
    superPage_sttlb_sp_storage_fa_io_victim_out_bits_entry_ppn; // @[TLBStorage.scala 513:24]
  assign normalPage_sttlb_np_storage_sa_io_victim_in_bits_entry_perm_pf =
    superPage_sttlb_sp_storage_fa_io_victim_out_bits_entry_perm_pf; // @[TLBStorage.scala 513:24]
  assign normalPage_sttlb_np_storage_sa_io_victim_in_bits_entry_perm_af =
    superPage_sttlb_sp_storage_fa_io_victim_out_bits_entry_perm_af; // @[TLBStorage.scala 513:24]
  assign normalPage_sttlb_np_storage_sa_io_victim_in_bits_entry_perm_d =
    superPage_sttlb_sp_storage_fa_io_victim_out_bits_entry_perm_d; // @[TLBStorage.scala 513:24]
  assign normalPage_sttlb_np_storage_sa_io_victim_in_bits_entry_perm_a =
    superPage_sttlb_sp_storage_fa_io_victim_out_bits_entry_perm_a; // @[TLBStorage.scala 513:24]
  assign normalPage_sttlb_np_storage_sa_io_victim_in_bits_entry_perm_u =
    superPage_sttlb_sp_storage_fa_io_victim_out_bits_entry_perm_u; // @[TLBStorage.scala 513:24]
  assign normalPage_sttlb_np_storage_sa_io_victim_in_bits_entry_perm_w =
    superPage_sttlb_sp_storage_fa_io_victim_out_bits_entry_perm_w; // @[TLBStorage.scala 513:24]
  assign normalPage_sttlb_np_storage_sa_io_victim_in_bits_entry_perm_pm_w =
    superPage_sttlb_sp_storage_fa_io_victim_out_bits_entry_perm_pm_w; // @[TLBStorage.scala 513:24]
  assign normalPage_sttlb_np_storage_sa_io_victim_in_bits_entry_perm_pm_c =
    superPage_sttlb_sp_storage_fa_io_victim_out_bits_entry_perm_pm_c; // @[TLBStorage.scala 513:24]
  assign superPage_sttlb_sp_storage_fa_clock = clock;
  assign superPage_sttlb_sp_storage_fa_reset = reset;
  assign superPage_sttlb_sp_storage_fa_io_sfence_valid = io_sfence_valid; // @[TLBStorage.scala 516:20]
  assign superPage_sttlb_sp_storage_fa_io_sfence_bits_rs1 = io_sfence_bits_rs1; // @[TLBStorage.scala 516:20]
  assign superPage_sttlb_sp_storage_fa_io_sfence_bits_rs2 = io_sfence_bits_rs2; // @[TLBStorage.scala 516:20]
  assign superPage_sttlb_sp_storage_fa_io_sfence_bits_addr = io_sfence_bits_addr; // @[TLBStorage.scala 516:20]
  assign superPage_sttlb_sp_storage_fa_io_sfence_bits_asid = io_sfence_bits_asid; // @[TLBStorage.scala 516:20]
  assign superPage_sttlb_sp_storage_fa_io_csr_satp_asid = io_csr_satp_asid; // @[TLBStorage.scala 518:17]
  assign superPage_sttlb_sp_storage_fa_io_rreq_0_valid = io_rreq_0_valid; // @[MMUBundle.scala 269:25]
  assign superPage_sttlb_sp_storage_fa_io_rreq_0_bits_vpn = io_rreq_0_bits_vpn; // @[MMUBundle.scala 270:28]
  assign superPage_sttlb_sp_storage_fa_io_rreq_1_valid = io_rreq_1_valid; // @[MMUBundle.scala 269:25]
  assign superPage_sttlb_sp_storage_fa_io_rreq_1_bits_vpn = io_rreq_1_bits_vpn; // @[MMUBundle.scala 270:28]
  assign superPage_sttlb_sp_storage_fa_io_wvalid = io_wvalid; // @[MMUBundle.scala 278:18]
  assign superPage_sttlb_sp_storage_fa_io_wwayIdx = {super_refill_idx_left_subtree_older,_super_refill_idx_T_6}; // @[Cat.scala 31:58]
  assign superPage_sttlb_sp_storage_fa_io_wdata_entry_tag = io_wdata_entry_tag; // @[MMUBundle.scala 280:22]
  assign superPage_sttlb_sp_storage_fa_io_wdata_entry_ppn = io_wdata_entry_ppn; // @[MMUBundle.scala 280:22]
  assign superPage_sttlb_sp_storage_fa_io_wdata_entry_perm_d = io_wdata_entry_perm_d; // @[MMUBundle.scala 280:22]
  assign superPage_sttlb_sp_storage_fa_io_wdata_entry_perm_a = io_wdata_entry_perm_a; // @[MMUBundle.scala 280:22]
  assign superPage_sttlb_sp_storage_fa_io_wdata_entry_perm_g = io_wdata_entry_perm_g; // @[MMUBundle.scala 280:22]
  assign superPage_sttlb_sp_storage_fa_io_wdata_entry_perm_u = io_wdata_entry_perm_u; // @[MMUBundle.scala 280:22]
  assign superPage_sttlb_sp_storage_fa_io_wdata_entry_perm_x = io_wdata_entry_perm_x; // @[MMUBundle.scala 280:22]
  assign superPage_sttlb_sp_storage_fa_io_wdata_entry_perm_w = io_wdata_entry_perm_w; // @[MMUBundle.scala 280:22]
  assign superPage_sttlb_sp_storage_fa_io_wdata_entry_perm_r = io_wdata_entry_perm_r; // @[MMUBundle.scala 280:22]
  assign superPage_sttlb_sp_storage_fa_io_wdata_entry_level = io_wdata_entry_level; // @[MMUBundle.scala 280:22]
  assign superPage_sttlb_sp_storage_fa_io_wdata_pf = io_wdata_pf; // @[MMUBundle.scala 280:22]
  assign superPage_sttlb_sp_storage_fa_io_wdata_af = io_wdata_af; // @[MMUBundle.scala 280:22]
  assign superPage_sttlb_sp_storage_fa_io_wdata_replenish_c = io_wdata_replenish_c; // @[MMUBundle.scala 281:32]
  assign superPage_sttlb_sp_storage_fa_io_wdata_replenish_atomic = io_wdata_replenish_atomic; // @[MMUBundle.scala 281:32]
  assign superPage_sttlb_sp_storage_fa_io_wdata_replenish_x = io_wdata_replenish_x; // @[MMUBundle.scala 281:32]
  assign superPage_sttlb_sp_storage_fa_io_wdata_replenish_w = io_wdata_replenish_w; // @[MMUBundle.scala 281:32]
  assign superPage_sttlb_sp_storage_fa_io_wdata_replenish_r = io_wdata_replenish_r; // @[MMUBundle.scala 281:32]
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Replacement.scala 175:40]
      super_refill_idx_state_reg <= 3'h0; // @[Replacement.scala 22:{56,56}]
    end else if (_super_refill_idx_T) begin // @[Replacement.scala 168:70]
      if (superPage_sttlb_sp_storage_fa_io_access_1_touch_ways_valid) begin
        super_refill_idx_state_reg <= _super_refill_idx_state_reg_T_18;
      end else if (superPage_sttlb_sp_storage_fa_io_access_0_touch_ways_valid) begin
        super_refill_idx_state_reg <= _super_refill_idx_state_reg_T_8;
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
  super_refill_idx_state_reg = _RAND_0[2:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    super_refill_idx_state_reg = 3'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

