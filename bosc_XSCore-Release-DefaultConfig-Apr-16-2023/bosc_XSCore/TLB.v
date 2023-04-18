module TLB(
  input         clock,
  input         reset,
  input         io_sfence_valid,
  input         io_sfence_bits_rs1,
  input         io_sfence_bits_rs2,
  input  [38:0] io_sfence_bits_addr,
  input  [15:0] io_sfence_bits_asid,
  input  [3:0]  io_csr_satp_mode,
  input  [15:0] io_csr_satp_asid,
  input         io_csr_satp_changed,
  input  [1:0]  io_csr_priv_imode,
  output        io_requestor_0_req_ready,
  input         io_requestor_0_req_valid,
  input  [38:0] io_requestor_0_req_bits_vaddr,
  input         io_requestor_0_req_bits_kill,
  input         io_requestor_0_resp_ready,
  output        io_requestor_0_resp_valid,
  output [35:0] io_requestor_0_resp_bits_paddr_0,
  output        io_requestor_0_resp_bits_excp_0_pf_instr,
  output        io_requestor_0_resp_bits_excp_0_af_instr,
  output        io_requestor_1_req_ready,
  input         io_requestor_1_req_valid,
  input  [38:0] io_requestor_1_req_bits_vaddr,
  input         io_requestor_1_req_bits_kill,
  input         io_requestor_1_resp_ready,
  output        io_requestor_1_resp_valid,
  output [35:0] io_requestor_1_resp_bits_paddr_0,
  output        io_requestor_1_resp_bits_excp_0_pf_instr,
  output        io_requestor_1_resp_bits_excp_0_af_instr,
  output        io_requestor_3_req_ready,
  input         io_requestor_3_req_valid,
  input  [38:0] io_requestor_3_req_bits_vaddr,
  output        io_requestor_3_resp_valid,
  output [35:0] io_requestor_3_resp_bits_paddr_0,
  output        io_requestor_3_resp_bits_miss,
  output        io_requestor_3_resp_bits_excp_0_pf_instr,
  output        io_requestor_3_resp_bits_excp_0_af_instr,
  input         io_flushPipe_0,
  input         io_flushPipe_1,
  input         io_flushPipe_3,
  input         io_ptw_req_0_ready,
  output        io_ptw_req_0_valid,
  output [26:0] io_ptw_req_0_bits_vpn,
  input         io_ptw_req_1_ready,
  output        io_ptw_req_1_valid,
  output [26:0] io_ptw_req_1_bits_vpn,
  input         io_ptw_req_3_ready,
  output        io_ptw_req_3_valid,
  output [26:0] io_ptw_req_3_bits_vpn,
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
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
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
`endif // RANDOMIZE_REG_INIT
  wire  sfence_delay_clock; // @[Hold.scala 97:23]
  wire  sfence_delay_io_in_valid; // @[Hold.scala 97:23]
  wire  sfence_delay_io_in_bits_rs1; // @[Hold.scala 97:23]
  wire  sfence_delay_io_in_bits_rs2; // @[Hold.scala 97:23]
  wire [38:0] sfence_delay_io_in_bits_addr; // @[Hold.scala 97:23]
  wire [15:0] sfence_delay_io_in_bits_asid; // @[Hold.scala 97:23]
  wire  sfence_delay_io_out_valid; // @[Hold.scala 97:23]
  wire  sfence_delay_io_out_bits_rs1; // @[Hold.scala 97:23]
  wire  sfence_delay_io_out_bits_rs2; // @[Hold.scala 97:23]
  wire [38:0] sfence_delay_io_out_bits_addr; // @[Hold.scala 97:23]
  wire [15:0] sfence_delay_io_out_bits_asid; // @[Hold.scala 97:23]
  wire  satp_delay_clock; // @[Hold.scala 97:23]
  wire [3:0] satp_delay_io_in_mode; // @[Hold.scala 97:23]
  wire [15:0] satp_delay_io_in_asid; // @[Hold.scala 97:23]
  wire [3:0] satp_delay_io_out_mode; // @[Hold.scala 97:23]
  wire [15:0] satp_delay_io_out_asid; // @[Hold.scala 97:23]
  wire  flush_mmu_delay_clock; // @[Hold.scala 97:23]
  wire  flush_mmu_delay_io_in; // @[Hold.scala 97:23]
  wire  flush_mmu_delay_io_out; // @[Hold.scala 97:23]
  wire  mmu_flush_pipe_delay_clock; // @[Hold.scala 97:23]
  wire  mmu_flush_pipe_delay_io_in; // @[Hold.scala 97:23]
  wire  mmu_flush_pipe_delay_io_out; // @[Hold.scala 97:23]
  wire  entries_clock; // @[TLB.scala 86:23]
  wire  entries_reset; // @[TLB.scala 86:23]
  wire  entries_io_sfence_valid; // @[TLB.scala 86:23]
  wire  entries_io_sfence_bits_rs1; // @[TLB.scala 86:23]
  wire  entries_io_sfence_bits_rs2; // @[TLB.scala 86:23]
  wire [38:0] entries_io_sfence_bits_addr; // @[TLB.scala 86:23]
  wire [15:0] entries_io_sfence_bits_asid; // @[TLB.scala 86:23]
  wire [15:0] entries_io_csr_satp_asid; // @[TLB.scala 86:23]
  wire  entries_io_rreq_0_valid; // @[TLB.scala 86:23]
  wire [26:0] entries_io_rreq_0_bits_vpn; // @[TLB.scala 86:23]
  wire  entries_io_rreq_1_valid; // @[TLB.scala 86:23]
  wire [26:0] entries_io_rreq_1_bits_vpn; // @[TLB.scala 86:23]
  wire  entries_io_rreq_3_valid; // @[TLB.scala 86:23]
  wire [26:0] entries_io_rreq_3_bits_vpn; // @[TLB.scala 86:23]
  wire  entries_io_rresp_0_bits_hit; // @[TLB.scala 86:23]
  wire [23:0] entries_io_rresp_0_bits_ppn_0; // @[TLB.scala 86:23]
  wire  entries_io_rresp_0_bits_perm_0_pf; // @[TLB.scala 86:23]
  wire  entries_io_rresp_0_bits_perm_0_af; // @[TLB.scala 86:23]
  wire  entries_io_rresp_0_bits_perm_0_a; // @[TLB.scala 86:23]
  wire  entries_io_rresp_0_bits_perm_0_u; // @[TLB.scala 86:23]
  wire  entries_io_rresp_0_bits_perm_0_x; // @[TLB.scala 86:23]
  wire  entries_io_rresp_1_bits_hit; // @[TLB.scala 86:23]
  wire [23:0] entries_io_rresp_1_bits_ppn_0; // @[TLB.scala 86:23]
  wire  entries_io_rresp_1_bits_perm_0_pf; // @[TLB.scala 86:23]
  wire  entries_io_rresp_1_bits_perm_0_af; // @[TLB.scala 86:23]
  wire  entries_io_rresp_1_bits_perm_0_a; // @[TLB.scala 86:23]
  wire  entries_io_rresp_1_bits_perm_0_u; // @[TLB.scala 86:23]
  wire  entries_io_rresp_1_bits_perm_0_x; // @[TLB.scala 86:23]
  wire  entries_io_rresp_3_bits_hit; // @[TLB.scala 86:23]
  wire [23:0] entries_io_rresp_3_bits_ppn_0; // @[TLB.scala 86:23]
  wire  entries_io_rresp_3_bits_perm_0_pf; // @[TLB.scala 86:23]
  wire  entries_io_rresp_3_bits_perm_0_af; // @[TLB.scala 86:23]
  wire  entries_io_rresp_3_bits_perm_0_a; // @[TLB.scala 86:23]
  wire  entries_io_rresp_3_bits_perm_0_u; // @[TLB.scala 86:23]
  wire  entries_io_rresp_3_bits_perm_0_x; // @[TLB.scala 86:23]
  wire  entries_io_wvalid; // @[TLB.scala 86:23]
  wire [26:0] entries_io_wdata_entry_tag; // @[TLB.scala 86:23]
  wire [23:0] entries_io_wdata_entry_ppn; // @[TLB.scala 86:23]
  wire  entries_io_wdata_entry_perm_d; // @[TLB.scala 86:23]
  wire  entries_io_wdata_entry_perm_a; // @[TLB.scala 86:23]
  wire  entries_io_wdata_entry_perm_g; // @[TLB.scala 86:23]
  wire  entries_io_wdata_entry_perm_u; // @[TLB.scala 86:23]
  wire  entries_io_wdata_entry_perm_x; // @[TLB.scala 86:23]
  wire  entries_io_wdata_entry_perm_w; // @[TLB.scala 86:23]
  wire  entries_io_wdata_entry_perm_r; // @[TLB.scala 86:23]
  wire [1:0] entries_io_wdata_entry_level; // @[TLB.scala 86:23]
  wire  entries_io_wdata_pf; // @[TLB.scala 86:23]
  wire  entries_io_wdata_af; // @[TLB.scala 86:23]
  wire  vmEnable = satp_delay_io_out_mode == 4'h8 & io_csr_priv_imode < 2'h3; // @[TLB.scala 75:29]
  wire  _req_out_T = io_requestor_0_req_ready & io_requestor_0_req_valid; // @[Decoupled.scala 50:35]
  reg [38:0] req_out_0_vaddr; // @[Reg.scala 16:16]
  wire  _req_out_T_1 = io_requestor_1_req_ready & io_requestor_1_req_valid; // @[Decoupled.scala 50:35]
  reg [38:0] req_out_1_vaddr; // @[Reg.scala 16:16]
  wire  _req_out_T_3 = io_requestor_3_req_ready & io_requestor_3_req_valid; // @[Decoupled.scala 50:35]
  reg [38:0] req_out_3_vaddr; // @[Reg.scala 16:16]
  wire  _req_out_v_T_2 = _req_out_T & ~io_requestor_0_req_bits_kill; // @[TLB.scala 80:69]
  wire  _req_out_v_T_3 = io_requestor_0_resp_ready & io_requestor_0_resp_valid; // @[Decoupled.scala 50:35]
  reg  req_out_v_0; // @[Hold.scala 40:24]
  wire  _GEN_48 = _req_out_v_T_3 ? 1'h0 : req_out_v_0; // @[Hold.scala 41:20 40:24 41:28]
  wire  _GEN_49 = _req_out_v_T_2 | _GEN_48; // @[Hold.scala 42:{19,27}]
  wire  _req_out_v_T_6 = _req_out_T_1 & ~io_requestor_1_req_bits_kill; // @[TLB.scala 80:69]
  wire  _req_out_v_T_7 = io_requestor_1_resp_ready & io_requestor_1_resp_valid; // @[Decoupled.scala 50:35]
  reg  req_out_v_1; // @[Hold.scala 40:24]
  wire  _GEN_51 = _req_out_v_T_7 ? 1'h0 : req_out_v_1; // @[Hold.scala 41:20 40:24 41:28]
  wire  _GEN_52 = _req_out_v_T_6 | _GEN_51; // @[Hold.scala 42:{19,27}]
  reg  req_out_v_3; // @[Hold.scala 40:24]
  wire  _GEN_57 = io_requestor_3_resp_valid ? 1'h0 : req_out_v_3; // @[Hold.scala 41:20 40:24 41:28]
  wire  _GEN_58 = _req_out_T_3 | _GEN_57; // @[Hold.scala 42:{19,27}]
  wire  _refill_T = io_ptw_resp_ready & io_ptw_resp_valid; // @[Decoupled.scala 50:35]
  wire  p_hit_asid_hit = io_ptw_resp_bits_entry_asid == io_csr_satp_asid; // @[MMUBundle.scala 578:59]
  wire  p_hit_hit0 = io_ptw_resp_bits_entry_tag[26:18] == io_requestor_0_req_bits_vaddr[38:30]; // @[MMUBundle.scala 581:48]
  wire  p_hit_hit1 = io_ptw_resp_bits_entry_tag[17:9] == io_requestor_0_req_bits_vaddr[29:21]; // @[MMUBundle.scala 582:48]
  wire  p_hit_hit2 = io_ptw_resp_bits_entry_tag[8:0] == io_requestor_0_req_bits_vaddr[20:12]; // @[MMUBundle.scala 583:50]
  wire  _p_hit_T_5 = io_ptw_resp_bits_entry_level == 2'h1 ? p_hit_hit1 & p_hit_hit0 : p_hit_hit0; // @[MMUBundle.scala 585:78]
  wire  _p_hit_T_6 = io_ptw_resp_bits_entry_level == 2'h2 ? p_hit_hit2 & p_hit_hit1 & p_hit_hit0 : _p_hit_T_5; // @[MMUBundle.scala 585:22]
  wire  _p_hit_T_7 = p_hit_asid_hit & _p_hit_T_6; // @[MMUBundle.scala 585:16]
  reg  p_hit; // @[TLB.scala 271:24]
  wire [23:0] _p_ppn_T_2 = {io_ptw_resp_bits_entry_ppn[23:18],io_requestor_0_req_bits_vaddr[29:12]}; // @[Cat.scala 31:58]
  wire [23:0] _p_ppn_T_5 = {io_ptw_resp_bits_entry_ppn[23:9],io_requestor_0_req_bits_vaddr[20:12]}; // @[Cat.scala 31:58]
  reg [23:0] p_ppn; // @[Reg.scala 16:16]
  wire [6:0] _p_perm_ptePerm_T = {io_ptw_resp_bits_entry_perm_d,io_ptw_resp_bits_entry_perm_a,
    io_ptw_resp_bits_entry_perm_g,io_ptw_resp_bits_entry_perm_u,io_ptw_resp_bits_entry_perm_x,
    io_ptw_resp_bits_entry_perm_w,io_ptw_resp_bits_entry_perm_r}; // @[MMUConst.scala 143:50]
  wire  p_perm_ptePerm_x = _p_perm_ptePerm_T[2]; // @[MMUConst.scala 143:50]
  wire  p_perm_ptePerm_u = _p_perm_ptePerm_T[3]; // @[MMUConst.scala 143:50]
  wire  p_perm_ptePerm_a = _p_perm_ptePerm_T[5]; // @[MMUConst.scala 143:50]
  reg  p_perm_pf; // @[Reg.scala 16:16]
  reg  p_perm_af; // @[Reg.scala 16:16]
  reg  p_perm_a; // @[Reg.scala 16:16]
  reg  p_perm_u; // @[Reg.scala 16:16]
  reg  p_perm_x; // @[Reg.scala 16:16]
  wire  hit_read_0 = entries_io_rresp_0_bits_hit | p_hit; // @[TLB.scala 130:21]
  wire  miss_read_0 = ~hit_read_0 & vmEnable; // @[TLB.scala 131:21]
  wire [35:0] vaddr = req_out_0_vaddr[35:0]; // @[BitUtils.scala 81:23]
  wire [23:0] ppn_0 = p_hit ? p_ppn : entries_io_rresp_0_bits_ppn_0; // @[TLB.scala 146:20]
  wire  perm_0_0_pf = p_hit ? p_perm_pf : entries_io_rresp_0_bits_perm_0_pf; // @[TLB.scala 147:21]
  wire  perm_0_0_af = p_hit ? p_perm_af : entries_io_rresp_0_bits_perm_0_af; // @[TLB.scala 147:21]
  wire  perm_0_0_a = p_hit ? p_perm_a : entries_io_rresp_0_bits_perm_0_a; // @[TLB.scala 147:21]
  wire  perm_0_0_u = p_hit ? p_perm_u : entries_io_rresp_0_bits_perm_0_u; // @[TLB.scala 147:21]
  wire  perm_0_0_x = p_hit ? p_perm_x : entries_io_rresp_0_bits_perm_0_x; // @[TLB.scala 147:21]
  wire [35:0] paddr = {ppn_0,req_out_0_vaddr[11:0]}; // @[Cat.scala 31:58]
  wire [35:0] _io_requestor_0_resp_bits_paddr_0_T = vmEnable ? paddr : vaddr; // @[TLB.scala 150:35]
  wire  p_hit_hit0_1 = io_ptw_resp_bits_entry_tag[26:18] == io_requestor_1_req_bits_vaddr[38:30]; // @[MMUBundle.scala 581:48]
  wire  p_hit_hit1_1 = io_ptw_resp_bits_entry_tag[17:9] == io_requestor_1_req_bits_vaddr[29:21]; // @[MMUBundle.scala 582:48]
  wire  p_hit_hit2_1 = io_ptw_resp_bits_entry_tag[8:0] == io_requestor_1_req_bits_vaddr[20:12]; // @[MMUBundle.scala 583:50]
  wire  _p_hit_T_15 = io_ptw_resp_bits_entry_level == 2'h1 ? p_hit_hit1_1 & p_hit_hit0_1 : p_hit_hit0_1; // @[MMUBundle.scala 585:78]
  wire  _p_hit_T_16 = io_ptw_resp_bits_entry_level == 2'h2 ? p_hit_hit2_1 & p_hit_hit1_1 & p_hit_hit0_1 : _p_hit_T_15; // @[MMUBundle.scala 585:22]
  wire  _p_hit_T_17 = p_hit_asid_hit & _p_hit_T_16; // @[MMUBundle.scala 585:16]
  reg  p_hit_1; // @[TLB.scala 271:24]
  wire [23:0] _p_ppn_T_15 = {io_ptw_resp_bits_entry_ppn[23:18],io_requestor_1_req_bits_vaddr[29:12]}; // @[Cat.scala 31:58]
  wire [23:0] _p_ppn_T_18 = {io_ptw_resp_bits_entry_ppn[23:9],io_requestor_1_req_bits_vaddr[20:12]}; // @[Cat.scala 31:58]
  reg [23:0] p_ppn_1; // @[Reg.scala 16:16]
  reg  p_perm_1_pf; // @[Reg.scala 16:16]
  reg  p_perm_1_af; // @[Reg.scala 16:16]
  reg  p_perm_1_a; // @[Reg.scala 16:16]
  reg  p_perm_1_u; // @[Reg.scala 16:16]
  reg  p_perm_1_x; // @[Reg.scala 16:16]
  wire  hit_read_1 = entries_io_rresp_1_bits_hit | p_hit_1; // @[TLB.scala 130:21]
  wire  miss_read_1 = ~hit_read_1 & vmEnable; // @[TLB.scala 131:21]
  wire [35:0] vaddr_1 = req_out_1_vaddr[35:0]; // @[BitUtils.scala 81:23]
  wire [23:0] ppn_1_0 = p_hit_1 ? p_ppn_1 : entries_io_rresp_1_bits_ppn_0; // @[TLB.scala 146:20]
  wire  perm_1_0_pf = p_hit_1 ? p_perm_1_pf : entries_io_rresp_1_bits_perm_0_pf; // @[TLB.scala 147:21]
  wire  perm_1_0_af = p_hit_1 ? p_perm_1_af : entries_io_rresp_1_bits_perm_0_af; // @[TLB.scala 147:21]
  wire  perm_1_0_a = p_hit_1 ? p_perm_1_a : entries_io_rresp_1_bits_perm_0_a; // @[TLB.scala 147:21]
  wire  perm_1_0_u = p_hit_1 ? p_perm_1_u : entries_io_rresp_1_bits_perm_0_u; // @[TLB.scala 147:21]
  wire  perm_1_0_x = p_hit_1 ? p_perm_1_x : entries_io_rresp_1_bits_perm_0_x; // @[TLB.scala 147:21]
  wire [35:0] paddr_1 = {ppn_1_0,req_out_1_vaddr[11:0]}; // @[Cat.scala 31:58]
  wire [35:0] _io_requestor_1_resp_bits_paddr_0_T = vmEnable ? paddr_1 : vaddr_1; // @[TLB.scala 150:35]
  wire  p_hit_hit0_3 = io_ptw_resp_bits_entry_tag[26:18] == io_requestor_3_req_bits_vaddr[38:30]; // @[MMUBundle.scala 581:48]
  wire  p_hit_hit1_3 = io_ptw_resp_bits_entry_tag[17:9] == io_requestor_3_req_bits_vaddr[29:21]; // @[MMUBundle.scala 582:48]
  wire  p_hit_hit2_3 = io_ptw_resp_bits_entry_tag[8:0] == io_requestor_3_req_bits_vaddr[20:12]; // @[MMUBundle.scala 583:50]
  wire  _p_hit_T_35 = io_ptw_resp_bits_entry_level == 2'h1 ? p_hit_hit1_3 & p_hit_hit0_3 : p_hit_hit0_3; // @[MMUBundle.scala 585:78]
  wire  _p_hit_T_36 = io_ptw_resp_bits_entry_level == 2'h2 ? p_hit_hit2_3 & p_hit_hit1_3 & p_hit_hit0_3 : _p_hit_T_35; // @[MMUBundle.scala 585:22]
  wire  _p_hit_T_37 = p_hit_asid_hit & _p_hit_T_36; // @[MMUBundle.scala 585:16]
  reg  p_hit_3; // @[TLB.scala 271:24]
  wire [23:0] _p_ppn_T_41 = {io_ptw_resp_bits_entry_ppn[23:18],io_requestor_3_req_bits_vaddr[29:12]}; // @[Cat.scala 31:58]
  wire [23:0] _p_ppn_T_44 = {io_ptw_resp_bits_entry_ppn[23:9],io_requestor_3_req_bits_vaddr[20:12]}; // @[Cat.scala 31:58]
  reg [23:0] p_ppn_3; // @[Reg.scala 16:16]
  reg  p_perm_3_pf; // @[Reg.scala 16:16]
  reg  p_perm_3_af; // @[Reg.scala 16:16]
  reg  p_perm_3_a; // @[Reg.scala 16:16]
  reg  p_perm_3_u; // @[Reg.scala 16:16]
  reg  p_perm_3_x; // @[Reg.scala 16:16]
  wire  hit_read_3 = entries_io_rresp_3_bits_hit | p_hit_3; // @[TLB.scala 130:21]
  wire  miss_read_3 = ~hit_read_3 & vmEnable; // @[TLB.scala 131:21]
  wire [35:0] vaddr_3 = req_out_3_vaddr[35:0]; // @[BitUtils.scala 81:23]
  wire [23:0] ppn_3_0 = p_hit_3 ? p_ppn_3 : entries_io_rresp_3_bits_ppn_0; // @[TLB.scala 146:20]
  wire  perm_3_0_pf = p_hit_3 ? p_perm_3_pf : entries_io_rresp_3_bits_perm_0_pf; // @[TLB.scala 147:21]
  wire  perm_3_0_af = p_hit_3 ? p_perm_3_af : entries_io_rresp_3_bits_perm_0_af; // @[TLB.scala 147:21]
  wire  perm_3_0_a = p_hit_3 ? p_perm_3_a : entries_io_rresp_3_bits_perm_0_a; // @[TLB.scala 147:21]
  wire  perm_3_0_u = p_hit_3 ? p_perm_3_u : entries_io_rresp_3_bits_perm_0_u; // @[TLB.scala 147:21]
  wire  perm_3_0_x = p_hit_3 ? p_perm_3_x : entries_io_rresp_3_bits_perm_0_x; // @[TLB.scala 147:21]
  wire [35:0] paddr_3 = {ppn_3_0,req_out_3_vaddr[11:0]}; // @[Cat.scala 31:58]
  wire [35:0] _io_requestor_3_resp_bits_paddr_0_T = vmEnable ? paddr_3 : vaddr_3; // @[TLB.scala 150:35]
  wire  _ldUpdate_T = ~perm_0_0_a; // @[TLB.scala 176:20]
  wire  modeCheck = ~(io_csr_priv_imode == 2'h0 & ~perm_0_0_u | io_csr_priv_imode == 2'h1 & perm_0_0_u); // @[TLB.scala 179:21]
  wire  instrPermFail = ~(modeCheck & perm_0_0_x); // @[TLB.scala 182:25]
  wire  instrPf = instrPermFail | perm_0_0_pf; // @[TLB.scala 185:34]
  wire  _io_requestor_0_resp_bits_excp_0_pf_ld_T_2 = ~perm_0_0_af; // @[TLB.scala 187:78]
  wire  _ldUpdate_T_6 = ~perm_1_0_a; // @[TLB.scala 176:20]
  wire  modeCheck_1 = ~(io_csr_priv_imode == 2'h0 & ~perm_1_0_u | io_csr_priv_imode == 2'h1 & perm_1_0_u); // @[TLB.scala 179:21]
  wire  instrPermFail_1 = ~(modeCheck_1 & perm_1_0_x); // @[TLB.scala 182:25]
  wire  instrPf_1 = instrPermFail_1 | perm_1_0_pf; // @[TLB.scala 185:34]
  wire  _io_requestor_1_resp_bits_excp_0_pf_ld_T_2 = ~perm_1_0_af; // @[TLB.scala 187:78]
  wire  _ldUpdate_T_18 = ~perm_3_0_a; // @[TLB.scala 176:20]
  wire  modeCheck_3 = ~(io_csr_priv_imode == 2'h0 & ~perm_3_0_u | io_csr_priv_imode == 2'h1 & perm_3_0_u); // @[TLB.scala 179:21]
  wire  instrPermFail_3 = ~(modeCheck_3 & perm_3_0_x); // @[TLB.scala 182:25]
  wire  instrPf_3 = instrPermFail_3 | perm_3_0_pf; // @[TLB.scala 185:34]
  wire  _io_requestor_3_resp_bits_excp_0_pf_ld_T_2 = ~perm_3_0_af; // @[TLB.scala 187:78]
  wire [26:0] miss_req_vpn = req_out_0_vaddr[38:12]; // @[MMUConst.scala 102:9]
  wire  hit_hit0 = io_ptw_resp_bits_entry_tag[26:18] == miss_req_vpn[26:18]; // @[MMUBundle.scala 581:48]
  wire  hit_hit1 = io_ptw_resp_bits_entry_tag[17:9] == miss_req_vpn[17:9]; // @[MMUBundle.scala 582:48]
  wire  hit_hit2 = io_ptw_resp_bits_entry_tag[8:0] == miss_req_vpn[8:0]; // @[MMUBundle.scala 583:50]
  wire  _hit_T_5 = io_ptw_resp_bits_entry_level == 2'h1 ? hit_hit1 & hit_hit0 : hit_hit0; // @[MMUBundle.scala 585:78]
  wire  _hit_T_6 = io_ptw_resp_bits_entry_level == 2'h2 ? hit_hit2 & hit_hit1 & hit_hit0 : _hit_T_5; // @[MMUBundle.scala 585:22]
  wire  _hit_T_7 = p_hit_asid_hit & _hit_T_6; // @[MMUBundle.scala 585:16]
  wire  hit = _hit_T_7 & io_ptw_resp_valid; // @[TLB.scala 223:90]
  reg  new_coming; // @[TLB.scala 225:29]
  wire  miss_wire = new_coming & miss_read_0; // @[TLB.scala 226:32]
  reg  miss_v_valid; // @[MMUBundle.scala 796:24]
  wire  _GEN_120 = miss_wire | miss_v_valid; // @[MMUBundle.scala 797:19 796:24 797:27]
  wire  miss_v = miss_v_valid | miss_wire; // @[MMUBundle.scala 800:11]
  wire  _miss_req_v_T_3 = miss_wire | miss_v & flush_mmu_delay_io_out & ~mmu_flush_pipe_delay_io_out; // @[TLB.scala 228:48]
  wire  _miss_req_v_T_4 = io_ptw_req_0_ready & io_ptw_req_0_valid; // @[Decoupled.scala 50:35]
  wire  _miss_req_v_T_6 = _miss_req_v_T_4 | _req_out_v_T_3; // @[TLB.scala 229:30]
  reg  miss_req_v_valid; // @[MMUBundle.scala 796:24]
  wire  _GEN_123 = _miss_req_v_T_3 | miss_req_v_valid; // @[MMUBundle.scala 797:19 796:24 797:27]
  wire [23:0] _io_requestor_0_resp_bits_paddr_0_T_4 = {io_ptw_resp_bits_entry_ppn[23:18],miss_req_vpn[17:0]}; // @[Cat.scala 31:58]
  wire [23:0] _io_requestor_0_resp_bits_paddr_0_T_7 = {io_ptw_resp_bits_entry_ppn[23:9],miss_req_vpn[8:0]}; // @[Cat.scala 31:58]
  wire [23:0] _io_requestor_0_resp_bits_paddr_0_T_9 = 2'h0 == io_ptw_resp_bits_entry_level ?
    _io_requestor_0_resp_bits_paddr_0_T_4 : 24'h0; // @[Mux.scala 81:58]
  wire [23:0] _io_requestor_0_resp_bits_paddr_0_T_11 = 2'h1 == io_ptw_resp_bits_entry_level ?
    _io_requestor_0_resp_bits_paddr_0_T_7 : _io_requestor_0_resp_bits_paddr_0_T_9; // @[Mux.scala 81:58]
  wire [23:0] _io_requestor_0_resp_bits_paddr_0_T_13 = 2'h2 == io_ptw_resp_bits_entry_level ? io_ptw_resp_bits_entry_ppn
     : _io_requestor_0_resp_bits_paddr_0_T_11; // @[Mux.scala 81:58]
  wire [35:0] _io_requestor_0_resp_bits_paddr_0_T_15 = {_io_requestor_0_resp_bits_paddr_0_T_13,req_out_0_vaddr[11:0]}; // @[Cat.scala 31:58]
  wire  _ldUpdate_T_24 = ~p_perm_ptePerm_a; // @[TLB.scala 176:20]
  wire  modeCheck_4 = ~(io_csr_priv_imode == 2'h0 & ~p_perm_ptePerm_u | io_csr_priv_imode == 2'h1 & p_perm_ptePerm_u); // @[TLB.scala 179:21]
  wire  instrPermFail_4 = ~(modeCheck_4 & p_perm_ptePerm_x); // @[TLB.scala 182:25]
  wire  instrPf_4 = instrPermFail_4 | io_ptw_resp_bits_pf; // @[TLB.scala 185:34]
  wire  _io_requestor_0_resp_bits_excp_0_pf_ld_T_6 = ~io_ptw_resp_bits_af; // @[TLB.scala 187:78]
  wire  _GEN_126 = _refill_T & hit & req_out_v_0 & vmEnable | req_out_v_0 & ~(miss_v & vmEnable); // @[TLB.scala 232:21 233:84 235:23]
  wire  _GEN_131 = _refill_T & hit & req_out_v_0 & vmEnable ? (instrPf_4 | _ldUpdate_T_24) & vmEnable &
    _io_requestor_0_resp_bits_excp_0_pf_ld_T_6 : (instrPf | _ldUpdate_T) & vmEnable &
    _io_requestor_0_resp_bits_excp_0_pf_ld_T_2; // @[TLB.scala 189:{41,41} 233:84]
  wire [26:0] miss_req_vpn_1 = req_out_1_vaddr[38:12]; // @[MMUConst.scala 102:9]
  wire  hit_hit0_1 = io_ptw_resp_bits_entry_tag[26:18] == miss_req_vpn_1[26:18]; // @[MMUBundle.scala 581:48]
  wire  hit_hit1_1 = io_ptw_resp_bits_entry_tag[17:9] == miss_req_vpn_1[17:9]; // @[MMUBundle.scala 582:48]
  wire  hit_hit2_1 = io_ptw_resp_bits_entry_tag[8:0] == miss_req_vpn_1[8:0]; // @[MMUBundle.scala 583:50]
  wire  _hit_T_13 = io_ptw_resp_bits_entry_level == 2'h1 ? hit_hit1_1 & hit_hit0_1 : hit_hit0_1; // @[MMUBundle.scala 585:78]
  wire  _hit_T_14 = io_ptw_resp_bits_entry_level == 2'h2 ? hit_hit2_1 & hit_hit1_1 & hit_hit0_1 : _hit_T_13; // @[MMUBundle.scala 585:22]
  wire  _hit_T_15 = p_hit_asid_hit & _hit_T_14; // @[MMUBundle.scala 585:16]
  wire  hit_1 = _hit_T_15 & io_ptw_resp_valid; // @[TLB.scala 223:90]
  reg  new_coming_1; // @[TLB.scala 225:29]
  wire  miss_wire_1 = new_coming_1 & miss_read_1; // @[TLB.scala 226:32]
  reg  miss_v_valid_1; // @[MMUBundle.scala 796:24]
  wire  _GEN_145 = miss_wire_1 | miss_v_valid_1; // @[MMUBundle.scala 797:19 796:24 797:27]
  wire  miss_v_1 = miss_v_valid_1 | miss_wire_1; // @[MMUBundle.scala 800:11]
  wire  _miss_req_v_T_10 = miss_wire_1 | miss_v_1 & flush_mmu_delay_io_out & ~mmu_flush_pipe_delay_io_out; // @[TLB.scala 228:48]
  wire  _miss_req_v_T_11 = io_ptw_req_1_ready & io_ptw_req_1_valid; // @[Decoupled.scala 50:35]
  wire  _miss_req_v_T_13 = _miss_req_v_T_11 | _req_out_v_T_7; // @[TLB.scala 229:30]
  reg  miss_req_v_valid_1; // @[MMUBundle.scala 796:24]
  wire  _GEN_148 = _miss_req_v_T_10 | miss_req_v_valid_1; // @[MMUBundle.scala 797:19 796:24 797:27]
  wire [23:0] _io_requestor_1_resp_bits_paddr_0_T_4 = {io_ptw_resp_bits_entry_ppn[23:18],miss_req_vpn_1[17:0]}; // @[Cat.scala 31:58]
  wire [23:0] _io_requestor_1_resp_bits_paddr_0_T_7 = {io_ptw_resp_bits_entry_ppn[23:9],miss_req_vpn_1[8:0]}; // @[Cat.scala 31:58]
  wire [23:0] _io_requestor_1_resp_bits_paddr_0_T_9 = 2'h0 == io_ptw_resp_bits_entry_level ?
    _io_requestor_1_resp_bits_paddr_0_T_4 : 24'h0; // @[Mux.scala 81:58]
  wire [23:0] _io_requestor_1_resp_bits_paddr_0_T_11 = 2'h1 == io_ptw_resp_bits_entry_level ?
    _io_requestor_1_resp_bits_paddr_0_T_7 : _io_requestor_1_resp_bits_paddr_0_T_9; // @[Mux.scala 81:58]
  wire [23:0] _io_requestor_1_resp_bits_paddr_0_T_13 = 2'h2 == io_ptw_resp_bits_entry_level ? io_ptw_resp_bits_entry_ppn
     : _io_requestor_1_resp_bits_paddr_0_T_11; // @[Mux.scala 81:58]
  wire [35:0] _io_requestor_1_resp_bits_paddr_0_T_15 = {_io_requestor_1_resp_bits_paddr_0_T_13,req_out_1_vaddr[11:0]}; // @[Cat.scala 31:58]
  wire  _GEN_151 = _refill_T & hit_1 & req_out_v_1 & vmEnable | req_out_v_1 & ~(miss_v_1 & vmEnable); // @[TLB.scala 232:21 233:84 235:23]
  wire  _GEN_156 = _refill_T & hit_1 & req_out_v_1 & vmEnable ? (instrPf_4 | _ldUpdate_T_24) & vmEnable &
    _io_requestor_0_resp_bits_excp_0_pf_ld_T_6 : (instrPf_1 | _ldUpdate_T_6) & vmEnable &
    _io_requestor_1_resp_bits_excp_0_pf_ld_T_2; // @[TLB.scala 189:{41,41} 233:84]
  wire [26:0] miss_req_vpn_2 = req_out_3_vaddr[38:12]; // @[MMUConst.scala 102:9]
  wire  hit_hit0_2 = io_ptw_resp_bits_entry_tag[26:18] == miss_req_vpn_2[26:18]; // @[MMUBundle.scala 581:48]
  wire  hit_hit1_2 = io_ptw_resp_bits_entry_tag[17:9] == miss_req_vpn_2[17:9]; // @[MMUBundle.scala 582:48]
  wire  hit_hit2_2 = io_ptw_resp_bits_entry_tag[8:0] == miss_req_vpn_2[8:0]; // @[MMUBundle.scala 583:50]
  wire  _hit_T_21 = io_ptw_resp_bits_entry_level == 2'h1 ? hit_hit1_2 & hit_hit0_2 : hit_hit0_2; // @[MMUBundle.scala 585:78]
  wire  _hit_T_22 = io_ptw_resp_bits_entry_level == 2'h2 ? hit_hit2_2 & hit_hit1_2 & hit_hit0_2 : _hit_T_21; // @[MMUBundle.scala 585:22]
  wire  _hit_T_23 = p_hit_asid_hit & _hit_T_22; // @[MMUBundle.scala 585:16]
  wire  hit_2 = _hit_T_23 & io_ptw_resp_valid; // @[TLB.scala 223:90]
  reg  new_coming_2; // @[TLB.scala 225:29]
  wire  miss_wire_2 = new_coming_2 & miss_read_3; // @[TLB.scala 226:32]
  reg  miss_v_valid_2; // @[MMUBundle.scala 796:24]
  wire  _GEN_172 = miss_wire_2 | miss_v_valid_2; // @[MMUBundle.scala 797:19 796:24 797:27]
  wire  miss_v_2 = miss_v_valid_2 | miss_wire_2; // @[MMUBundle.scala 800:11]
  wire  _miss_req_v_T_17 = miss_wire_2 | miss_v_2 & flush_mmu_delay_io_out & ~mmu_flush_pipe_delay_io_out; // @[TLB.scala 228:48]
  wire  _miss_req_v_T_18 = io_ptw_req_3_ready & io_ptw_req_3_valid; // @[Decoupled.scala 50:35]
  wire  _miss_req_v_T_20 = _miss_req_v_T_18 | io_requestor_3_resp_valid; // @[TLB.scala 229:30]
  reg  miss_req_v_valid_2; // @[MMUBundle.scala 796:24]
  wire  _GEN_175 = _miss_req_v_T_17 | miss_req_v_valid_2; // @[MMUBundle.scala 797:19 796:24 797:27]
  wire [23:0] _io_requestor_3_resp_bits_paddr_0_T_4 = {io_ptw_resp_bits_entry_ppn[23:18],miss_req_vpn_2[17:0]}; // @[Cat.scala 31:58]
  wire [23:0] _io_requestor_3_resp_bits_paddr_0_T_7 = {io_ptw_resp_bits_entry_ppn[23:9],miss_req_vpn_2[8:0]}; // @[Cat.scala 31:58]
  wire [23:0] _io_requestor_3_resp_bits_paddr_0_T_9 = 2'h0 == io_ptw_resp_bits_entry_level ?
    _io_requestor_3_resp_bits_paddr_0_T_4 : 24'h0; // @[Mux.scala 81:58]
  wire [23:0] _io_requestor_3_resp_bits_paddr_0_T_11 = 2'h1 == io_ptw_resp_bits_entry_level ?
    _io_requestor_3_resp_bits_paddr_0_T_7 : _io_requestor_3_resp_bits_paddr_0_T_9; // @[Mux.scala 81:58]
  wire [23:0] _io_requestor_3_resp_bits_paddr_0_T_13 = 2'h2 == io_ptw_resp_bits_entry_level ? io_ptw_resp_bits_entry_ppn
     : _io_requestor_3_resp_bits_paddr_0_T_11; // @[Mux.scala 81:58]
  wire [35:0] _io_requestor_3_resp_bits_paddr_0_T_15 = {_io_requestor_3_resp_bits_paddr_0_T_13,req_out_3_vaddr[11:0]}; // @[Cat.scala 31:58]
  wire  _GEN_178 = _refill_T & hit_2 & req_out_v_3 & vmEnable | req_out_v_3 & ~(miss_v_2 & vmEnable); // @[TLB.scala 232:21 233:84 235:23]
  wire  _GEN_183 = _refill_T & hit_2 & req_out_v_3 & vmEnable ? (instrPf_4 | _ldUpdate_T_24) & vmEnable &
    _io_requestor_0_resp_bits_excp_0_pf_ld_T_6 : (instrPf_3 | _ldUpdate_T_18) & vmEnable &
    _io_requestor_3_resp_bits_excp_0_pf_ld_T_2; // @[TLB.scala 189:{41,41} 233:84]
  DelayN_19 sfence_delay ( // @[Hold.scala 97:23]
    .clock(sfence_delay_clock),
    .io_in_valid(sfence_delay_io_in_valid),
    .io_in_bits_rs1(sfence_delay_io_in_bits_rs1),
    .io_in_bits_rs2(sfence_delay_io_in_bits_rs2),
    .io_in_bits_addr(sfence_delay_io_in_bits_addr),
    .io_in_bits_asid(sfence_delay_io_in_bits_asid),
    .io_out_valid(sfence_delay_io_out_valid),
    .io_out_bits_rs1(sfence_delay_io_out_bits_rs1),
    .io_out_bits_rs2(sfence_delay_io_out_bits_rs2),
    .io_out_bits_addr(sfence_delay_io_out_bits_addr),
    .io_out_bits_asid(sfence_delay_io_out_bits_asid)
  );
  DelayN_20 satp_delay ( // @[Hold.scala 97:23]
    .clock(satp_delay_clock),
    .io_in_mode(satp_delay_io_in_mode),
    .io_in_asid(satp_delay_io_in_asid),
    .io_out_mode(satp_delay_io_out_mode),
    .io_out_asid(satp_delay_io_out_asid)
  );
  DelayN_6 flush_mmu_delay ( // @[Hold.scala 97:23]
    .clock(flush_mmu_delay_clock),
    .io_in(flush_mmu_delay_io_in),
    .io_out(flush_mmu_delay_io_out)
  );
  DelayN_6 mmu_flush_pipe_delay ( // @[Hold.scala 97:23]
    .clock(mmu_flush_pipe_delay_clock),
    .io_in(mmu_flush_pipe_delay_io_in),
    .io_out(mmu_flush_pipe_delay_io_out)
  );
  TlbStorageWrapper entries ( // @[TLB.scala 86:23]
    .clock(entries_clock),
    .reset(entries_reset),
    .io_sfence_valid(entries_io_sfence_valid),
    .io_sfence_bits_rs1(entries_io_sfence_bits_rs1),
    .io_sfence_bits_rs2(entries_io_sfence_bits_rs2),
    .io_sfence_bits_addr(entries_io_sfence_bits_addr),
    .io_sfence_bits_asid(entries_io_sfence_bits_asid),
    .io_csr_satp_asid(entries_io_csr_satp_asid),
    .io_rreq_0_valid(entries_io_rreq_0_valid),
    .io_rreq_0_bits_vpn(entries_io_rreq_0_bits_vpn),
    .io_rreq_1_valid(entries_io_rreq_1_valid),
    .io_rreq_1_bits_vpn(entries_io_rreq_1_bits_vpn),
    .io_rreq_3_valid(entries_io_rreq_3_valid),
    .io_rreq_3_bits_vpn(entries_io_rreq_3_bits_vpn),
    .io_rresp_0_bits_hit(entries_io_rresp_0_bits_hit),
    .io_rresp_0_bits_ppn_0(entries_io_rresp_0_bits_ppn_0),
    .io_rresp_0_bits_perm_0_pf(entries_io_rresp_0_bits_perm_0_pf),
    .io_rresp_0_bits_perm_0_af(entries_io_rresp_0_bits_perm_0_af),
    .io_rresp_0_bits_perm_0_a(entries_io_rresp_0_bits_perm_0_a),
    .io_rresp_0_bits_perm_0_u(entries_io_rresp_0_bits_perm_0_u),
    .io_rresp_0_bits_perm_0_x(entries_io_rresp_0_bits_perm_0_x),
    .io_rresp_1_bits_hit(entries_io_rresp_1_bits_hit),
    .io_rresp_1_bits_ppn_0(entries_io_rresp_1_bits_ppn_0),
    .io_rresp_1_bits_perm_0_pf(entries_io_rresp_1_bits_perm_0_pf),
    .io_rresp_1_bits_perm_0_af(entries_io_rresp_1_bits_perm_0_af),
    .io_rresp_1_bits_perm_0_a(entries_io_rresp_1_bits_perm_0_a),
    .io_rresp_1_bits_perm_0_u(entries_io_rresp_1_bits_perm_0_u),
    .io_rresp_1_bits_perm_0_x(entries_io_rresp_1_bits_perm_0_x),
    .io_rresp_3_bits_hit(entries_io_rresp_3_bits_hit),
    .io_rresp_3_bits_ppn_0(entries_io_rresp_3_bits_ppn_0),
    .io_rresp_3_bits_perm_0_pf(entries_io_rresp_3_bits_perm_0_pf),
    .io_rresp_3_bits_perm_0_af(entries_io_rresp_3_bits_perm_0_af),
    .io_rresp_3_bits_perm_0_a(entries_io_rresp_3_bits_perm_0_a),
    .io_rresp_3_bits_perm_0_u(entries_io_rresp_3_bits_perm_0_u),
    .io_rresp_3_bits_perm_0_x(entries_io_rresp_3_bits_perm_0_x),
    .io_wvalid(entries_io_wvalid),
    .io_wdata_entry_tag(entries_io_wdata_entry_tag),
    .io_wdata_entry_ppn(entries_io_wdata_entry_ppn),
    .io_wdata_entry_perm_d(entries_io_wdata_entry_perm_d),
    .io_wdata_entry_perm_a(entries_io_wdata_entry_perm_a),
    .io_wdata_entry_perm_g(entries_io_wdata_entry_perm_g),
    .io_wdata_entry_perm_u(entries_io_wdata_entry_perm_u),
    .io_wdata_entry_perm_x(entries_io_wdata_entry_perm_x),
    .io_wdata_entry_perm_w(entries_io_wdata_entry_perm_w),
    .io_wdata_entry_perm_r(entries_io_wdata_entry_perm_r),
    .io_wdata_entry_level(entries_io_wdata_entry_level),
    .io_wdata_pf(entries_io_wdata_pf),
    .io_wdata_af(entries_io_wdata_af)
  );
  assign io_requestor_0_req_ready = ~req_out_v_0 | _req_out_v_T_3; // @[TLB.scala 217:52]
  assign io_requestor_0_resp_valid = req_out_v_0 & io_flushPipe_0 & vmEnable | _GEN_126; // @[TLB.scala 257:76 258:25]
  assign io_requestor_0_resp_bits_paddr_0 = _refill_T & hit & req_out_v_0 & vmEnable ?
    _io_requestor_0_resp_bits_paddr_0_T_15 : _io_requestor_0_resp_bits_paddr_0_T; // @[TLB.scala 150:29 233:84 238:33]
  assign io_requestor_0_resp_bits_excp_0_pf_instr = req_out_v_0 & io_flushPipe_0 & vmEnable | _GEN_131; // @[TLB.scala 257:76 262:43]
  assign io_requestor_0_resp_bits_excp_0_af_instr = _refill_T & hit & req_out_v_0 & vmEnable ? io_ptw_resp_bits_af &
    vmEnable : perm_0_0_af & vmEnable; // @[TLB.scala 196:{41,41} 233:84]
  assign io_requestor_1_req_ready = ~req_out_v_1 | _req_out_v_T_7; // @[TLB.scala 217:52]
  assign io_requestor_1_resp_valid = req_out_v_1 & io_flushPipe_1 & vmEnable | _GEN_151; // @[TLB.scala 257:76 258:25]
  assign io_requestor_1_resp_bits_paddr_0 = _refill_T & hit_1 & req_out_v_1 & vmEnable ?
    _io_requestor_1_resp_bits_paddr_0_T_15 : _io_requestor_1_resp_bits_paddr_0_T; // @[TLB.scala 150:29 233:84 238:33]
  assign io_requestor_1_resp_bits_excp_0_pf_instr = req_out_v_1 & io_flushPipe_1 & vmEnable | _GEN_156; // @[TLB.scala 257:76 262:43]
  assign io_requestor_1_resp_bits_excp_0_af_instr = _refill_T & hit_1 & req_out_v_1 & vmEnable ? io_ptw_resp_bits_af &
    vmEnable : perm_1_0_af & vmEnable; // @[TLB.scala 196:{41,41} 233:84]
  assign io_requestor_3_req_ready = ~req_out_v_3 | io_requestor_3_resp_valid; // @[TLB.scala 217:52]
  assign io_requestor_3_resp_valid = req_out_v_3 & io_flushPipe_3 & vmEnable | _GEN_178; // @[TLB.scala 257:76 258:25]
  assign io_requestor_3_resp_bits_paddr_0 = _refill_T & hit_2 & req_out_v_3 & vmEnable ?
    _io_requestor_3_resp_bits_paddr_0_T_15 : _io_requestor_3_resp_bits_paddr_0_T; // @[TLB.scala 150:29 233:84 238:33]
  assign io_requestor_3_resp_bits_miss = _refill_T & hit_2 & req_out_v_3 & vmEnable ? 1'h0 : miss_read_3; // @[TLB.scala 137:23 233:84 236:27]
  assign io_requestor_3_resp_bits_excp_0_pf_instr = req_out_v_3 & io_flushPipe_3 & vmEnable | _GEN_183; // @[TLB.scala 257:76 262:43]
  assign io_requestor_3_resp_bits_excp_0_af_instr = _refill_T & hit_2 & req_out_v_3 & vmEnable ? io_ptw_resp_bits_af &
    vmEnable : perm_3_0_af & vmEnable; // @[TLB.scala 196:{41,41} 233:84]
  assign io_ptw_req_0_valid = miss_req_v_valid | _miss_req_v_T_3; // @[MMUBundle.scala 800:11]
  assign io_ptw_req_0_bits_vpn = req_out_0_vaddr[38:12]; // @[MMUConst.scala 102:9]
  assign io_ptw_req_1_valid = miss_req_v_valid_1 | _miss_req_v_T_10; // @[MMUBundle.scala 800:11]
  assign io_ptw_req_1_bits_vpn = req_out_1_vaddr[38:12]; // @[MMUConst.scala 102:9]
  assign io_ptw_req_3_valid = miss_req_v_valid_2 | _miss_req_v_T_17; // @[MMUBundle.scala 800:11]
  assign io_ptw_req_3_bits_vpn = req_out_3_vaddr[38:12]; // @[MMUConst.scala 102:9]
  assign io_ptw_resp_ready = 1'h1; // @[TLB.scala 122:21]
  assign sfence_delay_clock = clock;
  assign sfence_delay_io_in_valid = io_sfence_valid; // @[Hold.scala 98:17]
  assign sfence_delay_io_in_bits_rs1 = io_sfence_bits_rs1; // @[Hold.scala 98:17]
  assign sfence_delay_io_in_bits_rs2 = io_sfence_bits_rs2; // @[Hold.scala 98:17]
  assign sfence_delay_io_in_bits_addr = io_sfence_bits_addr; // @[Hold.scala 98:17]
  assign sfence_delay_io_in_bits_asid = io_sfence_bits_asid; // @[Hold.scala 98:17]
  assign satp_delay_clock = clock;
  assign satp_delay_io_in_mode = io_csr_satp_mode; // @[Hold.scala 98:17]
  assign satp_delay_io_in_asid = io_csr_satp_asid; // @[Hold.scala 98:17]
  assign flush_mmu_delay_clock = clock;
  assign flush_mmu_delay_io_in = sfence_delay_io_out_valid | io_csr_satp_changed; // @[TLB.scala 65:39]
  assign mmu_flush_pipe_delay_clock = clock;
  assign mmu_flush_pipe_delay_io_in = 1'h0; // @[TLB.scala 66:44]
  assign entries_clock = clock;
  assign entries_reset = reset;
  assign entries_io_sfence_valid = sfence_delay_io_out_valid; // @[MMUBundle.scala 456:17]
  assign entries_io_sfence_bits_rs1 = sfence_delay_io_out_bits_rs1; // @[MMUBundle.scala 456:17]
  assign entries_io_sfence_bits_rs2 = sfence_delay_io_out_bits_rs2; // @[MMUBundle.scala 456:17]
  assign entries_io_sfence_bits_addr = sfence_delay_io_out_bits_addr; // @[MMUBundle.scala 456:17]
  assign entries_io_sfence_bits_asid = sfence_delay_io_out_bits_asid; // @[MMUBundle.scala 456:17]
  assign entries_io_csr_satp_asid = satp_delay_io_out_asid; // @[MMUBundle.scala 458:19]
  assign entries_io_rreq_0_valid = io_requestor_0_req_valid; // @[MMUBundle.scala 308:25]
  assign entries_io_rreq_0_bits_vpn = io_requestor_0_req_bits_vaddr[38:12]; // @[MMUConst.scala 102:9]
  assign entries_io_rreq_1_valid = io_requestor_1_req_valid; // @[MMUBundle.scala 308:25]
  assign entries_io_rreq_1_bits_vpn = io_requestor_1_req_bits_vaddr[38:12]; // @[MMUConst.scala 102:9]
  assign entries_io_rreq_3_valid = io_requestor_3_req_valid; // @[MMUBundle.scala 308:25]
  assign entries_io_rreq_3_bits_vpn = io_requestor_3_req_bits_vaddr[38:12]; // @[MMUConst.scala 102:9]
  assign entries_io_wvalid = _refill_T & ~flush_mmu_delay_io_out & vmEnable; // @[TLB.scala 82:46]
  assign entries_io_wdata_entry_tag = io_ptw_resp_bits_entry_tag; // @[MMUBundle.scala 319:22]
  assign entries_io_wdata_entry_ppn = io_ptw_resp_bits_entry_ppn; // @[MMUBundle.scala 319:22]
  assign entries_io_wdata_entry_perm_d = io_ptw_resp_bits_entry_perm_d; // @[MMUBundle.scala 319:22]
  assign entries_io_wdata_entry_perm_a = io_ptw_resp_bits_entry_perm_a; // @[MMUBundle.scala 319:22]
  assign entries_io_wdata_entry_perm_g = io_ptw_resp_bits_entry_perm_g; // @[MMUBundle.scala 319:22]
  assign entries_io_wdata_entry_perm_u = io_ptw_resp_bits_entry_perm_u; // @[MMUBundle.scala 319:22]
  assign entries_io_wdata_entry_perm_x = io_ptw_resp_bits_entry_perm_x; // @[MMUBundle.scala 319:22]
  assign entries_io_wdata_entry_perm_w = io_ptw_resp_bits_entry_perm_w; // @[MMUBundle.scala 319:22]
  assign entries_io_wdata_entry_perm_r = io_ptw_resp_bits_entry_perm_r; // @[MMUBundle.scala 319:22]
  assign entries_io_wdata_entry_level = io_ptw_resp_bits_entry_level; // @[MMUBundle.scala 319:22]
  assign entries_io_wdata_pf = io_ptw_resp_bits_pf; // @[MMUBundle.scala 319:22]
  assign entries_io_wdata_af = io_ptw_resp_bits_af; // @[MMUBundle.scala 319:22]
  always @(posedge clock) begin
    if (_req_out_T) begin // @[Reg.scala 17:18]
      req_out_0_vaddr <= io_requestor_0_req_bits_vaddr; // @[Reg.scala 17:22]
    end
    if (_req_out_T_1) begin // @[Reg.scala 17:18]
      req_out_1_vaddr <= io_requestor_1_req_bits_vaddr; // @[Reg.scala 17:22]
    end
    if (_req_out_T_3) begin // @[Reg.scala 17:18]
      req_out_3_vaddr <= io_requestor_3_req_bits_vaddr; // @[Reg.scala 17:22]
    end
    p_hit <= _p_hit_T_7 & _refill_T; // @[TLB.scala 271:88]
    if (_refill_T) begin // @[Reg.scala 17:18]
      if (2'h2 == io_ptw_resp_bits_entry_level) begin // @[Mux.scala 81:58]
        p_ppn <= io_ptw_resp_bits_entry_ppn;
      end else if (2'h1 == io_ptw_resp_bits_entry_level) begin // @[Mux.scala 81:58]
        p_ppn <= _p_ppn_T_5;
      end else if (2'h0 == io_ptw_resp_bits_entry_level) begin // @[Mux.scala 81:58]
        p_ppn <= _p_ppn_T_2;
      end else begin
        p_ppn <= 24'h0;
      end
    end
    if (_refill_T) begin // @[Reg.scala 17:18]
      p_perm_pf <= io_ptw_resp_bits_pf; // @[Reg.scala 17:22]
    end
    if (_refill_T) begin // @[Reg.scala 17:18]
      p_perm_af <= io_ptw_resp_bits_af; // @[Reg.scala 17:22]
    end
    if (_refill_T) begin // @[Reg.scala 17:18]
      p_perm_a <= p_perm_ptePerm_a; // @[Reg.scala 17:22]
    end
    if (_refill_T) begin // @[Reg.scala 17:18]
      p_perm_u <= p_perm_ptePerm_u; // @[Reg.scala 17:22]
    end
    if (_refill_T) begin // @[Reg.scala 17:18]
      p_perm_x <= p_perm_ptePerm_x; // @[Reg.scala 17:22]
    end
    p_hit_1 <= _p_hit_T_17 & _refill_T; // @[TLB.scala 271:88]
    if (_refill_T) begin // @[Reg.scala 17:18]
      if (2'h2 == io_ptw_resp_bits_entry_level) begin // @[Mux.scala 81:58]
        p_ppn_1 <= io_ptw_resp_bits_entry_ppn;
      end else if (2'h1 == io_ptw_resp_bits_entry_level) begin // @[Mux.scala 81:58]
        p_ppn_1 <= _p_ppn_T_18;
      end else if (2'h0 == io_ptw_resp_bits_entry_level) begin // @[Mux.scala 81:58]
        p_ppn_1 <= _p_ppn_T_15;
      end else begin
        p_ppn_1 <= 24'h0;
      end
    end
    if (_refill_T) begin // @[Reg.scala 17:18]
      p_perm_1_pf <= io_ptw_resp_bits_pf; // @[Reg.scala 17:22]
    end
    if (_refill_T) begin // @[Reg.scala 17:18]
      p_perm_1_af <= io_ptw_resp_bits_af; // @[Reg.scala 17:22]
    end
    if (_refill_T) begin // @[Reg.scala 17:18]
      p_perm_1_a <= p_perm_ptePerm_a; // @[Reg.scala 17:22]
    end
    if (_refill_T) begin // @[Reg.scala 17:18]
      p_perm_1_u <= p_perm_ptePerm_u; // @[Reg.scala 17:22]
    end
    if (_refill_T) begin // @[Reg.scala 17:18]
      p_perm_1_x <= p_perm_ptePerm_x; // @[Reg.scala 17:22]
    end
    p_hit_3 <= _p_hit_T_37 & _refill_T; // @[TLB.scala 271:88]
    if (_refill_T) begin // @[Reg.scala 17:18]
      if (2'h2 == io_ptw_resp_bits_entry_level) begin // @[Mux.scala 81:58]
        p_ppn_3 <= io_ptw_resp_bits_entry_ppn;
      end else if (2'h1 == io_ptw_resp_bits_entry_level) begin // @[Mux.scala 81:58]
        p_ppn_3 <= _p_ppn_T_44;
      end else if (2'h0 == io_ptw_resp_bits_entry_level) begin // @[Mux.scala 81:58]
        p_ppn_3 <= _p_ppn_T_41;
      end else begin
        p_ppn_3 <= 24'h0;
      end
    end
    if (_refill_T) begin // @[Reg.scala 17:18]
      p_perm_3_pf <= io_ptw_resp_bits_pf; // @[Reg.scala 17:22]
    end
    if (_refill_T) begin // @[Reg.scala 17:18]
      p_perm_3_af <= io_ptw_resp_bits_af; // @[Reg.scala 17:22]
    end
    if (_refill_T) begin // @[Reg.scala 17:18]
      p_perm_3_a <= p_perm_ptePerm_a; // @[Reg.scala 17:22]
    end
    if (_refill_T) begin // @[Reg.scala 17:18]
      p_perm_3_u <= p_perm_ptePerm_u; // @[Reg.scala 17:22]
    end
    if (_refill_T) begin // @[Reg.scala 17:18]
      p_perm_3_x <= p_perm_ptePerm_x; // @[Reg.scala 17:22]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Hold.scala 43:18]
      req_out_v_0 <= 1'h0; // @[Hold.scala 43:26]
    end else if (io_flushPipe_0) begin
      req_out_v_0 <= 1'h0;
    end else begin
      req_out_v_0 <= _GEN_49;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Hold.scala 43:18]
      req_out_v_1 <= 1'h0; // @[Hold.scala 43:26]
    end else if (io_flushPipe_1) begin
      req_out_v_1 <= 1'h0;
    end else begin
      req_out_v_1 <= _GEN_52;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Hold.scala 43:18]
      req_out_v_3 <= 1'h0; // @[Hold.scala 43:26]
    end else if (io_flushPipe_3) begin
      req_out_v_3 <= 1'h0;
    end else begin
      req_out_v_3 <= _GEN_58;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[TLB.scala 225:73]
      new_coming <= 1'h0;
    end else begin
      new_coming <= _req_out_v_T_2 & ~io_flushPipe_0;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MMUBundle.scala 799:18]
      miss_v_valid <= 1'h0; // @[MMUBundle.scala 799:26]
    end else if (io_flushPipe_0) begin // @[MMUBundle.scala 798:20]
      miss_v_valid <= 1'h0; // @[MMUBundle.scala 798:28]
    end else if (_req_out_v_T_3) begin
      miss_v_valid <= 1'h0;
    end else begin
      miss_v_valid <= _GEN_120;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MMUBundle.scala 799:18]
      miss_req_v_valid <= 1'h0; // @[MMUBundle.scala 799:26]
    end else if (io_flushPipe_0) begin // @[MMUBundle.scala 798:20]
      miss_req_v_valid <= 1'h0; // @[MMUBundle.scala 798:28]
    end else if (_miss_req_v_T_6) begin
      miss_req_v_valid <= 1'h0;
    end else begin
      miss_req_v_valid <= _GEN_123;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[TLB.scala 225:73]
      new_coming_1 <= 1'h0;
    end else begin
      new_coming_1 <= _req_out_v_T_6 & ~io_flushPipe_1;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MMUBundle.scala 799:18]
      miss_v_valid_1 <= 1'h0; // @[MMUBundle.scala 799:26]
    end else if (io_flushPipe_1) begin // @[MMUBundle.scala 798:20]
      miss_v_valid_1 <= 1'h0; // @[MMUBundle.scala 798:28]
    end else if (_req_out_v_T_7) begin
      miss_v_valid_1 <= 1'h0;
    end else begin
      miss_v_valid_1 <= _GEN_145;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MMUBundle.scala 799:18]
      miss_req_v_valid_1 <= 1'h0; // @[MMUBundle.scala 799:26]
    end else if (io_flushPipe_1) begin // @[MMUBundle.scala 798:20]
      miss_req_v_valid_1 <= 1'h0; // @[MMUBundle.scala 798:28]
    end else if (_miss_req_v_T_13) begin
      miss_req_v_valid_1 <= 1'h0;
    end else begin
      miss_req_v_valid_1 <= _GEN_148;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[TLB.scala 225:73]
      new_coming_2 <= 1'h0;
    end else begin
      new_coming_2 <= _req_out_T_3 & ~io_flushPipe_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MMUBundle.scala 799:18]
      miss_v_valid_2 <= 1'h0; // @[MMUBundle.scala 799:26]
    end else if (io_flushPipe_3) begin // @[MMUBundle.scala 798:20]
      miss_v_valid_2 <= 1'h0; // @[MMUBundle.scala 798:28]
    end else if (io_requestor_3_resp_valid) begin
      miss_v_valid_2 <= 1'h0;
    end else begin
      miss_v_valid_2 <= _GEN_172;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MMUBundle.scala 799:18]
      miss_req_v_valid_2 <= 1'h0; // @[MMUBundle.scala 799:26]
    end else if (io_flushPipe_3) begin // @[MMUBundle.scala 798:20]
      miss_req_v_valid_2 <= 1'h0; // @[MMUBundle.scala 798:28]
    end else if (_miss_req_v_T_20) begin
      miss_req_v_valid_2 <= 1'h0;
    end else begin
      miss_req_v_valid_2 <= _GEN_175;
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
  _RAND_0 = {2{`RANDOM}};
  req_out_0_vaddr = _RAND_0[38:0];
  _RAND_1 = {2{`RANDOM}};
  req_out_1_vaddr = _RAND_1[38:0];
  _RAND_2 = {2{`RANDOM}};
  req_out_3_vaddr = _RAND_2[38:0];
  _RAND_3 = {1{`RANDOM}};
  req_out_v_0 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  req_out_v_1 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  req_out_v_3 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  p_hit = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  p_ppn = _RAND_7[23:0];
  _RAND_8 = {1{`RANDOM}};
  p_perm_pf = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  p_perm_af = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  p_perm_a = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  p_perm_u = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  p_perm_x = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  p_hit_1 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  p_ppn_1 = _RAND_14[23:0];
  _RAND_15 = {1{`RANDOM}};
  p_perm_1_pf = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  p_perm_1_af = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  p_perm_1_a = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  p_perm_1_u = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  p_perm_1_x = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  p_hit_3 = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  p_ppn_3 = _RAND_21[23:0];
  _RAND_22 = {1{`RANDOM}};
  p_perm_3_pf = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  p_perm_3_af = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  p_perm_3_a = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  p_perm_3_u = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  p_perm_3_x = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  new_coming = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  miss_v_valid = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  miss_req_v_valid = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  new_coming_1 = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  miss_v_valid_1 = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  miss_req_v_valid_1 = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  new_coming_2 = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  miss_v_valid_2 = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  miss_req_v_valid_2 = _RAND_35[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    req_out_v_0 = 1'h0;
  end
  if (reset) begin
    req_out_v_1 = 1'h0;
  end
  if (reset) begin
    req_out_v_3 = 1'h0;
  end
  if (reset) begin
    new_coming = 1'h0;
  end
  if (reset) begin
    miss_v_valid = 1'h0;
  end
  if (reset) begin
    miss_req_v_valid = 1'h0;
  end
  if (reset) begin
    new_coming_1 = 1'h0;
  end
  if (reset) begin
    miss_v_valid_1 = 1'h0;
  end
  if (reset) begin
    miss_req_v_valid_1 = 1'h0;
  end
  if (reset) begin
    new_coming_2 = 1'h0;
  end
  if (reset) begin
    miss_v_valid_2 = 1'h0;
  end
  if (reset) begin
    miss_req_v_valid_2 = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

