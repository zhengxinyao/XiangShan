module ICacheMetaArray(
  input         clock,
  input         reset,
  input         io_write_valid,
  input  [5:0]  io_write_bits_virIdx,
  input  [23:0] io_write_bits_phyTag,
  input  [1:0]  io_write_bits_coh_state,
  input  [7:0]  io_write_bits_waymask,
  input         io_write_bits_bankIdx,
  output        io_read_ready,
  input         io_read_valid,
  input         io_read_bits_isDoubleLine,
  input  [5:0]  io_read_bits_vSetIdx_0,
  input  [5:0]  io_read_bits_vSetIdx_1,
  output [1:0]  io_readResp_metaData_0_0_coh_state,
  output [23:0] io_readResp_metaData_0_0_tag,
  output [1:0]  io_readResp_metaData_0_1_coh_state,
  output [23:0] io_readResp_metaData_0_1_tag,
  output [1:0]  io_readResp_metaData_0_2_coh_state,
  output [23:0] io_readResp_metaData_0_2_tag,
  output [1:0]  io_readResp_metaData_0_3_coh_state,
  output [23:0] io_readResp_metaData_0_3_tag,
  output [1:0]  io_readResp_metaData_0_4_coh_state,
  output [23:0] io_readResp_metaData_0_4_tag,
  output [1:0]  io_readResp_metaData_0_5_coh_state,
  output [23:0] io_readResp_metaData_0_5_tag,
  output [1:0]  io_readResp_metaData_0_6_coh_state,
  output [23:0] io_readResp_metaData_0_6_tag,
  output [1:0]  io_readResp_metaData_0_7_coh_state,
  output [23:0] io_readResp_metaData_0_7_tag,
  output [1:0]  io_readResp_metaData_1_0_coh_state,
  output [23:0] io_readResp_metaData_1_0_tag,
  output [1:0]  io_readResp_metaData_1_1_coh_state,
  output [23:0] io_readResp_metaData_1_1_tag,
  output [1:0]  io_readResp_metaData_1_2_coh_state,
  output [23:0] io_readResp_metaData_1_2_tag,
  output [1:0]  io_readResp_metaData_1_3_coh_state,
  output [23:0] io_readResp_metaData_1_3_tag,
  output [1:0]  io_readResp_metaData_1_4_coh_state,
  output [23:0] io_readResp_metaData_1_4_tag,
  output [1:0]  io_readResp_metaData_1_5_coh_state,
  output [23:0] io_readResp_metaData_1_5_tag,
  output [1:0]  io_readResp_metaData_1_6_coh_state,
  output [23:0] io_readResp_metaData_1_6_tag,
  output [1:0]  io_readResp_metaData_1_7_coh_state,
  output [23:0] io_readResp_metaData_1_7_tag,
  output        io_readResp_errors_0_0,
  output        io_readResp_errors_0_1,
  output        io_readResp_errors_0_2,
  output        io_readResp_errors_0_3,
  output        io_readResp_errors_0_4,
  output        io_readResp_errors_0_5,
  output        io_readResp_errors_0_6,
  output        io_readResp_errors_0_7,
  output        io_readResp_errors_1_0,
  output        io_readResp_errors_1_1,
  output        io_readResp_errors_1_2,
  output        io_readResp_errors_1_3,
  output        io_readResp_errors_1_4,
  output        io_readResp_errors_1_5,
  output        io_readResp_errors_1_6,
  output        io_readResp_errors_1_7,
  input         io_cacheOp_req_valid,
  input  [63:0] io_cacheOp_req_bits_wayNum,
  input  [63:0] io_cacheOp_req_bits_index,
  input  [63:0] io_cacheOp_req_bits_opCode,
  input  [63:0] io_cacheOp_req_bits_write_tag_low,
  output        io_cacheOp_resp_valid,
  output [63:0] io_cacheOp_resp_bits_read_tag_low
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
`endif // RANDOMIZE_REG_INIT
  wire  tagArrays_0_clock; // @[ICache.scala 172:26]
  wire  tagArrays_0_reset; // @[ICache.scala 172:26]
  wire  tagArrays_0_io_rreq_ready; // @[ICache.scala 172:26]
  wire  tagArrays_0_io_rreq_valid; // @[ICache.scala 172:26]
  wire [4:0] tagArrays_0_io_rreq_bits_setIdx; // @[ICache.scala 172:26]
  wire [26:0] tagArrays_0_io_rresp_data_0; // @[ICache.scala 172:26]
  wire [26:0] tagArrays_0_io_rresp_data_1; // @[ICache.scala 172:26]
  wire [26:0] tagArrays_0_io_rresp_data_2; // @[ICache.scala 172:26]
  wire [26:0] tagArrays_0_io_rresp_data_3; // @[ICache.scala 172:26]
  wire [26:0] tagArrays_0_io_rresp_data_4; // @[ICache.scala 172:26]
  wire [26:0] tagArrays_0_io_rresp_data_5; // @[ICache.scala 172:26]
  wire [26:0] tagArrays_0_io_rresp_data_6; // @[ICache.scala 172:26]
  wire [26:0] tagArrays_0_io_rresp_data_7; // @[ICache.scala 172:26]
  wire  tagArrays_0_io_wreq_valid; // @[ICache.scala 172:26]
  wire [4:0] tagArrays_0_io_wreq_bits_setIdx; // @[ICache.scala 172:26]
  wire [26:0] tagArrays_0_io_wreq_bits_data_0; // @[ICache.scala 172:26]
  wire [26:0] tagArrays_0_io_wreq_bits_data_1; // @[ICache.scala 172:26]
  wire [26:0] tagArrays_0_io_wreq_bits_data_2; // @[ICache.scala 172:26]
  wire [26:0] tagArrays_0_io_wreq_bits_data_3; // @[ICache.scala 172:26]
  wire [26:0] tagArrays_0_io_wreq_bits_data_4; // @[ICache.scala 172:26]
  wire [26:0] tagArrays_0_io_wreq_bits_data_5; // @[ICache.scala 172:26]
  wire [26:0] tagArrays_0_io_wreq_bits_data_6; // @[ICache.scala 172:26]
  wire [26:0] tagArrays_0_io_wreq_bits_data_7; // @[ICache.scala 172:26]
  wire [7:0] tagArrays_0_io_wreq_bits_waymask; // @[ICache.scala 172:26]
  wire  tagArrays_1_clock; // @[ICache.scala 172:26]
  wire  tagArrays_1_reset; // @[ICache.scala 172:26]
  wire  tagArrays_1_io_rreq_ready; // @[ICache.scala 172:26]
  wire  tagArrays_1_io_rreq_valid; // @[ICache.scala 172:26]
  wire [4:0] tagArrays_1_io_rreq_bits_setIdx; // @[ICache.scala 172:26]
  wire [26:0] tagArrays_1_io_rresp_data_0; // @[ICache.scala 172:26]
  wire [26:0] tagArrays_1_io_rresp_data_1; // @[ICache.scala 172:26]
  wire [26:0] tagArrays_1_io_rresp_data_2; // @[ICache.scala 172:26]
  wire [26:0] tagArrays_1_io_rresp_data_3; // @[ICache.scala 172:26]
  wire [26:0] tagArrays_1_io_rresp_data_4; // @[ICache.scala 172:26]
  wire [26:0] tagArrays_1_io_rresp_data_5; // @[ICache.scala 172:26]
  wire [26:0] tagArrays_1_io_rresp_data_6; // @[ICache.scala 172:26]
  wire [26:0] tagArrays_1_io_rresp_data_7; // @[ICache.scala 172:26]
  wire  tagArrays_1_io_wreq_valid; // @[ICache.scala 172:26]
  wire [4:0] tagArrays_1_io_wreq_bits_setIdx; // @[ICache.scala 172:26]
  wire [26:0] tagArrays_1_io_wreq_bits_data_0; // @[ICache.scala 172:26]
  wire [26:0] tagArrays_1_io_wreq_bits_data_1; // @[ICache.scala 172:26]
  wire [26:0] tagArrays_1_io_wreq_bits_data_2; // @[ICache.scala 172:26]
  wire [26:0] tagArrays_1_io_wreq_bits_data_3; // @[ICache.scala 172:26]
  wire [26:0] tagArrays_1_io_wreq_bits_data_4; // @[ICache.scala 172:26]
  wire [26:0] tagArrays_1_io_wreq_bits_data_5; // @[ICache.scala 172:26]
  wire [26:0] tagArrays_1_io_wreq_bits_data_6; // @[ICache.scala 172:26]
  wire [26:0] tagArrays_1_io_wreq_bits_data_7; // @[ICache.scala 172:26]
  wire [7:0] tagArrays_1_io_wreq_bits_waymask; // @[ICache.scala 172:26]
  wire  _io_read_ready_T = ~io_write_valid; // @[ICache.scala 150:20]
  wire  port_0_read_0 = io_read_valid & ~io_read_bits_vSetIdx_0[0]; // @[ICache.scala 152:38]
  wire  port_0_read_1 = io_read_valid & io_read_bits_vSetIdx_0[0]; // @[ICache.scala 153:38]
  wire  port_1_read_1 = io_read_valid & io_read_bits_vSetIdx_1[0] & io_read_bits_isDoubleLine; // @[ICache.scala 154:69]
  wire  port_1_read_0 = io_read_valid & ~io_read_bits_vSetIdx_1[0] & io_read_bits_isDoubleLine; // @[ICache.scala 155:69]
  wire  _port_0_read_0_reg_T = io_read_ready & io_read_valid; // @[Decoupled.scala 50:35]
  reg  port_0_read_0_reg; // @[Reg.scala 16:16]
  reg  port_1_read_0_reg; // @[Reg.scala 16:16]
  wire [5:0] bank_0_idx = port_0_read_0 ? io_read_bits_vSetIdx_0 : io_read_bits_vSetIdx_1; // @[ICache.scala 162:23]
  wire [5:0] bank_1_idx = port_0_read_1 ? io_read_bits_vSetIdx_0 : io_read_bits_vSetIdx_1; // @[ICache.scala 163:23]
  wire  write_bank_0 = io_write_valid & ~io_write_bits_bankIdx; // @[ICache.scala 166:37]
  wire  write_bank_1 = io_write_valid & io_write_bits_bankIdx; // @[ICache.scala 167:37]
  wire [215:0] _read_meta_bits_T = {tagArrays_0_io_rresp_data_7,tagArrays_0_io_rresp_data_6,
    tagArrays_0_io_rresp_data_5,tagArrays_0_io_rresp_data_4,tagArrays_0_io_rresp_data_3,tagArrays_0_io_rresp_data_2,
    tagArrays_0_io_rresp_data_1,tagArrays_0_io_rresp_data_0}; // @[ICache.scala 203:53]
  wire [26:0] read_meta_bits__0 = _read_meta_bits_T[26:0]; // @[ICache.scala 203:53]
  wire [26:0] read_meta_bits__1 = _read_meta_bits_T[53:27]; // @[ICache.scala 203:53]
  wire [26:0] read_meta_bits__2 = _read_meta_bits_T[80:54]; // @[ICache.scala 203:53]
  wire [26:0] read_meta_bits__3 = _read_meta_bits_T[107:81]; // @[ICache.scala 203:53]
  wire [26:0] read_meta_bits__4 = _read_meta_bits_T[134:108]; // @[ICache.scala 203:53]
  wire [26:0] read_meta_bits__5 = _read_meta_bits_T[161:135]; // @[ICache.scala 203:53]
  wire [26:0] read_meta_bits__6 = _read_meta_bits_T[188:162]; // @[ICache.scala 203:53]
  wire [26:0] read_meta_bits__7 = _read_meta_bits_T[215:189]; // @[ICache.scala 203:53]
  wire [25:0] uncorrected = read_meta_bits__0[25:0]; // @[ECC.scala 84:24]
  wire [25:0] uncorrected_1 = read_meta_bits__1[25:0]; // @[ECC.scala 84:24]
  wire [25:0] uncorrected_2 = read_meta_bits__2[25:0]; // @[ECC.scala 84:24]
  wire [25:0] uncorrected_3 = read_meta_bits__3[25:0]; // @[ECC.scala 84:24]
  wire [25:0] uncorrected_4 = read_meta_bits__4[25:0]; // @[ECC.scala 84:24]
  wire [25:0] uncorrected_5 = read_meta_bits__5[25:0]; // @[ECC.scala 84:24]
  wire [25:0] uncorrected_6 = read_meta_bits__6[25:0]; // @[ECC.scala 84:24]
  wire [25:0] uncorrected_7 = read_meta_bits__7[25:0]; // @[ECC.scala 84:24]
  wire [207:0] _T_4 = {uncorrected_7,uncorrected_6,uncorrected_5,uncorrected_4,uncorrected_3,uncorrected_2,uncorrected_1
    ,uncorrected}; // @[ICache.scala 207:50]
  wire [23:0] read_metas_0_0_tag = _T_4[23:0]; // @[ICache.scala 207:50]
  wire [1:0] read_metas_0_0_coh_state = _T_4[25:24]; // @[ICache.scala 207:50]
  wire [23:0] read_metas_0_1_tag = _T_4[49:26]; // @[ICache.scala 207:50]
  wire [1:0] read_metas_0_1_coh_state = _T_4[51:50]; // @[ICache.scala 207:50]
  wire [23:0] read_metas_0_2_tag = _T_4[75:52]; // @[ICache.scala 207:50]
  wire [1:0] read_metas_0_2_coh_state = _T_4[77:76]; // @[ICache.scala 207:50]
  wire [23:0] read_metas_0_3_tag = _T_4[101:78]; // @[ICache.scala 207:50]
  wire [1:0] read_metas_0_3_coh_state = _T_4[103:102]; // @[ICache.scala 207:50]
  wire [23:0] read_metas_0_4_tag = _T_4[127:104]; // @[ICache.scala 207:50]
  wire [1:0] read_metas_0_4_coh_state = _T_4[129:128]; // @[ICache.scala 207:50]
  wire [23:0] read_metas_0_5_tag = _T_4[153:130]; // @[ICache.scala 207:50]
  wire [1:0] read_metas_0_5_coh_state = _T_4[155:154]; // @[ICache.scala 207:50]
  wire [23:0] read_metas_0_6_tag = _T_4[179:156]; // @[ICache.scala 207:50]
  wire [1:0] read_metas_0_6_coh_state = _T_4[181:180]; // @[ICache.scala 207:50]
  wire [23:0] read_metas_0_7_tag = _T_4[205:182]; // @[ICache.scala 207:50]
  wire [1:0] read_metas_0_7_coh_state = _T_4[207:206]; // @[ICache.scala 207:50]
  reg  io_readResp_errors_0_0_REG; // @[ICache.scala 208:66]
  reg  io_readResp_errors_0_0_REG_1; // @[ICache.scala 208:105]
  reg  io_readResp_errors_0_0_REG_2; // @[ICache.scala 208:97]
  reg  io_readResp_errors_0_1_REG; // @[ICache.scala 208:66]
  reg  io_readResp_errors_0_1_REG_1; // @[ICache.scala 208:105]
  reg  io_readResp_errors_0_1_REG_2; // @[ICache.scala 208:97]
  reg  io_readResp_errors_0_2_REG; // @[ICache.scala 208:66]
  reg  io_readResp_errors_0_2_REG_1; // @[ICache.scala 208:105]
  reg  io_readResp_errors_0_2_REG_2; // @[ICache.scala 208:97]
  reg  io_readResp_errors_0_3_REG; // @[ICache.scala 208:66]
  reg  io_readResp_errors_0_3_REG_1; // @[ICache.scala 208:105]
  reg  io_readResp_errors_0_3_REG_2; // @[ICache.scala 208:97]
  reg  io_readResp_errors_0_4_REG; // @[ICache.scala 208:66]
  reg  io_readResp_errors_0_4_REG_1; // @[ICache.scala 208:105]
  reg  io_readResp_errors_0_4_REG_2; // @[ICache.scala 208:97]
  reg  io_readResp_errors_0_5_REG; // @[ICache.scala 208:66]
  reg  io_readResp_errors_0_5_REG_1; // @[ICache.scala 208:105]
  reg  io_readResp_errors_0_5_REG_2; // @[ICache.scala 208:97]
  reg  io_readResp_errors_0_6_REG; // @[ICache.scala 208:66]
  reg  io_readResp_errors_0_6_REG_1; // @[ICache.scala 208:105]
  reg  io_readResp_errors_0_6_REG_2; // @[ICache.scala 208:97]
  reg  io_readResp_errors_0_7_REG; // @[ICache.scala 208:66]
  reg  io_readResp_errors_0_7_REG_1; // @[ICache.scala 208:105]
  reg  io_readResp_errors_0_7_REG_2; // @[ICache.scala 208:97]
  wire [215:0] _read_meta_bits_T_9 = {tagArrays_1_io_rresp_data_7,tagArrays_1_io_rresp_data_6,
    tagArrays_1_io_rresp_data_5,tagArrays_1_io_rresp_data_4,tagArrays_1_io_rresp_data_3,tagArrays_1_io_rresp_data_2,
    tagArrays_1_io_rresp_data_1,tagArrays_1_io_rresp_data_0}; // @[ICache.scala 203:53]
  wire [26:0] read_meta_bits_1_0 = _read_meta_bits_T_9[26:0]; // @[ICache.scala 203:53]
  wire [26:0] read_meta_bits_1_1 = _read_meta_bits_T_9[53:27]; // @[ICache.scala 203:53]
  wire [26:0] read_meta_bits_1_2 = _read_meta_bits_T_9[80:54]; // @[ICache.scala 203:53]
  wire [26:0] read_meta_bits_1_3 = _read_meta_bits_T_9[107:81]; // @[ICache.scala 203:53]
  wire [26:0] read_meta_bits_1_4 = _read_meta_bits_T_9[134:108]; // @[ICache.scala 203:53]
  wire [26:0] read_meta_bits_1_5 = _read_meta_bits_T_9[161:135]; // @[ICache.scala 203:53]
  wire [26:0] read_meta_bits_1_6 = _read_meta_bits_T_9[188:162]; // @[ICache.scala 203:53]
  wire [26:0] read_meta_bits_1_7 = _read_meta_bits_T_9[215:189]; // @[ICache.scala 203:53]
  wire [25:0] uncorrected_8 = read_meta_bits_1_0[25:0]; // @[ECC.scala 84:24]
  wire [25:0] uncorrected_9 = read_meta_bits_1_1[25:0]; // @[ECC.scala 84:24]
  wire [25:0] uncorrected_10 = read_meta_bits_1_2[25:0]; // @[ECC.scala 84:24]
  wire [25:0] uncorrected_11 = read_meta_bits_1_3[25:0]; // @[ECC.scala 84:24]
  wire [25:0] uncorrected_12 = read_meta_bits_1_4[25:0]; // @[ECC.scala 84:24]
  wire [25:0] uncorrected_13 = read_meta_bits_1_5[25:0]; // @[ECC.scala 84:24]
  wire [25:0] uncorrected_14 = read_meta_bits_1_6[25:0]; // @[ECC.scala 84:24]
  wire [25:0] uncorrected_15 = read_meta_bits_1_7[25:0]; // @[ECC.scala 84:24]
  wire [207:0] _T_21 = {uncorrected_15,uncorrected_14,uncorrected_13,uncorrected_12,uncorrected_11,uncorrected_10,
    uncorrected_9,uncorrected_8}; // @[ICache.scala 207:50]
  wire [23:0] read_metas_1_0_tag = _T_21[23:0]; // @[ICache.scala 207:50]
  wire [1:0] read_metas_1_0_coh_state = _T_21[25:24]; // @[ICache.scala 207:50]
  wire [23:0] read_metas_1_1_tag = _T_21[49:26]; // @[ICache.scala 207:50]
  wire [1:0] read_metas_1_1_coh_state = _T_21[51:50]; // @[ICache.scala 207:50]
  wire [23:0] read_metas_1_2_tag = _T_21[75:52]; // @[ICache.scala 207:50]
  wire [1:0] read_metas_1_2_coh_state = _T_21[77:76]; // @[ICache.scala 207:50]
  wire [23:0] read_metas_1_3_tag = _T_21[101:78]; // @[ICache.scala 207:50]
  wire [1:0] read_metas_1_3_coh_state = _T_21[103:102]; // @[ICache.scala 207:50]
  wire [23:0] read_metas_1_4_tag = _T_21[127:104]; // @[ICache.scala 207:50]
  wire [1:0] read_metas_1_4_coh_state = _T_21[129:128]; // @[ICache.scala 207:50]
  wire [23:0] read_metas_1_5_tag = _T_21[153:130]; // @[ICache.scala 207:50]
  wire [1:0] read_metas_1_5_coh_state = _T_21[155:154]; // @[ICache.scala 207:50]
  wire [23:0] read_metas_1_6_tag = _T_21[179:156]; // @[ICache.scala 207:50]
  wire [1:0] read_metas_1_6_coh_state = _T_21[181:180]; // @[ICache.scala 207:50]
  wire [23:0] read_metas_1_7_tag = _T_21[205:182]; // @[ICache.scala 207:50]
  wire [1:0] read_metas_1_7_coh_state = _T_21[207:206]; // @[ICache.scala 207:50]
  reg  io_readResp_errors_1_0_REG; // @[ICache.scala 208:66]
  reg  io_readResp_errors_1_0_REG_1; // @[ICache.scala 208:105]
  reg  io_readResp_errors_1_0_REG_2; // @[ICache.scala 208:97]
  reg  io_readResp_errors_1_1_REG; // @[ICache.scala 208:66]
  reg  io_readResp_errors_1_1_REG_1; // @[ICache.scala 208:105]
  reg  io_readResp_errors_1_1_REG_2; // @[ICache.scala 208:97]
  reg  io_readResp_errors_1_2_REG; // @[ICache.scala 208:66]
  reg  io_readResp_errors_1_2_REG_1; // @[ICache.scala 208:105]
  reg  io_readResp_errors_1_2_REG_2; // @[ICache.scala 208:97]
  reg  io_readResp_errors_1_3_REG; // @[ICache.scala 208:66]
  reg  io_readResp_errors_1_3_REG_1; // @[ICache.scala 208:105]
  reg  io_readResp_errors_1_3_REG_2; // @[ICache.scala 208:97]
  reg  io_readResp_errors_1_4_REG; // @[ICache.scala 208:66]
  reg  io_readResp_errors_1_4_REG_1; // @[ICache.scala 208:105]
  reg  io_readResp_errors_1_4_REG_2; // @[ICache.scala 208:97]
  reg  io_readResp_errors_1_5_REG; // @[ICache.scala 208:66]
  reg  io_readResp_errors_1_5_REG_1; // @[ICache.scala 208:105]
  reg  io_readResp_errors_1_5_REG_2; // @[ICache.scala 208:97]
  reg  io_readResp_errors_1_6_REG; // @[ICache.scala 208:66]
  reg  io_readResp_errors_1_6_REG_1; // @[ICache.scala 208:105]
  reg  io_readResp_errors_1_6_REG_2; // @[ICache.scala 208:97]
  reg  io_readResp_errors_1_7_REG; // @[ICache.scala 208:66]
  reg  io_readResp_errors_1_7_REG_1; // @[ICache.scala 208:105]
  reg  io_readResp_errors_1_7_REG_2; // @[ICache.scala 208:97]
  wire [25:0] write_meta_bits_x13 = {io_write_bits_coh_state,io_write_bits_phyTag}; // @[ICache.scala 213:101]
  wire  _write_meta_bits_T = ^write_meta_bits_x13; // @[ECC.scala 81:55]
  wire [26:0] write_meta_bits = {_write_meta_bits_T,io_write_bits_coh_state,io_write_bits_phyTag}; // @[Cat.scala 31:58]
  wire  _T_38 = io_cacheOp_req_bits_opCode == 64'h2; // @[CacheInstruction.scala 95:54]
  wire  _T_39 = io_cacheOp_req_bits_opCode == 64'h0; // @[CacheInstruction.scala 93:54]
  wire  _T_40 = _T_38 | _T_39; // @[ICache.scala 239:61]
  wire  _GEN_68 = _T_40 | (port_0_read_0 | port_1_read_0); // @[ICache.scala 183:31 241:6 243:37]
  wire [63:0] _GEN_69 = _T_40 ? io_cacheOp_req_bits_index : {{59'd0}, bank_0_idx[5:1]}; // @[ICache.scala 241:6 SRAMTemplate.scala 42:{17,17}]
  wire  _GEN_70 = _T_40 | (port_0_read_1 | port_1_read_1); // @[ICache.scala 189:31 241:6 243:37]
  wire [63:0] _GEN_71 = _T_40 ? io_cacheOp_req_bits_index : {{59'd0}, bank_1_idx[5:1]}; // @[ICache.scala 241:6 SRAMTemplate.scala 42:{17,17}]
  wire  _T_41 = io_cacheOp_req_bits_opCode == 64'h6; // @[CacheInstruction.scala 99:54]
  wire [31:0] _T_43 = 32'h1 << io_cacheOp_req_bits_wayNum[4:0]; // @[OneHot.scala 57:35]
  wire  _GEN_73 = _T_41 | write_bank_0; // @[ICache.scala 185:31 248:65 250:37]
  wire [63:0] _GEN_74 = _T_41 ? io_cacheOp_req_bits_index : {{59'd0}, io_write_bits_virIdx[5:1]}; // @[ICache.scala 248:65 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_75 = _T_41 ? io_cacheOp_req_bits_write_tag_low : {{37'd0}, write_meta_bits}; // @[ICache.scala 248:65 SRAMTemplate.scala 53:{15,15}]
  wire [31:0] _GEN_83 = _T_41 ? _T_43 : {{24'd0}, io_write_bits_waymask}; // @[ICache.scala 248:65 SRAMTemplate.scala 54:{24,24}]
  wire  _GEN_84 = _T_41 | write_bank_1; // @[ICache.scala 191:31 248:65 250:37]
  wire  _GEN_95 = _T_41 | _T_40; // @[ICache.scala 248:65 257:25]
  wire [63:0] _GEN_97 = io_cacheOp_req_valid ? _GEN_69 : {{59'd0}, bank_0_idx[5:1]}; // @[ICache.scala 237:29 SRAMTemplate.scala 42:17]
  wire [63:0] _GEN_99 = io_cacheOp_req_valid ? _GEN_71 : {{59'd0}, bank_1_idx[5:1]}; // @[ICache.scala 237:29 SRAMTemplate.scala 42:17]
  wire  cacheOpShouldResp = io_cacheOp_req_valid & _GEN_95; // @[ICache.scala 237:29]
  wire [63:0] _GEN_102 = io_cacheOp_req_valid ? _GEN_74 : {{59'd0}, io_write_bits_virIdx[5:1]}; // @[ICache.scala 237:29 SRAMTemplate.scala 42:17]
  wire [63:0] _GEN_103 = io_cacheOp_req_valid ? _GEN_75 : {{37'd0}, write_meta_bits}; // @[ICache.scala 237:29 SRAMTemplate.scala 53:15]
  wire [31:0] _GEN_111 = io_cacheOp_req_valid ? _GEN_83 : {{24'd0}, io_write_bits_waymask}; // @[ICache.scala 237:29 SRAMTemplate.scala 54:24]
  reg  io_cacheOp_resp_valid_REG; // @[ICache.scala 270:35]
  wire [23:0] _GEN_124 = 3'h1 == io_cacheOp_req_bits_wayNum[2:0] ? _read_meta_bits_T[47:24] : _read_meta_bits_T[23:0]; // @[ICache.scala 271:{43,43}]
  wire [23:0] _GEN_125 = 3'h2 == io_cacheOp_req_bits_wayNum[2:0] ? _read_meta_bits_T[71:48] : _GEN_124; // @[ICache.scala 271:{43,43}]
  wire [23:0] _GEN_126 = 3'h3 == io_cacheOp_req_bits_wayNum[2:0] ? _read_meta_bits_T[95:72] : _GEN_125; // @[ICache.scala 271:{43,43}]
  wire [23:0] _GEN_127 = 3'h4 == io_cacheOp_req_bits_wayNum[2:0] ? _read_meta_bits_T[119:96] : _GEN_126; // @[ICache.scala 271:{43,43}]
  wire [23:0] _GEN_128 = 3'h5 == io_cacheOp_req_bits_wayNum[2:0] ? _read_meta_bits_T[143:120] : _GEN_127; // @[ICache.scala 271:{43,43}]
  wire [23:0] _GEN_129 = 3'h6 == io_cacheOp_req_bits_wayNum[2:0] ? _read_meta_bits_T[167:144] : _GEN_128; // @[ICache.scala 271:{43,43}]
  wire [23:0] _GEN_130 = 3'h7 == io_cacheOp_req_bits_wayNum[2:0] ? _read_meta_bits_T[191:168] : _GEN_129; // @[ICache.scala 271:{43,43}]
  wire [23:0] _io_cacheOp_resp_bits_read_tag_low_T_10 = io_cacheOp_resp_valid ? _GEN_130 : 24'h0; // @[ICache.scala 271:43]
  SRAMTemplate tagArrays_0 ( // @[ICache.scala 172:26]
    .clock(tagArrays_0_clock),
    .reset(tagArrays_0_reset),
    .io_rreq_ready(tagArrays_0_io_rreq_ready),
    .io_rreq_valid(tagArrays_0_io_rreq_valid),
    .io_rreq_bits_setIdx(tagArrays_0_io_rreq_bits_setIdx),
    .io_rresp_data_0(tagArrays_0_io_rresp_data_0),
    .io_rresp_data_1(tagArrays_0_io_rresp_data_1),
    .io_rresp_data_2(tagArrays_0_io_rresp_data_2),
    .io_rresp_data_3(tagArrays_0_io_rresp_data_3),
    .io_rresp_data_4(tagArrays_0_io_rresp_data_4),
    .io_rresp_data_5(tagArrays_0_io_rresp_data_5),
    .io_rresp_data_6(tagArrays_0_io_rresp_data_6),
    .io_rresp_data_7(tagArrays_0_io_rresp_data_7),
    .io_wreq_valid(tagArrays_0_io_wreq_valid),
    .io_wreq_bits_setIdx(tagArrays_0_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(tagArrays_0_io_wreq_bits_data_0),
    .io_wreq_bits_data_1(tagArrays_0_io_wreq_bits_data_1),
    .io_wreq_bits_data_2(tagArrays_0_io_wreq_bits_data_2),
    .io_wreq_bits_data_3(tagArrays_0_io_wreq_bits_data_3),
    .io_wreq_bits_data_4(tagArrays_0_io_wreq_bits_data_4),
    .io_wreq_bits_data_5(tagArrays_0_io_wreq_bits_data_5),
    .io_wreq_bits_data_6(tagArrays_0_io_wreq_bits_data_6),
    .io_wreq_bits_data_7(tagArrays_0_io_wreq_bits_data_7),
    .io_wreq_bits_waymask(tagArrays_0_io_wreq_bits_waymask)
  );
  SRAMTemplate tagArrays_1 ( // @[ICache.scala 172:26]
    .clock(tagArrays_1_clock),
    .reset(tagArrays_1_reset),
    .io_rreq_ready(tagArrays_1_io_rreq_ready),
    .io_rreq_valid(tagArrays_1_io_rreq_valid),
    .io_rreq_bits_setIdx(tagArrays_1_io_rreq_bits_setIdx),
    .io_rresp_data_0(tagArrays_1_io_rresp_data_0),
    .io_rresp_data_1(tagArrays_1_io_rresp_data_1),
    .io_rresp_data_2(tagArrays_1_io_rresp_data_2),
    .io_rresp_data_3(tagArrays_1_io_rresp_data_3),
    .io_rresp_data_4(tagArrays_1_io_rresp_data_4),
    .io_rresp_data_5(tagArrays_1_io_rresp_data_5),
    .io_rresp_data_6(tagArrays_1_io_rresp_data_6),
    .io_rresp_data_7(tagArrays_1_io_rresp_data_7),
    .io_wreq_valid(tagArrays_1_io_wreq_valid),
    .io_wreq_bits_setIdx(tagArrays_1_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(tagArrays_1_io_wreq_bits_data_0),
    .io_wreq_bits_data_1(tagArrays_1_io_wreq_bits_data_1),
    .io_wreq_bits_data_2(tagArrays_1_io_wreq_bits_data_2),
    .io_wreq_bits_data_3(tagArrays_1_io_wreq_bits_data_3),
    .io_wreq_bits_data_4(tagArrays_1_io_wreq_bits_data_4),
    .io_wreq_bits_data_5(tagArrays_1_io_wreq_bits_data_5),
    .io_wreq_bits_data_6(tagArrays_1_io_wreq_bits_data_6),
    .io_wreq_bits_data_7(tagArrays_1_io_wreq_bits_data_7),
    .io_wreq_bits_waymask(tagArrays_1_io_wreq_bits_waymask)
  );
  assign io_read_ready = _io_read_ready_T & (tagArrays_0_io_rreq_ready & tagArrays_1_io_rreq_ready); // @[ICache.scala 198:36]
  assign io_readResp_metaData_0_0_coh_state = port_0_read_0_reg ? read_metas_0_0_coh_state : read_metas_1_0_coh_state; // @[ICache.scala 219:26 220:29]
  assign io_readResp_metaData_0_0_tag = port_0_read_0_reg ? read_metas_0_0_tag : read_metas_1_0_tag; // @[ICache.scala 219:26 220:29]
  assign io_readResp_metaData_0_1_coh_state = port_0_read_0_reg ? read_metas_0_1_coh_state : read_metas_1_1_coh_state; // @[ICache.scala 219:26 220:29]
  assign io_readResp_metaData_0_1_tag = port_0_read_0_reg ? read_metas_0_1_tag : read_metas_1_1_tag; // @[ICache.scala 219:26 220:29]
  assign io_readResp_metaData_0_2_coh_state = port_0_read_0_reg ? read_metas_0_2_coh_state : read_metas_1_2_coh_state; // @[ICache.scala 219:26 220:29]
  assign io_readResp_metaData_0_2_tag = port_0_read_0_reg ? read_metas_0_2_tag : read_metas_1_2_tag; // @[ICache.scala 219:26 220:29]
  assign io_readResp_metaData_0_3_coh_state = port_0_read_0_reg ? read_metas_0_3_coh_state : read_metas_1_3_coh_state; // @[ICache.scala 219:26 220:29]
  assign io_readResp_metaData_0_3_tag = port_0_read_0_reg ? read_metas_0_3_tag : read_metas_1_3_tag; // @[ICache.scala 219:26 220:29]
  assign io_readResp_metaData_0_4_coh_state = port_0_read_0_reg ? read_metas_0_4_coh_state : read_metas_1_4_coh_state; // @[ICache.scala 219:26 220:29]
  assign io_readResp_metaData_0_4_tag = port_0_read_0_reg ? read_metas_0_4_tag : read_metas_1_4_tag; // @[ICache.scala 219:26 220:29]
  assign io_readResp_metaData_0_5_coh_state = port_0_read_0_reg ? read_metas_0_5_coh_state : read_metas_1_5_coh_state; // @[ICache.scala 219:26 220:29]
  assign io_readResp_metaData_0_5_tag = port_0_read_0_reg ? read_metas_0_5_tag : read_metas_1_5_tag; // @[ICache.scala 219:26 220:29]
  assign io_readResp_metaData_0_6_coh_state = port_0_read_0_reg ? read_metas_0_6_coh_state : read_metas_1_6_coh_state; // @[ICache.scala 219:26 220:29]
  assign io_readResp_metaData_0_6_tag = port_0_read_0_reg ? read_metas_0_6_tag : read_metas_1_6_tag; // @[ICache.scala 219:26 220:29]
  assign io_readResp_metaData_0_7_coh_state = port_0_read_0_reg ? read_metas_0_7_coh_state : read_metas_1_7_coh_state; // @[ICache.scala 219:26 220:29]
  assign io_readResp_metaData_0_7_tag = port_0_read_0_reg ? read_metas_0_7_tag : read_metas_1_7_tag; // @[ICache.scala 219:26 220:29]
  assign io_readResp_metaData_1_0_coh_state = port_1_read_0_reg ? read_metas_0_0_coh_state : read_metas_1_0_coh_state; // @[ICache.scala 225:26 226:29]
  assign io_readResp_metaData_1_0_tag = port_1_read_0_reg ? read_metas_0_0_tag : read_metas_1_0_tag; // @[ICache.scala 225:26 226:29]
  assign io_readResp_metaData_1_1_coh_state = port_1_read_0_reg ? read_metas_0_1_coh_state : read_metas_1_1_coh_state; // @[ICache.scala 225:26 226:29]
  assign io_readResp_metaData_1_1_tag = port_1_read_0_reg ? read_metas_0_1_tag : read_metas_1_1_tag; // @[ICache.scala 225:26 226:29]
  assign io_readResp_metaData_1_2_coh_state = port_1_read_0_reg ? read_metas_0_2_coh_state : read_metas_1_2_coh_state; // @[ICache.scala 225:26 226:29]
  assign io_readResp_metaData_1_2_tag = port_1_read_0_reg ? read_metas_0_2_tag : read_metas_1_2_tag; // @[ICache.scala 225:26 226:29]
  assign io_readResp_metaData_1_3_coh_state = port_1_read_0_reg ? read_metas_0_3_coh_state : read_metas_1_3_coh_state; // @[ICache.scala 225:26 226:29]
  assign io_readResp_metaData_1_3_tag = port_1_read_0_reg ? read_metas_0_3_tag : read_metas_1_3_tag; // @[ICache.scala 225:26 226:29]
  assign io_readResp_metaData_1_4_coh_state = port_1_read_0_reg ? read_metas_0_4_coh_state : read_metas_1_4_coh_state; // @[ICache.scala 225:26 226:29]
  assign io_readResp_metaData_1_4_tag = port_1_read_0_reg ? read_metas_0_4_tag : read_metas_1_4_tag; // @[ICache.scala 225:26 226:29]
  assign io_readResp_metaData_1_5_coh_state = port_1_read_0_reg ? read_metas_0_5_coh_state : read_metas_1_5_coh_state; // @[ICache.scala 225:26 226:29]
  assign io_readResp_metaData_1_5_tag = port_1_read_0_reg ? read_metas_0_5_tag : read_metas_1_5_tag; // @[ICache.scala 225:26 226:29]
  assign io_readResp_metaData_1_6_coh_state = port_1_read_0_reg ? read_metas_0_6_coh_state : read_metas_1_6_coh_state; // @[ICache.scala 225:26 226:29]
  assign io_readResp_metaData_1_6_tag = port_1_read_0_reg ? read_metas_0_6_tag : read_metas_1_6_tag; // @[ICache.scala 225:26 226:29]
  assign io_readResp_metaData_1_7_coh_state = port_1_read_0_reg ? read_metas_0_7_coh_state : read_metas_1_7_coh_state; // @[ICache.scala 225:26 226:29]
  assign io_readResp_metaData_1_7_tag = port_1_read_0_reg ? read_metas_0_7_tag : read_metas_1_7_tag; // @[ICache.scala 225:26 226:29]
  assign io_readResp_errors_0_0 = io_readResp_errors_0_0_REG & io_readResp_errors_0_0_REG_2; // @[ICache.scala 208:87]
  assign io_readResp_errors_0_1 = io_readResp_errors_0_1_REG & io_readResp_errors_0_1_REG_2; // @[ICache.scala 208:87]
  assign io_readResp_errors_0_2 = io_readResp_errors_0_2_REG & io_readResp_errors_0_2_REG_2; // @[ICache.scala 208:87]
  assign io_readResp_errors_0_3 = io_readResp_errors_0_3_REG & io_readResp_errors_0_3_REG_2; // @[ICache.scala 208:87]
  assign io_readResp_errors_0_4 = io_readResp_errors_0_4_REG & io_readResp_errors_0_4_REG_2; // @[ICache.scala 208:87]
  assign io_readResp_errors_0_5 = io_readResp_errors_0_5_REG & io_readResp_errors_0_5_REG_2; // @[ICache.scala 208:87]
  assign io_readResp_errors_0_6 = io_readResp_errors_0_6_REG & io_readResp_errors_0_6_REG_2; // @[ICache.scala 208:87]
  assign io_readResp_errors_0_7 = io_readResp_errors_0_7_REG & io_readResp_errors_0_7_REG_2; // @[ICache.scala 208:87]
  assign io_readResp_errors_1_0 = io_readResp_errors_1_0_REG & io_readResp_errors_1_0_REG_2; // @[ICache.scala 208:87]
  assign io_readResp_errors_1_1 = io_readResp_errors_1_1_REG & io_readResp_errors_1_1_REG_2; // @[ICache.scala 208:87]
  assign io_readResp_errors_1_2 = io_readResp_errors_1_2_REG & io_readResp_errors_1_2_REG_2; // @[ICache.scala 208:87]
  assign io_readResp_errors_1_3 = io_readResp_errors_1_3_REG & io_readResp_errors_1_3_REG_2; // @[ICache.scala 208:87]
  assign io_readResp_errors_1_4 = io_readResp_errors_1_4_REG & io_readResp_errors_1_4_REG_2; // @[ICache.scala 208:87]
  assign io_readResp_errors_1_5 = io_readResp_errors_1_5_REG & io_readResp_errors_1_5_REG_2; // @[ICache.scala 208:87]
  assign io_readResp_errors_1_6 = io_readResp_errors_1_6_REG & io_readResp_errors_1_6_REG_2; // @[ICache.scala 208:87]
  assign io_readResp_errors_1_7 = io_readResp_errors_1_7_REG & io_readResp_errors_1_7_REG_2; // @[ICache.scala 208:87]
  assign io_cacheOp_resp_valid = io_cacheOp_resp_valid_REG; // @[ICache.scala 270:25]
  assign io_cacheOp_resp_bits_read_tag_low = {{40'd0}, _io_cacheOp_resp_bits_read_tag_low_T_10}; // @[ICache.scala 271:37]
  assign tagArrays_0_clock = clock;
  assign tagArrays_0_reset = reset;
  assign tagArrays_0_io_rreq_valid = io_cacheOp_req_valid ? _GEN_68 : port_0_read_0 | port_1_read_0; // @[ICache.scala 237:29 183:31]
  assign tagArrays_0_io_rreq_bits_setIdx = _GEN_97[4:0];
  assign tagArrays_0_io_wreq_valid = io_cacheOp_req_valid ? _GEN_73 : write_bank_0; // @[ICache.scala 237:29 185:31]
  assign tagArrays_0_io_wreq_bits_setIdx = _GEN_102[4:0];
  assign tagArrays_0_io_wreq_bits_data_0 = _GEN_103[26:0];
  assign tagArrays_0_io_wreq_bits_data_1 = _GEN_103[26:0];
  assign tagArrays_0_io_wreq_bits_data_2 = _GEN_103[26:0];
  assign tagArrays_0_io_wreq_bits_data_3 = _GEN_103[26:0];
  assign tagArrays_0_io_wreq_bits_data_4 = _GEN_103[26:0];
  assign tagArrays_0_io_wreq_bits_data_5 = _GEN_103[26:0];
  assign tagArrays_0_io_wreq_bits_data_6 = _GEN_103[26:0];
  assign tagArrays_0_io_wreq_bits_data_7 = _GEN_103[26:0];
  assign tagArrays_0_io_wreq_bits_waymask = _GEN_111[7:0];
  assign tagArrays_1_clock = clock;
  assign tagArrays_1_reset = reset;
  assign tagArrays_1_io_rreq_valid = io_cacheOp_req_valid ? _GEN_70 : port_0_read_1 | port_1_read_1; // @[ICache.scala 237:29 189:31]
  assign tagArrays_1_io_rreq_bits_setIdx = _GEN_99[4:0];
  assign tagArrays_1_io_wreq_valid = io_cacheOp_req_valid ? _GEN_84 : write_bank_1; // @[ICache.scala 237:29 191:31]
  assign tagArrays_1_io_wreq_bits_setIdx = _GEN_102[4:0];
  assign tagArrays_1_io_wreq_bits_data_0 = _GEN_103[26:0];
  assign tagArrays_1_io_wreq_bits_data_1 = _GEN_103[26:0];
  assign tagArrays_1_io_wreq_bits_data_2 = _GEN_103[26:0];
  assign tagArrays_1_io_wreq_bits_data_3 = _GEN_103[26:0];
  assign tagArrays_1_io_wreq_bits_data_4 = _GEN_103[26:0];
  assign tagArrays_1_io_wreq_bits_data_5 = _GEN_103[26:0];
  assign tagArrays_1_io_wreq_bits_data_6 = _GEN_103[26:0];
  assign tagArrays_1_io_wreq_bits_data_7 = _GEN_103[26:0];
  assign tagArrays_1_io_wreq_bits_waymask = _GEN_111[7:0];
  always @(posedge clock) begin
    if (_port_0_read_0_reg_T) begin // @[Reg.scala 17:18]
      port_0_read_0_reg <= port_0_read_0; // @[Reg.scala 17:22]
    end
    if (_port_0_read_0_reg_T) begin // @[Reg.scala 17:18]
      port_1_read_0_reg <= port_1_read_0; // @[Reg.scala 17:22]
    end
    io_readResp_errors_0_0_REG <= ^read_meta_bits__0; // @[ECC.scala 87:27]
    io_readResp_errors_0_0_REG_1 <= io_read_ready & io_read_valid; // @[Decoupled.scala 50:35]
    io_readResp_errors_0_0_REG_2 <= io_readResp_errors_0_0_REG_1; // @[ICache.scala 208:97]
    io_readResp_errors_0_1_REG <= ^read_meta_bits__1; // @[ECC.scala 87:27]
    io_readResp_errors_0_1_REG_1 <= io_read_ready & io_read_valid; // @[Decoupled.scala 50:35]
    io_readResp_errors_0_1_REG_2 <= io_readResp_errors_0_1_REG_1; // @[ICache.scala 208:97]
    io_readResp_errors_0_2_REG <= ^read_meta_bits__2; // @[ECC.scala 87:27]
    io_readResp_errors_0_2_REG_1 <= io_read_ready & io_read_valid; // @[Decoupled.scala 50:35]
    io_readResp_errors_0_2_REG_2 <= io_readResp_errors_0_2_REG_1; // @[ICache.scala 208:97]
    io_readResp_errors_0_3_REG <= ^read_meta_bits__3; // @[ECC.scala 87:27]
    io_readResp_errors_0_3_REG_1 <= io_read_ready & io_read_valid; // @[Decoupled.scala 50:35]
    io_readResp_errors_0_3_REG_2 <= io_readResp_errors_0_3_REG_1; // @[ICache.scala 208:97]
    io_readResp_errors_0_4_REG <= ^read_meta_bits__4; // @[ECC.scala 87:27]
    io_readResp_errors_0_4_REG_1 <= io_read_ready & io_read_valid; // @[Decoupled.scala 50:35]
    io_readResp_errors_0_4_REG_2 <= io_readResp_errors_0_4_REG_1; // @[ICache.scala 208:97]
    io_readResp_errors_0_5_REG <= ^read_meta_bits__5; // @[ECC.scala 87:27]
    io_readResp_errors_0_5_REG_1 <= io_read_ready & io_read_valid; // @[Decoupled.scala 50:35]
    io_readResp_errors_0_5_REG_2 <= io_readResp_errors_0_5_REG_1; // @[ICache.scala 208:97]
    io_readResp_errors_0_6_REG <= ^read_meta_bits__6; // @[ECC.scala 87:27]
    io_readResp_errors_0_6_REG_1 <= io_read_ready & io_read_valid; // @[Decoupled.scala 50:35]
    io_readResp_errors_0_6_REG_2 <= io_readResp_errors_0_6_REG_1; // @[ICache.scala 208:97]
    io_readResp_errors_0_7_REG <= ^read_meta_bits__7; // @[ECC.scala 87:27]
    io_readResp_errors_0_7_REG_1 <= io_read_ready & io_read_valid; // @[Decoupled.scala 50:35]
    io_readResp_errors_0_7_REG_2 <= io_readResp_errors_0_7_REG_1; // @[ICache.scala 208:97]
    io_readResp_errors_1_0_REG <= ^read_meta_bits_1_0; // @[ECC.scala 87:27]
    io_readResp_errors_1_0_REG_1 <= io_read_ready & io_read_valid; // @[Decoupled.scala 50:35]
    io_readResp_errors_1_0_REG_2 <= io_readResp_errors_1_0_REG_1; // @[ICache.scala 208:97]
    io_readResp_errors_1_1_REG <= ^read_meta_bits_1_1; // @[ECC.scala 87:27]
    io_readResp_errors_1_1_REG_1 <= io_read_ready & io_read_valid; // @[Decoupled.scala 50:35]
    io_readResp_errors_1_1_REG_2 <= io_readResp_errors_1_1_REG_1; // @[ICache.scala 208:97]
    io_readResp_errors_1_2_REG <= ^read_meta_bits_1_2; // @[ECC.scala 87:27]
    io_readResp_errors_1_2_REG_1 <= io_read_ready & io_read_valid; // @[Decoupled.scala 50:35]
    io_readResp_errors_1_2_REG_2 <= io_readResp_errors_1_2_REG_1; // @[ICache.scala 208:97]
    io_readResp_errors_1_3_REG <= ^read_meta_bits_1_3; // @[ECC.scala 87:27]
    io_readResp_errors_1_3_REG_1 <= io_read_ready & io_read_valid; // @[Decoupled.scala 50:35]
    io_readResp_errors_1_3_REG_2 <= io_readResp_errors_1_3_REG_1; // @[ICache.scala 208:97]
    io_readResp_errors_1_4_REG <= ^read_meta_bits_1_4; // @[ECC.scala 87:27]
    io_readResp_errors_1_4_REG_1 <= io_read_ready & io_read_valid; // @[Decoupled.scala 50:35]
    io_readResp_errors_1_4_REG_2 <= io_readResp_errors_1_4_REG_1; // @[ICache.scala 208:97]
    io_readResp_errors_1_5_REG <= ^read_meta_bits_1_5; // @[ECC.scala 87:27]
    io_readResp_errors_1_5_REG_1 <= io_read_ready & io_read_valid; // @[Decoupled.scala 50:35]
    io_readResp_errors_1_5_REG_2 <= io_readResp_errors_1_5_REG_1; // @[ICache.scala 208:97]
    io_readResp_errors_1_6_REG <= ^read_meta_bits_1_6; // @[ECC.scala 87:27]
    io_readResp_errors_1_6_REG_1 <= io_read_ready & io_read_valid; // @[Decoupled.scala 50:35]
    io_readResp_errors_1_6_REG_2 <= io_readResp_errors_1_6_REG_1; // @[ICache.scala 208:97]
    io_readResp_errors_1_7_REG <= ^read_meta_bits_1_7; // @[ECC.scala 87:27]
    io_readResp_errors_1_7_REG_1 <= io_read_ready & io_read_valid; // @[Decoupled.scala 50:35]
    io_readResp_errors_1_7_REG_2 <= io_readResp_errors_1_7_REG_1; // @[ICache.scala 208:97]
    io_cacheOp_resp_valid_REG <= io_cacheOp_req_valid & cacheOpShouldResp; // @[ICache.scala 270:57]
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
  port_0_read_0_reg = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  port_1_read_0_reg = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  io_readResp_errors_0_0_REG = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  io_readResp_errors_0_0_REG_1 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  io_readResp_errors_0_0_REG_2 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  io_readResp_errors_0_1_REG = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  io_readResp_errors_0_1_REG_1 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  io_readResp_errors_0_1_REG_2 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  io_readResp_errors_0_2_REG = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  io_readResp_errors_0_2_REG_1 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  io_readResp_errors_0_2_REG_2 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  io_readResp_errors_0_3_REG = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  io_readResp_errors_0_3_REG_1 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  io_readResp_errors_0_3_REG_2 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  io_readResp_errors_0_4_REG = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  io_readResp_errors_0_4_REG_1 = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  io_readResp_errors_0_4_REG_2 = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  io_readResp_errors_0_5_REG = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  io_readResp_errors_0_5_REG_1 = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  io_readResp_errors_0_5_REG_2 = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  io_readResp_errors_0_6_REG = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  io_readResp_errors_0_6_REG_1 = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  io_readResp_errors_0_6_REG_2 = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  io_readResp_errors_0_7_REG = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  io_readResp_errors_0_7_REG_1 = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  io_readResp_errors_0_7_REG_2 = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  io_readResp_errors_1_0_REG = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  io_readResp_errors_1_0_REG_1 = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  io_readResp_errors_1_0_REG_2 = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  io_readResp_errors_1_1_REG = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  io_readResp_errors_1_1_REG_1 = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  io_readResp_errors_1_1_REG_2 = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  io_readResp_errors_1_2_REG = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  io_readResp_errors_1_2_REG_1 = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  io_readResp_errors_1_2_REG_2 = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  io_readResp_errors_1_3_REG = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  io_readResp_errors_1_3_REG_1 = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  io_readResp_errors_1_3_REG_2 = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  io_readResp_errors_1_4_REG = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  io_readResp_errors_1_4_REG_1 = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  io_readResp_errors_1_4_REG_2 = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  io_readResp_errors_1_5_REG = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  io_readResp_errors_1_5_REG_1 = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  io_readResp_errors_1_5_REG_2 = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  io_readResp_errors_1_6_REG = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  io_readResp_errors_1_6_REG_1 = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  io_readResp_errors_1_6_REG_2 = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  io_readResp_errors_1_7_REG = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  io_readResp_errors_1_7_REG_1 = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  io_readResp_errors_1_7_REG_2 = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  io_cacheOp_resp_valid_REG = _RAND_50[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

