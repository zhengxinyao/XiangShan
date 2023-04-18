module MSHR(
  input         clock,
  input         reset,
  input  [3:0]  io_id,
  input         io_enable,
  input         io_alloc_valid,
  input  [2:0]  io_alloc_bits_channel,
  input  [2:0]  io_alloc_bits_opcode,
  input  [2:0]  io_alloc_bits_param,
  input  [2:0]  io_alloc_bits_size,
  input  [5:0]  io_alloc_bits_source,
  input  [9:0]  io_alloc_bits_set,
  input  [19:0] io_alloc_bits_tag,
  input  [5:0]  io_alloc_bits_off,
  input  [31:0] io_alloc_bits_mask,
  input  [2:0]  io_alloc_bits_bufIdx,
  input         io_alloc_bits_preferCache,
  input         io_alloc_bits_dirty,
  input         io_alloc_bits_fromProbeHelper,
  input         io_alloc_bits_fromCmoHelper,
  input         io_alloc_bits_needProbeAckData,
  output        io_status_valid,
  output [9:0]  io_status_bits_set,
  output [19:0] io_status_bits_tag,
  output [2:0]  io_status_bits_way,
  output [2:0]  io_status_bits_way_reg,
  output        io_status_bits_nestB,
  output        io_status_bits_nestC,
  output        io_status_bits_will_grant_data,
  output        io_status_bits_will_save_data,
  output        io_status_bits_will_free,
  input         io_resps_sink_c_valid,
  input         io_resps_sink_c_bits_hasData,
  input  [2:0]  io_resps_sink_c_bits_param,
  input  [5:0]  io_resps_sink_c_bits_source,
  input         io_resps_sink_c_bits_last,
  input  [2:0]  io_resps_sink_c_bits_bufIdx,
  input         io_resps_sink_d_valid,
  input  [2:0]  io_resps_sink_d_bits_opcode,
  input  [2:0]  io_resps_sink_d_bits_param,
  input  [2:0]  io_resps_sink_d_bits_sink,
  input         io_resps_sink_d_bits_last,
  input         io_resps_sink_d_bits_denied,
  input  [2:0]  io_resps_sink_d_bits_bufIdx,
  input         io_resps_sink_e_valid,
  input         io_resps_source_d_valid,
  input  [9:0]  io_nestedwb_set,
  input  [19:0] io_nestedwb_tag,
  input         io_nestedwb_btoN,
  input         io_nestedwb_btoB,
  input         io_nestedwb_bclr_dirty,
  input         io_nestedwb_bset_dirty,
  input         io_nestedwb_c_set_dirty,
  input         io_nestedwb_c_set_hit,
  input         io_nestedwb_clients_0_isToN,
  input         io_nestedwb_clients_1_isToN,
  input         io_tasks_sink_a_ready,
  output        io_tasks_sink_a_valid,
  output [5:0]  io_tasks_sink_a_bits_sourceId,
  output [9:0]  io_tasks_sink_a_bits_set,
  output [19:0] io_tasks_sink_a_bits_tag,
  output [2:0]  io_tasks_sink_a_bits_size,
  output [5:0]  io_tasks_sink_a_bits_off,
  input         io_tasks_source_bready,
  output        io_tasks_source_bvalid,
  output [9:0]  io_tasks_source_bset,
  output [19:0] io_tasks_source_btag,
  output [2:0]  io_tasks_source_bparam,
  output [1:0]  io_tasks_source_bclients,
  output        io_tasks_source_bneedData,
  input         io_tasks_sink_c_ready,
  output        io_tasks_sink_c_valid,
  output [5:0]  io_tasks_sink_c_bits_sourceId,
  output [9:0]  io_tasks_sink_c_bits_set,
  output [19:0] io_tasks_sink_c_bits_tag,
  output [2:0]  io_tasks_sink_c_bits_size,
  output [2:0]  io_tasks_sink_c_bits_way,
  output [5:0]  io_tasks_sink_c_bits_off,
  output [2:0]  io_tasks_sink_c_bits_bufIdx,
  output [2:0]  io_tasks_sink_c_bits_opcode,
  output [2:0]  io_tasks_sink_c_bits_param,
  output [3:0]  io_tasks_sink_c_bits_source,
  output        io_tasks_sink_c_bits_save,
  output        io_tasks_sink_c_bits_drop,
  output        io_tasks_sink_c_bits_release,
  output        io_tasks_sink_c_bits_dirty,
  input         io_tasks_source_d_ready,
  output        io_tasks_source_d_valid,
  output [5:0]  io_tasks_source_d_bits_sourceId,
  output [9:0]  io_tasks_source_d_bits_set,
  output [19:0] io_tasks_source_d_bits_tag,
  output [2:0]  io_tasks_source_d_bits_channel,
  output [2:0]  io_tasks_source_d_bits_opcode,
  output [2:0]  io_tasks_source_d_bits_param,
  output [2:0]  io_tasks_source_d_bits_size,
  output [2:0]  io_tasks_source_d_bits_way,
  output [5:0]  io_tasks_source_d_bits_off,
  output        io_tasks_source_d_bits_useBypass,
  output [2:0]  io_tasks_source_d_bits_bufIdx,
  output        io_tasks_source_d_bits_denied,
  output [3:0]  io_tasks_source_d_bits_sinkId,
  output        io_tasks_source_d_bits_bypassPut,
  output        io_tasks_source_d_bits_dirty,
  input         io_tasks_source_a_ready,
  output        io_tasks_source_a_valid,
  output [19:0] io_tasks_source_a_bits_tag,
  output [9:0]  io_tasks_source_a_bits_set,
  output [5:0]  io_tasks_source_a_bits_off,
  output [31:0] io_tasks_source_a_bits_mask,
  output [2:0]  io_tasks_source_a_bits_opcode,
  output [2:0]  io_tasks_source_a_bits_param,
  output [3:0]  io_tasks_source_a_bits_source,
  output [2:0]  io_tasks_source_a_bits_bufIdx,
  output [2:0]  io_tasks_source_a_bits_size,
  output        io_tasks_source_a_bits_needData,
  output        io_tasks_source_a_bits_putData,
  input         io_tasks_source_c_ready,
  output        io_tasks_source_c_valid,
  output [2:0]  io_tasks_source_c_bits_opcode,
  output [19:0] io_tasks_source_c_bits_tag,
  output [9:0]  io_tasks_source_c_bits_set,
  output [2:0]  io_tasks_source_c_bits_param,
  output [3:0]  io_tasks_source_c_bits_source,
  output [2:0]  io_tasks_source_c_bits_way,
  output        io_tasks_source_c_bits_dirty,
  input         io_tasks_source_e_ready,
  output        io_tasks_source_e_valid,
  output [2:0]  io_tasks_source_e_bits_sink,
  input         io_tasks_dir_write_ready,
  output        io_tasks_dir_write_valid,
  output [9:0]  io_tasks_dir_write_bits_set,
  output [2:0]  io_tasks_dir_write_bits_way,
  output        io_tasks_dir_write_bits_data_dirty,
  output [1:0]  io_tasks_dir_write_bits_data_state,
  output [1:0]  io_tasks_dir_write_bits_data_clientStates_0,
  output [1:0]  io_tasks_dir_write_bits_data_clientStates_1,
  input         io_tasks_tag_write_ready,
  output        io_tasks_tag_write_valid,
  output [9:0]  io_tasks_tag_write_bits_set,
  output [2:0]  io_tasks_tag_write_bits_way,
  output [19:0] io_tasks_tag_write_bits_tag,
  input         io_tasks_client_dir_write_ready,
  output        io_tasks_client_dir_write_valid,
  output [6:0]  io_tasks_client_dir_write_bits_set,
  output [3:0]  io_tasks_client_dir_write_bits_way,
  output [1:0]  io_tasks_client_dir_write_bits_data_0_state,
  output [1:0]  io_tasks_client_dir_write_bits_data_1_state,
  input         io_tasks_client_tag_write_ready,
  output        io_tasks_client_tag_write_valid,
  output [6:0]  io_tasks_client_tag_write_bits_set,
  output [3:0]  io_tasks_client_tag_write_bits_way,
  output [22:0] io_tasks_client_tag_write_bits_tag,
  input         io_dirResult_valid,
  input         io_dirResult_bits_self_dirty,
  input  [1:0]  io_dirResult_bits_self_state,
  input  [1:0]  io_dirResult_bits_self_clientStates_0,
  input  [1:0]  io_dirResult_bits_self_clientStates_1,
  input         io_dirResult_bits_self_hit,
  input  [2:0]  io_dirResult_bits_self_way,
  input  [19:0] io_dirResult_bits_self_tag,
  input  [1:0]  io_dirResult_bits_clients_states_0_state,
  input         io_dirResult_bits_clients_states_0_hit,
  input  [1:0]  io_dirResult_bits_clients_states_1_state,
  input         io_dirResult_bits_clients_states_1_hit,
  input  [22:0] io_dirResult_bits_clients_tag,
  input  [3:0]  io_dirResult_bits_clients_way,
  input  [9:0]  io_c_status_set,
  input  [19:0] io_c_status_tag,
  input  [2:0]  io_c_status_way,
  input         io_c_status_nestedReleaseData,
  output        io_c_status_releaseThrough,
  input  [9:0]  io_bstatus_set,
  input  [19:0] io_bstatus_tag,
  input  [2:0]  io_bstatus_way,
  input         io_bstatus_nestedProbeAckData,
  input         io_bstatus_probeHelperFinish,
  output        io_bstatus_probeAckDataThrough,
  input         io_releaseThrough,
  input         io_probeAckDataThrough,
  output        io_is_nestedReleaseData,
  output        io_is_nestedProbeAckData,
  output        io_probeHelperFinish
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
`endif // RANDOMIZE_REG_INIT
  reg [2:0] req_channel; // @[MSHR.scala 51:16]
  reg [2:0] req_opcode; // @[MSHR.scala 51:16]
  reg [2:0] req_param; // @[MSHR.scala 51:16]
  reg [2:0] req_size; // @[MSHR.scala 51:16]
  reg [5:0] req_source; // @[MSHR.scala 51:16]
  reg [9:0] req_set; // @[MSHR.scala 51:16]
  reg [19:0] req_tag; // @[MSHR.scala 51:16]
  reg [5:0] req_off; // @[MSHR.scala 51:16]
  reg [31:0] req_mask; // @[MSHR.scala 51:16]
  reg [2:0] req_bufIdx; // @[MSHR.scala 51:16]
  reg  req_preferCache; // @[MSHR.scala 51:16]
  reg  req_dirty; // @[MSHR.scala 51:16]
  reg  req_fromProbeHelper; // @[MSHR.scala 51:16]
  reg  req_fromCmoHelper; // @[MSHR.scala 51:16]
  reg  req_needProbeAckData; // @[MSHR.scala 51:16]
  reg  req_valid; // @[MSHR.scala 52:26]
  reg [1:0] iam; // @[MSHR.scala 53:16]
  reg  meta_reg_self_dirty; // @[MSHR.scala 54:21]
  reg [1:0] meta_reg_self_state; // @[MSHR.scala 54:21]
  reg [1:0] meta_reg_self_clientStates_0; // @[MSHR.scala 54:21]
  reg [1:0] meta_reg_self_clientStates_1; // @[MSHR.scala 54:21]
  reg  meta_reg_self_hit; // @[MSHR.scala 54:21]
  reg [2:0] meta_reg_self_way; // @[MSHR.scala 54:21]
  reg [19:0] meta_reg_self_tag; // @[MSHR.scala 54:21]
  reg [1:0] meta_reg_clients_states_0_state; // @[MSHR.scala 54:21]
  reg  meta_reg_clients_states_0_hit; // @[MSHR.scala 54:21]
  reg [1:0] meta_reg_clients_states_1_state; // @[MSHR.scala 54:21]
  reg  meta_reg_clients_states_1_hit; // @[MSHR.scala 54:21]
  reg [22:0] meta_reg_clients_tag; // @[MSHR.scala 54:21]
  reg [3:0] meta_reg_clients_way; // @[MSHR.scala 54:21]
  reg  meta_valid; // @[MSHR.scala 57:27]
  wire  _GEN_0 = io_dirResult_valid | meta_valid; // @[MSHR.scala 66:28 67:16 57:27]
  wire  _GEN_2 = io_dirResult_valid ? io_dirResult_bits_self_dirty : meta_reg_self_dirty; // @[MSHR.scala 66:28 68:14 54:21]
  wire [1:0] _GEN_3 = io_dirResult_valid ? io_dirResult_bits_self_state : meta_reg_self_state; // @[MSHR.scala 66:28 68:14 54:21]
  wire [1:0] _GEN_4 = io_dirResult_valid ? io_dirResult_bits_self_clientStates_0 : meta_reg_self_clientStates_0; // @[MSHR.scala 66:28 68:14 54:21]
  wire [1:0] _GEN_5 = io_dirResult_valid ? io_dirResult_bits_self_clientStates_1 : meta_reg_self_clientStates_1; // @[MSHR.scala 66:28 68:14 54:21]
  wire  _GEN_6 = io_dirResult_valid ? io_dirResult_bits_self_hit : meta_reg_self_hit; // @[MSHR.scala 66:28 68:14 54:21]
  wire [2:0] _GEN_7 = io_dirResult_valid ? io_dirResult_bits_self_way : meta_reg_self_way; // @[MSHR.scala 66:28 68:14 54:21]
  wire [19:0] _GEN_8 = io_dirResult_valid ? io_dirResult_bits_self_tag : meta_reg_self_tag; // @[MSHR.scala 66:28 68:14 54:21]
  wire  _GEN_9 = 1'h0; // @[MSHR.scala 66:28 68:14 54:21]
  wire [1:0] _GEN_10 = io_dirResult_valid ? io_dirResult_bits_clients_states_0_state : meta_reg_clients_states_0_state; // @[MSHR.scala 66:28 68:14 54:21]
  wire  _GEN_11 = io_dirResult_valid ? io_dirResult_bits_clients_states_0_hit : meta_reg_clients_states_0_hit; // @[MSHR.scala 66:28 68:14 54:21]
  wire [1:0] _GEN_12 = io_dirResult_valid ? io_dirResult_bits_clients_states_1_state : meta_reg_clients_states_1_state; // @[MSHR.scala 66:28 68:14 54:21]
  wire  _GEN_13 = io_dirResult_valid ? io_dirResult_bits_clients_states_1_hit : meta_reg_clients_states_1_hit; // @[MSHR.scala 66:28 68:14 54:21]
  wire [22:0] _GEN_15 = io_dirResult_valid ? io_dirResult_bits_clients_tag : meta_reg_clients_tag; // @[MSHR.scala 66:28 68:14 54:21]
  wire  _req_acquire_T = req_opcode == 3'h6; // @[MSHR.scala 80:32]
  wire  _req_acquire_T_1 = req_opcode == 3'h7; // @[MSHR.scala 80:63]
  wire  req_acquire = req_opcode == 3'h6 | req_opcode == 3'h7; // @[MSHR.scala 80:49]
  wire  req_put = req_opcode[2:1] == 2'h0; // @[MSHR.scala 81:33]
  wire  _req_needT_T_2 = req_opcode == 3'h5; // @[MetaData.scala 36:13]
  wire  _req_needT_T_3 = req_param == 3'h1; // @[MetaData.scala 36:42]
  wire  _req_needT_T_4 = req_opcode == 3'h5 & req_param == 3'h1; // @[MetaData.scala 36:33]
  wire  _req_needT_T_5 = ~req_opcode[2] | _req_needT_T_4; // @[MetaData.scala 35:16]
  wire  _req_needT_T_9 = req_param != 3'h0; // @[MetaData.scala 37:89]
  wire  _req_needT_T_10 = req_acquire & req_param != 3'h0; // @[MetaData.scala 37:80]
  wire  req_needT = _req_needT_T_5 | _req_needT_T_10; // @[MetaData.scala 36:70]
  reg  promoteT_safe; // @[MSHR.scala 83:30]
  reg  gotT; // @[MSHR.scala 84:21]
  reg  a_do_release; // @[MSHR.scala 86:29]
  reg  a_do_probe; // @[MSHR.scala 87:27]
  wire [1:0] meta_self_clientStates_0 = _GEN_4; // @[MSHR.scala 70:14]
  wire  _meta_no_clients_T = meta_self_clientStates_0 == 2'h0; // @[MSHR.scala 88:58]
  wire [1:0] meta_self_clientStates_1 = _GEN_5; // @[MSHR.scala 70:14]
  wire  _meta_no_clients_T_1 = meta_self_clientStates_1 == 2'h0; // @[MSHR.scala 88:58]
  wire [1:0] _meta_no_clients_T_2 = {_meta_no_clients_T,_meta_no_clients_T_1}; // @[Cat.scala 31:58]
  wire  meta_no_clients = &_meta_no_clients_T_2; // @[MSHR.scala 88:76]
  wire [1:0] meta_self_state = _GEN_3; // @[MSHR.scala 70:14]
  wire  _req_promoteT_T = meta_self_state == 2'h3; // @[MSHR.scala 91:40]
  wire  _req_promoteT_T_1 = meta_no_clients & meta_self_state == 2'h3; // @[MSHR.scala 91:21]
  wire  _req_promoteT_T_2 = gotT & promoteT_safe; // @[MSHR.scala 92:10]
  wire  meta_self_hit = _GEN_6; // @[MSHR.scala 70:14]
  wire  _req_promoteT_T_3 = meta_self_hit ? _req_promoteT_T_1 : _req_promoteT_T_2; // @[MSHR.scala 89:40]
  wire  req_promoteT = req_acquire & _req_promoteT_T_3; // @[MSHR.scala 89:34]
  reg  probe_dirty; // @[MSHR.scala 94:28]
  reg [1:0] probes_done; // @[MSHR.scala 95:28]
  wire  _client_shrink_perm_T_1 = req_param == 3'h2; // @[MetaData.scala 48:43]
  wire  _client_shrink_perm_T_4 = _req_needT_T_3 | req_param == 3'h2 | req_param == 3'h5; // @[MetaData.scala 48:66]
  wire [1:0] meta_clients_states_0_state = _GEN_10; // @[MSHR.scala 70:14]
  wire [1:0] meta_clients_states_1_state = _GEN_12; // @[MSHR.scala 70:14]
  wire [1:0] _GEN_23 = iam[0] ? meta_clients_states_1_state : meta_clients_states_0_state; // @[MSHR.scala 97:{49,49}]
  wire  _client_shrink_perm_T_8 = req_param == 3'h0; // @[MetaData.scala 51:11]
  wire  _client_shrink_perm_T_10 = req_param == 3'h0 | req_param == 3'h4; // @[MetaData.scala 51:34]
  wire  client_shrink_perm = _client_shrink_perm_T_4 & _GEN_23 != 2'h0 | _client_shrink_perm_T_10 & _GEN_23[1]; // @[MSHR.scala 97:61]
  wire  meta_clients_states_1_hit = _GEN_13; // @[MSHR.scala 70:14]
  wire  meta_clients_states_0_hit = _GEN_11; // @[MSHR.scala 70:14]
  wire [1:0] _clients_hit_T = {meta_clients_states_1_hit,meta_clients_states_0_hit}; // @[MSHR.scala 98:54]
  wire  clients_hit = |_clients_hit_T; // @[MSHR.scala 98:61]
  wire  _other_clients_hit_T = 2'h0 != iam; // @[MSHR.scala 100:27]
  wire  _other_clients_hit_T_1 = 2'h0 != iam & meta_clients_states_0_hit; // @[MSHR.scala 100:35]
  wire  _other_clients_hit_T_2 = 2'h1 != iam; // @[MSHR.scala 100:27]
  wire  _other_clients_hit_T_3 = 2'h1 != iam & meta_clients_states_1_hit; // @[MSHR.scala 100:35]
  wire [1:0] _other_clients_hit_T_4 = {_other_clients_hit_T_3,_other_clients_hit_T_1}; // @[MSHR.scala 101:6]
  wire  other_clients_hit = |_other_clients_hit_T_4; // @[MSHR.scala 101:13]
  wire  _clients_have_T_T_1 = meta_clients_states_0_hit & meta_clients_states_0_state[1]; // @[MSHR.scala 103:27]
  wire  _clients_have_T_T_3 = meta_clients_states_1_hit & meta_clients_states_1_state[1]; // @[MSHR.scala 103:27]
  wire [1:0] _clients_have_T_T_4 = {_clients_have_T_T_3,_clients_have_T_T_1}; // @[MSHR.scala 104:6]
  wire  clients_have_T = |_clients_have_T_T_4; // @[MSHR.scala 104:13]
  wire  _GEN_27 = iam[0] ? meta_clients_states_1_hit : meta_clients_states_0_hit; // @[MSHR.scala 110:{56,56}]
  wire  _highest_perm_T = ~io_probeAckDataThrough; // @[MSHR.scala 113:30]
  wire [1:0] _highest_perm_T_2 = meta_self_hit & ~io_probeAckDataThrough ? meta_self_state : 2'h0; // @[MSHR.scala 113:12]
  wire [1:0] _highest_perm_T_3 = meta_clients_states_0_hit ? meta_clients_states_0_state : 2'h0; // @[MSHR.scala 114:32]
  wire [1:0] _highest_perm_T_4 = meta_clients_states_1_hit ? meta_clients_states_1_state : 2'h0; // @[MSHR.scala 114:32]
  wire [1:0] _highest_perm_T_6 = _highest_perm_T_3 > _highest_perm_T_4 ? _highest_perm_T_3 : _highest_perm_T_4; // @[ParallelMux.scala 78:45]
  wire [1:0] highest_perm = _highest_perm_T_2 > _highest_perm_T_6 ? _highest_perm_T_2 : _highest_perm_T_6; // @[ParallelMux.scala 78:45]
  reg [1:0] highest_perm_reg_reg; // @[MSHR.scala 1418:24]
  reg  w_probeacklast; // @[MSHR.scala 545:31]
  reg  w_grantlast; // @[MSHR.scala 548:28]
  reg  w_releaseack; // @[MSHR.scala 550:29]
  reg  w_grantack; // @[MSHR.scala 551:27]
  reg  w_putwritten; // @[MSHR.scala 552:29]
  wire  no_wait = w_probeacklast & w_grantlast & w_releaseack & w_grantack & w_putwritten; // @[MSHR.scala 923:77]
  reg  s_probeack; // @[MSHR.scala 531:27]
  reg  s_execute; // @[MSHR.scala 532:26]
  reg  s_grantack; // @[MSHR.scala 533:27]
  reg  no_schedule_REG; // @[MSHR.scala 1396:12]
  wire  _no_schedule_T_6 = s_probeack & s_execute & s_grantack & no_schedule_REG; // @[MSHR.scala 1395:59]
  reg  s_writerelease; // @[MSHR.scala 539:31]
  wire  _no_schedule_T_7 = _no_schedule_T_6 & s_writerelease; // @[MSHR.scala 1396:99]
  reg  s_writeprobe; // @[MSHR.scala 540:29]
  wire  _no_schedule_T_8 = _no_schedule_T_7 & s_writeprobe; // @[MSHR.scala 1397:20]
  reg  s_transferput; // @[MSHR.scala 538:30]
  wire  no_schedule = _no_schedule_T_8 & s_transferput; // @[MSHR.scala 1399:37]
  wire  will_be_free = no_wait & no_schedule; // @[MSHR.scala 1401:27]
  wire [1:0] highest_perm_reg = highest_perm | highest_perm_reg_reg; // @[MSHR.scala 1424:19]
  wire [1:0] _highest_perm_except_me_T = meta_self_hit ? meta_self_state : 2'h0; // @[MSHR.scala 118:12]
  wire  _highest_perm_except_me_T_1 = iam == 2'h0; // @[MSHR.scala 121:34]
  wire [1:0] _highest_perm_except_me_T_6 = req_acquire & iam == 2'h0 ? 2'h0 : _highest_perm_T_3; // @[MSHR.scala 121:14]
  wire  _highest_perm_except_me_T_7 = iam == 2'h1; // @[MSHR.scala 121:34]
  wire [1:0] _highest_perm_except_me_T_12 = req_acquire & iam == 2'h1 ? 2'h0 : _highest_perm_T_4; // @[MSHR.scala 121:14]
  wire [1:0] _highest_perm_except_me_T_14 = _highest_perm_except_me_T_6 > _highest_perm_except_me_T_12 ?
    _highest_perm_except_me_T_6 : _highest_perm_except_me_T_12; // @[ParallelMux.scala 78:45]
  wire [1:0] highest_perm_except_me = _highest_perm_except_me_T > _highest_perm_except_me_T_14 ?
    _highest_perm_except_me_T : _highest_perm_except_me_T_14; // @[ParallelMux.scala 78:45]
  reg  inv_self_dir; // @[MSHR.scala 130:29]
  reg [2:0] client_probeack_param_vec_reg_0; // @[MSHR.scala 131:46]
  reg [2:0] client_probeack_param_vec_reg_1; // @[MSHR.scala 131:46]
  wire [1:0] replace_clients_perm = meta_self_clientStates_0 > meta_self_clientStates_1 ? meta_self_clientStates_0 :
    meta_self_clientStates_1; // @[ParallelMux.scala 78:45]
  wire  meta_self_dirty = _GEN_2; // @[MSHR.scala 70:14]
  wire  replace_need_release = meta_self_state > replace_clients_perm | meta_self_dirty & meta_self_state[1]; // @[MSHR.scala 137:69]
  wire [3:0] _replace_param_T = {meta_self_state,replace_clients_perm}; // @[Cat.scala 31:58]
  wire [2:0] _replace_param_T_9 = 4'h4 == _replace_param_T ? 3'h2 : 3'h0; // @[Mux.scala 81:58]
  wire [2:0] _replace_param_T_11 = 4'h5 == _replace_param_T ? 3'h4 : _replace_param_T_9; // @[Mux.scala 81:58]
  wire [2:0] _replace_param_T_13 = 4'h6 == _replace_param_T ? 3'h3 : _replace_param_T_11; // @[Mux.scala 81:58]
  wire [2:0] _replace_param_T_15 = 4'h7 == _replace_param_T ? 3'h3 : _replace_param_T_13; // @[Mux.scala 81:58]
  wire [2:0] _replace_param_T_17 = 4'hc == _replace_param_T ? 3'h1 : _replace_param_T_15; // @[Mux.scala 81:58]
  wire [2:0] _replace_param_T_19 = 4'hd == _replace_param_T ? 3'h0 : _replace_param_T_17; // @[Mux.scala 81:58]
  wire [2:0] replace_param = 4'hb == _replace_param_T ? 3'h3 : _replace_param_T_19; // @[Mux.scala 81:58]
  wire  _prefetch_miss_need_acquire_T_1 = highest_perm == 2'h0; // @[MSHR.scala 152:82]
  wire  _prefetch_miss_need_acquire_T_3 = ~highest_perm[1]; // @[MSHR.scala 152:95]
  wire  prefetch_miss_need_acquire = _client_shrink_perm_T_8 ? highest_perm == 2'h0 : ~highest_perm[1]; // @[MSHR.scala 152:39]
  wire  _prefetch_miss_need_probe_vec_T_5 = ~meta_self_hit; // @[MSHR.scala 156:74]
  wire  _prefetch_miss_need_probe_vec_T_15 = ~_GEN_27; // @[MSHR.scala 157:72]
  wire  _prefetch_miss_need_probe_vec_T_16 = _client_shrink_perm_T_8 & meta_clients_states_0_hit &
    _prefetch_miss_need_probe_vec_T_5 & ~_GEN_27; // @[MSHR.scala 157:69]
  wire  _prefetch_miss_need_probe_vec_T_17 = _req_needT_T_3 & meta_clients_states_0_state[1] & meta_clients_states_0_hit
     & (~meta_self_hit | ~meta_self_state[1]) | _prefetch_miss_need_probe_vec_T_16; // @[MSHR.scala 156:115]
  wire  prefetch_miss_need_probe_vec_0 = _other_clients_hit_T & _prefetch_miss_need_probe_vec_T_17; // @[MSHR.scala 155:19]
  wire  _prefetch_miss_need_probe_vec_T_35 = _client_shrink_perm_T_8 & meta_clients_states_1_hit &
    _prefetch_miss_need_probe_vec_T_5 & ~_GEN_27; // @[MSHR.scala 157:69]
  wire  _prefetch_miss_need_probe_vec_T_36 = _req_needT_T_3 & meta_clients_states_1_state[1] & meta_clients_states_1_hit
     & (~meta_self_hit | ~meta_self_state[1]) | _prefetch_miss_need_probe_vec_T_35; // @[MSHR.scala 156:115]
  wire  prefetch_miss_need_probe_vec_1 = _other_clients_hit_T_2 & _prefetch_miss_need_probe_vec_T_36; // @[MSHR.scala 155:19]
  wire [1:0] _prefetch_miss_need_probe_T = {prefetch_miss_need_probe_vec_1,prefetch_miss_need_probe_vec_0}; // @[MSHR.scala 159:68]
  wire  prefetch_miss_need_probe = |_prefetch_miss_need_probe_T; // @[MSHR.scala 159:75]
  wire  prefetch_miss = _req_needT_T_2 & (prefetch_miss_need_acquire | prefetch_miss_need_probe); // @[MSHR.scala 160:43]
  wire  prefetch_need_data = prefetch_miss & _prefetch_miss_need_probe_vec_T_5; // @[MSHR.scala 161:42]
  wire  _transmit_from_other_client_T_1 = req_opcode == 3'h4; // @[MSHR.scala 166:19]
  wire  _transmit_from_other_client_T_2 = req_opcode == 3'h4 | req_put; // @[MSHR.scala 166:27]
  wire  _transmit_from_other_client_T_5 = (req_opcode == 3'h4 | req_put | _other_clients_hit_T) &
    meta_clients_states_0_hit; // @[MSHR.scala 166:54]
  wire  _transmit_from_other_client_T_10 = (req_opcode == 3'h4 | req_put | _other_clients_hit_T_2) &
    meta_clients_states_1_hit; // @[MSHR.scala 166:54]
  wire [1:0] _transmit_from_other_client_T_11 = {_transmit_from_other_client_T_10,_transmit_from_other_client_T_5}; // @[MSHR.scala 167:6]
  wire  _transmit_from_other_client_T_12 = |_transmit_from_other_client_T_11; // @[MSHR.scala 167:13]
  reg  transmit_from_other_client_reg; // @[MSHR.scala 1418:24]
  wire  _transmit_from_other_client_T_13 = _transmit_from_other_client_T_12 | transmit_from_other_client_reg; // @[MSHR.scala 1424:19]
  wire  transmit_from_other_client = _prefetch_miss_need_probe_vec_T_5 & _transmit_from_other_client_T_13; // @[MSHR.scala 164:51]
  wire  a_need_data = req_channel[0] & (_transmit_from_other_client_T_2 | _req_acquire_T | _req_needT_T_2); // @[MSHR.scala 169:31]
  reg  releaseThrough; // @[MSHR.scala 178:31]
  reg  releaseDrop; // @[MSHR.scala 179:28]
  wire  releaseSave = ~releaseThrough & ~releaseDrop; // @[MSHR.scala 180:37]
  reg  probeAckDataThrough; // @[MSHR.scala 187:36]
  reg  probeAckDataDrop; // @[MSHR.scala 188:33]
  reg  probeAckDataSave; // @[MSHR.scala 189:33]
  reg  someClientHasProbeAckData; // @[MSHR.scala 191:42]
  wire  _a_probe_clients_T_2 = meta_clients_states_0_state != 2'h0; // @[MSHR.scala 202:32]
  wire  _a_probe_clients_T_7 = req_needT & meta_clients_states_0_state != 2'h0 | meta_clients_states_0_state[1] |
    _prefetch_miss_need_probe_vec_T_5; // @[MSHR.scala 202:60]
  wire  _a_probe_clients_T_8 = meta_clients_states_0_hit & _a_probe_clients_T_7; // @[MSHR.scala 201:15]
  wire  a_probe_clients_0 = 2'h0 == iam & req_acquire ? 1'h0 : _a_probe_clients_T_8; // @[MSHR.scala 199:10]
  wire  _a_probe_clients_T_12 = meta_clients_states_1_state != 2'h0; // @[MSHR.scala 202:32]
  wire  _a_probe_clients_T_17 = req_needT & meta_clients_states_1_state != 2'h0 | meta_clients_states_1_state[1] |
    _prefetch_miss_need_probe_vec_T_5; // @[MSHR.scala 202:60]
  wire  _a_probe_clients_T_18 = meta_clients_states_1_hit & _a_probe_clients_T_17; // @[MSHR.scala 201:15]
  wire  a_probe_clients_1 = 2'h1 == iam & req_acquire ? 1'h0 : _a_probe_clients_T_18; // @[MSHR.scala 199:10]
  wire [1:0] _new_self_meta_state_T_2 = meta_self_state[1] ? 2'h3 : 2'h1; // @[MSHR.scala 231:12]
  wire [1:0] _new_self_meta_state_T_3 = meta_self_hit ? _new_self_meta_state_T_2 : meta_self_state; // @[MSHR.scala 230:10]
  wire [1:0] _new_self_meta_state_T_4 = _req_needT_T_3 ? _new_self_meta_state_T_3 : 2'h0; // @[MSHR.scala 229:31]
  wire  _new_self_meta_clientStates_0_T = meta_self_clientStates_0 != 2'h0; // @[MSHR.scala 237:67]
  wire [1:0] _new_self_meta_clientStates_0_T_3 = meta_self_clientStates_0 != 2'h0 & _req_needT_T_3 ? 2'h1 : 2'h0; // @[MSHR.scala 237:40]
  wire [1:0] _new_self_meta_clientStates_0_T_4 = meta_self_hit ? _new_self_meta_clientStates_0_T_3 :
    meta_self_clientStates_0; // @[MSHR.scala 237:21]
  wire  _new_self_meta_clientStates_1_T = meta_self_clientStates_1 != 2'h0; // @[MSHR.scala 237:67]
  wire [1:0] _new_self_meta_clientStates_1_T_3 = meta_self_clientStates_1 != 2'h0 & _req_needT_T_3 ? 2'h1 : 2'h0; // @[MSHR.scala 237:40]
  wire [1:0] _new_self_meta_clientStates_1_T_4 = meta_self_hit ? _new_self_meta_clientStates_1_T_3 :
    meta_self_clientStates_1; // @[MSHR.scala 237:21]
  wire [1:0] _new_clients_meta_0_state_T_3 = _a_probe_clients_T_2 & _req_needT_T_3 ? 2'h1 : 2'h0; // @[MSHR.scala 241:34]
  wire [1:0] _new_clients_meta_0_state_T_4 = meta_clients_states_0_hit ? _new_clients_meta_0_state_T_3 :
    meta_clients_states_0_state; // @[MSHR.scala 241:23]
  wire [1:0] _new_clients_meta_1_state_T_3 = _a_probe_clients_T_12 & _req_needT_T_3 ? 2'h1 : 2'h0; // @[MSHR.scala 241:34]
  wire [1:0] _new_clients_meta_1_state_T_4 = meta_clients_states_1_hit ? _new_clients_meta_1_state_T_3 :
    meta_clients_states_1_state; // @[MSHR.scala 241:23]
  wire  _new_self_meta_dirty_T = meta_self_hit & meta_self_dirty; // @[MSHR.scala 247:42]
  wire  _new_self_meta_dirty_T_5 = _req_needT_T_3 | _client_shrink_perm_T_8 | req_param == 3'h3; // @[MetaData.scala 55:66]
  wire [1:0] _new_self_meta_state_T_7 = meta_self_hit & _req_promoteT_T ? 2'h3 : 2'h1; // @[MSHR.scala 256:20]
  wire [1:0] _new_self_meta_state_T_9 = 3'h3 == req_param ? 2'h2 : meta_self_state; // @[Mux.scala 81:58]
  wire [1:0] _new_self_meta_state_T_11 = 3'h0 == req_param ? 2'h3 : _new_self_meta_state_T_9; // @[Mux.scala 81:58]
  wire [1:0] _new_self_meta_state_T_13 = 3'h1 == req_param ? 2'h3 : _new_self_meta_state_T_11; // @[Mux.scala 81:58]
  wire [1:0] _new_self_meta_state_T_15 = 3'h2 == req_param ? _new_self_meta_state_T_7 : _new_self_meta_state_T_13; // @[Mux.scala 81:58]
  wire [1:0] _new_self_meta_clientStates_0_T_14 = _client_shrink_perm_T_10 ? 2'h1 : meta_self_clientStates_0; // @[MSHR.scala 264:45]
  wire [1:0] _new_self_meta_clientStates_0_T_15 = _client_shrink_perm_T_4 ? 2'h0 : _new_self_meta_clientStates_0_T_14; // @[MSHR.scala 264:14]
  wire [1:0] _new_self_meta_clientStates_0_T_16 = _highest_perm_except_me_T_1 ? _new_self_meta_clientStates_0_T_15 :
    meta_reg_clients_states_0_state; // @[MSHR.scala 262:21]
  wire [1:0] _new_self_meta_clientStates_1_T_14 = _client_shrink_perm_T_10 ? 2'h1 : meta_self_clientStates_1; // @[MSHR.scala 264:45]
  wire [1:0] _new_self_meta_clientStates_1_T_15 = _client_shrink_perm_T_4 ? 2'h0 : _new_self_meta_clientStates_1_T_14; // @[MSHR.scala 264:14]
  wire [1:0] _new_self_meta_clientStates_1_T_16 = _highest_perm_except_me_T_7 ? _new_self_meta_clientStates_1_T_15 :
    meta_reg_clients_states_1_state; // @[MSHR.scala 262:21]
  wire [1:0] _new_clients_meta_0_state_T_14 = _client_shrink_perm_T_10 ? 2'h1 : meta_reg_clients_states_0_state; // @[MSHR.scala 272:45]
  wire [1:0] _new_clients_meta_0_state_T_15 = _client_shrink_perm_T_4 ? 2'h0 : _new_clients_meta_0_state_T_14; // @[MSHR.scala 272:14]
  wire [1:0] _new_clients_meta_0_state_T_16 = _highest_perm_except_me_T_1 ? _new_clients_meta_0_state_T_15 :
    meta_reg_clients_states_0_state; // @[MSHR.scala 270:23]
  wire [1:0] _new_clients_meta_1_state_T_14 = _client_shrink_perm_T_10 ? 2'h1 : meta_reg_clients_states_1_state; // @[MSHR.scala 272:45]
  wire [1:0] _new_clients_meta_1_state_T_15 = _client_shrink_perm_T_4 ? 2'h0 : _new_clients_meta_1_state_T_14; // @[MSHR.scala 272:14]
  wire [1:0] _new_clients_meta_1_state_T_16 = _highest_perm_except_me_T_7 ? _new_clients_meta_1_state_T_15 :
    meta_reg_clients_states_1_state; // @[MSHR.scala 270:23]
  wire  _GEN_36 = req_fromCmoHelper ? 1'h0 : meta_self_hit & meta_self_dirty | req_dirty & _new_self_meta_dirty_T_5; // @[MSHR.scala 228:25 247:25 432:29]
  wire [1:0] _GEN_37 = req_fromCmoHelper ? _new_self_meta_state_T_4 : _new_self_meta_state_T_15; // @[MSHR.scala 229:25 248:25 432:29]
  wire [1:0] _GEN_38 = req_fromCmoHelper ? _new_self_meta_clientStates_0_T_4 : _new_self_meta_clientStates_0_T_16; // @[MSHR.scala 237:15 262:15 432:29]
  wire [1:0] _GEN_39 = req_fromCmoHelper ? _new_self_meta_clientStates_1_T_4 : _new_self_meta_clientStates_1_T_16; // @[MSHR.scala 237:15 262:15 432:29]
  wire [1:0] _GEN_40 = req_fromCmoHelper ? _new_clients_meta_0_state_T_4 : _new_clients_meta_0_state_T_16; // @[MSHR.scala 241:17 270:17 432:29]
  wire [1:0] _GEN_41 = req_fromCmoHelper ? _new_clients_meta_1_state_T_4 : _new_clients_meta_1_state_T_16; // @[MSHR.scala 241:17 270:17 432:29]
  wire  _new_self_meta_dirty_T_8 = ~probeAckDataThrough; // @[MSHR.scala 290:51]
  wire  _new_self_meta_dirty_T_9 = req_fromProbeHelper & ~probeAckDataThrough; // @[MSHR.scala 290:48]
  wire  _new_self_meta_state_T_22 = meta_self_state[1] & _client_shrink_perm_T_8; // @[MSHR.scala 209:16]
  wire  _new_self_meta_state_T_23 = meta_self_state != 2'h0; // @[MSHR.scala 211:15]
  wire [1:0] _new_self_meta_state_T_26 = meta_self_state != 2'h0 & req_param != 3'h2 ? 2'h1 : 2'h0; // @[MSHR.scala 211:8]
  wire [1:0] _new_self_meta_state_T_27 = _new_self_meta_state_T_22 ? meta_self_state : _new_self_meta_state_T_26; // @[MSHR.scala 208:61]
  wire [1:0] _new_self_meta_state_T_28 = _new_self_meta_dirty_T_9 ? _new_self_meta_state_T_2 : _new_self_meta_state_T_27
    ; // @[MSHR.scala 292:10]
  wire [1:0] _new_self_meta_state_T_29 = meta_self_hit ? _new_self_meta_state_T_28 : meta_self_state; // @[MSHR.scala 291:31]
  wire  _new_self_meta_clientStates_0_T_19 = meta_self_clientStates_0[1] & _client_shrink_perm_T_8; // @[MSHR.scala 209:16]
  wire [1:0] _new_self_meta_clientStates_0_T_23 = _new_self_meta_clientStates_0_T & req_param != 3'h2 ? 2'h1 : 2'h0; // @[MSHR.scala 211:8]
  wire [1:0] _new_self_meta_clientStates_0_T_24 = _new_self_meta_clientStates_0_T_19 ? meta_self_clientStates_0 :
    _new_self_meta_clientStates_0_T_23; // @[MSHR.scala 208:61]
  wire [1:0] _new_self_meta_clientStates_0_T_25 = meta_self_hit ? _new_self_meta_clientStates_0_T_24 :
    meta_self_clientStates_0; // @[MSHR.scala 300:21]
  wire  _new_self_meta_clientStates_1_T_19 = meta_self_clientStates_1[1] & _client_shrink_perm_T_8; // @[MSHR.scala 209:16]
  wire [1:0] _new_self_meta_clientStates_1_T_23 = _new_self_meta_clientStates_1_T & req_param != 3'h2 ? 2'h1 : 2'h0; // @[MSHR.scala 211:8]
  wire [1:0] _new_self_meta_clientStates_1_T_24 = _new_self_meta_clientStates_1_T_19 ? meta_self_clientStates_1 :
    _new_self_meta_clientStates_1_T_23; // @[MSHR.scala 208:61]
  wire [1:0] _new_self_meta_clientStates_1_T_25 = meta_self_hit ? _new_self_meta_clientStates_1_T_24 :
    meta_self_clientStates_1; // @[MSHR.scala 300:21]
  wire  sink_c_resp_valid = io_resps_sink_c_valid & ~w_probeacklast; // @[MSHR.scala 1290:49]
  wire  sinkc_resp_last = sink_c_resp_valid & io_resps_sink_c_bits_last; // @[MSHR.scala 1298:43]
  wire  _T_263 = req_valid & sinkc_resp_last; // @[MSHR.scala 1300:18]
  wire  _client_T_7 = io_resps_sink_c_bits_source[5:2] == 4'h6; // @[Parameters.scala 54:32]
  wire [1:0] client_uncommonBits_1 = io_resps_sink_c_bits_source[1:0]; // @[Parameters.scala 52:64]
  wire  _client_T_10 = client_uncommonBits_1 <= 2'h2; // @[Parameters.scala 57:20]
  wire  _client_T_11 = _client_T_7 & _client_T_10; // @[Parameters.scala 56:50]
  wire  _client_T_1 = io_resps_sink_c_bits_source[5:4] == 2'h0; // @[Parameters.scala 54:32]
  wire [3:0] client_uncommonBits = io_resps_sink_c_bits_source[3:0]; // @[Parameters.scala 52:64]
  wire  _client_T_4 = client_uncommonBits <= 4'hc; // @[Parameters.scala 57:20]
  wire  _client_T_5 = _client_T_1 & _client_T_4; // @[Parameters.scala 56:50]
  wire [1:0] _client_T_12 = {_client_T_11,_client_T_5}; // @[Cat.scala 31:58]
  wire  client = _client_T_12[1]; // @[CircuitMath.scala 30:8]
  wire [2:0] _GEN_350 = ~client ? io_resps_sink_c_bits_param : client_probeack_param_vec_reg_0; // @[MSHR.scala 1296:29 1303:{39,39}]
  wire [2:0] client_probeack_param_vec_0 = req_valid & sinkc_resp_last ? _GEN_350 : client_probeack_param_vec_reg_0; // @[MSHR.scala 1296:29 1300:38]
  wire [1:0] _new_clients_meta_0_state_T_24 = client_probeack_param_vec_0 == 3'h0 | client_probeack_param_vec_0 == 3'h4
     ? 2'h1 : 2'h0; // @[MSHR.scala 216:8]
  wire [1:0] _new_clients_meta_0_state_T_25 = meta_clients_states_0_hit ? _new_clients_meta_0_state_T_24 :
    meta_reg_clients_states_0_state; // @[MSHR.scala 304:23]
  wire [2:0] _GEN_351 = client ? io_resps_sink_c_bits_param : client_probeack_param_vec_reg_1; // @[MSHR.scala 1296:29 1303:{39,39}]
  wire [2:0] client_probeack_param_vec_1 = req_valid & sinkc_resp_last ? _GEN_351 : client_probeack_param_vec_reg_1; // @[MSHR.scala 1296:29 1300:38]
  wire [1:0] _new_clients_meta_1_state_T_24 = client_probeack_param_vec_1 == 3'h0 | client_probeack_param_vec_1 == 3'h4
     ? 2'h1 : 2'h0; // @[MSHR.scala 216:8]
  wire [1:0] _new_clients_meta_1_state_T_25 = meta_clients_states_1_hit ? _new_clients_meta_1_state_T_24 :
    meta_reg_clients_states_1_state; // @[MSHR.scala 304:23]
  wire  _new_self_meta_dirty_T_13 = meta_self_dirty | probe_dirty; // @[MSHR.scala 316:54]
  wire  _new_self_meta_dirty_T_14 = req_promoteT ? 1'h0 : meta_self_dirty | probe_dirty; // @[MSHR.scala 316:14]
  wire  _new_self_meta_dirty_T_16 = meta_self_hit ? _new_self_meta_dirty_T_14 : probe_dirty; // @[MSHR.scala 315:12]
  wire  _new_self_meta_dirty_T_17 = req_needT ? 1'h0 : _new_self_meta_dirty_T_16; // @[MSHR.scala 313:10]
  wire  _new_self_meta_dirty_T_20 = probe_dirty | _new_self_meta_dirty_T; // @[MSHR.scala 322:33]
  wire  _new_self_meta_dirty_T_21 = req_put | _new_self_meta_dirty_T_20; // @[MSHR.scala 320:10]
  wire  _new_self_meta_dirty_T_22 = req_acquire ? _new_self_meta_dirty_T_17 : _new_self_meta_dirty_T_21; // @[MSHR.scala 311:31]
  wire [1:0] _new_self_meta_state_T_30 = req_acquire ? 2'h2 : 2'h3; // @[MSHR.scala 327:10]
  wire [1:0] _new_self_meta_state_T_34 = req_acquire & promoteT_safe ? 2'h2 : 2'h3; // @[MSHR.scala 337:24]
  wire [1:0] _new_self_meta_state_T_35 = gotT ? _new_self_meta_state_T_34 : highest_perm_reg; // @[MSHR.scala 337:14]
  wire [1:0] _new_self_meta_state_T_38 = gotT ? _new_self_meta_state_T_34 : 2'h1; // @[MSHR.scala 338:14]
  wire [1:0] _new_self_meta_state_T_39 = transmit_from_other_client ? _new_self_meta_state_T_35 :
    _new_self_meta_state_T_38; // @[MSHR.scala 335:12]
  wire  _new_self_meta_state_T_40 = meta_no_clients & req_acquire; // @[MSHR.scala 353:29]
  wire [1:0] _new_self_meta_state_T_41 = _new_self_meta_state_T_40 ? 2'h2 : 2'h3; // @[MSHR.scala 352:21]
  wire [1:0] _new_self_meta_state_T_45 = 2'h2 == meta_self_state ? 2'h3 : 2'h1; // @[Mux.scala 81:58]
  wire [1:0] _new_self_meta_state_T_47 = 2'h3 == meta_self_state ? _new_self_meta_state_T_41 : _new_self_meta_state_T_45
    ; // @[Mux.scala 81:58]
  wire [1:0] _new_self_meta_state_T_48 = _prefetch_miss_need_probe_vec_T_5 ? _new_self_meta_state_T_39 :
    _new_self_meta_state_T_47; // @[MSHR.scala 334:10]
  wire [1:0] _new_self_meta_state_T_49 = req_needT ? _new_self_meta_state_T_30 : _new_self_meta_state_T_48; // @[MSHR.scala 325:31]
  wire [1:0] _GEN_42 = inv_self_dir ? 2'h0 : _new_self_meta_state_T_49; // @[MSHR.scala 359:23 325:25 360:27]
  wire [1:0] _new_self_meta_clientStates_0_T_27 = req_needT | req_promoteT ? 2'h3 : 2'h1; // @[MSHR.scala 367:16]
  wire [1:0] _new_self_meta_clientStates_0_T_29 = meta_reg_clients_states_0_hit ? 2'h1 : 2'h0; // @[MSHR.scala 370:18]
  wire [1:0] _new_self_meta_clientStates_0_T_30 = meta_reg_clients_states_0_hit ? meta_reg_clients_states_0_state : 2'h0
    ; // @[MSHR.scala 371:18]
  wire [1:0] _new_self_meta_clientStates_0_T_31 = _transmit_from_other_client_T_1 ? _new_self_meta_clientStates_0_T_29
     : _new_self_meta_clientStates_0_T_30; // @[MSHR.scala 368:16]
  wire [1:0] _new_self_meta_clientStates_0_T_32 = req_acquire ? _new_self_meta_clientStates_0_T_27 :
    _new_self_meta_clientStates_0_T_31; // @[MSHR.scala 366:23]
  wire  _new_self_meta_clientStates_0_T_33 = req_acquire | req_put; // @[MSHR.scala 381:25]
  wire  _new_self_meta_clientStates_0_T_36 = _req_needT_T_9 | req_promoteT | req_put; // @[MSHR.scala 383:50]
  wire  _new_self_meta_clientStates_0_T_37 = meta_reg_clients_states_0_hit & a_do_probe; // @[MSHR.scala 385:43]
  wire [1:0] _new_self_meta_clientStates_0_T_38 = meta_reg_clients_states_0_hit & a_do_probe ?
    _new_clients_meta_0_state_T_24 : 2'h0; // @[MSHR.scala 385:18]
  wire [1:0] _new_self_meta_clientStates_0_T_39 = _new_self_meta_clientStates_0_T_36 ? 2'h0 :
    _new_self_meta_clientStates_0_T_38; // @[MSHR.scala 382:16]
  wire [1:0] _new_self_meta_clientStates_0_T_44 = _client_shrink_perm_T_8 ? _new_clients_meta_0_state_T_24 : 2'h0; // @[MSHR.scala 390:48]
  wire [1:0] _new_self_meta_clientStates_0_T_45 = prefetch_miss_need_probe ? _new_self_meta_clientStates_0_T_44 :
    meta_reg_clients_states_0_state; // @[MSHR.scala 390:18]
  wire [1:0] _new_self_meta_clientStates_0_T_46 = _transmit_from_other_client_T_1 ? _new_self_meta_clientStates_0_T_38
     : _new_self_meta_clientStates_0_T_45; // @[MSHR.scala 387:16]
  wire [1:0] _new_self_meta_clientStates_0_T_47 = _new_self_meta_clientStates_0_T_33 ?
    _new_self_meta_clientStates_0_T_39 : _new_self_meta_clientStates_0_T_46; // @[MSHR.scala 380:23]
  wire [1:0] _GEN_43 = _highest_perm_except_me_T_1 ? _new_self_meta_clientStates_0_T_32 :
    _new_self_meta_clientStates_0_T_47; // @[MSHR.scala 365:27 366:17 380:17]
  wire [1:0] _new_self_meta_clientStates_1_T_29 = meta_reg_clients_states_1_hit ? 2'h1 : 2'h0; // @[MSHR.scala 370:18]
  wire [1:0] _new_self_meta_clientStates_1_T_30 = meta_reg_clients_states_1_hit ? meta_reg_clients_states_1_state : 2'h0
    ; // @[MSHR.scala 371:18]
  wire [1:0] _new_self_meta_clientStates_1_T_31 = _transmit_from_other_client_T_1 ? _new_self_meta_clientStates_1_T_29
     : _new_self_meta_clientStates_1_T_30; // @[MSHR.scala 368:16]
  wire [1:0] _new_self_meta_clientStates_1_T_32 = req_acquire ? _new_self_meta_clientStates_0_T_27 :
    _new_self_meta_clientStates_1_T_31; // @[MSHR.scala 366:23]
  wire  _new_self_meta_clientStates_1_T_37 = meta_reg_clients_states_1_hit & a_do_probe; // @[MSHR.scala 385:43]
  wire [1:0] _new_self_meta_clientStates_1_T_38 = meta_reg_clients_states_1_hit & a_do_probe ?
    _new_clients_meta_1_state_T_24 : 2'h0; // @[MSHR.scala 385:18]
  wire [1:0] _new_self_meta_clientStates_1_T_39 = _new_self_meta_clientStates_0_T_36 ? 2'h0 :
    _new_self_meta_clientStates_1_T_38; // @[MSHR.scala 382:16]
  wire [1:0] _new_self_meta_clientStates_1_T_44 = _client_shrink_perm_T_8 ? _new_clients_meta_1_state_T_24 : 2'h0; // @[MSHR.scala 390:48]
  wire [1:0] _new_self_meta_clientStates_1_T_45 = prefetch_miss_need_probe ? _new_self_meta_clientStates_1_T_44 :
    meta_reg_clients_states_1_state; // @[MSHR.scala 390:18]
  wire [1:0] _new_self_meta_clientStates_1_T_46 = _transmit_from_other_client_T_1 ? _new_self_meta_clientStates_1_T_38
     : _new_self_meta_clientStates_1_T_45; // @[MSHR.scala 387:16]
  wire [1:0] _new_self_meta_clientStates_1_T_47 = _new_self_meta_clientStates_0_T_33 ?
    _new_self_meta_clientStates_1_T_39 : _new_self_meta_clientStates_1_T_46; // @[MSHR.scala 380:23]
  wire [1:0] _GEN_44 = _highest_perm_except_me_T_7 ? _new_self_meta_clientStates_1_T_32 :
    _new_self_meta_clientStates_1_T_47; // @[MSHR.scala 365:27 366:17 380:17]
  wire [1:0] _new_clients_meta_0_state_T_28 = req_acquire ? _new_self_meta_clientStates_0_T_27 :
    meta_reg_clients_states_0_state; // @[MSHR.scala 399:25]
  wire [1:0] _new_clients_meta_0_state_T_34 = _new_self_meta_clientStates_0_T_37 ? 2'h0 :
    meta_reg_clients_states_0_state; // @[MSHR.scala 415:18]
  wire [1:0] _new_clients_meta_0_state_T_36 = _new_self_meta_clientStates_0_T_37 ? _new_clients_meta_0_state_T_24 :
    meta_reg_clients_states_0_state; // @[MSHR.scala 417:18]
  wire [1:0] _new_clients_meta_0_state_T_37 = _new_self_meta_clientStates_0_T_36 ? _new_clients_meta_0_state_T_34 :
    _new_clients_meta_0_state_T_36; // @[MSHR.scala 413:16]
  wire [1:0] _new_clients_meta_0_state_T_41 = _new_self_meta_clientStates_0_T_33 ? _new_clients_meta_0_state_T_37 :
    _new_self_meta_clientStates_0_T_45; // @[MSHR.scala 411:25]
  wire [1:0] _GEN_45 = _highest_perm_except_me_T_1 ? _new_clients_meta_0_state_T_28 : _new_clients_meta_0_state_T_41; // @[MSHR.scala 398:27 399:19 411:19]
  wire [1:0] _GEN_46 = _transmit_from_other_client_T_1 ? _new_clients_meta_0_state_T_36 : _GEN_45; // @[MSHR.scala 424:35 425:19]
  wire [1:0] _new_clients_meta_1_state_T_28 = req_acquire ? _new_self_meta_clientStates_0_T_27 :
    meta_reg_clients_states_1_state; // @[MSHR.scala 399:25]
  wire [1:0] _new_clients_meta_1_state_T_34 = _new_self_meta_clientStates_1_T_37 ? 2'h0 :
    meta_reg_clients_states_1_state; // @[MSHR.scala 415:18]
  wire [1:0] _new_clients_meta_1_state_T_36 = _new_self_meta_clientStates_1_T_37 ? _new_clients_meta_1_state_T_24 :
    meta_reg_clients_states_1_state; // @[MSHR.scala 417:18]
  wire [1:0] _new_clients_meta_1_state_T_37 = _new_self_meta_clientStates_0_T_36 ? _new_clients_meta_1_state_T_34 :
    _new_clients_meta_1_state_T_36; // @[MSHR.scala 413:16]
  wire [1:0] _new_clients_meta_1_state_T_41 = _new_self_meta_clientStates_0_T_33 ? _new_clients_meta_1_state_T_37 :
    _new_self_meta_clientStates_1_T_45; // @[MSHR.scala 411:25]
  wire [1:0] _GEN_47 = _highest_perm_except_me_T_7 ? _new_clients_meta_1_state_T_28 : _new_clients_meta_1_state_T_41; // @[MSHR.scala 398:27 399:19 411:19]
  wire [1:0] _GEN_48 = _transmit_from_other_client_T_1 ? _new_clients_meta_1_state_T_36 : _GEN_47; // @[MSHR.scala 424:35 425:19]
  wire  _GEN_49 = req_channel[1] ? req_fromProbeHelper & ~probeAckDataThrough & (_new_self_meta_dirty_T | probe_dirty)
     : _new_self_meta_dirty_T_22; // @[MSHR.scala 290:25 311:25 437:25]
  wire [1:0] _GEN_50 = req_channel[1] ? _new_self_meta_state_T_29 : _GEN_42; // @[MSHR.scala 291:25 437:25]
  wire [1:0] _GEN_51 = req_channel[1] ? _new_self_meta_clientStates_0_T_25 : _GEN_43; // @[MSHR.scala 300:15 437:25]
  wire [1:0] _GEN_52 = req_channel[1] ? _new_self_meta_clientStates_1_T_25 : _GEN_44; // @[MSHR.scala 300:15 437:25]
  wire [1:0] _GEN_53 = req_channel[1] ? _new_clients_meta_0_state_T_25 : _GEN_46; // @[MSHR.scala 304:17 437:25]
  wire [1:0] _GEN_54 = req_channel[1] ? _new_clients_meta_1_state_T_25 : _GEN_48; // @[MSHR.scala 304:17 437:25]
  wire  new_self_meta_dirty = req_channel[2] ? _GEN_36 : _GEN_49; // @[MSHR.scala 431:19]
  wire [1:0] new_self_meta_state = req_channel[2] ? _GEN_37 : _GEN_50; // @[MSHR.scala 431:19]
  wire [1:0] new_self_meta_clientStates_0 = req_channel[2] ? _GEN_38 : _GEN_51; // @[MSHR.scala 431:19]
  wire [1:0] new_self_meta_clientStates_1 = req_channel[2] ? _GEN_39 : _GEN_52; // @[MSHR.scala 431:19]
  reg [2:0] sink; // @[MSHR.scala 455:17]
  reg  bad_grant; // @[MSHR.scala 457:26]
  wire [1:0] _new_self_dir_clientStates_0_T_2 = meta_self_hit & _other_clients_hit_T ? new_self_meta_clientStates_0 :
    meta_self_clientStates_0; // @[MSHR.scala 464:21]
  wire [1:0] _new_self_dir_clientStates_1_T_2 = meta_self_hit & _other_clients_hit_T_2 ? new_self_meta_clientStates_1 :
    meta_self_clientStates_1; // @[MSHR.scala 464:21]
  wire [29:0] debug_addr_hi = {req_tag,req_set}; // @[Cat.scala 31:58]
  wire  _change_self_meta_T_2 = io_nestedwb_set == req_set; // @[MSHR.scala 476:21]
  wire  _change_self_meta_T_3 = meta_valid & _new_self_meta_state_T_23 & _change_self_meta_T_2; // @[MSHR.scala 475:68]
  wire [19:0] meta_self_tag = _GEN_8; // @[MSHR.scala 70:14]
  wire  change_self_meta = _change_self_meta_T_3 & io_nestedwb_tag == meta_self_tag; // @[MSHR.scala 476:33]
  wire [29:0] _nested_client_match_T = {io_nestedwb_tag,io_nestedwb_set}; // @[Cat.scala 31:58]
  wire  _nested_client_match_T_5 = io_nestedwb_set[6:0] == req_set[6:0]; // @[MSHR.scala 479:45]
  wire  nested_client_match = _nested_client_match_T[29:7] == _GEN_15 & _nested_client_match_T_5; // @[MSHR.scala 478:87]
  wire  change_clients_meta_0 = meta_valid & _a_probe_clients_T_2 & nested_client_match; // @[MSHR.scala 483:44]
  wire  change_clients_meta_1 = meta_valid & _a_probe_clients_T_12 & nested_client_match; // @[MSHR.scala 483:44]
  wire  _GEN_67 = io_nestedwb_bclr_dirty ? 1'h0 : _GEN_2; // @[MSHR.scala 486:35 487:27]
  wire  _GEN_68 = io_nestedwb_bset_dirty | _GEN_67; // @[MSHR.scala 489:35 490:27]
  wire  _GEN_69 = io_nestedwb_c_set_dirty | _GEN_68; // @[MSHR.scala 492:35 493:27]
  reg  nested_c_hit_reg; // @[MSHR.scala 505:33]
  wire  _T_44 = meta_valid & _prefetch_miss_need_probe_vec_T_5 & req_channel[0] & _change_self_meta_T_2; // @[MSHR.scala 507:51]
  wire  _T_45 = _T_44 & io_nestedwb_c_set_hit; // @[MSHR.scala 508:33]
  wire  nested_c_hit = _T_45 | nested_c_hit_reg; // @[MSHR.scala 509:5 510:18]
  reg  s_acquire; // @[MSHR.scala 528:26]
  reg  s_probe; // @[MSHR.scala 529:24]
  reg  s_release; // @[MSHR.scala 530:26]
  reg  s_wbselfdir; // @[MSHR.scala 534:28]
  reg  s_wbselftag; // @[MSHR.scala 535:28]
  reg  s_wbclientsdir; // @[MSHR.scala 536:31]
  reg  s_wbclientstag; // @[MSHR.scala 537:31]
  reg  w_probeackfirst; // @[MSHR.scala 544:32]
  reg  w_probeack; // @[MSHR.scala 546:27]
  reg  w_grantfirst; // @[MSHR.scala 547:29]
  reg  w_grant; // @[MSHR.scala 549:24]
  reg  acquire_flag; // @[MSHR.scala 554:29]
  wire  _T_46 = ~s_acquire; // @[MSHR.scala 597:8]
  wire  _GEN_91 = ~s_acquire | acquire_flag; // @[MSHR.scala 597:20 554:29 597:35]
  wire [1:0] _bypassPut_T_2 = {meta_clients_states_0_hit,meta_clients_states_1_hit}; // @[Cat.scala 31:58]
  wire  _bypassPut_T_3 = |_bypassPut_T_2; // @[MSHR.scala 701:81]
  wire  bypassPut = req_put & _prefetch_miss_need_probe_vec_T_5 & ~(|_bypassPut_T_2); // @[MSHR.scala 701:45]
  reg  bypassPut_latch_reg; // @[MSHR.scala 1429:22]
  wire  bypassPut_all = io_dirResult_valid ? bypassPut : bypassPut_latch_reg; // @[MSHR.scala 703:26]
  wire  preferCache = req_preferCache & ~bypassPut_all; // @[MSHR.scala 705:38]
  wire  bypassGet = _transmit_from_other_client_T_1 & ~preferCache; // @[MSHR.scala 706:38]
  wire  acquirePermMiss = _req_acquire_T_1 & _prefetch_miss_need_probe_vec_T_5; // @[MSHR.scala 719:52]
  wire  meta_self_error = 1'h0; // @[MSHR.scala 70:14]
  wire  _GEN_94 = req_channel[2] ? 1'h0 : 1'h1; // @[MSHR.scala 562:15 844:22 845:19]
  wire  _GEN_95 = req_channel[1] ? 1'h0 : 1'h1; // @[MSHR.scala 561:16 847:22 848:20]
  wire  _GEN_96 = req_acquire ? 1'h0 : 1'h1; // @[MSHR.scala 581:16 852:26 853:22]
  wire  _GEN_97 = req_channel[0] ? 1'h0 : _GEN_94; // @[MSHR.scala 850:23 851:19]
  wire  _GEN_98 = req_channel[0] ? _GEN_96 : 1'h1; // @[MSHR.scala 581:16 850:23]
  wire  _GEN_99 = meta_clients_states_0_hit ? 1'h0 : 1'h1; // @[MSHR.scala 559:13 603:24 604:19]
  wire  _GEN_100 = meta_clients_states_1_hit ? 1'h0 : _GEN_99; // @[MSHR.scala 603:24 604:19]
  wire  _GEN_101 = meta_self_hit ? 1'h0 : 1'h1; // @[MSHR.scala 564:17 611:25 612:19]
  wire  _GEN_102 = _req_needT_T_9 & meta_self_hit ? 1'h0 : 1'h1; // @[MSHR.scala 560:15 616:46 617:17]
  wire  _GEN_103 = client_shrink_perm ? 1'h0 : 1'h1; // @[MSHR.scala 566:20 626:30 627:22]
  wire  _T_60 = _prefetch_miss_need_probe_vec_T_5 & req_opcode[0]; // @[MSHR.scala 631:27]
  wire  _GEN_104 = _prefetch_miss_need_probe_vec_T_5 & req_opcode[0] ? 1'h0 : 1'h1; // @[MSHR.scala 565:17 631:45 632:21]
  wire  _GEN_105 = meta_self_hit | req_opcode[0] ? 1'h0 : 1'h1; // @[MSHR.scala 564:17 634:44 635:21]
  wire  _T_67 = _T_60 & _new_self_meta_state_T_23; // @[MSHR.scala 638:41]
  wire  _T_68 = _T_67 & replace_need_release; // @[MSHR.scala 639:39]
  wire  _GEN_106 = _T_68 ? 1'h0 : 1'h1; // @[MSHR.scala 560:15 640:9 641:19]
  wire  will_save_release = io_releaseThrough & io_dirResult_valid & req_channel[2] ? 1'h0 : 1'h1; // @[MSHR.scala 873:62 881:23]
  wire  _GEN_107 = will_save_release ? _GEN_104 : 1'h1; // @[MSHR.scala 565:17 629:29]
  wire  _GEN_108 = will_save_release ? _GEN_105 : 1'h1; // @[MSHR.scala 564:17 629:29]
  wire  _GEN_109 = will_save_release ? _GEN_106 : 1'h1; // @[MSHR.scala 560:15 629:29]
  wire  _GEN_110 = req_opcode[0] ? 1'h0 : 1'h1; // @[MSHR.scala 569:20 647:25 648:22]
  wire  _will_release_through_T_1 = req_param <= 3'h2; // @[Bundles.scala 114:29]
  wire  will_release_through = io_releaseThrough & io_dirResult_valid & req_channel[2] & (~other_clients_hit &
    _will_release_through_T_1); // @[MSHR.scala 873:62 876:26]
  wire  _GEN_111 = will_release_through & req_opcode[0] ? 1'h0 : _GEN_109; // @[MSHR.scala 656:49 657:20]
  wire  _GEN_112 = req_fromCmoHelper ? _GEN_100 : 1'h1; // @[MSHR.scala 559:13 858:33]
  wire  _GEN_113 = req_fromCmoHelper ? _GEN_100 : _GEN_103; // @[MSHR.scala 858:33]
  wire  _GEN_114 = req_fromCmoHelper ? _GEN_101 : _GEN_108; // @[MSHR.scala 858:33]
  wire  _GEN_115 = req_fromCmoHelper ? _GEN_102 : _GEN_109; // @[MSHR.scala 858:33]
  wire  _GEN_116 = req_fromCmoHelper ? _GEN_102 : _GEN_111; // @[MSHR.scala 858:33]
  wire  _GEN_118 = req_fromCmoHelper | _GEN_107; // @[MSHR.scala 565:17 858:33]
  wire  _GEN_119 = req_fromCmoHelper | _GEN_110; // @[MSHR.scala 569:20 858:33]
  wire  _will_probeack_through_T = highest_perm != 2'h0; // @[MSHR.scala 900:107]
  wire  _GEN_302 = req_channel[1] & (clients_have_T | req_needProbeAckData & highest_perm != 2'h0 &
    _prefetch_miss_need_probe_vec_T_5); // @[MSHR.scala 899:21 900:29]
  wire  will_probeack_through = io_dirResult_valid & _GEN_302; // @[MSHR.scala 898:28]
  wire  _T_74 = ~will_probeack_through; // @[MSHR.scala 668:10]
  wire  _T_75 = ~req_fromProbeHelper; // @[MSHR.scala 668:36]
  wire  _GEN_120 = ~will_probeack_through & ~req_fromProbeHelper ? 1'h0 : 1'h1; // @[MSHR.scala 561:16 668:58 669:18]
  wire  _T_81 = _client_shrink_perm_T_1 | meta_self_state[1] & _req_needT_T_3; // @[MSHR.scala 220:18]
  wire  _T_82 = meta_self_state == 2'h1; // @[MSHR.scala 224:11]
  wire  _GEN_121 = _T_81 ? 1'h0 : 1'h1; // @[MSHR.scala 564:17 672:58 673:21]
  wire  _GEN_122 = meta_self_hit ? _GEN_121 : 1'h1; // @[MSHR.scala 564:17 671:25]
  wire  _GEN_123 = _bypassPut_T_3 ? 1'h0 : 1'h1; // @[MSHR.scala 559:13 691:48 692:17]
  wire  _GEN_124 = ~(meta_self_hit & meta_self_state[0] & _req_needT_T_3) ? _GEN_123 : 1'h1; // @[MSHR.scala 559:13 682:71]
  wire  _T_130 = prefetch_need_data | transmit_from_other_client; // @[MSHR.scala 729:32]
  wire  _T_132 = preferCache & (_req_acquire_T | _transmit_from_other_client_T_1) | _T_130; // @[MSHR.scala 727:78]
  wire  _T_133 = _prefetch_miss_need_probe_vec_T_5 & _new_self_meta_state_T_23 & replace_need_release & _T_132; // @[MSHR.scala 725:80]
  wire  _GEN_125 = _T_133 ? 1'h0 : 1'h1; // @[MSHR.scala 560:15 734:6 735:17]
  wire  _T_137 = req_needT ? ~highest_perm_except_me[1] : highest_perm_except_me == 2'h0; // @[MSHR.scala 744:12]
  wire  _T_141 = req_needT ? _prefetch_miss_need_acquire_T_3 : _prefetch_miss_need_acquire_T_1; // @[MSHR.scala 745:12]
  wire  _T_142 = req_acquire ? _T_137 : _T_141; // @[MSHR.scala 742:10]
  wire  _T_143 = ~bypassGet; // @[MSHR.scala 752:13]
  wire  _T_144 = ~bypassPut; // @[MSHR.scala 752:27]
  wire  _GEN_127 = ~bypassGet & ~bypassPut ? 1'h0 : 1'h1; // @[MSHR.scala 563:16 752:39 753:20]
  wire  _T_146 = ~acquirePermMiss; // @[MSHR.scala 757:12]
  wire  _GEN_128 = ~acquirePermMiss & (meta_self_hit & ~_transmit_from_other_client_T_1 | preferCache) ? 1'h0 : 1'h1; // @[MSHR.scala 564:17 757:91 758:21]
  wire  _GEN_129 = _T_142 ? 1'h0 : 1'h1; // @[MSHR.scala 558:15 747:7 748:17]
  wire  _GEN_130 = _T_142 ? _GEN_127 : 1'h1; // @[MSHR.scala 563:16 747:7]
  wire  _GEN_131 = _T_142 ? _GEN_128 : 1'h1; // @[MSHR.scala 564:17 747:7]
  wire  _T_153 = ~req_put; // @[MSHR.scala 764:37]
  wire  _T_162 = _req_needT_T_2 & prefetch_miss_need_probe; // @[MSHR.scala 770:37]
  wire  _T_163 = req_acquire & (req_needT | _prefetch_miss_need_probe_vec_T_5 | meta_clients_states_0_state[1]) | _T_162
    ; // @[MSHR.scala 769:81]
  wire  _T_164 = meta_clients_states_0_hit & _T_163; // @[MSHR.scala 768:24]
  wire  _GEN_132 = _prefetch_miss_need_probe_vec_T_5 ? 1'h0 : _GEN_131; // @[MSHR.scala 714:25 715:19]
  wire  _GEN_133 = _prefetch_miss_need_probe_vec_T_5 ? 1'h0 : 1'h1; // @[MSHR.scala 565:17 714:25 716:19]
  wire  _GEN_135 = _T_164 ? 1'h0 : 1'h1; // @[MSHR.scala 559:13 710:13 772:15]
  wire  _GEN_136 = _T_164 ? _GEN_132 : _GEN_131; // @[MSHR.scala 772:15]
  wire  _GEN_137 = _T_164 ? _GEN_133 : 1'h1; // @[MSHR.scala 772:15 565:17]
  wire  _GEN_144 = _other_clients_hit_T & _T_164; // @[MSHR.scala 766:29]
  wire  _GEN_145 = _other_clients_hit_T ? _GEN_135 : 1'h1; // @[MSHR.scala 766:29]
  wire  _GEN_146 = _other_clients_hit_T ? _GEN_136 : _GEN_131; // @[MSHR.scala 766:29]
  wire  _GEN_147 = _other_clients_hit_T ? _GEN_137 : 1'h1; // @[MSHR.scala 766:29]
  wire  _T_171 = meta_clients_states_0_hit & (meta_clients_states_0_state[1] | _prefetch_miss_need_probe_vec_T_5 |
    req_put); // @[MSHR.scala 784:26]
  wire  _GEN_150 = meta_self_hit ? 1'h0 : _GEN_132; // @[MSHR.scala 786:33 787:27]
  wire  _GEN_152 = meta_clients_states_0_hit & (meta_clients_states_0_state[1] | _prefetch_miss_need_probe_vec_T_5 |
    req_put) ? 1'h0 : 1'h1; // @[MSHR.scala 559:13 710:13 784:77]
  wire  _GEN_153 = meta_clients_states_0_hit & (meta_clients_states_0_state[1] | _prefetch_miss_need_probe_vec_T_5 |
    req_put) ? _GEN_150 : _GEN_131; // @[MSHR.scala 784:77]
  wire  _GEN_154 = meta_clients_states_0_hit & (meta_clients_states_0_state[1] | _prefetch_miss_need_probe_vec_T_5 |
    req_put) ? _GEN_133 : 1'h1; // @[MSHR.scala 565:17 784:77]
  wire  _GEN_155 = req_opcode != 3'h4 & ~req_put ? _GEN_144 : _T_171; // @[MSHR.scala 764:47]
  wire  _GEN_156 = req_opcode != 3'h4 & ~req_put ? _GEN_145 : _GEN_152; // @[MSHR.scala 764:47]
  wire  _GEN_157 = req_opcode != 3'h4 & ~req_put ? _GEN_146 : _GEN_153; // @[MSHR.scala 764:47]
  wire  _GEN_158 = req_opcode != 3'h4 & ~req_put ? _GEN_147 : _GEN_154; // @[MSHR.scala 764:47]
  wire  _T_184 = req_acquire & (req_needT | _prefetch_miss_need_probe_vec_T_5 | meta_clients_states_1_state[1]) | _T_162
    ; // @[MSHR.scala 769:81]
  wire  _T_185 = meta_clients_states_1_hit & _T_184; // @[MSHR.scala 768:24]
  wire  _GEN_159 = _prefetch_miss_need_probe_vec_T_5 ? 1'h0 : _GEN_157; // @[MSHR.scala 714:25 715:19]
  wire  _GEN_160 = _prefetch_miss_need_probe_vec_T_5 ? 1'h0 : _GEN_158; // @[MSHR.scala 714:25 716:19]
  wire  _GEN_161 = _T_185 | _GEN_155; // @[MSHR.scala 772:15 709:16]
  wire  _GEN_162 = _T_185 ? 1'h0 : _GEN_156; // @[MSHR.scala 710:13 772:15]
  wire  _GEN_163 = _T_185 ? _GEN_159 : _GEN_157; // @[MSHR.scala 772:15]
  wire  _GEN_164 = _T_185 ? _GEN_160 : _GEN_158; // @[MSHR.scala 772:15]
  wire  _GEN_171 = _other_clients_hit_T_2 ? _GEN_161 : _GEN_155; // @[MSHR.scala 766:29]
  wire  _GEN_172 = _other_clients_hit_T_2 ? _GEN_162 : _GEN_156; // @[MSHR.scala 766:29]
  wire  _GEN_173 = _other_clients_hit_T_2 ? _GEN_163 : _GEN_157; // @[MSHR.scala 766:29]
  wire  _GEN_174 = _other_clients_hit_T_2 ? _GEN_164 : _GEN_158; // @[MSHR.scala 766:29]
  wire  _GEN_177 = meta_self_hit ? 1'h0 : _GEN_159; // @[MSHR.scala 786:33 787:27]
  wire  _GEN_178 = meta_clients_states_1_hit & (meta_clients_states_1_state[1] | _prefetch_miss_need_probe_vec_T_5 |
    req_put) | _GEN_155; // @[MSHR.scala 709:16 784:77]
  wire  _GEN_179 = meta_clients_states_1_hit & (meta_clients_states_1_state[1] | _prefetch_miss_need_probe_vec_T_5 |
    req_put) ? 1'h0 : _GEN_156; // @[MSHR.scala 710:13 784:77]
  wire  _GEN_180 = meta_clients_states_1_hit & (meta_clients_states_1_state[1] | _prefetch_miss_need_probe_vec_T_5 |
    req_put) ? _GEN_177 : _GEN_157; // @[MSHR.scala 784:77]
  wire  _GEN_181 = meta_clients_states_1_hit & (meta_clients_states_1_state[1] | _prefetch_miss_need_probe_vec_T_5 |
    req_put) ? _GEN_160 : _GEN_158; // @[MSHR.scala 784:77]
  wire  _GEN_182 = req_opcode != 3'h4 & ~req_put ? _GEN_171 : _GEN_178; // @[MSHR.scala 764:47]
  wire  _GEN_183 = req_opcode != 3'h4 & ~req_put ? _GEN_172 : _GEN_179; // @[MSHR.scala 764:47]
  wire  _GEN_184 = req_opcode != 3'h4 & ~req_put ? _GEN_173 : _GEN_180; // @[MSHR.scala 764:47]
  wire  _GEN_185 = req_opcode != 3'h4 & ~req_put ? _GEN_174 : _GEN_181; // @[MSHR.scala 764:47]
  wire  _GEN_186 = _T_146 & (meta_self_hit | preferCache) ? 1'h0 : _GEN_184; // @[MSHR.scala 796:64 797:21]
  wire  _GEN_189 = _prefetch_miss_need_probe_vec_T_15 ? 1'h0 : 1'h1; // @[MSHR.scala 567:20 800:36 801:24]
  wire  _GEN_190 = req_acquire ? _GEN_186 : _GEN_184; // @[MSHR.scala 794:23]
  wire  _GEN_191 = req_acquire ? 1'h0 : _GEN_183; // @[MSHR.scala 794:23 799:22]
  wire  _GEN_192 = req_acquire ? _GEN_189 : 1'h1; // @[MSHR.scala 567:20 794:23]
  wire  _T_204 = _transmit_from_other_client_T_1 | _req_acquire_T | prefetch_need_data; // @[MSHR.scala 807:60]
  wire  _T_205 = _prefetch_miss_need_probe_vec_T_5 & preferCache & _T_204; // @[MSHR.scala 806:37]
  wire  _GEN_193 = _T_205 ? 1'h0 : _GEN_185; // @[MSHR.scala 808:7 809:19]
  wire  _GEN_194 = bypassPut ? 1'h0 : 1'h1; // @[MSHR.scala 568:19 812:21 813:21]
  wire  _GEN_195 = req_put & _T_144 ? 1'h0 : 1'h1; // @[MSHR.scala 582:18 815:33 816:20]
  wire  _GEN_196 = req_put & meta_self_hit & ~meta_self_dirty ? 1'h0 : _GEN_190; // @[MSHR.scala 819:56 820:19]
  wire  _GEN_197 = ~(_req_needT_T_2 & clients_hit) ? _req_needT_T_2 : 1'h1; // @[MSHR.scala 562:15 724:15 866:54]
  wire  _GEN_198 = ~(_req_needT_T_2 & clients_hit) ? _GEN_125 : 1'h1; // @[MSHR.scala 560:15 866:54]
  wire  _GEN_199 = ~(_req_needT_T_2 & clients_hit) & _T_133; // @[MSHR.scala 594:18 866:54]
  wire  _GEN_200 = ~(_req_needT_T_2 & clients_hit) ? _GEN_129 : 1'h1; // @[MSHR.scala 558:15 866:54]
  wire  _GEN_201 = ~(_req_needT_T_2 & clients_hit) ? _GEN_130 : 1'h1; // @[MSHR.scala 563:16 866:54]
  wire  _GEN_202 = ~(_req_needT_T_2 & clients_hit) ? _GEN_196 : 1'h1; // @[MSHR.scala 564:17 866:54]
  wire  _GEN_203 = ~(_req_needT_T_2 & clients_hit) & _GEN_182; // @[MSHR.scala 595:16 866:54]
  wire  _GEN_204 = ~(_req_needT_T_2 & clients_hit) ? _GEN_183 : 1'h1; // @[MSHR.scala 559:13 866:54]
  wire  _GEN_205 = ~(_req_needT_T_2 & clients_hit) ? _GEN_193 : 1'h1; // @[MSHR.scala 565:17 866:54]
  wire  _GEN_206 = ~(_req_needT_T_2 & clients_hit) ? _GEN_191 : 1'h1; // @[MSHR.scala 566:20 866:54]
  wire  _GEN_207 = ~(_req_needT_T_2 & clients_hit) ? _GEN_96 : 1'h1; // @[MSHR.scala 581:16 866:54]
  wire  _GEN_208 = ~(_req_needT_T_2 & clients_hit) ? _GEN_192 : 1'h1; // @[MSHR.scala 567:20 866:54]
  wire  _GEN_209 = ~(_req_needT_T_2 & clients_hit) ? _GEN_194 : 1'h1; // @[MSHR.scala 568:19 866:54]
  wire  _GEN_210 = ~(_req_needT_T_2 & clients_hit) ? _GEN_195 : 1'h1; // @[MSHR.scala 582:18 866:54]
  wire  _GEN_211 = req_channel[1] ? _GEN_120 : 1'h1; // @[MSHR.scala 561:16 863:29]
  wire  _GEN_212 = req_channel[1] ? _GEN_122 : _GEN_202; // @[MSHR.scala 863:29]
  wire  _GEN_213 = req_channel[1] ? _GEN_124 : _GEN_204; // @[MSHR.scala 863:29]
  wire  _GEN_214 = req_channel[1] ? _GEN_124 : _GEN_206; // @[MSHR.scala 863:29]
  wire  _GEN_215 = req_channel[1] | _GEN_197; // @[MSHR.scala 562:15 863:29]
  wire  _GEN_216 = req_channel[1] | _GEN_198; // @[MSHR.scala 560:15 863:29]
  wire  _GEN_218 = req_channel[1] | _GEN_200; // @[MSHR.scala 558:15 863:29]
  wire  _GEN_219 = req_channel[1] | _GEN_201; // @[MSHR.scala 563:16 863:29]
  wire  _GEN_221 = req_channel[1] | _GEN_205; // @[MSHR.scala 565:17 863:29]
  wire  _GEN_222 = req_channel[1] | _GEN_207; // @[MSHR.scala 581:16 863:29]
  wire  _GEN_223 = req_channel[1] | _GEN_208; // @[MSHR.scala 567:20 863:29]
  wire  _GEN_224 = req_channel[1] | _GEN_209; // @[MSHR.scala 568:19 863:29]
  wire  _GEN_225 = req_channel[1] | _GEN_210; // @[MSHR.scala 582:18 863:29]
  wire  _GEN_226 = req_channel[2] ? _GEN_112 : _GEN_213; // @[MSHR.scala 857:23]
  wire  _GEN_227 = req_channel[2] ? _GEN_113 : _GEN_214; // @[MSHR.scala 857:23]
  wire  _GEN_228 = req_channel[2] ? _GEN_114 : _GEN_212; // @[MSHR.scala 857:23]
  wire  _GEN_229 = req_channel[2] ? _GEN_115 : _GEN_216; // @[MSHR.scala 857:23]
  wire  _GEN_230 = req_channel[2] ? _GEN_116 : _GEN_216; // @[MSHR.scala 857:23]
  wire  _GEN_231 = req_channel[2] ? req_fromCmoHelper : _GEN_215; // @[MSHR.scala 857:23]
  wire  _GEN_232 = req_channel[2] ? _GEN_118 : _GEN_221; // @[MSHR.scala 857:23]
  wire  _GEN_233 = req_channel[2] ? _GEN_119 : 1'h1; // @[MSHR.scala 569:20 857:23]
  wire  _GEN_234 = req_channel[2] | _GEN_211; // @[MSHR.scala 561:16 857:23]
  wire  _GEN_236 = req_channel[2] | _GEN_218; // @[MSHR.scala 558:15 857:23]
  wire  _GEN_237 = req_channel[2] | _GEN_219; // @[MSHR.scala 563:16 857:23]
  wire  _GEN_239 = req_channel[2] | _GEN_222; // @[MSHR.scala 581:16 857:23]
  wire  _GEN_240 = req_channel[2] | _GEN_223; // @[MSHR.scala 567:20 857:23]
  wire  _GEN_241 = req_channel[2] | _GEN_224; // @[MSHR.scala 568:19 857:23]
  wire  _GEN_242 = req_channel[2] | _GEN_225; // @[MSHR.scala 582:18 857:23]
  wire  _GEN_243 = _GEN_9 ? _GEN_97 : _GEN_231; // @[MSHR.scala 843:48]
  wire  _GEN_244 = _GEN_9 ? _GEN_95 : _GEN_234; // @[MSHR.scala 843:48]
  wire  _GEN_245 = _GEN_9 ? _GEN_98 : _GEN_239; // @[MSHR.scala 843:48]
  wire  _GEN_246 = _GEN_9 | _GEN_226; // @[MSHR.scala 559:13 843:48]
  wire  _GEN_247 = _GEN_9 | _GEN_227; // @[MSHR.scala 566:20 843:48]
  wire  _GEN_248 = _GEN_9 | _GEN_228; // @[MSHR.scala 564:17 843:48]
  wire  _GEN_249 = _GEN_9 | _GEN_229; // @[MSHR.scala 560:15 843:48]
  wire  _GEN_250 = _GEN_9 | _GEN_230; // @[MSHR.scala 580:18 843:48]
  wire  _GEN_251 = _GEN_9 | _GEN_232; // @[MSHR.scala 565:17 843:48]
  wire  _GEN_252 = _GEN_9 | _GEN_233; // @[MSHR.scala 569:20 843:48]
  wire  _GEN_254 = _GEN_9 | _GEN_236; // @[MSHR.scala 558:15 843:48]
  wire  _GEN_255 = _GEN_9 | _GEN_237; // @[MSHR.scala 563:16 843:48]
  wire  _GEN_257 = _GEN_9 | _GEN_240; // @[MSHR.scala 567:20 843:48]
  wire  _GEN_258 = _GEN_9 | _GEN_241; // @[MSHR.scala 568:19 843:48]
  wire  _GEN_259 = _GEN_9 | _GEN_242; // @[MSHR.scala 582:18 843:48]
  wire  _GEN_260 = io_dirResult_valid ? _GEN_254 : s_acquire; // @[MSHR.scala 528:26 839:28]
  wire  _GEN_261 = io_dirResult_valid ? _GEN_246 : s_probe; // @[MSHR.scala 529:24 839:28]
  wire  _GEN_262 = io_dirResult_valid ? _GEN_249 : s_release; // @[MSHR.scala 530:26 839:28]
  wire  _GEN_263 = io_dirResult_valid ? _GEN_244 : s_probeack; // @[MSHR.scala 531:27 839:28]
  wire  _GEN_264 = io_dirResult_valid ? _GEN_243 : s_execute; // @[MSHR.scala 532:26 839:28]
  wire  _GEN_265 = io_dirResult_valid ? _GEN_255 : s_grantack; // @[MSHR.scala 533:27 839:28]
  wire  _GEN_266 = io_dirResult_valid ? _GEN_248 : s_wbselfdir; // @[MSHR.scala 534:28 839:28]
  wire  _GEN_267 = io_dirResult_valid ? _GEN_251 : s_wbselftag; // @[MSHR.scala 535:28 839:28]
  wire  _GEN_268 = io_dirResult_valid ? _GEN_247 : s_wbclientsdir; // @[MSHR.scala 839:28 536:31]
  wire  _GEN_269 = io_dirResult_valid ? _GEN_257 : s_wbclientstag; // @[MSHR.scala 839:28 537:31]
  wire  _GEN_270 = io_dirResult_valid ? _GEN_258 : s_transferput; // @[MSHR.scala 839:28 538:30]
  wire  _GEN_271 = io_dirResult_valid ? _GEN_252 : s_writerelease; // @[MSHR.scala 839:28 539:31]
  wire  _GEN_272 = io_dirResult_valid | s_writeprobe; // @[MSHR.scala 570:18 839:28 540:29]
  wire  _GEN_276 = io_dirResult_valid ? _GEN_254 : w_grantfirst; // @[MSHR.scala 839:28 547:29]
  wire  _GEN_277 = io_dirResult_valid ? _GEN_254 : w_grantlast; // @[MSHR.scala 548:28 839:28]
  wire  _GEN_278 = io_dirResult_valid ? _GEN_254 : w_grant; // @[MSHR.scala 549:24 839:28]
  wire  _GEN_279 = io_dirResult_valid ? _GEN_250 : w_releaseack; // @[MSHR.scala 839:28 550:29]
  wire  _GEN_280 = io_dirResult_valid ? _GEN_245 : w_grantack; // @[MSHR.scala 551:27 839:28]
  wire  _GEN_281 = io_dirResult_valid ? _GEN_259 : w_putwritten; // @[MSHR.scala 839:28 552:29]
  wire  _GEN_282 = io_dirResult_valid | promoteT_safe; // @[MSHR.scala 584:19 839:28 83:30]
  wire  _GEN_283 = io_dirResult_valid ? 1'h0 : gotT; // @[MSHR.scala 585:10 839:28 84:21]
  wire  _GEN_286 = io_dirResult_valid ? 1'h0 : bad_grant; // @[MSHR.scala 588:15 457:26 839:28]
  wire  _GEN_288 = io_dirResult_valid ? 1'h0 : inv_self_dir; // @[MSHR.scala 590:18 839:28 130:29]
  wire  will_drop_release = io_releaseThrough & io_dirResult_valid & req_channel[2] & ~will_release_through; // @[MSHR.scala 873:62 878:23]
  wire  _will_save_probeack_T_2 = will_probeack_through & _highest_perm_T & meta_self_hit; // @[MSHR.scala 902:78]
  wire  _GEN_299 = req_fromProbeHelper ? will_probeack_through & (_prefetch_miss_need_probe_vec_T_5 |
    io_probeAckDataThrough) : will_probeack_through; // @[MSHR.scala 903:33 904:29 908:29]
  wire  _GEN_303 = req_channel[1] & _T_74; // @[MSHR.scala 899:21 901:26]
  wire  will_drop_probeack = io_dirResult_valid & _GEN_303; // @[MSHR.scala 898:28]
  wire  _GEN_304 = req_channel[1] ? will_probeack_through & _highest_perm_T & meta_self_hit & _req_needT_T_3 : 1'h1; // @[MSHR.scala 899:21 902:26]
  wire  will_save_probeack = io_dirResult_valid ? _GEN_304 : 1'h1; // @[MSHR.scala 898:28]
  wire  _GEN_301 = req_fromProbeHelper ? _will_save_probeack_T_2 : will_save_probeack; // @[MSHR.scala 903:33 906:26 910:26]
  wire  _probeAckDataSave_T_4 = ~probeAckDataDrop; // @[MSHR.scala 913:51]
  wire  _clients_meta_busy_T_2 = ~meta_clients_states_0_hit & _a_probe_clients_T_2; // @[MSHR.scala 925:60]
  wire  _clients_meta_busy_T_5 = ~meta_clients_states_1_hit & _a_probe_clients_T_12; // @[MSHR.scala 925:60]
  wire [1:0] _clients_meta_busy_T_6 = {_clients_meta_busy_T_2,_clients_meta_busy_T_5}; // @[Cat.scala 31:58]
  wire  clients_meta_busy = |_clients_meta_busy_T_6; // @[MSHR.scala 925:88]
  wire  _client_dir_conflict_T_3 = req_channel[0] & req_acquire & clients_meta_busy; // @[MSHR.scala 927:30]
  reg  client_dir_conflict; // @[Reg.scala 16:16]
  reg  probe_helper_finish; // @[MSHR.scala 930:36]
  wire  client_set_match = req_set[6:0] == io_bstatus_set[6:0]; // @[MSHR.scala 931:56]
  wire  _GEN_318 = req_valid & io_bstatus_probeHelperFinish & client_set_match | probe_helper_finish; // @[MSHR.scala 932:71 933:25 930:36]
  wire  can_start = client_dir_conflict ? probe_helper_finish : 1'h1; // @[MSHR.scala 942:22]
  wire  _io_tasks_source_a_valid_T_1 = ~s_transferput; // @[MSHR.scala 943:58]
  wire  _io_tasks_sink_c_valid_T_4 = ~s_writeprobe; // @[MSHR.scala 954:95]
  wire [2:0] acquire_opcode = req_put ? 3'h6 : req_opcode; // @[MSHR.scala 991:8]
  wire [2:0] _acquire_param_T_3 = req_put ? 3'h1 : req_param; // @[MSHR.scala 1001:69]
  wire [2:0] acquire_param = _req_acquire_T & _client_shrink_perm_T_1 ? 3'h1 : _acquire_param_T_3; // @[MSHR.scala 1001:8]
  wire [2:0] _io_tasks_source_a_bits_opcode_T_3 = _transmit_from_other_client_T_1 ? 3'h6 : acquire_opcode; // @[MSHR.scala 1013:8]
  wire [2:0] _io_tasks_source_a_bits_param_T_2 = _transmit_from_other_client_T_1 ? 3'h0 : acquire_param; // @[MSHR.scala 1030:8]
  wire [1:0] _io_tasks_source_bparam_T_4 = _client_shrink_perm_T_8 ? 2'h1 : 2'h2; // @[MSHR.scala 1049:10]
  wire [1:0] _io_tasks_source_bparam_T_6 = _req_needT_T_3 ? 2'h1 : 2'h2; // @[MSHR.scala 1051:12]
  wire [1:0] _io_tasks_source_bparam_T_8 = req_needT ? 2'h2 : 2'h1; // @[MSHR.scala 1052:12]
  wire [1:0] _io_tasks_source_bparam_T_9 = req_fromCmoHelper ? _io_tasks_source_bparam_T_6 :
    _io_tasks_source_bparam_T_8; // @[MSHR.scala 1050:10]
  wire [1:0] _io_tasks_source_bparam_T_10 = _req_needT_T_2 ? _io_tasks_source_bparam_T_4 :
    _io_tasks_source_bparam_T_9; // @[MSHR.scala 1047:8]
  wire  x_probe_clients_0 = _req_needT_T_3 ? _clients_have_T_T_1 : meta_clients_states_0_hit; // @[MSHR.scala 1062:18]
  wire  x_probe_clients_1 = _req_needT_T_3 ? _clients_have_T_T_3 : meta_clients_states_1_hit; // @[MSHR.scala 1062:18]
  wire  _probe_clients_T_3 = req_channel[0] & _req_needT_T_2; // @[MSHR.scala 1066:17]
  wire  _probe_clients_T_6_0 = req_fromCmoHelper ? x_probe_clients_0 : meta_clients_states_0_hit; // @[MSHR.scala 1071:12]
  wire  _probe_clients_T_6_1 = req_fromCmoHelper ? x_probe_clients_1 : meta_clients_states_1_hit; // @[MSHR.scala 1071:12]
  wire  _probe_clients_T_7_0 = req_channel[0] ? a_probe_clients_0 : _probe_clients_T_6_0; // @[MSHR.scala 1068:10]
  wire  _probe_clients_T_7_1 = req_channel[0] ? a_probe_clients_1 : _probe_clients_T_6_1; // @[MSHR.scala 1068:10]
  wire  _probe_clients_T_8_0 = _probe_clients_T_3 ? prefetch_miss_need_probe_vec_0 : _probe_clients_T_7_0; // @[MSHR.scala 1065:8]
  wire  _probe_clients_T_8_1 = _probe_clients_T_3 ? prefetch_miss_need_probe_vec_1 : _probe_clients_T_7_1; // @[MSHR.scala 1065:8]
  wire [1:0] _probe_clients_T_9 = {_probe_clients_T_8_1,_probe_clients_T_8_0}; // @[MSHR.scala 1076:7]
  reg [1:0] probe_clients; // @[Reg.scala 16:16]
  wire [1:0] _io_tasks_source_c_bits_opcode_T_2 = req_fromProbeHelper ? 2'h3 : 2'h2; // @[MSHR.scala 1087:10]
  wire  _io_tasks_source_c_bits_opcode_T_7 = probe_dirty & _probeAckDataSave_T_4 | _new_self_meta_dirty_T |
    req_needProbeAckData; // @[MSHR.scala 1088:77]
  wire  _io_tasks_source_c_bits_opcode_T_9 = _io_tasks_source_c_bits_opcode_T_7 & _will_probeack_through_T; // @[MSHR.scala 1089:50]
  wire [2:0] _io_tasks_source_c_bits_opcode_T_10 = {_io_tasks_source_c_bits_opcode_T_2,
    _io_tasks_source_c_bits_opcode_T_9}; // @[Cat.scala 31:58]
  wire [2:0] _io_tasks_source_c_bits_opcode_T_11 = {2'h3,meta_self_dirty}; // @[Cat.scala 31:58]
  wire  _probeack_param_T_2 = highest_perm[1] & _client_shrink_perm_T_8; // @[MSHR.scala 209:16]
  wire [1:0] _probeack_param_T_6 = _will_probeack_through_T & req_param != 3'h2 ? 2'h1 : 2'h0; // @[MSHR.scala 211:8]
  wire [1:0] _probeack_param_T_7 = _probeack_param_T_2 ? highest_perm : _probeack_param_T_6; // @[MSHR.scala 208:61]
  wire [3:0] _probeack_param_T_8 = {highest_perm,_probeack_param_T_7}; // @[Cat.scala 31:58]
  wire [2:0] _probeack_param_T_19 = 4'ha == _probeack_param_T_8 ? 3'h3 : 3'h5; // @[Mux.scala 81:58]
  wire [2:0] _probeack_param_T_21 = 4'hf == _probeack_param_T_8 ? 3'h3 : _probeack_param_T_19; // @[Mux.scala 81:58]
  wire [2:0] _probeack_param_T_23 = 4'h9 == _probeack_param_T_8 ? 3'h0 : _probeack_param_T_21; // @[Mux.scala 81:58]
  wire [2:0] _probeack_param_T_25 = 4'hd == _probeack_param_T_8 ? 3'h0 : _probeack_param_T_23; // @[Mux.scala 81:58]
  wire [2:0] _probeack_param_T_27 = 4'h8 == _probeack_param_T_8 ? 3'h1 : _probeack_param_T_25; // @[Mux.scala 81:58]
  wire [2:0] _probeack_param_T_29 = 4'hc == _probeack_param_T_8 ? 3'h1 : _probeack_param_T_27; // @[Mux.scala 81:58]
  wire [2:0] _probeack_param_T_31 = 4'h5 == _probeack_param_T_8 ? 3'h4 : _probeack_param_T_29; // @[Mux.scala 81:58]
  wire [2:0] _probeack_param_T_33 = 4'h4 == _probeack_param_T_8 ? 3'h2 : _probeack_param_T_31; // @[Mux.scala 81:58]
  wire [2:0] probeack_param = 4'h0 == _probeack_param_T_8 ? 3'h5 : _probeack_param_T_33; // @[Mux.scala 81:58]
  wire  _io_tasks_source_d_bits_useBypass_T_7 = ~probe_dirty | acquire_flag & io_tasks_source_a_bits_opcode != 3'h7; // @[MSHR.scala 1122:19]
  wire  _io_tasks_source_d_bits_useBypass_T_8 = (_prefetch_miss_need_probe_vec_T_5 | _T_82 & req_needT) &
    _io_tasks_source_d_bits_useBypass_T_7; // @[MSHR.scala 1121:79]
  wire [1:0] io_tasks_source_d_bits_channel_hi = {req_channel[2],1'h0}; // @[Cat.scala 31:58]
  wire [2:0] io_tasks_source_d_bits_opcode_grantOp = _client_shrink_perm_T_1 & _req_acquire_T_1 ? 3'h4 : 3'h5; // @[MSHR.scala 1138:10]
  wire [2:0] _GEN_326 = 3'h2 == req_opcode ? 3'h1 : 3'h0; // @[MSHR.scala 1142:{8,8}]
  wire [2:0] _GEN_327 = 3'h3 == req_opcode ? 3'h1 : _GEN_326; // @[MSHR.scala 1142:{8,8}]
  wire [2:0] _GEN_328 = 3'h4 == req_opcode ? 3'h1 : _GEN_327; // @[MSHR.scala 1142:{8,8}]
  wire [2:0] _GEN_329 = 3'h5 == req_opcode ? 3'h2 : _GEN_328; // @[MSHR.scala 1142:{8,8}]
  wire [2:0] _GEN_330 = 3'h6 == req_opcode ? io_tasks_source_d_bits_opcode_grantOp : _GEN_329; // @[MSHR.scala 1142:{8,8}]
  wire [2:0] _GEN_331 = 3'h7 == req_opcode ? 3'h4 : _GEN_330; // @[MSHR.scala 1142:{8,8}]
  wire  _io_tasks_source_d_bits_param_T = ~req_acquire; // @[MSHR.scala 1148:7]
  wire [1:0] _io_tasks_source_d_bits_param_T_1 = req_promoteT ? 2'h0 : 2'h1; // @[MSHR.scala 1150:54]
  wire [2:0] _io_tasks_source_d_bits_param_T_3 = 3'h0 == req_param ? {{1'd0}, _io_tasks_source_d_bits_param_T_1} :
    req_param; // @[Mux.scala 81:58]
  wire [2:0] _io_tasks_source_d_bits_param_T_5 = 3'h2 == req_param ? 3'h0 : _io_tasks_source_d_bits_param_T_3; // @[Mux.scala 81:58]
  wire [2:0] _io_tasks_source_d_bits_param_T_7 = 3'h1 == req_param ? 3'h0 : _io_tasks_source_d_bits_param_T_5; // @[Mux.scala 81:58]
  wire  _io_tasks_source_d_bits_dirty_T_5 = _client_shrink_perm_T_8 & ~req_promoteT ? 1'h0 : _new_self_meta_dirty_T_13; // @[MSHR.scala 1160:10]
  wire  _io_tasks_source_d_bits_dirty_T_7 = meta_self_hit ? _io_tasks_source_d_bits_dirty_T_5 : probe_dirty; // @[MSHR.scala 1158:8]
  wire  _io_tasks_sink_c_bits_bufIdx_T = io_resps_sink_c_valid & io_resps_sink_c_bits_hasData; // @[MSHR.scala 1186:66]
  reg [2:0] io_tasks_sink_c_bits_bufIdx_r; // @[Reg.scala 16:16]
  wire [2:0] _io_tasks_sink_c_bits_opcode_T_1 = req_fromProbeHelper | req_fromCmoHelper ? 3'h7 : 3'h5; // @[MSHR.scala 1190:8]
  wire  _io_tasks_sink_c_bits_dirty_T_1 = req_dirty | _new_self_meta_dirty_T; // @[MSHR.scala 1208:15]
  wire  _T_248 = io_tasks_source_a_ready & io_tasks_source_a_valid; // @[Decoupled.scala 50:35]
  wire  _GEN_333 = _T_248 | _GEN_260; // @[MSHR.scala 1244:34 1245:15]
  wire  _T_249 = io_tasks_source_bready & io_tasks_source_bvalid; // @[Decoupled.scala 50:35]
  wire  _T_254 = io_tasks_source_c_ready & io_tasks_source_c_valid; // @[Decoupled.scala 50:35]
  wire  _GEN_337 = _T_254 | _GEN_263; // @[MSHR.scala 1252:34 1254:16]
  wire  _T_255 = io_tasks_source_d_ready & io_tasks_source_d_valid; // @[Decoupled.scala 50:35]
  wire  _T_256 = io_tasks_source_e_ready & io_tasks_source_e_valid; // @[Decoupled.scala 50:35]
  wire  _GEN_339 = _T_256 | _GEN_265; // @[MSHR.scala 1259:34 1260:16]
  wire  _T_257 = io_tasks_dir_write_ready & io_tasks_dir_write_valid; // @[Decoupled.scala 50:35]
  wire  _T_258 = io_tasks_tag_write_ready & io_tasks_tag_write_valid; // @[Decoupled.scala 50:35]
  wire  _GEN_341 = _T_258 | _GEN_267; // @[MSHR.scala 1265:35 1266:17]
  wire  _T_259 = io_tasks_client_dir_write_ready & io_tasks_client_dir_write_valid; // @[Decoupled.scala 50:35]
  wire  _T_260 = io_tasks_client_tag_write_ready & io_tasks_client_tag_write_valid; // @[Decoupled.scala 50:35]
  wire  _T_261 = io_tasks_sink_c_ready & io_tasks_sink_c_valid; // @[Decoupled.scala 50:35]
  wire  _GEN_344 = _io_tasks_sink_c_valid_T_4 | _GEN_272; // @[MSHR.scala 1275:25 1276:20]
  wire  _GEN_346 = _T_261 ? _GEN_344 : _GEN_272; // @[MSHR.scala 1274:32]
  wire [1:0] _probeack_last_T = probes_done | _client_T_12; // @[MSHR.scala 1293:36]
  wire  probeack_last = _probeack_last_T == probe_clients; // @[MSHR.scala 1293:52]
  wire  _GEN_356 = _T_263 & io_resps_sink_c_bits_hasData | someClientHasProbeAckData; // @[MSHR.scala 1305:70 1306:31 191:42]
  wire  _T_271 = req_channel[1] & req_fromProbeHelper; // @[MSHR.scala 1313:22]
  wire  _GEN_357 = req_channel[1] & req_fromProbeHelper & probeAckDataThrough | req_fromCmoHelper & probeAckDataThrough
     ? 1'h0 : _GEN_279; // @[MSHR.scala 1313:112 1314:22]
  wire  _GEN_358 = req_fromProbeHelper ? 1'h0 : _GEN_279; // @[MSHR.scala 1322:34 1323:24]
  wire  _GEN_360 = req_channel[1] & (probeAckDataThrough & io_resps_sink_c_bits_param != 3'h5 | _T_75) ? _GEN_358 :
    _GEN_279; // @[MSHR.scala 1317:112]
  wire  _GEN_362 = someClientHasProbeAckData | io_resps_sink_c_bits_hasData ? _GEN_357 : _GEN_360; // @[MSHR.scala 1310:68]
  wire  _GEN_365 = _T_263 & probeack_last ? _GEN_362 : _GEN_279; // @[MSHR.scala 1309:55]
  wire  _wprobeack_T = req_off == 6'h0; // @[MSHR.scala 1333:72]
  wire  _T_287 = ~acquire_flag & req_channel[0] & probeack_last; // @[MSHR.scala 1336:34]
  wire  _T_289 = ~io_resps_sink_c_bits_hasData; // @[MSHR.scala 1337:39]
  wire  _T_291 = ~nested_c_hit; // @[MSHR.scala 1337:56]
  wire  _T_294 = _T_287 & io_resps_sink_c_bits_last & ~io_resps_sink_c_bits_hasData & ~nested_c_hit &
    _prefetch_miss_need_probe_vec_T_5; // @[MSHR.scala 1337:70]
  wire  _GEN_370 = _T_294 ? 1'h0 : _GEN_276; // @[MSHR.scala 1338:7 1344:20]
  wire  _GEN_371 = _T_294 ? 1'h0 : _GEN_277; // @[MSHR.scala 1338:7 1345:19]
  wire  _GEN_372 = _T_294 ? 1'h0 : _GEN_278; // @[MSHR.scala 1338:7 1346:15]
  wire  _T_311 = req_channel[0] & probeack_last & io_resps_sink_c_bits_last & _T_289 & _T_291 &
    _prefetch_miss_need_probe_vec_T_5; // @[MSHR.scala 1356:81]
  wire  _GEN_375 = ~(preferCache | meta_self_hit) | _GEN_341; // @[MSHR.scala 1358:45 1360:21]
  wire  _GEN_376 = ~(preferCache | meta_self_hit) | _GEN_288; // @[MSHR.scala 1358:45 1363:22]
  wire  _GEN_386 = req_valid & sink_c_resp_valid ? _GEN_370 : _GEN_276; // @[MSHR.scala 1328:40]
  wire  _GEN_387 = req_valid & sink_c_resp_valid ? _GEN_371 : _GEN_277; // @[MSHR.scala 1328:40]
  wire  _GEN_388 = req_valid & sink_c_resp_valid ? _GEN_372 : _GEN_278; // @[MSHR.scala 1328:40]
  wire  _GEN_395 = io_resps_sink_d_bits_opcode == 3'h4 | io_resps_sink_d_bits_opcode == 3'h5 |
    io_resps_sink_d_bits_opcode == 3'h1 | io_resps_sink_d_bits_opcode == 3'h0 | _GEN_386; // @[MSHR.scala 1369:188 1371:20]
  wire  _GEN_402 = io_resps_sink_d_bits_opcode == 3'h6 | _GEN_365; // @[MSHR.scala 1381:54 1382:20]
  wire  _GEN_415 = will_be_free ? 1'h0 : req_valid; // @[MSHR.scala 1402:22 1404:15 52:26]
  wire [3:0] clientBitOH_uncommonBits = io_alloc_bits_source[3:0]; // @[Parameters.scala 52:64]
  wire  _clientBitOH_T_1 = io_alloc_bits_source[5:4] == 2'h0; // @[Parameters.scala 54:32]
  wire  _clientBitOH_T_4 = clientBitOH_uncommonBits <= 4'hc; // @[Parameters.scala 57:20]
  wire  _clientBitOH_T_5 = _clientBitOH_T_1 & _clientBitOH_T_4; // @[Parameters.scala 56:50]
  wire [1:0] clientBitOH_uncommonBits_1 = io_alloc_bits_source[1:0]; // @[Parameters.scala 52:64]
  wire  _clientBitOH_T_7 = io_alloc_bits_source[5:2] == 4'h6; // @[Parameters.scala 54:32]
  wire  _clientBitOH_T_10 = clientBitOH_uncommonBits_1 <= 2'h2; // @[Parameters.scala 57:20]
  wire  _clientBitOH_T_11 = _clientBitOH_T_7 & _clientBitOH_T_10; // @[Parameters.scala 56:50]
  wire [1:0] clientBitOH = {_clientBitOH_T_11,_clientBitOH_T_5}; // @[Cat.scala 31:58]
  reg  preferCache_latch; // @[MSHR.scala 1453:34]
  reg  transmit_from_other_client_latch; // @[MSHR.scala 1454:49]
  wire  _io_status_bits_will_save_data_T_2 = preferCache_latch | meta_self_hit; // @[MSHR.scala 1464:68]
  wire  _io_status_bits_nestB_T = w_releaseack & w_probeacklast; // @[MSHR.scala 1471:19]
  wire  _io_status_bits_nestB_T_1 = meta_valid & _io_status_bits_nestB_T; // @[MSHR.scala 1470:38]
  wire  _io_status_bits_nestB_T_3 = ~w_grantfirst; // @[MSHR.scala 1472:6]
  wire  _io_status_bits_nestB_T_5 = client_dir_conflict & ~probe_helper_finish; // @[MSHR.scala 1472:44]
  wire  _io_status_bits_nestB_T_6 = ~w_grantfirst | client_dir_conflict & ~probe_helper_finish; // @[MSHR.scala 1472:20]
  wire  _io_status_bits_nestC_T = meta_valid & w_releaseack; // @[MSHR.scala 1475:38]
  wire  _io_status_bits_nestC_T_6 = ~w_probeackfirst | _io_status_bits_nestB_T_3 | _io_status_bits_nestB_T_5; // @[MSHR.scala 1478:41]
  wire  nest_c_set_match = io_c_status_set == req_set; // @[MSHR.scala 1487:42]
  wire  nest_c_tag_match = io_c_status_tag == req_tag; // @[MSHR.scala 1488:42]
  wire [2:0] meta_self_way = _GEN_7; // @[MSHR.scala 70:14]
  wire  nest_c_way_match = io_c_status_way == meta_self_way; // @[MSHR.scala 1489:42]
  wire  _a_c_through_T_3 = nest_c_tag_match & _prefetch_miss_need_probe_vec_T_5; // @[MSHR.scala 1492:24]
  reg  a_c_through_reg; // @[MSHR.scala 1418:24]
  wire  _a_c_through_T_11 = meta_self_hit | a_c_through_reg; // @[MSHR.scala 1424:19]
  wire  _a_c_through_T_14 = ~nest_c_tag_match & nest_c_way_match & (preferCache_latch & _T_146 | _a_c_through_T_11 |
    transmit_from_other_client_latch); // @[MSHR.scala 1493:45]
  wire  _a_c_through_T_15 = nest_c_tag_match & _prefetch_miss_need_probe_vec_T_5 & ~nest_c_way_match | _a_c_through_T_14
    ; // @[MSHR.scala 1492:63]
  wire  _a_c_through_T_19 = nest_c_tag_match & nest_c_way_match & _prefetch_miss_need_probe_vec_T_5 & a_do_release; // @[MSHR.scala 1494:62]
  wire  _a_c_through_T_20 = _a_c_through_T_15 | _a_c_through_T_19; // @[MSHR.scala 1493:177]
  wire  a_c_through = req_channel[0] & _a_c_through_T_20; // @[MSHR.scala 1491:31]
  wire  b_c_through = req_channel[1] & (_a_c_through_T_3 | nest_c_way_match & meta_self_hit != nest_c_tag_match); // @[MSHR.scala 1497:31]
  wire  _io_c_status_releaseThrough_T = req_valid & io_c_status_nestedReleaseData; // @[MSHR.scala 1499:43]
  wire  _io_c_status_releaseThrough_T_1 = _io_c_status_releaseThrough_T & nest_c_set_match; // @[MSHR.scala 1500:35]
  wire  _io_c_status_releaseThrough_T_2 = a_c_through | b_c_through; // @[MSHR.scala 1502:18]
  wire  _io_bstatus_probeAckDataThrough_T = io_bstatus_set == req_set; // @[MSHR.scala 1506:21]
  wire  _io_bstatus_probeAckDataThrough_T_1 = req_valid & _io_bstatus_probeAckDataThrough_T; // @[MSHR.scala 1505:48]
  wire  _io_bstatus_probeAckDataThrough_T_4 = io_bstatus_way == meta_self_way; // @[MSHR.scala 1507:21]
  wire  _io_bstatus_probeAckDataThrough_T_5 = _io_bstatus_probeAckDataThrough_T_1 & io_bstatus_tag != req_tag &
    _io_bstatus_probeAckDataThrough_T_4; // @[MSHR.scala 1506:64]
  wire  _io_bstatus_probeAckDataThrough_T_6 = _io_bstatus_probeAckDataThrough_T_5 & io_bstatus_nestedProbeAckData; // @[MSHR.scala 1507:39]
  wire  _io_bstatus_probeAckDataThrough_T_9 = _io_bstatus_probeAckDataThrough_T_6 & req_channel[0]; // @[MSHR.scala 1508:36]
  assign io_status_valid = req_valid; // @[MSHR.scala 1457:19]
  assign io_status_bits_set = req_set; // @[MSHR.scala 1458:22]
  assign io_status_bits_tag = req_tag; // @[MSHR.scala 1459:22]
  assign io_status_bits_way = meta_self_way; // @[MSHR.scala 1461:22]
  assign io_status_bits_way_reg = meta_reg_self_way; // @[MSHR.scala 1462:26]
  assign io_status_bits_nestB = _io_status_bits_nestB_T_1 & s_writeprobe & _io_status_bits_nestB_T_6; // @[MSHR.scala 1471:54]
  assign io_status_bits_nestC = _io_status_bits_nestC_T & _io_status_bits_nestC_T_6; // @[MSHR.scala 1476:18]
  assign io_status_bits_will_grant_data = req_channel[0] & io_tasks_source_d_bits_opcode[0] &
    io_tasks_source_d_bits_useBypass; // @[MSHR.scala 1463:63]
  assign io_status_bits_will_save_data = req_channel[0] & (preferCache_latch | meta_self_hit) & _T_146; // @[MSHR.scala 1464:86]
  assign io_status_bits_will_free = no_wait & no_schedule; // @[MSHR.scala 1401:27]
  assign io_tasks_sink_a_valid = 1'h0; // @[MSHR.scala 953:25]
  assign io_tasks_sink_a_bits_sourceId = req_source; // @[MSHR.scala 1170:15]
  assign io_tasks_sink_a_bits_set = req_set; // @[MSHR.scala 1171:10]
  assign io_tasks_sink_a_bits_tag = req_tag; // @[MSHR.scala 1172:10]
  assign io_tasks_sink_a_bits_size = req_size; // @[MSHR.scala 1173:11]
  assign io_tasks_sink_a_bits_off = req_off; // @[MSHR.scala 1174:10]
  assign io_tasks_source_bvalid = io_enable & ~s_probe & s_release; // @[MSHR.scala 944:52]
  assign io_tasks_source_bset = req_set; // @[MSHR.scala 1039:10]
  assign io_tasks_source_btag = req_tag; // @[MSHR.scala 1038:10]
  assign io_tasks_source_bparam = req_channel[1] ? req_param : {{1'd0}, _io_tasks_source_bparam_T_10}; // @[MSHR.scala 1044:18]
  assign io_tasks_source_bclients = probe_clients; // @[MSHR.scala 1079:14]
  assign io_tasks_source_bneedData = a_need_data & _prefetch_miss_need_probe_vec_T_5 | req_channel[1] &
    req_needProbeAckData; // @[MSHR.scala 1081:37]
  assign io_tasks_sink_c_valid = io_enable & (~s_writerelease & (~releaseSave | s_release) | ~s_writeprobe); // @[MSHR.scala 954:38]
  assign io_tasks_sink_c_bits_sourceId = 6'h0;
  assign io_tasks_sink_c_bits_set = req_set; // @[MSHR.scala 1178:10]
  assign io_tasks_sink_c_bits_tag = req_tag; // @[MSHR.scala 1179:10]
  assign io_tasks_sink_c_bits_size = req_size; // @[MSHR.scala 1180:11]
  assign io_tasks_sink_c_bits_way = meta_self_way; // @[MSHR.scala 1182:10]
  assign io_tasks_sink_c_bits_off = req_off; // @[MSHR.scala 1181:10]
  assign io_tasks_sink_c_bits_bufIdx = s_writeprobe ? req_bufIdx : io_tasks_sink_c_bits_bufIdx_r; // @[MSHR.scala 1183:19]
  assign io_tasks_sink_c_bits_opcode = s_writeprobe ? req_opcode : _io_tasks_sink_c_bits_opcode_T_1; // @[MSHR.scala 1188:19]
  assign io_tasks_sink_c_bits_param = _io_tasks_sink_c_valid_T_4 ? probeack_param : req_param; // @[MSHR.scala 1199:18]
  assign io_tasks_sink_c_bits_source = io_id; // @[MSHR.scala 1177:13]
  assign io_tasks_sink_c_bits_save = s_writeprobe ? releaseSave : probeAckDataSave; // @[MSHR.scala 1204:17]
  assign io_tasks_sink_c_bits_drop = s_writeprobe ? releaseDrop : probeAckDataDrop; // @[MSHR.scala 1205:17]
  assign io_tasks_sink_c_bits_release = s_writeprobe ? releaseThrough : probeAckDataThrough; // @[MSHR.scala 1206:20]
  assign io_tasks_sink_c_bits_dirty = s_writeprobe ? _io_tasks_sink_c_bits_dirty_T_1 : _new_self_meta_dirty_T_20; // @[MSHR.scala 1207:18]
  assign io_tasks_source_d_valid = io_enable & ~s_execute & can_start & w_grant & s_writeprobe & w_probeacklast &
    s_transferput; // @[MSHR.scala 946:112]
  assign io_tasks_source_d_bits_sourceId = req_source; // @[MSHR.scala 1124:15]
  assign io_tasks_source_d_bits_set = req_set; // @[MSHR.scala 1125:10]
  assign io_tasks_source_d_bits_tag = req_tag; // @[MSHR.scala 1126:10]
  assign io_tasks_source_d_bits_channel = {io_tasks_source_d_bits_channel_hi,req_channel[0]}; // @[Cat.scala 31:58]
  assign io_tasks_source_d_bits_opcode = req_channel[0] ? _GEN_331 : 3'h6; // @[MSHR.scala 1142:8]
  assign io_tasks_source_d_bits_param = _io_tasks_source_d_bits_param_T ? req_param : _io_tasks_source_d_bits_param_T_7; // @[MSHR.scala 1147:8]
  assign io_tasks_source_d_bits_size = req_size; // @[MSHR.scala 1152:11]
  assign io_tasks_source_d_bits_way = meta_reg_self_way; // @[MSHR.scala 1153:10]
  assign io_tasks_source_d_bits_off = req_off; // @[MSHR.scala 1154:10]
  assign io_tasks_source_d_bits_useBypass = _io_tasks_source_d_bits_useBypass_T_8 & _T_153; // @[MSHR.scala 1123:54]
  assign io_tasks_source_d_bits_bufIdx = req_bufIdx; // @[MSHR.scala 1165:13]
  assign io_tasks_source_d_bits_denied = bad_grant; // @[MSHR.scala 1155:26]
  assign io_tasks_source_d_bits_sinkId = io_id; // @[MSHR.scala 1120:13]
  assign io_tasks_source_d_bits_bypassPut = bypassPut_latch_reg; // @[MSHR.scala 1435:{26,26}]
  assign io_tasks_source_d_bits_dirty = req_acquire & _io_tasks_source_d_bits_dirty_T_7; // @[MSHR.scala 1156:18]
  assign io_tasks_source_a_valid = io_enable & (_T_46 | ~s_transferput) & s_release & s_probe & w_probeacklast &
    can_start; // @[MSHR.scala 943:116]
  assign io_tasks_source_a_bits_tag = req_tag; // @[MSHR.scala 981:10]
  assign io_tasks_source_a_bits_set = req_set; // @[MSHR.scala 982:10]
  assign io_tasks_source_a_bits_off = req_off; // @[MSHR.scala 983:10]
  assign io_tasks_source_a_bits_mask = req_mask; // @[MSHR.scala 984:11]
  assign io_tasks_source_a_bits_opcode = _io_tasks_source_a_valid_T_1 | bypassGet ? req_opcode :
    _io_tasks_source_a_bits_opcode_T_3; // @[MSHR.scala 1004:19]
  assign io_tasks_source_a_bits_param = _io_tasks_source_a_valid_T_1 ? req_param : _io_tasks_source_a_bits_param_T_2; // @[MSHR.scala 1015:18]
  assign io_tasks_source_a_bits_source = io_id; // @[MSHR.scala 1032:13]
  assign io_tasks_source_a_bits_bufIdx = req_bufIdx; // @[MSHR.scala 1035:13]
  assign io_tasks_source_a_bits_size = req_size; // @[MSHR.scala 1036:11]
  assign io_tasks_source_a_bits_needData = ~_req_acquire_T_1 | req_size != 3'h6; // @[MSHR.scala 1033:48]
  assign io_tasks_source_a_bits_putData = bypassPut_latch_reg; // @[MSHR.scala 1435:{26,26}]
  assign io_tasks_source_c_valid = io_enable & (~s_release | ~s_probeack & s_writerelease & w_probeack); // @[MSHR.scala 945:40]
  assign io_tasks_source_c_bits_opcode = req_channel[1] ? _io_tasks_source_c_bits_opcode_T_10 :
    _io_tasks_source_c_bits_opcode_T_11; // @[MSHR.scala 1084:19]
  assign io_tasks_source_c_bits_tag = req_channel[1] ? req_tag : meta_self_tag; // @[MSHR.scala 1093:16]
  assign io_tasks_source_c_bits_set = req_set; // @[MSHR.scala 1094:10]
  assign io_tasks_source_c_bits_param = req_channel[1] ? probeack_param : replace_param; // @[MSHR.scala 1111:18]
  assign io_tasks_source_c_bits_source = io_id; // @[MSHR.scala 1116:13]
  assign io_tasks_source_c_bits_way = meta_reg_self_way; // @[MSHR.scala 1117:10]
  assign io_tasks_source_c_bits_dirty = req_channel[1] ? _new_self_meta_dirty_T_20 : meta_self_dirty; // @[MSHR.scala 1118:18]
  assign io_tasks_source_e_valid = ~s_grantack & w_grantfirst; // @[MSHR.scala 947:42]
  assign io_tasks_source_e_bits_sink = sink; // @[MSHR.scala 1168:11]
  assign io_tasks_dir_write_valid = io_enable & ~s_wbselfdir & no_wait & can_start; // @[MSHR.scala 948:68]
  assign io_tasks_dir_write_bits_set = req_set; // @[MSHR.scala 1212:31]
  assign io_tasks_dir_write_bits_way = meta_reg_self_way; // @[MSHR.scala 1213:31]
  assign io_tasks_dir_write_bits_data_dirty = bad_grant ? 1'h0 : new_self_meta_dirty; // @[MSHR.scala 459:19 445:22 460:24]
  assign io_tasks_dir_write_bits_data_state = bad_grant ? meta_self_state : new_self_meta_state; // @[MSHR.scala 459:19 446:22 461:24]
  assign io_tasks_dir_write_bits_data_clientStates_0 = bad_grant ? _new_self_dir_clientStates_0_T_2 :
    new_self_meta_clientStates_0; // @[MSHR.scala 459:19 464:15 447:29]
  assign io_tasks_dir_write_bits_data_clientStates_1 = bad_grant ? _new_self_dir_clientStates_1_T_2 :
    new_self_meta_clientStates_1; // @[MSHR.scala 459:19 464:15 447:29]
  assign io_tasks_tag_write_valid = io_enable & ~s_wbselftag & no_wait & can_start; // @[MSHR.scala 949:68]
  assign io_tasks_tag_write_bits_set = req_set; // @[MSHR.scala 1216:31]
  assign io_tasks_tag_write_bits_way = meta_reg_self_way; // @[MSHR.scala 1217:31]
  assign io_tasks_tag_write_bits_tag = req_tag; // @[MSHR.scala 1218:31]
  assign io_tasks_client_dir_write_valid = io_enable & ~s_wbclientsdir & no_wait & can_start; // @[MSHR.scala 950:78]
  assign io_tasks_client_dir_write_bits_set = debug_addr_hi[6:0]; // @[Directory.scala 97:25]
  assign io_tasks_client_dir_write_bits_way = meta_reg_clients_way; // @[Directory.scala 98:14]
  assign io_tasks_client_dir_write_bits_data_0_state = req_channel[2] ? _GEN_40 : _GEN_53; // @[MSHR.scala 431:19]
  assign io_tasks_client_dir_write_bits_data_1_state = req_channel[2] ? _GEN_41 : _GEN_54; // @[MSHR.scala 431:19]
  assign io_tasks_client_tag_write_valid = io_enable & ~s_wbclientstag & no_wait & can_start; // @[MSHR.scala 951:78]
  assign io_tasks_client_tag_write_bits_set = debug_addr_hi[6:0]; // @[Directory.scala 79:25]
  assign io_tasks_client_tag_write_bits_way = meta_reg_clients_way; // @[Directory.scala 80:14]
  assign io_tasks_client_tag_write_bits_tag = debug_addr_hi[29:7]; // @[Directory.scala 81:25]
  assign io_c_status_releaseThrough = _io_c_status_releaseThrough_T_1 & _io_c_status_releaseThrough_T_2; // @[MSHR.scala 1501:22]
  assign io_bstatus_probeAckDataThrough = _io_bstatus_probeAckDataThrough_T_9 & _io_status_bits_will_save_data_T_2 &
    _T_146; // @[MSHR.scala 1509:55]
  assign io_is_nestedReleaseData = req_channel[2] & req_valid; // @[MSHR.scala 1481:40]
  assign io_is_nestedProbeAckData = req_channel[1] & req_valid; // @[MSHR.scala 1483:60]
  assign io_probeHelperFinish = _T_271 & no_schedule & no_wait; // @[MSHR.scala 1484:75]
  always @(posedge clock) begin
    if (io_alloc_valid) begin // @[MSHR.scala 1442:24]
      req_channel <= io_alloc_bits_channel; // @[MSHR.scala 1444:9]
    end
    if (io_alloc_valid) begin // @[MSHR.scala 1442:24]
      req_opcode <= io_alloc_bits_opcode; // @[MSHR.scala 1444:9]
    end
    if (io_alloc_valid) begin // @[MSHR.scala 1442:24]
      req_param <= io_alloc_bits_param; // @[MSHR.scala 1444:9]
    end
    if (io_alloc_valid) begin // @[MSHR.scala 1442:24]
      req_size <= io_alloc_bits_size; // @[MSHR.scala 1444:9]
    end
    if (io_alloc_valid) begin // @[MSHR.scala 1442:24]
      req_source <= io_alloc_bits_source; // @[MSHR.scala 1444:9]
    end
    if (io_alloc_valid) begin // @[MSHR.scala 1442:24]
      req_set <= io_alloc_bits_set; // @[MSHR.scala 1444:9]
    end
    if (io_alloc_valid) begin // @[MSHR.scala 1442:24]
      req_tag <= io_alloc_bits_tag; // @[MSHR.scala 1444:9]
    end
    if (io_alloc_valid) begin // @[MSHR.scala 1442:24]
      req_off <= io_alloc_bits_off; // @[MSHR.scala 1444:9]
    end
    if (io_alloc_valid) begin // @[MSHR.scala 1442:24]
      req_mask <= io_alloc_bits_mask; // @[MSHR.scala 1444:9]
    end
    if (io_alloc_valid) begin // @[MSHR.scala 1442:24]
      req_bufIdx <= io_alloc_bits_bufIdx; // @[MSHR.scala 1444:9]
    end else if (req_valid & io_resps_sink_d_valid) begin // @[MSHR.scala 1368:44]
      if (io_resps_sink_d_bits_opcode == 3'h4 | io_resps_sink_d_bits_opcode == 3'h5 | io_resps_sink_d_bits_opcode == 3'h1
         | io_resps_sink_d_bits_opcode == 3'h0) begin // @[MSHR.scala 1369:188]
        if (_T_153) begin // @[MSHR.scala 1377:23]
          req_bufIdx <= io_resps_sink_d_bits_bufIdx; // @[MSHR.scala 1378:20]
        end
      end
    end
    if (io_alloc_valid) begin // @[MSHR.scala 1442:24]
      req_preferCache <= io_alloc_bits_preferCache; // @[MSHR.scala 1444:9]
    end
    if (io_alloc_valid) begin // @[MSHR.scala 1442:24]
      req_dirty <= io_alloc_bits_dirty; // @[MSHR.scala 1444:9]
    end
    if (io_alloc_valid) begin // @[MSHR.scala 1442:24]
      req_fromProbeHelper <= io_alloc_bits_fromProbeHelper; // @[MSHR.scala 1444:9]
    end
    if (io_alloc_valid) begin // @[MSHR.scala 1442:24]
      req_fromCmoHelper <= io_alloc_bits_fromCmoHelper; // @[MSHR.scala 1444:9]
    end
    if (io_alloc_valid) begin // @[MSHR.scala 1442:24]
      req_needProbeAckData <= io_alloc_bits_needProbeAckData; // @[MSHR.scala 1444:9]
    end
    if (io_alloc_valid) begin // @[MSHR.scala 1442:24]
      if (clientBitOH == 2'h0) begin // @[MSHR.scala 1448:15]
        iam <= 2'h2;
      end else begin
        iam <= {{1'd0}, clientBitOH[1]};
      end
    end
    if (change_self_meta) begin // @[MSHR.scala 485:26]
      meta_reg_self_dirty <= _GEN_69;
    end else if (io_dirResult_valid) begin // @[MSHR.scala 66:28]
      meta_reg_self_dirty <= io_dirResult_bits_self_dirty; // @[MSHR.scala 68:14]
    end
    if (change_self_meta) begin // @[MSHR.scala 485:26]
      if (io_nestedwb_btoN) begin // @[MSHR.scala 499:29]
        meta_reg_self_state <= 2'h0; // @[MSHR.scala 500:27]
      end else if (io_nestedwb_btoB) begin // @[MSHR.scala 495:29]
        meta_reg_self_state <= 2'h1; // @[MSHR.scala 496:27]
      end else begin
        meta_reg_self_state <= _GEN_3;
      end
    end else begin
      meta_reg_self_state <= _GEN_3;
    end
    if (change_self_meta) begin // @[MSHR.scala 485:26]
      if (io_nestedwb_btoN) begin // @[MSHR.scala 499:29]
        meta_reg_self_clientStates_0 <= 2'h0; // @[MSHR.scala 502:44]
      end else if (io_nestedwb_btoB) begin // @[MSHR.scala 495:29]
        if (meta_reg_self_clientStates_0[1]) begin // @[MSHR.scala 497:57]
          meta_reg_self_clientStates_0 <= 2'h1;
        end
      end else begin
        meta_reg_self_clientStates_0 <= _GEN_4;
      end
    end else begin
      meta_reg_self_clientStates_0 <= _GEN_4;
    end
    if (change_self_meta) begin // @[MSHR.scala 485:26]
      if (io_nestedwb_btoN) begin // @[MSHR.scala 499:29]
        meta_reg_self_clientStates_1 <= 2'h0; // @[MSHR.scala 502:44]
      end else if (io_nestedwb_btoB) begin // @[MSHR.scala 495:29]
        if (meta_reg_self_clientStates_1[1]) begin // @[MSHR.scala 497:57]
          meta_reg_self_clientStates_1 <= 2'h1;
        end
      end else begin
        meta_reg_self_clientStates_1 <= _GEN_5;
      end
    end else begin
      meta_reg_self_clientStates_1 <= _GEN_5;
    end
    if (change_self_meta) begin // @[MSHR.scala 485:26]
      if (io_nestedwb_btoN) begin // @[MSHR.scala 499:29]
        meta_reg_self_hit <= 1'h0; // @[MSHR.scala 501:25]
      end else begin
        meta_reg_self_hit <= _GEN_6;
      end
    end else begin
      meta_reg_self_hit <= _GEN_6;
    end
    if (io_dirResult_valid) begin // @[MSHR.scala 66:28]
      meta_reg_self_way <= io_dirResult_bits_self_way; // @[MSHR.scala 68:14]
    end
    if (io_dirResult_valid) begin // @[MSHR.scala 66:28]
      meta_reg_self_tag <= io_dirResult_bits_self_tag; // @[MSHR.scala 68:14]
    end
    if (change_clients_meta_0) begin // @[MSHR.scala 516:36]
      if (io_nestedwb_clients_0_isToN) begin // @[MSHR.scala 520:49]
        meta_reg_clients_states_0_state <= 2'h0; // @[MSHR.scala 521:21]
      end else begin
        meta_reg_clients_states_0_state <= _GEN_10;
      end
    end else begin
      meta_reg_clients_states_0_state <= _GEN_10;
    end
    if (change_clients_meta_0) begin // @[MSHR.scala 516:36]
      if (io_nestedwb_clients_0_isToN) begin // @[MSHR.scala 520:49]
        meta_reg_clients_states_0_hit <= 1'h0; // @[MSHR.scala 522:19]
      end else begin
        meta_reg_clients_states_0_hit <= _GEN_11;
      end
    end else begin
      meta_reg_clients_states_0_hit <= _GEN_11;
    end
    if (change_clients_meta_1) begin // @[MSHR.scala 516:36]
      if (io_nestedwb_clients_1_isToN) begin // @[MSHR.scala 520:49]
        meta_reg_clients_states_1_state <= 2'h0; // @[MSHR.scala 521:21]
      end else begin
        meta_reg_clients_states_1_state <= _GEN_12;
      end
    end else begin
      meta_reg_clients_states_1_state <= _GEN_12;
    end
    if (change_clients_meta_1) begin // @[MSHR.scala 516:36]
      if (io_nestedwb_clients_1_isToN) begin // @[MSHR.scala 520:49]
        meta_reg_clients_states_1_hit <= 1'h0; // @[MSHR.scala 522:19]
      end else begin
        meta_reg_clients_states_1_hit <= _GEN_13;
      end
    end else begin
      meta_reg_clients_states_1_hit <= _GEN_13;
    end
    if (io_dirResult_valid) begin // @[MSHR.scala 66:28]
      meta_reg_clients_tag <= io_dirResult_bits_clients_tag; // @[MSHR.scala 68:14]
    end
    if (io_dirResult_valid) begin // @[MSHR.scala 66:28]
      meta_reg_clients_way <= io_dirResult_bits_clients_way; // @[MSHR.scala 68:14]
    end
    if (req_valid & io_resps_sink_d_valid) begin // @[MSHR.scala 1368:44]
      if (io_resps_sink_d_bits_opcode == 3'h4 | io_resps_sink_d_bits_opcode == 3'h5 | io_resps_sink_d_bits_opcode == 3'h1
         | io_resps_sink_d_bits_opcode == 3'h0) begin // @[MSHR.scala 1369:188]
        sink <= io_resps_sink_d_bits_sink; // @[MSHR.scala 1370:12]
      end
    end
    if (io_dirResult_valid) begin // @[Reg.scala 17:18]
      client_dir_conflict <= _client_dir_conflict_T_3; // @[Reg.scala 17:22]
    end
    if (io_dirResult_valid) begin // @[Reg.scala 17:18]
      probe_clients <= _probe_clients_T_9; // @[Reg.scala 17:22]
    end
    if (_io_tasks_sink_c_bits_bufIdx_T) begin // @[Reg.scala 17:18]
      io_tasks_sink_c_bits_bufIdx_r <= io_resps_sink_c_bits_bufIdx; // @[Reg.scala 17:22]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MSHR.scala 1442:24]
      req_valid <= 1'h0; // @[MSHR.scala 1443:15]
    end else begin
      req_valid <= io_alloc_valid | _GEN_415;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MSHR.scala 1402:22]
      meta_valid <= 1'h0; // @[MSHR.scala 1403:16]
    end else if (will_be_free) begin
      meta_valid <= 1'h0;
    end else begin
      meta_valid <= _GEN_0;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MSHR.scala 1328:40]
      promoteT_safe <= 1'h1; // @[MSHR.scala 1338:7 1342:21]
    end else if (req_valid & sink_c_resp_valid) begin
      if (_T_294) begin
        promoteT_safe <= 1'h0;
      end else begin
        promoteT_safe <= _GEN_282;
      end
    end else begin
      promoteT_safe <= _GEN_282;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MSHR.scala 1368:44]
      gotT <= 1'h0; // @[MSHR.scala 1369:188 1375:12]
    end else if (req_valid & io_resps_sink_d_valid) begin
      if (io_resps_sink_d_bits_opcode == 3'h4 | io_resps_sink_d_bits_opcode == 3'h5 | io_resps_sink_d_bits_opcode == 3'h1
         | io_resps_sink_d_bits_opcode == 3'h0) begin
        gotT <= io_resps_sink_d_bits_param == 3'h0;
      end else begin
        gotT <= _GEN_283;
      end
    end else begin
      gotT <= _GEN_283;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MSHR.scala 839:28]
      a_do_release <= 1'h0; // @[MSHR.scala 594:{18,18,18} 843:48 857:23 863:29]
    end else if (io_dirResult_valid) begin // @[MSHR.scala 86:29]
      if (_GEN_9) begin
        a_do_release <= 1'h0;
      end else if (req_channel[2]) begin
        a_do_release <= 1'h0;
      end else if (req_channel[1]) begin
        a_do_release <= 1'h0;
      end else begin
        a_do_release <= _GEN_199;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MSHR.scala 839:28]
      a_do_probe <= 1'h0; // @[MSHR.scala 595:{16,16,16} 843:48 857:23 863:29]
    end else if (io_dirResult_valid) begin // @[MSHR.scala 87:27]
      if (_GEN_9) begin
        a_do_probe <= 1'h0;
      end else if (req_channel[2]) begin
        a_do_probe <= 1'h0;
      end else if (req_channel[1]) begin
        a_do_probe <= 1'h0;
      end else begin
        a_do_probe <= _GEN_203;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MSHR.scala 1328:40]
      probe_dirty <= 1'h0; // @[MSHR.scala 1334:17]
    end else if (req_valid & sink_c_resp_valid) begin // @[MSHR.scala 839:28]
      probe_dirty <= probe_dirty | io_resps_sink_c_bits_hasData | nested_c_hit; // @[MSHR.scala 586:17]
    end else if (io_dirResult_valid) begin // @[MSHR.scala 94:28]
      probe_dirty <= 1'h0;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MSHR.scala 1328:40]
      probes_done <= 2'h0; // @[MSHR.scala 1330:17]
    end else if (req_valid & sink_c_resp_valid) begin // @[MSHR.scala 839:28]
      probes_done <= _probeack_last_T; // @[MSHR.scala 587:17]
    end else if (io_dirResult_valid) begin // @[MSHR.scala 95:28]
      probes_done <= 2'h0;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MSHR.scala 1419:31]
      highest_perm_reg_reg <= 2'h0; // @[MSHR.scala 113:12 114:{32,32} ParallelMux.scala 78:{45,45}]
    end else if (io_dirResult_valid) begin // @[MSHR.scala 1421:31]
      if (_highest_perm_T_2 > _highest_perm_T_6) begin // @[MSHR.scala 1422:13]
        if (meta_self_hit & ~io_probeAckDataThrough) begin
          highest_perm_reg_reg <= meta_self_state;
        end else begin
          highest_perm_reg_reg <= 2'h0;
        end
      end else if (_highest_perm_T_3 > _highest_perm_T_4) begin
        if (meta_clients_states_0_hit) begin
          highest_perm_reg_reg <= meta_clients_states_0_state;
        end else begin
          highest_perm_reg_reg <= 2'h0;
        end
      end else if (meta_clients_states_1_hit) begin
        highest_perm_reg_reg <= meta_clients_states_1_state;
      end else begin
        highest_perm_reg_reg <= 2'h0;
      end
    end else if (will_be_free) begin // @[MSHR.scala 1418:24]
      highest_perm_reg_reg <= 2'h0;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MSHR.scala 1328:40]
      w_probeacklast <= 1'h1; // @[MSHR.scala 1332:20]
    end else if (req_valid & sink_c_resp_valid) begin // @[MSHR.scala 839:28]
      w_probeacklast <= w_probeacklast | probeack_last & io_resps_sink_c_bits_last;
    end else if (io_dirResult_valid) begin // @[MSHR.scala 545:31]
      w_probeacklast <= _GEN_246;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MSHR.scala 1368:44]
      w_grantlast <= 1'h1; // @[MSHR.scala 1369:188 1372:19]
    end else if (req_valid & io_resps_sink_d_valid) begin
      if (io_resps_sink_d_bits_opcode == 3'h4 | io_resps_sink_d_bits_opcode == 3'h5 | io_resps_sink_d_bits_opcode == 3'h1
         | io_resps_sink_d_bits_opcode == 3'h0) begin
        w_grantlast <= w_grantlast | io_resps_sink_d_bits_last;
      end else begin
        w_grantlast <= _GEN_387;
      end
    end else begin
      w_grantlast <= _GEN_387;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MSHR.scala 1368:44]
      w_releaseack <= 1'h1;
    end else if (req_valid & io_resps_sink_d_valid) begin // @[MSHR.scala 1309:55]
      w_releaseack <= _GEN_402; // @[MSHR.scala 1310:68 1313:112 1314:22 1317:112]
    end else if (_T_263 & probeack_last) begin
      if (someClientHasProbeAckData | io_resps_sink_c_bits_hasData) begin
        if (req_channel[1] & req_fromProbeHelper & probeAckDataThrough | req_fromCmoHelper & probeAckDataThrough) begin
          w_releaseack <= 1'h0;
        end else begin
          w_releaseack <= _GEN_279;
        end
      end else if (req_channel[1] & (probeAckDataThrough & io_resps_sink_c_bits_param != 3'h5 | _T_75)) begin
        w_releaseack <= _GEN_358;
      end else begin
        w_releaseack <= _GEN_279;
      end
    end else begin
      w_releaseack <= _GEN_279;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MSHR.scala 1386:31]
      w_grantack <= 1'h1; // @[MSHR.scala 1387:16]
    end else begin
      w_grantack <= io_resps_sink_e_valid | _GEN_280;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MSHR.scala 1390:33]
      w_putwritten <= 1'h1; // @[MSHR.scala 1391:18]
    end else begin
      w_putwritten <= io_resps_source_d_valid | _GEN_281;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MSHR.scala 1309:55]
      s_probeack <= 1'h1; // @[MSHR.scala 1310:68 1317:112 1321:20]
    end else if (_T_263 & probeack_last) begin
      if (someClientHasProbeAckData | io_resps_sink_c_bits_hasData) begin
        s_probeack <= _GEN_337;
      end else if (req_channel[1] & (probeAckDataThrough & io_resps_sink_c_bits_param != 3'h5 | _T_75)) begin
        s_probeack <= 1'h0;
      end else begin
        s_probeack <= _GEN_337;
      end
    end else begin
      s_probeack <= _GEN_337;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MSHR.scala 1256:34]
      s_execute <= 1'h1; // @[MSHR.scala 1257:15]
    end else begin
      s_execute <= _T_255 | _GEN_264;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MSHR.scala 1328:40]
      s_grantack <= 1'h1; // @[MSHR.scala 1338:7 1347:45 1348:20]
    end else if (req_valid & sink_c_resp_valid) begin
      if (_T_294) begin
        if (_T_143 & ~bypassPut_latch_reg) begin
          s_grantack <= 1'h0;
        end else begin
          s_grantack <= _GEN_339;
        end
      end else begin
        s_grantack <= _GEN_339;
      end
    end else begin
      s_grantack <= _GEN_339;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MSHR.scala 1396:76]
      no_schedule_REG <= 1'h1;
    end else begin
      no_schedule_REG <= s_wbselfdir & s_wbselftag & s_wbclientsdir & s_wbclientstag & meta_valid;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MSHR.scala 1274:32]
      s_writerelease <= 1'h1; // @[MSHR.scala 1275:25 1278:22]
    end else if (_T_261) begin
      if (_io_tasks_sink_c_valid_T_4) begin
        s_writerelease <= _GEN_271;
      end else begin
        s_writerelease <= 1'h1;
      end
    end else begin
      s_writerelease <= _GEN_271;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MSHR.scala 1309:55]
      s_writeprobe <= 1'h1; // @[MSHR.scala 1310:68 1312:20]
    end else if (_T_263 & probeack_last) begin
      if (someClientHasProbeAckData | io_resps_sink_c_bits_hasData) begin
        s_writeprobe <= 1'h0;
      end else begin
        s_writeprobe <= _GEN_346;
      end
    end else begin
      s_writeprobe <= _GEN_346;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MSHR.scala 1244:34]
      s_transferput <= 1'h1; // @[MSHR.scala 1246:19]
    end else begin
      s_transferput <= _T_248 | _GEN_270;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MSHR.scala 1328:40]
      inv_self_dir <= 1'h0; // @[MSHR.scala 1357:7]
    end else if (req_valid & sink_c_resp_valid) begin
      if (_T_311) begin
        inv_self_dir <= _GEN_376;
      end else begin
        inv_self_dir <= _GEN_288;
      end
    end else begin
      inv_self_dir <= _GEN_288;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MSHR.scala 1300:38]
      client_probeack_param_vec_reg_0 <= 3'h0; // @[MSHR.scala 1296:29 1303:{39,39}]
    end else if (req_valid & sinkc_resp_last) begin // @[MSHR.scala 131:46]
      if (~client) begin
        client_probeack_param_vec_reg_0 <= io_resps_sink_c_bits_param;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MSHR.scala 1300:38]
      client_probeack_param_vec_reg_1 <= 3'h0; // @[MSHR.scala 1296:29 1303:{39,39}]
    end else if (req_valid & sinkc_resp_last) begin // @[MSHR.scala 131:46]
      if (client) begin
        client_probeack_param_vec_reg_1 <= io_resps_sink_c_bits_param;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MSHR.scala 1419:31]
      transmit_from_other_client_reg <= 1'h0; // @[MSHR.scala 1420:13]
    end else if (io_dirResult_valid) begin // @[MSHR.scala 1421:31]
      transmit_from_other_client_reg <= _transmit_from_other_client_T_12; // @[MSHR.scala 1422:13]
    end else if (will_be_free) begin // @[MSHR.scala 1418:24]
      transmit_from_other_client_reg <= 1'h0;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MSHR.scala 1402:22]
      releaseThrough <= 1'h0; // @[MSHR.scala 1405:20]
    end else if (will_be_free) begin // @[MSHR.scala 873:62]
      releaseThrough <= 1'h0; // @[MSHR.scala 882:20]
    end else if (io_releaseThrough & io_dirResult_valid & req_channel[2]) begin // @[MSHR.scala 178:31]
      releaseThrough <= will_release_through;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MSHR.scala 1402:22]
      releaseDrop <= 1'h0; // @[MSHR.scala 1406:17]
    end else if (will_be_free) begin // @[MSHR.scala 873:62]
      releaseDrop <= 1'h0; // @[MSHR.scala 883:17]
    end else if (io_releaseThrough & io_dirResult_valid & req_channel[2]) begin // @[MSHR.scala 179:28]
      releaseDrop <= will_drop_release;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MSHR.scala 1402:22]
      probeAckDataThrough <= 1'h0; // @[MSHR.scala 1407:25]
    end else if (will_be_free) begin // @[MSHR.scala 898:28]
      probeAckDataThrough <= 1'h0; // @[MSHR.scala 899:21 916:29 917:27 187:36]
    end else if (io_dirResult_valid) begin // @[MSHR.scala 187:36]
      if (req_fromCmoHelper) begin
        probeAckDataThrough <= _req_needT_T_9 & (clients_have_T & _prefetch_miss_need_probe_vec_T_5);
      end else if (req_channel[1]) begin
        probeAckDataThrough <= _GEN_299;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MSHR.scala 1402:22]
      probeAckDataDrop <= 1'h0; // @[MSHR.scala 1408:22]
    end else if (will_be_free) begin // @[MSHR.scala 898:28]
      probeAckDataDrop <= 1'h0; // @[MSHR.scala 899:21 916:29 918:24 188:33]
    end else if (io_dirResult_valid) begin // @[MSHR.scala 188:33]
      if (req_fromCmoHelper) begin
        probeAckDataDrop <= _client_shrink_perm_T_8;
      end else if (req_channel[1]) begin
        probeAckDataDrop <= will_drop_probeack;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MSHR.scala 1402:22]
      probeAckDataSave <= 1'h0; // @[MSHR.scala 1409:22]
    end else if (will_be_free) begin // @[MSHR.scala 898:28]
      probeAckDataSave <= 1'h0; // @[MSHR.scala 899:21 913:24 916:29 919:24]
    end else if (io_dirResult_valid) begin // @[MSHR.scala 189:33]
      if (req_fromCmoHelper) begin
        probeAckDataSave <= _probeAckDataSave_T_4 & _new_self_meta_dirty_T_8;
      end else if (req_channel[1]) begin
        probeAckDataSave <= _GEN_301;
      end else begin
        probeAckDataSave <= _new_self_meta_dirty_T_8 & ~probeAckDataDrop;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MSHR.scala 1402:22]
      someClientHasProbeAckData <= 1'h0; // @[MSHR.scala 1411:31]
    end else if (will_be_free) begin
      someClientHasProbeAckData <= 1'h0;
    end else begin
      someClientHasProbeAckData <= _GEN_356;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MSHR.scala 1368:44]
      bad_grant <= 1'h0; // @[MSHR.scala 1369:188 1374:17]
    end else if (req_valid & io_resps_sink_d_valid) begin
      if (io_resps_sink_d_bits_opcode == 3'h4 | io_resps_sink_d_bits_opcode == 3'h5 | io_resps_sink_d_bits_opcode == 3'h1
         | io_resps_sink_d_bits_opcode == 3'h0) begin
        bad_grant <= io_resps_sink_d_bits_denied;
      end else begin
        bad_grant <= _GEN_286;
      end
    end else begin
      bad_grant <= _GEN_286;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MSHR.scala 839:28]
      nested_c_hit_reg <= 1'h0; // @[MSHR.scala 591:22]
    end else if (io_dirResult_valid) begin
      nested_c_hit_reg <= 1'h0;
    end else begin
      nested_c_hit_reg <= nested_c_hit;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MSHR.scala 1328:40]
      s_acquire <= 1'h1; // @[MSHR.scala 1338:7 1343:17]
    end else if (req_valid & sink_c_resp_valid) begin
      if (_T_294) begin
        s_acquire <= 1'h0;
      end else begin
        s_acquire <= _GEN_333;
      end
    end else begin
      s_acquire <= _GEN_333;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MSHR.scala 1248:34]
      s_probe <= 1'h1; // @[MSHR.scala 1249:13]
    end else begin
      s_probe <= _T_249 | _GEN_261;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MSHR.scala 1252:34]
      s_release <= 1'h1; // @[MSHR.scala 1253:15]
    end else begin
      s_release <= _T_254 | _GEN_262;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MSHR.scala 1262:35]
      s_wbselfdir <= 1'h1; // @[MSHR.scala 1263:17]
    end else begin
      s_wbselfdir <= _T_257 | _GEN_266;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MSHR.scala 1328:40]
      s_wbselftag <= 1'h1; // @[MSHR.scala 1357:7]
    end else if (req_valid & sink_c_resp_valid) begin
      if (_T_311) begin
        s_wbselftag <= _GEN_375;
      end else begin
        s_wbselftag <= _GEN_341;
      end
    end else begin
      s_wbselftag <= _GEN_341;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MSHR.scala 1268:41]
      s_wbclientsdir <= 1'h1; // @[MSHR.scala 1269:20]
    end else begin
      s_wbclientsdir <= _T_259 | _GEN_268;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MSHR.scala 1271:41]
      s_wbclientstag <= 1'h1; // @[MSHR.scala 1272:20]
    end else begin
      s_wbclientstag <= _T_260 | _GEN_269;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MSHR.scala 1328:40]
      w_probeackfirst <= 1'h1; // @[MSHR.scala 1331:21]
    end else if (req_valid & sink_c_resp_valid) begin // @[MSHR.scala 839:28]
      w_probeackfirst <= w_probeackfirst | probeack_last;
    end else if (io_dirResult_valid) begin // @[MSHR.scala 544:32]
      w_probeackfirst <= _GEN_246;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MSHR.scala 1328:40]
      w_probeack <= 1'h1; // @[MSHR.scala 1333:16]
    end else if (req_valid & sink_c_resp_valid) begin // @[MSHR.scala 839:28]
      w_probeack <= w_probeack | probeack_last & (io_resps_sink_c_bits_last | req_off == 6'h0);
    end else if (io_dirResult_valid) begin // @[MSHR.scala 546:27]
      w_probeack <= _GEN_246;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MSHR.scala 1368:44]
      w_grantfirst <= 1'h1;
    end else if (req_valid & io_resps_sink_d_valid) begin // @[MSHR.scala 1328:40]
      w_grantfirst <= _GEN_395; // @[MSHR.scala 1338:7 1344:20]
    end else if (req_valid & sink_c_resp_valid) begin
      if (_T_294) begin
        w_grantfirst <= 1'h0;
      end else begin
        w_grantfirst <= _GEN_276;
      end
    end else begin
      w_grantfirst <= _GEN_276;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MSHR.scala 1368:44]
      w_grant <= 1'h1; // @[MSHR.scala 1369:188 1373:15]
    end else if (req_valid & io_resps_sink_d_valid) begin
      if (io_resps_sink_d_bits_opcode == 3'h4 | io_resps_sink_d_bits_opcode == 3'h5 | io_resps_sink_d_bits_opcode == 3'h1
         | io_resps_sink_d_bits_opcode == 3'h0) begin
        w_grant <= _wprobeack_T & req_size == 3'h6 | io_resps_sink_d_bits_last;
      end else begin
        w_grant <= _GEN_388;
      end
    end else begin
      w_grant <= _GEN_388;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MSHR.scala 839:28]
      acquire_flag <= 1'h0; // @[MSHR.scala 593:18]
    end else if (io_dirResult_valid) begin
      acquire_flag <= 1'h0;
    end else begin
      acquire_flag <= _GEN_91;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MSHR.scala 1430:29]
      bypassPut_latch_reg <= 1'h0; // @[MSHR.scala 1431:11]
    end else if (io_dirResult_valid) begin // @[MSHR.scala 1432:29]
      bypassPut_latch_reg <= bypassPut; // @[MSHR.scala 1433:11]
    end else if (will_be_free) begin // @[MSHR.scala 1429:22]
      bypassPut_latch_reg <= 1'h0;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MSHR.scala 1402:22]
      probe_helper_finish <= 1'h0; // @[MSHR.scala 1410:25]
    end else if (will_be_free) begin
      probe_helper_finish <= 1'h0;
    end else begin
      probe_helper_finish <= _GEN_318;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MSHR.scala 705:38]
      preferCache_latch <= 1'h0;
    end else begin
      preferCache_latch <= req_preferCache & ~bypassPut_all;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MSHR.scala 164:51]
      transmit_from_other_client_latch <= 1'h0;
    end else begin
      transmit_from_other_client_latch <= _prefetch_miss_need_probe_vec_T_5 & _transmit_from_other_client_T_13;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MSHR.scala 1419:31]
      a_c_through_reg <= 1'h0; // @[MSHR.scala 1420:13]
    end else if (io_dirResult_valid) begin // @[MSHR.scala 1421:31]
      a_c_through_reg <= meta_self_hit; // @[MSHR.scala 1422:13]
    end else if (will_be_free) begin // @[MSHR.scala 1418:24]
      a_c_through_reg <= 1'h0;
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
  req_channel = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  req_opcode = _RAND_1[2:0];
  _RAND_2 = {1{`RANDOM}};
  req_param = _RAND_2[2:0];
  _RAND_3 = {1{`RANDOM}};
  req_size = _RAND_3[2:0];
  _RAND_4 = {1{`RANDOM}};
  req_source = _RAND_4[5:0];
  _RAND_5 = {1{`RANDOM}};
  req_set = _RAND_5[9:0];
  _RAND_6 = {1{`RANDOM}};
  req_tag = _RAND_6[19:0];
  _RAND_7 = {1{`RANDOM}};
  req_off = _RAND_7[5:0];
  _RAND_8 = {1{`RANDOM}};
  req_mask = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  req_bufIdx = _RAND_9[2:0];
  _RAND_10 = {1{`RANDOM}};
  req_preferCache = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  req_dirty = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  req_fromProbeHelper = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  req_fromCmoHelper = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  req_needProbeAckData = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  req_valid = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  iam = _RAND_16[1:0];
  _RAND_17 = {1{`RANDOM}};
  meta_reg_self_dirty = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  meta_reg_self_state = _RAND_18[1:0];
  _RAND_19 = {1{`RANDOM}};
  meta_reg_self_clientStates_0 = _RAND_19[1:0];
  _RAND_20 = {1{`RANDOM}};
  meta_reg_self_clientStates_1 = _RAND_20[1:0];
  _RAND_21 = {1{`RANDOM}};
  meta_reg_self_hit = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  meta_reg_self_way = _RAND_22[2:0];
  _RAND_23 = {1{`RANDOM}};
  meta_reg_self_tag = _RAND_23[19:0];
  _RAND_24 = {1{`RANDOM}};
  meta_reg_clients_states_0_state = _RAND_24[1:0];
  _RAND_25 = {1{`RANDOM}};
  meta_reg_clients_states_0_hit = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  meta_reg_clients_states_1_state = _RAND_26[1:0];
  _RAND_27 = {1{`RANDOM}};
  meta_reg_clients_states_1_hit = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  meta_reg_clients_tag = _RAND_28[22:0];
  _RAND_29 = {1{`RANDOM}};
  meta_reg_clients_way = _RAND_29[3:0];
  _RAND_30 = {1{`RANDOM}};
  meta_valid = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  promoteT_safe = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  gotT = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  a_do_release = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  a_do_probe = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  probe_dirty = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  probes_done = _RAND_36[1:0];
  _RAND_37 = {1{`RANDOM}};
  highest_perm_reg_reg = _RAND_37[1:0];
  _RAND_38 = {1{`RANDOM}};
  w_probeacklast = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  w_grantlast = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  w_releaseack = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  w_grantack = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  w_putwritten = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  s_probeack = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  s_execute = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  s_grantack = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  no_schedule_REG = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  s_writerelease = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  s_writeprobe = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  s_transferput = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  inv_self_dir = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  client_probeack_param_vec_reg_0 = _RAND_51[2:0];
  _RAND_52 = {1{`RANDOM}};
  client_probeack_param_vec_reg_1 = _RAND_52[2:0];
  _RAND_53 = {1{`RANDOM}};
  transmit_from_other_client_reg = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  releaseThrough = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  releaseDrop = _RAND_55[0:0];
  _RAND_56 = {1{`RANDOM}};
  probeAckDataThrough = _RAND_56[0:0];
  _RAND_57 = {1{`RANDOM}};
  probeAckDataDrop = _RAND_57[0:0];
  _RAND_58 = {1{`RANDOM}};
  probeAckDataSave = _RAND_58[0:0];
  _RAND_59 = {1{`RANDOM}};
  someClientHasProbeAckData = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  sink = _RAND_60[2:0];
  _RAND_61 = {1{`RANDOM}};
  bad_grant = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  nested_c_hit_reg = _RAND_62[0:0];
  _RAND_63 = {1{`RANDOM}};
  s_acquire = _RAND_63[0:0];
  _RAND_64 = {1{`RANDOM}};
  s_probe = _RAND_64[0:0];
  _RAND_65 = {1{`RANDOM}};
  s_release = _RAND_65[0:0];
  _RAND_66 = {1{`RANDOM}};
  s_wbselfdir = _RAND_66[0:0];
  _RAND_67 = {1{`RANDOM}};
  s_wbselftag = _RAND_67[0:0];
  _RAND_68 = {1{`RANDOM}};
  s_wbclientsdir = _RAND_68[0:0];
  _RAND_69 = {1{`RANDOM}};
  s_wbclientstag = _RAND_69[0:0];
  _RAND_70 = {1{`RANDOM}};
  w_probeackfirst = _RAND_70[0:0];
  _RAND_71 = {1{`RANDOM}};
  w_probeack = _RAND_71[0:0];
  _RAND_72 = {1{`RANDOM}};
  w_grantfirst = _RAND_72[0:0];
  _RAND_73 = {1{`RANDOM}};
  w_grant = _RAND_73[0:0];
  _RAND_74 = {1{`RANDOM}};
  acquire_flag = _RAND_74[0:0];
  _RAND_75 = {1{`RANDOM}};
  bypassPut_latch_reg = _RAND_75[0:0];
  _RAND_76 = {1{`RANDOM}};
  client_dir_conflict = _RAND_76[0:0];
  _RAND_77 = {1{`RANDOM}};
  probe_helper_finish = _RAND_77[0:0];
  _RAND_78 = {1{`RANDOM}};
  probe_clients = _RAND_78[1:0];
  _RAND_79 = {1{`RANDOM}};
  io_tasks_sink_c_bits_bufIdx_r = _RAND_79[2:0];
  _RAND_80 = {1{`RANDOM}};
  preferCache_latch = _RAND_80[0:0];
  _RAND_81 = {1{`RANDOM}};
  transmit_from_other_client_latch = _RAND_81[0:0];
  _RAND_82 = {1{`RANDOM}};
  a_c_through_reg = _RAND_82[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    req_valid = 1'h0;
  end
  if (reset) begin
    meta_valid = 1'h0;
  end
  if (reset) begin
    promoteT_safe = 1'h1;
  end
  if (reset) begin
    gotT = 1'h0;
  end
  if (reset) begin
    a_do_release = 1'h0;
  end
  if (reset) begin
    a_do_probe = 1'h0;
  end
  if (reset) begin
    probe_dirty = 1'h0;
  end
  if (reset) begin
    probes_done = 2'h0;
  end
  if (reset) begin
    highest_perm_reg_reg = 2'h0;
  end
  if (reset) begin
    w_probeacklast = 1'h1;
  end
  if (reset) begin
    w_grantlast = 1'h1;
  end
  if (reset) begin
    w_releaseack = 1'h1;
  end
  if (reset) begin
    w_grantack = 1'h1;
  end
  if (reset) begin
    w_putwritten = 1'h1;
  end
  if (reset) begin
    s_probeack = 1'h1;
  end
  if (reset) begin
    s_execute = 1'h1;
  end
  if (reset) begin
    s_grantack = 1'h1;
  end
  if (reset) begin
    no_schedule_REG = 1'h1;
  end
  if (reset) begin
    s_writerelease = 1'h1;
  end
  if (reset) begin
    s_writeprobe = 1'h1;
  end
  if (reset) begin
    s_transferput = 1'h1;
  end
  if (reset) begin
    inv_self_dir = 1'h0;
  end
  if (reset) begin
    client_probeack_param_vec_reg_0 = 3'h0;
  end
  if (reset) begin
    client_probeack_param_vec_reg_1 = 3'h0;
  end
  if (reset) begin
    transmit_from_other_client_reg = 1'h0;
  end
  if (reset) begin
    releaseThrough = 1'h0;
  end
  if (reset) begin
    releaseDrop = 1'h0;
  end
  if (reset) begin
    probeAckDataThrough = 1'h0;
  end
  if (reset) begin
    probeAckDataDrop = 1'h0;
  end
  if (reset) begin
    probeAckDataSave = 1'h0;
  end
  if (reset) begin
    someClientHasProbeAckData = 1'h0;
  end
  if (reset) begin
    bad_grant = 1'h0;
  end
  if (reset) begin
    nested_c_hit_reg = 1'h0;
  end
  if (reset) begin
    s_acquire = 1'h1;
  end
  if (reset) begin
    s_probe = 1'h1;
  end
  if (reset) begin
    s_release = 1'h1;
  end
  if (reset) begin
    s_wbselfdir = 1'h1;
  end
  if (reset) begin
    s_wbselftag = 1'h1;
  end
  if (reset) begin
    s_wbclientsdir = 1'h1;
  end
  if (reset) begin
    s_wbclientstag = 1'h1;
  end
  if (reset) begin
    w_probeackfirst = 1'h1;
  end
  if (reset) begin
    w_probeack = 1'h1;
  end
  if (reset) begin
    w_grantfirst = 1'h1;
  end
  if (reset) begin
    w_grant = 1'h1;
  end
  if (reset) begin
    acquire_flag = 1'h0;
  end
  if (reset) begin
    bypassPut_latch_reg = 1'h0;
  end
  if (reset) begin
    probe_helper_finish = 1'h0;
  end
  if (reset) begin
    preferCache_latch = 1'h0;
  end
  if (reset) begin
    transmit_from_other_client_latch = 1'h0;
  end
  if (reset) begin
    a_c_through_reg = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

