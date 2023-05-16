module PTWFilter(
  input         clock,
  input         reset,
  input         io_sfence_valid,
  input         io_csr_satp_changed,
  output        io_tlb_req_0_ready,
  input         io_tlb_req_0_valid,
  input  [26:0] io_tlb_req_0_bits_vpn,
  output        io_tlb_req_1_ready,
  input         io_tlb_req_1_valid,
  input  [26:0] io_tlb_req_1_bits_vpn,
  output        io_tlb_req_3_ready,
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
`endif // RANDOMIZE_REG_INIT
  wire  flush_delay_clock; // @[Hold.scala 97:23]
  wire  flush_delay_io_in; // @[Hold.scala 97:23]
  wire  flush_delay_io_out; // @[Hold.scala 97:23]
  reg  v_0; // @[Repeater.scala 157:18]
  reg  v_1; // @[Repeater.scala 157:18]
  reg  v_2; // @[Repeater.scala 157:18]
  reg  v_3; // @[Repeater.scala 157:18]
  reg [26:0] vpn_0; // @[Repeater.scala 159:16]
  reg [26:0] vpn_1; // @[Repeater.scala 159:16]
  reg [26:0] vpn_2; // @[Repeater.scala 159:16]
  reg [26:0] vpn_3; // @[Repeater.scala 159:16]
  reg [1:0] enqPtr; // @[Repeater.scala 161:23]
  reg [1:0] issPtr; // @[Repeater.scala 162:23]
  reg [1:0] deqPtr; // @[Repeater.scala 163:23]
  reg  mayFullDeq; // @[Repeater.scala 164:27]
  reg  mayFullIss; // @[Repeater.scala 165:27]
  reg [2:0] counter; // @[Repeater.scala 166:24]
  reg [2:0] inflight_counter; // @[Repeater.scala 172:33]
  wire  inflight_full = inflight_counter == 3'h4; // @[Repeater.scala 173:40]
  wire  _T = io_ptw_req_0_ready & io_ptw_req_0_valid; // @[Decoupled.scala 50:35]
  wire  _T_1 = io_ptw_resp_ready & io_ptw_resp_valid; // @[Decoupled.scala 50:35]
  wire [2:0] _inflight_counter_T_2 = inflight_counter + 3'h1; // @[Repeater.scala 175:68]
  wire [2:0] _inflight_counter_T_4 = inflight_counter - 3'h1; // @[Repeater.scala 175:92]
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
  wire [3:0] _ptwResp_valid_T_1 = {ptwResp_OldMatchVec_0,ptwResp_OldMatchVec_1,ptwResp_OldMatchVec_2,
    ptwResp_OldMatchVec_3}; // @[Cat.scala 31:58]
  reg  ptwResp_valid; // @[Repeater.scala 182:30]
  wire  oldMatchVec_early_0_0 = v_0 & vpn_0 == io_tlb_req_0_bits_vpn; // @[Repeater.scala 183:83]
  wire  oldMatchVec_early_0_1 = v_1 & vpn_1 == io_tlb_req_0_bits_vpn; // @[Repeater.scala 183:83]
  wire  oldMatchVec_early_0_2 = v_2 & vpn_2 == io_tlb_req_0_bits_vpn; // @[Repeater.scala 183:83]
  wire  oldMatchVec_early_0_3 = v_3 & vpn_3 == io_tlb_req_0_bits_vpn; // @[Repeater.scala 183:83]
  wire  oldMatchVec_early_1_0 = v_0 & vpn_0 == io_tlb_req_1_bits_vpn; // @[Repeater.scala 183:83]
  wire  oldMatchVec_early_1_1 = v_1 & vpn_1 == io_tlb_req_1_bits_vpn; // @[Repeater.scala 183:83]
  wire  oldMatchVec_early_1_2 = v_2 & vpn_2 == io_tlb_req_1_bits_vpn; // @[Repeater.scala 183:83]
  wire  oldMatchVec_early_1_3 = v_3 & vpn_3 == io_tlb_req_1_bits_vpn; // @[Repeater.scala 183:83]
  wire  oldMatchVec_early_3_0 = v_0 & vpn_0 == io_tlb_req_3_bits_vpn; // @[Repeater.scala 183:83]
  wire  oldMatchVec_early_3_1 = v_1 & vpn_1 == io_tlb_req_3_bits_vpn; // @[Repeater.scala 183:83]
  wire  oldMatchVec_early_3_2 = v_2 & vpn_2 == io_tlb_req_3_bits_vpn; // @[Repeater.scala 183:83]
  wire  oldMatchVec_early_3_3 = v_3 & vpn_3 == io_tlb_req_3_bits_vpn; // @[Repeater.scala 183:83]
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
  reg  newMatchVec_REG_4; // @[Repeater.scala 197:12]
  wire  newMatchVec_1_0 = newMatchVec_REG_4 & tlb_req_0_valid_REG; // @[Repeater.scala 197:38]
  wire  _reqs_reqs_merge_T_3 = |newMatchVec_1_0; // @[Repeater.scala 210:41]
  wire  reqs_reqs_merge_1 = ptwResp_newMatchVec_1 | oldMatchVec_1 | _reqs_reqs_merge_T_3; // @[Repeater.scala 209:54]
  reg  tlb_req_1_valid_REG; // @[Repeater.scala 188:32]
  wire  reqs_1_valid = ~reqs_reqs_merge_1 & tlb_req_1_valid_REG; // @[Repeater.scala 218:27]
  wire [1:0] _enqNum_T = reqs_0_valid + reqs_1_valid; // @[Bitwise.scala 48:55]
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
  reg  newMatchVec_REG_12; // @[Repeater.scala 197:12]
  wire  newMatchVec_3_0 = newMatchVec_REG_12 & tlb_req_0_valid_REG; // @[Repeater.scala 197:38]
  reg  newMatchVec_REG_13; // @[Repeater.scala 197:12]
  wire  newMatchVec_3_1 = newMatchVec_REG_13 & tlb_req_1_valid_REG; // @[Repeater.scala 197:38]
  wire [2:0] _reqs_reqs_merge_T_8 = {newMatchVec_3_0,newMatchVec_3_1,1'h0}; // @[Cat.scala 31:58]
  wire  _reqs_reqs_merge_T_9 = |_reqs_reqs_merge_T_8; // @[Repeater.scala 210:41]
  wire  reqs_reqs_merge_3 = ptwResp_newMatchVec_3 | oldMatchVec_3 | _reqs_reqs_merge_T_9; // @[Repeater.scala 209:54]
  reg  tlb_req_3_valid_REG; // @[Repeater.scala 188:32]
  wire  reqs_3_valid = ~reqs_reqs_merge_3 & tlb_req_3_valid_REG; // @[Repeater.scala 218:27]
  wire [1:0] _enqNum_T_2 = {{1'd0}, reqs_3_valid}; // @[Bitwise.scala 48:55]
  wire [2:0] enqNum = _enqNum_T + _enqNum_T_2; // @[Bitwise.scala 48:55]
  wire [3:0] _canEnqueue_T = counter + enqNum; // @[Repeater.scala 233:25]
  wire  canEnqueue = _canEnqueue_T <= 4'h4; // @[Repeater.scala 233:35]
  wire  lastReqMatchVec_early_0_0 = tlb_req_0_valid_REG & tlb_req_0_bits_rvpn == io_tlb_req_0_bits_vpn & canEnqueue; // @[Repeater.scala 184:106]
  wire  lastReqMatchVec_early_0_1 = tlb_req_1_valid_REG & tlb_req_1_bits_rvpn == io_tlb_req_0_bits_vpn & canEnqueue; // @[Repeater.scala 184:106]
  wire  lastReqMatchVec_early_0_3 = tlb_req_3_valid_REG & tlb_req_3_bits_rvpn == io_tlb_req_0_bits_vpn & canEnqueue; // @[Repeater.scala 184:106]
  wire  lastReqMatchVec_early_1_0 = tlb_req_0_valid_REG & tlb_req_0_bits_rvpn == io_tlb_req_1_bits_vpn & canEnqueue; // @[Repeater.scala 184:106]
  wire  lastReqMatchVec_early_1_1 = tlb_req_1_valid_REG & tlb_req_1_bits_rvpn == io_tlb_req_1_bits_vpn & canEnqueue; // @[Repeater.scala 184:106]
  wire  lastReqMatchVec_early_1_3 = tlb_req_3_valid_REG & tlb_req_3_bits_rvpn == io_tlb_req_1_bits_vpn & canEnqueue; // @[Repeater.scala 184:106]
  wire  lastReqMatchVec_early_3_0 = tlb_req_0_valid_REG & tlb_req_0_bits_rvpn == io_tlb_req_3_bits_vpn & canEnqueue; // @[Repeater.scala 184:106]
  wire  lastReqMatchVec_early_3_1 = tlb_req_1_valid_REG & tlb_req_1_bits_rvpn == io_tlb_req_3_bits_vpn & canEnqueue; // @[Repeater.scala 184:106]
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
  wire [3:0] _tlb_req_0_valid_T_11 = {lastReqMatchVec_early_0_0,lastReqMatchVec_early_0_1,1'h0,lastReqMatchVec_early_0_3
    }; // @[Cat.scala 31:58]
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
  wire [3:0] _tlb_req_1_valid_T_11 = {lastReqMatchVec_early_1_0,lastReqMatchVec_early_1_1,1'h0,lastReqMatchVec_early_1_3
    }; // @[Cat.scala 31:58]
  wire  _tlb_req_1_valid_T_13 = ~(|_tlb_req_1_valid_T_11); // @[Repeater.scala 190:7]
  wire  tlb_req_3_valid_hit0 = ptwResp_entry_tag[26:18] == io_tlb_req_3_bits_vpn[26:18]; // @[MMUBundle.scala 581:48]
  wire  tlb_req_3_valid_hit1 = ptwResp_entry_tag[17:9] == io_tlb_req_3_bits_vpn[17:9]; // @[MMUBundle.scala 582:48]
  wire  tlb_req_3_valid_hit2 = ptwResp_entry_tag[8:0] == io_tlb_req_3_bits_vpn[8:0]; // @[MMUBundle.scala 583:50]
  wire  _tlb_req_3_valid_T_5 = ptwResp_entry_level == 2'h1 ? tlb_req_3_valid_hit1 & tlb_req_3_valid_hit0 :
    tlb_req_3_valid_hit0; // @[MMUBundle.scala 585:78]
  wire  _tlb_req_3_valid_T_6 = ptwResp_entry_level == 2'h2 ? tlb_req_3_valid_hit2 & tlb_req_3_valid_hit1 &
    tlb_req_3_valid_hit0 : _tlb_req_3_valid_T_5; // @[MMUBundle.scala 585:22]
  wire  _tlb_req_3_valid_T_9 = ~(ptwResp_valid & _tlb_req_3_valid_T_6); // @[Repeater.scala 189:7]
  wire  _tlb_req_3_valid_T_10 = io_tlb_req_3_valid & _tlb_req_3_valid_T_9; // @[Repeater.scala 188:53]
  wire [3:0] _tlb_req_3_valid_T_11 = {lastReqMatchVec_early_3_0,lastReqMatchVec_early_3_1,1'h0,lastReqMatchVec_early_3_3
    }; // @[Cat.scala 31:58]
  wire  _tlb_req_3_valid_T_13 = ~(|_tlb_req_3_valid_T_11); // @[Repeater.scala 190:7]
  wire [3:0] _oldMatchVec_T = {oldMatchVec_early_0_0,oldMatchVec_early_0_1,oldMatchVec_early_0_2,oldMatchVec_early_0_3}; // @[Cat.scala 31:58]
  wire [3:0] _oldMatchVec_T_2 = {oldMatchVec_early_1_0,oldMatchVec_early_1_1,oldMatchVec_early_1_2,oldMatchVec_early_1_3
    }; // @[Cat.scala 31:58]
  wire [3:0] _oldMatchVec_T_6 = {oldMatchVec_early_3_0,oldMatchVec_early_3_1,oldMatchVec_early_3_2,oldMatchVec_early_3_3
    }; // @[Cat.scala 31:58]
  wire  _isFull_T = enqPtr == deqPtr; // @[Repeater.scala 226:23]
  wire  isEmptyDeq = _isFull_T & ~mayFullDeq; // @[Repeater.scala 227:38]
  wire  isEmptyIss = enqPtr == issPtr & ~mayFullIss; // @[Repeater.scala 228:38]
  wire [1:0] _accumEnqNum_T_1 = {{1'd0}, reqs_1_valid}; // @[Bitwise.scala 48:55]
  wire [1:0] _GEN_413 = {{1'd0}, reqs_0_valid}; // @[Bitwise.scala 48:55]
  wire [2:0] _accumEnqNum_T_3 = _GEN_413 + _accumEnqNum_T_1; // @[Bitwise.scala 48:55]
  wire [1:0] accumEnqNum_3 = _accumEnqNum_T_3[1:0]; // @[Bitwise.scala 48:55]
  wire [2:0] _enqPtrVecInit_T = {{1'd0}, enqPtr}; // @[Repeater.scala 230:63]
  wire [1:0] enqPtrVecInit_0 = _enqPtrVecInit_T[1:0]; // @[Repeater.scala 230:63]
  wire [1:0] enqPtrVecInit_1 = enqPtr + 2'h1; // @[Repeater.scala 230:63]
  wire [1:0] enqPtrVecInit_2 = enqPtr + 2'h2; // @[Repeater.scala 230:63]
  wire [1:0] enqPtrVecInit_3 = enqPtr + 2'h3; // @[Repeater.scala 230:63]
  wire [1:0] _GEN_37 = reqs_0_valid ? enqPtrVecInit_1 : enqPtrVecInit_0; // @[Repeater.scala 231:{26,26}]
  wire [1:0] _GEN_38 = 2'h2 == _GEN_413 ? enqPtrVecInit_2 : _GEN_37; // @[Repeater.scala 231:{26,26}]
  wire [1:0] enqPtrVec_1 = 2'h3 == _GEN_413 ? enqPtrVecInit_3 : _GEN_38; // @[Repeater.scala 231:{26,26}]
  wire [1:0] _GEN_45 = 2'h1 == accumEnqNum_3 ? enqPtrVecInit_1 : enqPtrVecInit_0; // @[Repeater.scala 231:{26,26}]
  wire [1:0] _GEN_46 = 2'h2 == accumEnqNum_3 ? enqPtrVecInit_2 : _GEN_45; // @[Repeater.scala 231:{26,26}]
  wire [1:0] enqPtrVec_3 = 2'h3 == accumEnqNum_3 ? enqPtrVecInit_3 : _GEN_46; // @[Repeater.scala 231:{26,26}]
  wire [1:0] _enqNum_fake_T = io_tlb_req_0_valid + io_tlb_req_1_valid; // @[Bitwise.scala 48:55]
  wire [1:0] _enqNum_fake_T_2 = {{1'd0}, io_tlb_req_3_valid}; // @[Bitwise.scala 48:55]
  wire [2:0] enqNum_fake = _enqNum_fake_T + _enqNum_fake_T_2; // @[Bitwise.scala 48:55]
  wire [3:0] _canEnqueue_fake_T = counter + enqNum_fake; // @[Repeater.scala 237:33]
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
  wire  tlb_req_flushed_hit0_3 = io_ptw_resp_bits_entry_tag[26:18] == tlb_req_3_bits_rvpn[26:18]; // @[MMUBundle.scala 581:48]
  wire  tlb_req_flushed_hit1_3 = io_ptw_resp_bits_entry_tag[17:9] == tlb_req_3_bits_rvpn[17:9]; // @[MMUBundle.scala 582:48]
  wire  tlb_req_flushed_hit2_3 = io_ptw_resp_bits_entry_tag[8:0] == tlb_req_3_bits_rvpn[8:0]; // @[MMUBundle.scala 583:50]
  wire  _tlb_req_flushed_T_29 = io_ptw_resp_bits_entry_level == 2'h1 ? tlb_req_flushed_hit1_3 & tlb_req_flushed_hit0_3
     : tlb_req_flushed_hit0_3; // @[MMUBundle.scala 585:78]
  wire  _tlb_req_flushed_T_30 = io_ptw_resp_bits_entry_level == 2'h2 ? tlb_req_flushed_hit2_3 & tlb_req_flushed_hit1_3
     & tlb_req_flushed_hit0_3 : _tlb_req_flushed_T_29; // @[MMUBundle.scala 585:22]
  wire  tlb_req_flushed_3 = io_ptw_resp_valid & _tlb_req_flushed_T_30; // @[Repeater.scala 242:57]
  wire  _issue_valid_T = ~isEmptyIss; // @[Repeater.scala 251:34]
  wire  _GEN_61 = 2'h1 == issPtr ? v_1 : v_0; // @[Repeater.scala 251:{31,31}]
  wire  _GEN_62 = 2'h2 == issPtr ? v_2 : _GEN_61; // @[Repeater.scala 251:{31,31}]
  wire  _GEN_63 = 2'h3 == issPtr ? v_3 : _GEN_62; // @[Repeater.scala 251:{31,31}]
  wire  issue_valid = _GEN_63 & ~isEmptyIss & ~inflight_full; // @[Repeater.scala 251:46]
  wire  issue_filtered_hit0 = ptwResp_entry_tag[26:18] == io_ptw_req_0_bits_vpn[26:18]; // @[MMUBundle.scala 581:48]
  wire  issue_filtered_hit1 = ptwResp_entry_tag[17:9] == io_ptw_req_0_bits_vpn[17:9]; // @[MMUBundle.scala 582:48]
  wire  issue_filtered_hit2 = ptwResp_entry_tag[8:0] == io_ptw_req_0_bits_vpn[8:0]; // @[MMUBundle.scala 583:50]
  wire  _issue_filtered_T_5 = ptwResp_entry_level == 2'h1 ? issue_filtered_hit1 & issue_filtered_hit0 :
    issue_filtered_hit0; // @[MMUBundle.scala 585:78]
  wire  _issue_filtered_T_6 = ptwResp_entry_level == 2'h2 ? issue_filtered_hit2 & issue_filtered_hit1 &
    issue_filtered_hit0 : _issue_filtered_T_5; // @[MMUBundle.scala 585:22]
  wire  issue_filtered = ptwResp_valid & _issue_filtered_T_6; // @[Repeater.scala 252:38]
  wire  issue_fire_fake = issue_valid & io_ptw_req_0_ready; // @[Repeater.scala 253:37]
  wire [26:0] _GEN_65 = 2'h1 == issPtr ? vpn_1 : vpn_0; // @[Repeater.scala 255:{26,26}]
  wire [26:0] _GEN_66 = 2'h2 == issPtr ? vpn_2 : _GEN_65; // @[Repeater.scala 255:{26,26}]
  wire  _GEN_68 = 2'h0 == enqPtrVecInit_0 ? ~tlb_req_flushed_0 : v_0; // @[Repeater.scala 157:18 261:{25,25}]
  wire  _GEN_69 = 2'h1 == enqPtrVecInit_0 ? ~tlb_req_flushed_0 : v_1; // @[Repeater.scala 157:18 261:{25,25}]
  wire  _GEN_70 = 2'h2 == enqPtrVecInit_0 ? ~tlb_req_flushed_0 : v_2; // @[Repeater.scala 157:18 261:{25,25}]
  wire  _GEN_71 = 2'h3 == enqPtrVecInit_0 ? ~tlb_req_flushed_0 : v_3; // @[Repeater.scala 157:18 261:{25,25}]
  wire [26:0] _GEN_72 = 2'h0 == enqPtrVecInit_0 ? tlb_req_0_bits_rvpn : vpn_0; // @[Repeater.scala 159:16 262:{27,27}]
  wire [26:0] _GEN_73 = 2'h1 == enqPtrVecInit_0 ? tlb_req_0_bits_rvpn : vpn_1; // @[Repeater.scala 159:16 262:{27,27}]
  wire [26:0] _GEN_74 = 2'h2 == enqPtrVecInit_0 ? tlb_req_0_bits_rvpn : vpn_2; // @[Repeater.scala 159:16 262:{27,27}]
  wire [26:0] _GEN_75 = 2'h3 == enqPtrVecInit_0 ? tlb_req_0_bits_rvpn : vpn_3; // @[Repeater.scala 159:16 262:{27,27}]
  wire  _GEN_104 = reqs_0_valid & canEnqueue ? _GEN_68 : v_0; // @[Repeater.scala 157:18 260:38]
  wire  _GEN_105 = reqs_0_valid & canEnqueue ? _GEN_69 : v_1; // @[Repeater.scala 157:18 260:38]
  wire  _GEN_106 = reqs_0_valid & canEnqueue ? _GEN_70 : v_2; // @[Repeater.scala 157:18 260:38]
  wire  _GEN_107 = reqs_0_valid & canEnqueue ? _GEN_71 : v_3; // @[Repeater.scala 157:18 260:38]
  wire [26:0] _GEN_108 = reqs_0_valid & canEnqueue ? _GEN_72 : vpn_0; // @[Repeater.scala 159:16 260:38]
  wire [26:0] _GEN_109 = reqs_0_valid & canEnqueue ? _GEN_73 : vpn_1; // @[Repeater.scala 159:16 260:38]
  wire [26:0] _GEN_110 = reqs_0_valid & canEnqueue ? _GEN_74 : vpn_2; // @[Repeater.scala 159:16 260:38]
  wire [26:0] _GEN_111 = reqs_0_valid & canEnqueue ? _GEN_75 : vpn_3; // @[Repeater.scala 159:16 260:38]
  wire  _GEN_140 = 2'h0 == enqPtrVec_1 ? ~tlb_req_flushed_1 : _GEN_104; // @[Repeater.scala 261:{25,25}]
  wire  _GEN_141 = 2'h1 == enqPtrVec_1 ? ~tlb_req_flushed_1 : _GEN_105; // @[Repeater.scala 261:{25,25}]
  wire  _GEN_142 = 2'h2 == enqPtrVec_1 ? ~tlb_req_flushed_1 : _GEN_106; // @[Repeater.scala 261:{25,25}]
  wire  _GEN_143 = 2'h3 == enqPtrVec_1 ? ~tlb_req_flushed_1 : _GEN_107; // @[Repeater.scala 261:{25,25}]
  wire [26:0] _GEN_144 = 2'h0 == enqPtrVec_1 ? tlb_req_1_bits_rvpn : _GEN_108; // @[Repeater.scala 262:{27,27}]
  wire [26:0] _GEN_145 = 2'h1 == enqPtrVec_1 ? tlb_req_1_bits_rvpn : _GEN_109; // @[Repeater.scala 262:{27,27}]
  wire [26:0] _GEN_146 = 2'h2 == enqPtrVec_1 ? tlb_req_1_bits_rvpn : _GEN_110; // @[Repeater.scala 262:{27,27}]
  wire [26:0] _GEN_147 = 2'h3 == enqPtrVec_1 ? tlb_req_1_bits_rvpn : _GEN_111; // @[Repeater.scala 262:{27,27}]
  wire  _GEN_176 = reqs_1_valid & canEnqueue ? _GEN_140 : _GEN_104; // @[Repeater.scala 260:38]
  wire  _GEN_177 = reqs_1_valid & canEnqueue ? _GEN_141 : _GEN_105; // @[Repeater.scala 260:38]
  wire  _GEN_178 = reqs_1_valid & canEnqueue ? _GEN_142 : _GEN_106; // @[Repeater.scala 260:38]
  wire  _GEN_179 = reqs_1_valid & canEnqueue ? _GEN_143 : _GEN_107; // @[Repeater.scala 260:38]
  wire [26:0] _GEN_180 = reqs_1_valid & canEnqueue ? _GEN_144 : _GEN_108; // @[Repeater.scala 260:38]
  wire [26:0] _GEN_181 = reqs_1_valid & canEnqueue ? _GEN_145 : _GEN_109; // @[Repeater.scala 260:38]
  wire [26:0] _GEN_182 = reqs_1_valid & canEnqueue ? _GEN_146 : _GEN_110; // @[Repeater.scala 260:38]
  wire [26:0] _GEN_183 = reqs_1_valid & canEnqueue ? _GEN_147 : _GEN_111; // @[Repeater.scala 260:38]
  wire  _GEN_284 = 2'h0 == enqPtrVec_3 ? ~tlb_req_flushed_3 : _GEN_176; // @[Repeater.scala 261:{25,25}]
  wire  _GEN_285 = 2'h1 == enqPtrVec_3 ? ~tlb_req_flushed_3 : _GEN_177; // @[Repeater.scala 261:{25,25}]
  wire  _GEN_286 = 2'h2 == enqPtrVec_3 ? ~tlb_req_flushed_3 : _GEN_178; // @[Repeater.scala 261:{25,25}]
  wire  _GEN_287 = 2'h3 == enqPtrVec_3 ? ~tlb_req_flushed_3 : _GEN_179; // @[Repeater.scala 261:{25,25}]
  wire  _GEN_320 = reqs_3_valid & canEnqueue ? _GEN_284 : _GEN_176; // @[Repeater.scala 260:38]
  wire  _GEN_321 = reqs_3_valid & canEnqueue ? _GEN_285 : _GEN_177; // @[Repeater.scala 260:38]
  wire  _GEN_322 = reqs_3_valid & canEnqueue ? _GEN_286 : _GEN_178; // @[Repeater.scala 260:38]
  wire  _GEN_323 = reqs_3_valid & canEnqueue ? _GEN_287 : _GEN_179; // @[Repeater.scala 260:38]
  wire [3:0] _do_enq_T = {reqs_0_valid,reqs_1_valid,1'h0,reqs_3_valid}; // @[Cat.scala 31:58]
  wire  do_enq = canEnqueue & |_do_enq_T; // @[Repeater.scala 273:27]
  wire  _GEN_373 = 2'h1 == deqPtr ? v_1 : v_0; // @[Repeater.scala 274:{17,17}]
  wire  _GEN_374 = 2'h2 == deqPtr ? v_2 : _GEN_373; // @[Repeater.scala 274:{17,17}]
  wire  _GEN_375 = 2'h3 == deqPtr ? v_3 : _GEN_374; // @[Repeater.scala 274:{17,17}]
  wire  do_deq = ~_GEN_375 & ~isEmptyDeq; // @[Repeater.scala 274:28]
  wire  do_iss = issue_fire_fake | ~_GEN_63 & _issue_valid_T; // @[Repeater.scala 275:32]
  wire [2:0] _enqPtr_T_1 = _enqPtrVecInit_T + enqNum; // @[Repeater.scala 277:22]
  wire [2:0] _GEN_376 = do_enq ? _enqPtr_T_1 : {{1'd0}, enqPtr}; // @[Repeater.scala 276:17 277:12 161:23]
  wire [1:0] _deqPtr_T_1 = deqPtr + 2'h1; // @[Repeater.scala 280:22]
  wire [1:0] _issPtr_T_1 = issPtr + 2'h1; // @[Repeater.scala 283:22]
  wire  _GEN_379 = 2'h0 == issPtr ? 1'h0 : _GEN_320; // @[Repeater.scala 286:{15,15}]
  wire  _GEN_380 = 2'h1 == issPtr ? 1'h0 : _GEN_321; // @[Repeater.scala 286:{15,15}]
  wire  _GEN_381 = 2'h2 == issPtr ? 1'h0 : _GEN_322; // @[Repeater.scala 286:{15,15}]
  wire  _GEN_382 = 2'h3 == issPtr ? 1'h0 : _GEN_323; // @[Repeater.scala 286:{15,15}]
  wire  _GEN_383 = issue_fire_fake & issue_filtered ? _GEN_379 : _GEN_320; // @[Repeater.scala 285:44]
  wire  _GEN_384 = issue_fire_fake & issue_filtered ? _GEN_380 : _GEN_321; // @[Repeater.scala 285:44]
  wire  _GEN_385 = issue_fire_fake & issue_filtered ? _GEN_381 : _GEN_322; // @[Repeater.scala 285:44]
  wire  _GEN_386 = issue_fire_fake & issue_filtered ? _GEN_382 : _GEN_323; // @[Repeater.scala 285:44]
  wire [2:0] _GEN_417 = {{2'd0}, do_deq}; // @[Repeater.scala 299:22]
  wire [2:0] _counter_T_1 = counter - _GEN_417; // @[Repeater.scala 299:22]
  wire [2:0] _counter_T_2 = do_enq ? enqNum : 3'h0; // @[Repeater.scala 299:36]
  wire [2:0] _counter_T_4 = _counter_T_1 + _counter_T_2; // @[Repeater.scala 299:31]
  wire [2:0] _GEN_402 = flush_delay_io_out ? 3'h0 : _GEN_376; // @[Repeater.scala 310:16 313:12]
  DelayN_6 flush_delay ( // @[Hold.scala 97:23]
    .clock(flush_delay_clock),
    .io_in(flush_delay_io_in),
    .io_out(flush_delay_io_out)
  );
  assign io_tlb_req_0_ready = _canEnqueue_fake_T <= 4'h4; // @[Repeater.scala 237:48]
  assign io_tlb_req_1_ready = _canEnqueue_fake_T <= 4'h4; // @[Repeater.scala 237:48]
  assign io_tlb_req_3_ready = _canEnqueue_fake_T <= 4'h4; // @[Repeater.scala 237:48]
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
  assign io_ptw_req_0_valid = issue_valid & ~issue_filtered; // @[Repeater.scala 254:38]
  assign io_ptw_req_0_bits_vpn = 2'h3 == issPtr ? vpn_3 : _GEN_66; // @[Repeater.scala 255:{26,26}]
  assign io_ptw_resp_ready = 1'h1; // @[Repeater.scala 256:21]
  assign flush_delay_clock = clock;
  assign flush_delay_io_in = io_sfence_valid | io_csr_satp_changed; // @[Repeater.scala 168:38]
  always @(posedge clock) begin
    if (reqs_3_valid & canEnqueue) begin // @[Repeater.scala 260:38]
      if (2'h0 == enqPtrVec_3) begin // @[Repeater.scala 262:27]
        vpn_0 <= tlb_req_3_bits_rvpn; // @[Repeater.scala 262:27]
      end else begin
        vpn_0 <= _GEN_180;
      end
    end else begin
      vpn_0 <= _GEN_180;
    end
    if (reqs_3_valid & canEnqueue) begin // @[Repeater.scala 260:38]
      if (2'h1 == enqPtrVec_3) begin // @[Repeater.scala 262:27]
        vpn_1 <= tlb_req_3_bits_rvpn; // @[Repeater.scala 262:27]
      end else begin
        vpn_1 <= _GEN_181;
      end
    end else begin
      vpn_1 <= _GEN_181;
    end
    if (reqs_3_valid & canEnqueue) begin // @[Repeater.scala 260:38]
      if (2'h2 == enqPtrVec_3) begin // @[Repeater.scala 262:27]
        vpn_2 <= tlb_req_3_bits_rvpn; // @[Repeater.scala 262:27]
      end else begin
        vpn_2 <= _GEN_182;
      end
    end else begin
      vpn_2 <= _GEN_182;
    end
    if (reqs_3_valid & canEnqueue) begin // @[Repeater.scala 260:38]
      if (2'h3 == enqPtrVec_3) begin // @[Repeater.scala 262:27]
        vpn_3 <= tlb_req_3_bits_rvpn; // @[Repeater.scala 262:27]
      end else begin
        vpn_3 <= _GEN_183;
      end
    end else begin
      vpn_3 <= _GEN_183;
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
    newMatchVec_REG_4 <= io_tlb_req_1_bits_vpn == io_tlb_req_0_bits_vpn; // @[Repeater.scala 185:78]
    if (io_tlb_req_3_valid) begin // @[Reg.scala 17:18]
      tlb_req_3_bits_rvpn <= io_tlb_req_3_bits_vpn; // @[Reg.scala 17:22]
    end
    oldMatchVec_3 <= |_oldMatchVec_T_6; // @[Repeater.scala 195:63]
    newMatchVec_REG_12 <= io_tlb_req_3_bits_vpn == io_tlb_req_0_bits_vpn; // @[Repeater.scala 185:78]
    newMatchVec_REG_13 <= io_tlb_req_3_bits_vpn == io_tlb_req_1_bits_vpn; // @[Repeater.scala 185:78]
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
        v_0 <= _GEN_383;
      end
    end else begin
      v_0 <= _GEN_383;
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
        v_1 <= _GEN_384;
      end
    end else begin
      v_1 <= _GEN_384;
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
        v_2 <= _GEN_385;
      end
    end else begin
      v_2 <= _GEN_385;
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
        v_3 <= _GEN_386;
      end
    end else begin
      v_3 <= _GEN_386;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Repeater.scala 161:23]
      enqPtr <= 2'h0; // @[Repeater.scala 161:23]
    end else begin
      enqPtr <= _GEN_402[1:0];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Repeater.scala 310:16]
      issPtr <= 2'h0; // @[Repeater.scala 314:12]
    end else if (flush_delay_io_out) begin // @[Repeater.scala 282:17]
      issPtr <= 2'h0; // @[Repeater.scala 283:12]
    end else if (do_iss) begin // @[Repeater.scala 162:23]
      issPtr <= _issPtr_T_1;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Repeater.scala 310:16]
      deqPtr <= 2'h0; // @[Repeater.scala 312:12]
    end else if (flush_delay_io_out) begin // @[Repeater.scala 279:17]
      deqPtr <= 2'h0; // @[Repeater.scala 280:12]
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
      counter <= 3'h0; // @[Repeater.scala 318:13]
    end else if (flush_delay_io_out) begin // @[Repeater.scala 299:11]
      counter <= 3'h0;
    end else begin
      counter <= _counter_T_4;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Repeater.scala 310:16]
      inflight_counter <= 3'h0; // @[Repeater.scala 319:22]
    end else if (flush_delay_io_out) begin // @[Repeater.scala 174:54]
      inflight_counter <= 3'h0; // @[Repeater.scala 175:28]
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
  vpn_0 = _RAND_4[26:0];
  _RAND_5 = {1{`RANDOM}};
  vpn_1 = _RAND_5[26:0];
  _RAND_6 = {1{`RANDOM}};
  vpn_2 = _RAND_6[26:0];
  _RAND_7 = {1{`RANDOM}};
  vpn_3 = _RAND_7[26:0];
  _RAND_8 = {1{`RANDOM}};
  enqPtr = _RAND_8[1:0];
  _RAND_9 = {1{`RANDOM}};
  issPtr = _RAND_9[1:0];
  _RAND_10 = {1{`RANDOM}};
  deqPtr = _RAND_10[1:0];
  _RAND_11 = {1{`RANDOM}};
  mayFullDeq = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  mayFullIss = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  counter = _RAND_13[2:0];
  _RAND_14 = {1{`RANDOM}};
  inflight_counter = _RAND_14[2:0];
  _RAND_15 = {1{`RANDOM}};
  ptwResp_entry_tag = _RAND_15[26:0];
  _RAND_16 = {1{`RANDOM}};
  ptwResp_entry_asid = _RAND_16[15:0];
  _RAND_17 = {1{`RANDOM}};
  ptwResp_entry_ppn = _RAND_17[23:0];
  _RAND_18 = {1{`RANDOM}};
  ptwResp_entry_perm_d = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  ptwResp_entry_perm_a = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  ptwResp_entry_perm_g = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  ptwResp_entry_perm_u = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  ptwResp_entry_perm_x = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  ptwResp_entry_perm_w = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  ptwResp_entry_perm_r = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  ptwResp_entry_level = _RAND_25[1:0];
  _RAND_26 = {1{`RANDOM}};
  ptwResp_pf = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  ptwResp_af = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  ptwResp_valid = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  tlb_req_0_bits_rvpn = _RAND_29[26:0];
  _RAND_30 = {1{`RANDOM}};
  tlb_req_0_valid_REG = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  oldMatchVec_0 = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  tlb_req_1_bits_rvpn = _RAND_32[26:0];
  _RAND_33 = {1{`RANDOM}};
  oldMatchVec_1 = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  newMatchVec_REG_4 = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  tlb_req_1_valid_REG = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  tlb_req_3_bits_rvpn = _RAND_36[26:0];
  _RAND_37 = {1{`RANDOM}};
  oldMatchVec_3 = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  newMatchVec_REG_12 = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  newMatchVec_REG_13 = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  tlb_req_3_valid_REG = _RAND_40[0:0];
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
    enqPtr = 2'h0;
  end
  if (reset) begin
    issPtr = 2'h0;
  end
  if (reset) begin
    deqPtr = 2'h0;
  end
  if (reset) begin
    mayFullDeq = 1'h0;
  end
  if (reset) begin
    mayFullIss = 1'h0;
  end
  if (reset) begin
    counter = 3'h0;
  end
  if (reset) begin
    inflight_counter = 3'h0;
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
    tlb_req_3_valid_REG = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

