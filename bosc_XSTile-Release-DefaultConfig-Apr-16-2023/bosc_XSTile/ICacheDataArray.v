module ICacheDataArray(
  input          clock,
  input          reset,
  input          io_write_valid,
  input  [5:0]   io_write_bits_virIdx,
  input  [511:0] io_write_bits_data,
  input  [7:0]   io_write_bits_waymask,
  input          io_write_bits_bankIdx,
  output         io_read_ready,
  input          io_read_valid,
  input          io_read_bits_0_isDoubleLine,
  input  [5:0]   io_read_bits_0_vSetIdx_0,
  input  [5:0]   io_read_bits_0_vSetIdx_1,
  input          io_read_bits_1_isDoubleLine,
  input  [5:0]   io_read_bits_1_vSetIdx_0,
  input  [5:0]   io_read_bits_1_vSetIdx_1,
  input          io_read_bits_2_isDoubleLine,
  input  [5:0]   io_read_bits_2_vSetIdx_0,
  input  [5:0]   io_read_bits_2_vSetIdx_1,
  input          io_read_bits_3_isDoubleLine,
  input  [5:0]   io_read_bits_3_vSetIdx_0,
  input  [5:0]   io_read_bits_3_vSetIdx_1,
  output [511:0] io_readResp_datas_0_0,
  output [511:0] io_readResp_datas_0_1,
  output [511:0] io_readResp_datas_0_2,
  output [511:0] io_readResp_datas_0_3,
  output [511:0] io_readResp_datas_0_4,
  output [511:0] io_readResp_datas_0_5,
  output [511:0] io_readResp_datas_0_6,
  output [511:0] io_readResp_datas_0_7,
  output [511:0] io_readResp_datas_1_0,
  output [511:0] io_readResp_datas_1_1,
  output [511:0] io_readResp_datas_1_2,
  output [511:0] io_readResp_datas_1_3,
  output [511:0] io_readResp_datas_1_4,
  output [511:0] io_readResp_datas_1_5,
  output [511:0] io_readResp_datas_1_6,
  output [511:0] io_readResp_datas_1_7,
  output [31:0]  io_readResp_codes_0_0,
  output [31:0]  io_readResp_codes_0_1,
  output [31:0]  io_readResp_codes_0_2,
  output [31:0]  io_readResp_codes_0_3,
  output [31:0]  io_readResp_codes_0_4,
  output [31:0]  io_readResp_codes_0_5,
  output [31:0]  io_readResp_codes_0_6,
  output [31:0]  io_readResp_codes_0_7,
  output [31:0]  io_readResp_codes_1_0,
  output [31:0]  io_readResp_codes_1_1,
  output [31:0]  io_readResp_codes_1_2,
  output [31:0]  io_readResp_codes_1_3,
  output [31:0]  io_readResp_codes_1_4,
  output [31:0]  io_readResp_codes_1_5,
  output [31:0]  io_readResp_codes_1_6,
  output [31:0]  io_readResp_codes_1_7,
  input          io_cacheOp_req_valid,
  input  [63:0]  io_cacheOp_req_bits_wayNum,
  input  [63:0]  io_cacheOp_req_bits_index,
  input  [63:0]  io_cacheOp_req_bits_opCode,
  input  [63:0]  io_cacheOp_req_bits_write_data_vec_0,
  input  [63:0]  io_cacheOp_req_bits_write_data_vec_1,
  input  [63:0]  io_cacheOp_req_bits_write_data_vec_2,
  input  [63:0]  io_cacheOp_req_bits_write_data_vec_3,
  input  [63:0]  io_cacheOp_req_bits_write_data_vec_4,
  input  [63:0]  io_cacheOp_req_bits_write_data_vec_5,
  input  [63:0]  io_cacheOp_req_bits_write_data_vec_6,
  input  [63:0]  io_cacheOp_req_bits_write_data_vec_7,
  input  [63:0]  io_cacheOp_req_bits_bank_num,
  output         io_cacheOp_resp_valid,
  output [63:0]  io_cacheOp_resp_bits_read_data_vec_0,
  output [63:0]  io_cacheOp_resp_bits_read_data_vec_1,
  output [63:0]  io_cacheOp_resp_bits_read_data_vec_2,
  output [63:0]  io_cacheOp_resp_bits_read_data_vec_3,
  output [63:0]  io_cacheOp_resp_bits_read_data_vec_4,
  output [63:0]  io_cacheOp_resp_bits_read_data_vec_5,
  output [63:0]  io_cacheOp_resp_bits_read_data_vec_6,
  output [63:0]  io_cacheOp_resp_bits_read_data_vec_7
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire  dataArrays_0_clock; // @[ICache.scala 319:27]
  wire  dataArrays_0_reset; // @[ICache.scala 319:27]
  wire  dataArrays_0_io_read_req_0_ready; // @[ICache.scala 319:27]
  wire  dataArrays_0_io_read_req_0_valid; // @[ICache.scala 319:27]
  wire [4:0] dataArrays_0_io_read_req_0_bits_ridx; // @[ICache.scala 319:27]
  wire  dataArrays_0_io_read_req_1_ready; // @[ICache.scala 319:27]
  wire  dataArrays_0_io_read_req_1_valid; // @[ICache.scala 319:27]
  wire [4:0] dataArrays_0_io_read_req_1_bits_ridx; // @[ICache.scala 319:27]
  wire [511:0] dataArrays_0_io_read_resp_rdata_0_0; // @[ICache.scala 319:27]
  wire [511:0] dataArrays_0_io_read_resp_rdata_0_1; // @[ICache.scala 319:27]
  wire [511:0] dataArrays_0_io_read_resp_rdata_1_0; // @[ICache.scala 319:27]
  wire [511:0] dataArrays_0_io_read_resp_rdata_1_1; // @[ICache.scala 319:27]
  wire  dataArrays_0_io_write_valid; // @[ICache.scala 319:27]
  wire [511:0] dataArrays_0_io_write_bits_wdata; // @[ICache.scala 319:27]
  wire [4:0] dataArrays_0_io_write_bits_widx; // @[ICache.scala 319:27]
  wire  dataArrays_0_io_write_bits_wbankidx; // @[ICache.scala 319:27]
  wire  dataArrays_0_io_write_bits_wmask_0; // @[ICache.scala 319:27]
  wire  dataArrays_0_io_write_bits_wmask_1; // @[ICache.scala 319:27]
  wire  dataArrays_1_clock; // @[ICache.scala 319:27]
  wire  dataArrays_1_reset; // @[ICache.scala 319:27]
  wire  dataArrays_1_io_read_req_0_ready; // @[ICache.scala 319:27]
  wire  dataArrays_1_io_read_req_0_valid; // @[ICache.scala 319:27]
  wire [4:0] dataArrays_1_io_read_req_0_bits_ridx; // @[ICache.scala 319:27]
  wire  dataArrays_1_io_read_req_1_ready; // @[ICache.scala 319:27]
  wire  dataArrays_1_io_read_req_1_valid; // @[ICache.scala 319:27]
  wire [4:0] dataArrays_1_io_read_req_1_bits_ridx; // @[ICache.scala 319:27]
  wire [511:0] dataArrays_1_io_read_resp_rdata_0_0; // @[ICache.scala 319:27]
  wire [511:0] dataArrays_1_io_read_resp_rdata_0_1; // @[ICache.scala 319:27]
  wire [511:0] dataArrays_1_io_read_resp_rdata_1_0; // @[ICache.scala 319:27]
  wire [511:0] dataArrays_1_io_read_resp_rdata_1_1; // @[ICache.scala 319:27]
  wire  dataArrays_1_io_write_valid; // @[ICache.scala 319:27]
  wire [511:0] dataArrays_1_io_write_bits_wdata; // @[ICache.scala 319:27]
  wire [4:0] dataArrays_1_io_write_bits_widx; // @[ICache.scala 319:27]
  wire  dataArrays_1_io_write_bits_wbankidx; // @[ICache.scala 319:27]
  wire  dataArrays_1_io_write_bits_wmask_0; // @[ICache.scala 319:27]
  wire  dataArrays_1_io_write_bits_wmask_1; // @[ICache.scala 319:27]
  wire  dataArrays_2_clock; // @[ICache.scala 319:27]
  wire  dataArrays_2_reset; // @[ICache.scala 319:27]
  wire  dataArrays_2_io_read_req_0_ready; // @[ICache.scala 319:27]
  wire  dataArrays_2_io_read_req_0_valid; // @[ICache.scala 319:27]
  wire [4:0] dataArrays_2_io_read_req_0_bits_ridx; // @[ICache.scala 319:27]
  wire  dataArrays_2_io_read_req_1_ready; // @[ICache.scala 319:27]
  wire  dataArrays_2_io_read_req_1_valid; // @[ICache.scala 319:27]
  wire [4:0] dataArrays_2_io_read_req_1_bits_ridx; // @[ICache.scala 319:27]
  wire [511:0] dataArrays_2_io_read_resp_rdata_0_0; // @[ICache.scala 319:27]
  wire [511:0] dataArrays_2_io_read_resp_rdata_0_1; // @[ICache.scala 319:27]
  wire [511:0] dataArrays_2_io_read_resp_rdata_1_0; // @[ICache.scala 319:27]
  wire [511:0] dataArrays_2_io_read_resp_rdata_1_1; // @[ICache.scala 319:27]
  wire  dataArrays_2_io_write_valid; // @[ICache.scala 319:27]
  wire [511:0] dataArrays_2_io_write_bits_wdata; // @[ICache.scala 319:27]
  wire [4:0] dataArrays_2_io_write_bits_widx; // @[ICache.scala 319:27]
  wire  dataArrays_2_io_write_bits_wbankidx; // @[ICache.scala 319:27]
  wire  dataArrays_2_io_write_bits_wmask_0; // @[ICache.scala 319:27]
  wire  dataArrays_2_io_write_bits_wmask_1; // @[ICache.scala 319:27]
  wire  dataArrays_3_clock; // @[ICache.scala 319:27]
  wire  dataArrays_3_reset; // @[ICache.scala 319:27]
  wire  dataArrays_3_io_read_req_0_ready; // @[ICache.scala 319:27]
  wire  dataArrays_3_io_read_req_0_valid; // @[ICache.scala 319:27]
  wire [4:0] dataArrays_3_io_read_req_0_bits_ridx; // @[ICache.scala 319:27]
  wire  dataArrays_3_io_read_req_1_ready; // @[ICache.scala 319:27]
  wire  dataArrays_3_io_read_req_1_valid; // @[ICache.scala 319:27]
  wire [4:0] dataArrays_3_io_read_req_1_bits_ridx; // @[ICache.scala 319:27]
  wire [511:0] dataArrays_3_io_read_resp_rdata_0_0; // @[ICache.scala 319:27]
  wire [511:0] dataArrays_3_io_read_resp_rdata_0_1; // @[ICache.scala 319:27]
  wire [511:0] dataArrays_3_io_read_resp_rdata_1_0; // @[ICache.scala 319:27]
  wire [511:0] dataArrays_3_io_read_resp_rdata_1_1; // @[ICache.scala 319:27]
  wire  dataArrays_3_io_write_valid; // @[ICache.scala 319:27]
  wire [511:0] dataArrays_3_io_write_bits_wdata; // @[ICache.scala 319:27]
  wire [4:0] dataArrays_3_io_write_bits_widx; // @[ICache.scala 319:27]
  wire  dataArrays_3_io_write_bits_wbankidx; // @[ICache.scala 319:27]
  wire  dataArrays_3_io_write_bits_wmask_0; // @[ICache.scala 319:27]
  wire  dataArrays_3_io_write_bits_wmask_1; // @[ICache.scala 319:27]
  wire  codeArrays_0_clock; // @[ICache.scala 359:27]
  wire  codeArrays_0_reset; // @[ICache.scala 359:27]
  wire  codeArrays_0_io_rreq_ready; // @[ICache.scala 359:27]
  wire  codeArrays_0_io_rreq_valid; // @[ICache.scala 359:27]
  wire [4:0] codeArrays_0_io_rreq_bits_setIdx; // @[ICache.scala 359:27]
  wire [31:0] codeArrays_0_io_rresp_data_0; // @[ICache.scala 359:27]
  wire [31:0] codeArrays_0_io_rresp_data_1; // @[ICache.scala 359:27]
  wire [31:0] codeArrays_0_io_rresp_data_2; // @[ICache.scala 359:27]
  wire [31:0] codeArrays_0_io_rresp_data_3; // @[ICache.scala 359:27]
  wire [31:0] codeArrays_0_io_rresp_data_4; // @[ICache.scala 359:27]
  wire [31:0] codeArrays_0_io_rresp_data_5; // @[ICache.scala 359:27]
  wire [31:0] codeArrays_0_io_rresp_data_6; // @[ICache.scala 359:27]
  wire [31:0] codeArrays_0_io_rresp_data_7; // @[ICache.scala 359:27]
  wire  codeArrays_0_io_wreq_valid; // @[ICache.scala 359:27]
  wire [4:0] codeArrays_0_io_wreq_bits_setIdx; // @[ICache.scala 359:27]
  wire [31:0] codeArrays_0_io_wreq_bits_data_0; // @[ICache.scala 359:27]
  wire [31:0] codeArrays_0_io_wreq_bits_data_1; // @[ICache.scala 359:27]
  wire [31:0] codeArrays_0_io_wreq_bits_data_2; // @[ICache.scala 359:27]
  wire [31:0] codeArrays_0_io_wreq_bits_data_3; // @[ICache.scala 359:27]
  wire [31:0] codeArrays_0_io_wreq_bits_data_4; // @[ICache.scala 359:27]
  wire [31:0] codeArrays_0_io_wreq_bits_data_5; // @[ICache.scala 359:27]
  wire [31:0] codeArrays_0_io_wreq_bits_data_6; // @[ICache.scala 359:27]
  wire [31:0] codeArrays_0_io_wreq_bits_data_7; // @[ICache.scala 359:27]
  wire [7:0] codeArrays_0_io_wreq_bits_waymask; // @[ICache.scala 359:27]
  wire  codeArrays_1_clock; // @[ICache.scala 359:27]
  wire  codeArrays_1_reset; // @[ICache.scala 359:27]
  wire  codeArrays_1_io_rreq_ready; // @[ICache.scala 359:27]
  wire  codeArrays_1_io_rreq_valid; // @[ICache.scala 359:27]
  wire [4:0] codeArrays_1_io_rreq_bits_setIdx; // @[ICache.scala 359:27]
  wire [31:0] codeArrays_1_io_rresp_data_0; // @[ICache.scala 359:27]
  wire [31:0] codeArrays_1_io_rresp_data_1; // @[ICache.scala 359:27]
  wire [31:0] codeArrays_1_io_rresp_data_2; // @[ICache.scala 359:27]
  wire [31:0] codeArrays_1_io_rresp_data_3; // @[ICache.scala 359:27]
  wire [31:0] codeArrays_1_io_rresp_data_4; // @[ICache.scala 359:27]
  wire [31:0] codeArrays_1_io_rresp_data_5; // @[ICache.scala 359:27]
  wire [31:0] codeArrays_1_io_rresp_data_6; // @[ICache.scala 359:27]
  wire [31:0] codeArrays_1_io_rresp_data_7; // @[ICache.scala 359:27]
  wire  codeArrays_1_io_wreq_valid; // @[ICache.scala 359:27]
  wire [4:0] codeArrays_1_io_wreq_bits_setIdx; // @[ICache.scala 359:27]
  wire [31:0] codeArrays_1_io_wreq_bits_data_0; // @[ICache.scala 359:27]
  wire [31:0] codeArrays_1_io_wreq_bits_data_1; // @[ICache.scala 359:27]
  wire [31:0] codeArrays_1_io_wreq_bits_data_2; // @[ICache.scala 359:27]
  wire [31:0] codeArrays_1_io_wreq_bits_data_3; // @[ICache.scala 359:27]
  wire [31:0] codeArrays_1_io_wreq_bits_data_4; // @[ICache.scala 359:27]
  wire [31:0] codeArrays_1_io_wreq_bits_data_5; // @[ICache.scala 359:27]
  wire [31:0] codeArrays_1_io_wreq_bits_data_6; // @[ICache.scala 359:27]
  wire [31:0] codeArrays_1_io_wreq_bits_data_7; // @[ICache.scala 359:27]
  wire [7:0] codeArrays_1_io_wreq_bits_waymask; // @[ICache.scala 359:27]
  wire  _port_0_read_0_reg_T_1 = ~io_read_bits_0_vSetIdx_0[0]; // @[ICacheBundle.scala 32:24]
  wire  _port_0_read_0_reg_T_2 = io_read_valid & _port_0_read_0_reg_T_1; // @[ICache.scala 310:58]
  wire  _port_0_read_0_reg_T_3 = io_read_ready & io_read_valid; // @[Decoupled.scala 50:35]
  wire  _port_0_read_1_reg_T_1 = io_read_valid & io_read_bits_0_vSetIdx_0[0]; // @[ICache.scala 311:58]
  reg  port_0_read_1_reg; // @[Reg.scala 16:16]
  wire  _port_1_read_1_reg_T_1 = io_read_bits_0_vSetIdx_1[0] & io_read_bits_0_isDoubleLine; // @[ICacheBundle.scala 35:39]
  wire  _port_1_read_0_reg_T_2 = ~io_read_bits_0_vSetIdx_1[0] & io_read_bits_0_isDoubleLine; // @[ICacheBundle.scala 34:39]
  wire  _port_1_read_0_reg_T_3 = io_read_valid & _port_1_read_0_reg_T_2; // @[ICache.scala 313:58]
  reg  port_1_read_0_reg; // @[Reg.scala 16:16]
  wire [5:0] bank_0_idx_vec_0 = _port_0_read_0_reg_T_2 ? io_read_bits_0_vSetIdx_0 : io_read_bits_0_vSetIdx_1; // @[ICache.scala 315:53]
  wire  _bank_0_idx_vec_T_4 = ~io_read_bits_1_vSetIdx_0[0]; // @[ICacheBundle.scala 32:24]
  wire [5:0] bank_0_idx_vec_1 = io_read_valid & _bank_0_idx_vec_T_4 ? io_read_bits_1_vSetIdx_0 :
    io_read_bits_1_vSetIdx_1; // @[ICache.scala 315:53]
  wire  _bank_0_idx_vec_T_7 = ~io_read_bits_2_vSetIdx_0[0]; // @[ICacheBundle.scala 32:24]
  wire [5:0] bank_0_idx_vec_2 = io_read_valid & _bank_0_idx_vec_T_7 ? io_read_bits_2_vSetIdx_0 :
    io_read_bits_2_vSetIdx_1; // @[ICache.scala 315:53]
  wire  _bank_0_idx_vec_T_10 = ~io_read_bits_3_vSetIdx_0[0]; // @[ICacheBundle.scala 32:24]
  wire [5:0] bank_0_idx = io_read_valid & _bank_0_idx_vec_T_10 ? io_read_bits_3_vSetIdx_0 : io_read_bits_3_vSetIdx_1; // @[ICache.scala 315:53]
  wire [5:0] bank_1_idx_vec_0 = _port_0_read_1_reg_T_1 ? io_read_bits_0_vSetIdx_0 : io_read_bits_0_vSetIdx_1; // @[ICache.scala 316:53]
  wire [5:0] bank_1_idx_vec_1 = io_read_valid & io_read_bits_1_vSetIdx_0[0] ? io_read_bits_1_vSetIdx_0 :
    io_read_bits_1_vSetIdx_1; // @[ICache.scala 316:53]
  wire [5:0] bank_1_idx_vec_2 = io_read_valid & io_read_bits_2_vSetIdx_0[0] ? io_read_bits_2_vSetIdx_0 :
    io_read_bits_2_vSetIdx_1; // @[ICache.scala 316:53]
  wire [5:0] bank_1_idx = io_read_valid & io_read_bits_3_vSetIdx_0[0] ? io_read_bits_3_vSetIdx_0 :
    io_read_bits_3_vSetIdx_1; // @[ICache.scala 316:53]
  wire  _dataArray_io_read_req_0_valid_T_5 = _port_0_read_0_reg_T_1 | _port_1_read_0_reg_T_2; // @[ICacheBundle.scala 37:35]
  wire  _dataArray_io_read_req_1_valid_T_3 = io_read_bits_0_vSetIdx_0[0] | _port_1_read_1_reg_T_1; // @[ICacheBundle.scala 38:36]
  wire  _dataArray_io_read_req_0_valid_T_11 = ~io_read_bits_1_vSetIdx_1[0] & io_read_bits_1_isDoubleLine; // @[ICacheBundle.scala 34:39]
  wire  _dataArray_io_read_req_0_valid_T_12 = _bank_0_idx_vec_T_4 | _dataArray_io_read_req_0_valid_T_11; // @[ICacheBundle.scala 37:35]
  wire  _dataArray_io_read_req_1_valid_T_7 = io_read_bits_1_vSetIdx_1[0] & io_read_bits_1_isDoubleLine; // @[ICacheBundle.scala 35:39]
  wire  _dataArray_io_read_req_1_valid_T_8 = io_read_bits_1_vSetIdx_0[0] | _dataArray_io_read_req_1_valid_T_7; // @[ICacheBundle.scala 38:36]
  wire  _dataArray_io_read_req_0_valid_T_18 = ~io_read_bits_2_vSetIdx_1[0] & io_read_bits_2_isDoubleLine; // @[ICacheBundle.scala 34:39]
  wire  _dataArray_io_read_req_0_valid_T_19 = _bank_0_idx_vec_T_7 | _dataArray_io_read_req_0_valid_T_18; // @[ICacheBundle.scala 37:35]
  wire  _dataArray_io_read_req_1_valid_T_12 = io_read_bits_2_vSetIdx_1[0] & io_read_bits_2_isDoubleLine; // @[ICacheBundle.scala 35:39]
  wire  _dataArray_io_read_req_1_valid_T_13 = io_read_bits_2_vSetIdx_0[0] | _dataArray_io_read_req_1_valid_T_12; // @[ICacheBundle.scala 38:36]
  wire  _dataArray_io_read_req_0_valid_T_25 = ~io_read_bits_3_vSetIdx_1[0] & io_read_bits_3_isDoubleLine; // @[ICacheBundle.scala 34:39]
  wire  _dataArray_io_read_req_0_valid_T_26 = _bank_0_idx_vec_T_10 | _dataArray_io_read_req_0_valid_T_25; // @[ICacheBundle.scala 37:35]
  wire  _dataArray_io_read_req_1_valid_T_17 = io_read_bits_3_vSetIdx_1[0] & io_read_bits_3_isDoubleLine; // @[ICacheBundle.scala 35:39]
  wire  _dataArray_io_read_req_1_valid_T_18 = io_read_bits_3_vSetIdx_0[0] | _dataArray_io_read_req_1_valid_T_17; // @[ICacheBundle.scala 38:36]
  wire [1023:0] _read_datas_0_0_T = {dataArrays_0_io_read_resp_rdata_0_1,dataArrays_0_io_read_resp_rdata_0_0}; // @[ICache.scala 343:84]
  wire [511:0] read_datas_0_0 = _read_datas_0_0_T[511:0]; // @[ICache.scala 343:84]
  wire [1023:0] _read_datas_0_2_T = {dataArrays_1_io_read_resp_rdata_0_1,dataArrays_1_io_read_resp_rdata_0_0}; // @[ICache.scala 343:84]
  wire [511:0] read_datas_0_2 = _read_datas_0_2_T[511:0]; // @[ICache.scala 343:84]
  wire [1023:0] _read_datas_0_4_T = {dataArrays_2_io_read_resp_rdata_0_1,dataArrays_2_io_read_resp_rdata_0_0}; // @[ICache.scala 343:84]
  wire [511:0] read_datas_0_4 = _read_datas_0_4_T[511:0]; // @[ICache.scala 343:84]
  wire [1023:0] _read_datas_0_6_T = {dataArrays_3_io_read_resp_rdata_0_1,dataArrays_3_io_read_resp_rdata_0_0}; // @[ICache.scala 343:84]
  wire [511:0] read_datas_0_6 = _read_datas_0_6_T[511:0]; // @[ICache.scala 343:84]
  wire [1023:0] _read_datas_1_0_T = {dataArrays_0_io_read_resp_rdata_1_1,dataArrays_0_io_read_resp_rdata_1_0}; // @[ICache.scala 343:84]
  wire [511:0] read_datas_1_0 = _read_datas_1_0_T[511:0]; // @[ICache.scala 343:84]
  wire [1023:0] _read_datas_1_2_T = {dataArrays_1_io_read_resp_rdata_1_1,dataArrays_1_io_read_resp_rdata_1_0}; // @[ICache.scala 343:84]
  wire [511:0] read_datas_1_2 = _read_datas_1_2_T[511:0]; // @[ICache.scala 343:84]
  wire [1023:0] _read_datas_1_4_T = {dataArrays_2_io_read_resp_rdata_1_1,dataArrays_2_io_read_resp_rdata_1_0}; // @[ICache.scala 343:84]
  wire [511:0] read_datas_1_4 = _read_datas_1_4_T[511:0]; // @[ICache.scala 343:84]
  wire [1023:0] _read_datas_1_6_T = {dataArrays_3_io_read_resp_rdata_1_1,dataArrays_3_io_read_resp_rdata_1_0}; // @[ICache.scala 343:84]
  wire [511:0] read_datas_1_6 = _read_datas_1_6_T[511:0]; // @[ICache.scala 343:84]
  wire  _io_read_ready_T_7 = dataArrays_0_io_read_req_0_ready & dataArrays_0_io_read_req_1_ready & (
    dataArrays_1_io_read_req_0_ready & dataArrays_1_io_read_req_1_ready) & (dataArrays_2_io_read_req_0_ready &
    dataArrays_2_io_read_req_1_ready) & (dataArrays_3_io_read_req_0_ready & dataArrays_3_io_read_req_1_ready); // @[ICache.scala 385:85]
  wire  _io_read_ready_T_8 = ~io_write_valid & _io_read_ready_T_7; // @[ICache.scala 384:36]
  wire  _io_read_ready_T_9 = codeArrays_0_io_rreq_ready & codeArrays_1_io_rreq_ready; // @[ICache.scala 386:63]
  wire [255:0] _T_38 = {codeArrays_0_io_rresp_data_7,codeArrays_0_io_rresp_data_6,codeArrays_0_io_rresp_data_5,
    codeArrays_0_io_rresp_data_4,codeArrays_0_io_rresp_data_3,codeArrays_0_io_rresp_data_2,
    codeArrays_0_io_rresp_data_1,codeArrays_0_io_rresp_data_0}; // @[ICache.scala 391:50]
  wire [31:0] read_codes_0_0 = _T_38[31:0]; // @[ICache.scala 391:50]
  wire [31:0] read_codes_0_1 = _T_38[63:32]; // @[ICache.scala 391:50]
  wire [31:0] read_codes_0_2 = _T_38[95:64]; // @[ICache.scala 391:50]
  wire [31:0] read_codes_0_3 = _T_38[127:96]; // @[ICache.scala 391:50]
  wire [31:0] read_codes_0_4 = _T_38[159:128]; // @[ICache.scala 391:50]
  wire [31:0] read_codes_0_5 = _T_38[191:160]; // @[ICache.scala 391:50]
  wire [31:0] read_codes_0_6 = _T_38[223:192]; // @[ICache.scala 391:50]
  wire [31:0] read_codes_0_7 = _T_38[255:224]; // @[ICache.scala 391:50]
  wire [255:0] _T_47 = {codeArrays_1_io_rresp_data_7,codeArrays_1_io_rresp_data_6,codeArrays_1_io_rresp_data_5,
    codeArrays_1_io_rresp_data_4,codeArrays_1_io_rresp_data_3,codeArrays_1_io_rresp_data_2,
    codeArrays_1_io_rresp_data_1,codeArrays_1_io_rresp_data_0}; // @[ICache.scala 391:50]
  wire [31:0] read_codes_1_0 = _T_47[31:0]; // @[ICache.scala 391:50]
  wire [31:0] read_codes_1_1 = _T_47[63:32]; // @[ICache.scala 391:50]
  wire [31:0] read_codes_1_2 = _T_47[95:64]; // @[ICache.scala 391:50]
  wire [31:0] read_codes_1_3 = _T_47[127:96]; // @[ICache.scala 391:50]
  wire [31:0] read_codes_1_4 = _T_47[159:128]; // @[ICache.scala 391:50]
  wire [31:0] read_codes_1_5 = _T_47[191:160]; // @[ICache.scala 391:50]
  wire [31:0] read_codes_1_6 = _T_47[223:192]; // @[ICache.scala 391:50]
  wire [31:0] read_codes_1_7 = _T_47[255:224]; // @[ICache.scala 391:50]
  wire [15:0] write_data_code_unit = io_write_bits_data[15:0]; // @[ICache.scala 296:28]
  wire  _write_data_code_T = ^write_data_code_unit; // @[ECC.scala 81:55]
  wire [16:0] _write_data_code_T_2 = {_write_data_code_T,write_data_code_unit}; // @[Cat.scala 31:58]
  wire [15:0] write_data_code_unit_1 = io_write_bits_data[31:16]; // @[ICache.scala 296:28]
  wire  _write_data_code_T_4 = ^write_data_code_unit_1; // @[ECC.scala 81:55]
  wire [16:0] _write_data_code_T_6 = {_write_data_code_T_4,write_data_code_unit_1}; // @[Cat.scala 31:58]
  wire [15:0] write_data_code_unit_2 = io_write_bits_data[47:32]; // @[ICache.scala 296:28]
  wire  _write_data_code_T_8 = ^write_data_code_unit_2; // @[ECC.scala 81:55]
  wire [16:0] _write_data_code_T_10 = {_write_data_code_T_8,write_data_code_unit_2}; // @[Cat.scala 31:58]
  wire [15:0] write_data_code_unit_3 = io_write_bits_data[63:48]; // @[ICache.scala 296:28]
  wire  _write_data_code_T_12 = ^write_data_code_unit_3; // @[ECC.scala 81:55]
  wire [16:0] _write_data_code_T_14 = {_write_data_code_T_12,write_data_code_unit_3}; // @[Cat.scala 31:58]
  wire [15:0] write_data_code_unit_4 = io_write_bits_data[79:64]; // @[ICache.scala 296:28]
  wire  _write_data_code_T_16 = ^write_data_code_unit_4; // @[ECC.scala 81:55]
  wire [16:0] _write_data_code_T_18 = {_write_data_code_T_16,write_data_code_unit_4}; // @[Cat.scala 31:58]
  wire [15:0] write_data_code_unit_5 = io_write_bits_data[95:80]; // @[ICache.scala 296:28]
  wire  _write_data_code_T_20 = ^write_data_code_unit_5; // @[ECC.scala 81:55]
  wire [16:0] _write_data_code_T_22 = {_write_data_code_T_20,write_data_code_unit_5}; // @[Cat.scala 31:58]
  wire [15:0] write_data_code_unit_6 = io_write_bits_data[111:96]; // @[ICache.scala 296:28]
  wire  _write_data_code_T_24 = ^write_data_code_unit_6; // @[ECC.scala 81:55]
  wire [16:0] _write_data_code_T_26 = {_write_data_code_T_24,write_data_code_unit_6}; // @[Cat.scala 31:58]
  wire [15:0] write_data_code_unit_7 = io_write_bits_data[127:112]; // @[ICache.scala 296:28]
  wire  _write_data_code_T_28 = ^write_data_code_unit_7; // @[ECC.scala 81:55]
  wire [16:0] _write_data_code_T_30 = {_write_data_code_T_28,write_data_code_unit_7}; // @[Cat.scala 31:58]
  wire [15:0] write_data_code_unit_8 = io_write_bits_data[143:128]; // @[ICache.scala 296:28]
  wire  _write_data_code_T_32 = ^write_data_code_unit_8; // @[ECC.scala 81:55]
  wire [16:0] _write_data_code_T_34 = {_write_data_code_T_32,write_data_code_unit_8}; // @[Cat.scala 31:58]
  wire [15:0] write_data_code_unit_9 = io_write_bits_data[159:144]; // @[ICache.scala 296:28]
  wire  _write_data_code_T_36 = ^write_data_code_unit_9; // @[ECC.scala 81:55]
  wire [16:0] _write_data_code_T_38 = {_write_data_code_T_36,write_data_code_unit_9}; // @[Cat.scala 31:58]
  wire [15:0] write_data_code_unit_10 = io_write_bits_data[175:160]; // @[ICache.scala 296:28]
  wire  _write_data_code_T_40 = ^write_data_code_unit_10; // @[ECC.scala 81:55]
  wire [16:0] _write_data_code_T_42 = {_write_data_code_T_40,write_data_code_unit_10}; // @[Cat.scala 31:58]
  wire [15:0] write_data_code_unit_11 = io_write_bits_data[191:176]; // @[ICache.scala 296:28]
  wire  _write_data_code_T_44 = ^write_data_code_unit_11; // @[ECC.scala 81:55]
  wire [16:0] _write_data_code_T_46 = {_write_data_code_T_44,write_data_code_unit_11}; // @[Cat.scala 31:58]
  wire [15:0] write_data_code_unit_12 = io_write_bits_data[207:192]; // @[ICache.scala 296:28]
  wire  _write_data_code_T_48 = ^write_data_code_unit_12; // @[ECC.scala 81:55]
  wire [16:0] _write_data_code_T_50 = {_write_data_code_T_48,write_data_code_unit_12}; // @[Cat.scala 31:58]
  wire [15:0] write_data_code_unit_13 = io_write_bits_data[223:208]; // @[ICache.scala 296:28]
  wire  _write_data_code_T_52 = ^write_data_code_unit_13; // @[ECC.scala 81:55]
  wire [16:0] _write_data_code_T_54 = {_write_data_code_T_52,write_data_code_unit_13}; // @[Cat.scala 31:58]
  wire [15:0] write_data_code_unit_14 = io_write_bits_data[239:224]; // @[ICache.scala 296:28]
  wire  _write_data_code_T_56 = ^write_data_code_unit_14; // @[ECC.scala 81:55]
  wire [16:0] _write_data_code_T_58 = {_write_data_code_T_56,write_data_code_unit_14}; // @[Cat.scala 31:58]
  wire [15:0] write_data_code_unit_15 = io_write_bits_data[255:240]; // @[ICache.scala 296:28]
  wire  _write_data_code_T_60 = ^write_data_code_unit_15; // @[ECC.scala 81:55]
  wire [16:0] _write_data_code_T_62 = {_write_data_code_T_60,write_data_code_unit_15}; // @[Cat.scala 31:58]
  wire [15:0] write_data_code_unit_16 = io_write_bits_data[271:256]; // @[ICache.scala 296:28]
  wire  _write_data_code_T_64 = ^write_data_code_unit_16; // @[ECC.scala 81:55]
  wire [16:0] _write_data_code_T_66 = {_write_data_code_T_64,write_data_code_unit_16}; // @[Cat.scala 31:58]
  wire [15:0] write_data_code_unit_17 = io_write_bits_data[287:272]; // @[ICache.scala 296:28]
  wire  _write_data_code_T_68 = ^write_data_code_unit_17; // @[ECC.scala 81:55]
  wire [16:0] _write_data_code_T_70 = {_write_data_code_T_68,write_data_code_unit_17}; // @[Cat.scala 31:58]
  wire [15:0] write_data_code_unit_18 = io_write_bits_data[303:288]; // @[ICache.scala 296:28]
  wire  _write_data_code_T_72 = ^write_data_code_unit_18; // @[ECC.scala 81:55]
  wire [16:0] _write_data_code_T_74 = {_write_data_code_T_72,write_data_code_unit_18}; // @[Cat.scala 31:58]
  wire [15:0] write_data_code_unit_19 = io_write_bits_data[319:304]; // @[ICache.scala 296:28]
  wire  _write_data_code_T_76 = ^write_data_code_unit_19; // @[ECC.scala 81:55]
  wire [16:0] _write_data_code_T_78 = {_write_data_code_T_76,write_data_code_unit_19}; // @[Cat.scala 31:58]
  wire [15:0] write_data_code_unit_20 = io_write_bits_data[335:320]; // @[ICache.scala 296:28]
  wire  _write_data_code_T_80 = ^write_data_code_unit_20; // @[ECC.scala 81:55]
  wire [16:0] _write_data_code_T_82 = {_write_data_code_T_80,write_data_code_unit_20}; // @[Cat.scala 31:58]
  wire [15:0] write_data_code_unit_21 = io_write_bits_data[351:336]; // @[ICache.scala 296:28]
  wire  _write_data_code_T_84 = ^write_data_code_unit_21; // @[ECC.scala 81:55]
  wire [16:0] _write_data_code_T_86 = {_write_data_code_T_84,write_data_code_unit_21}; // @[Cat.scala 31:58]
  wire [15:0] write_data_code_unit_22 = io_write_bits_data[367:352]; // @[ICache.scala 296:28]
  wire  _write_data_code_T_88 = ^write_data_code_unit_22; // @[ECC.scala 81:55]
  wire [16:0] _write_data_code_T_90 = {_write_data_code_T_88,write_data_code_unit_22}; // @[Cat.scala 31:58]
  wire [15:0] write_data_code_unit_23 = io_write_bits_data[383:368]; // @[ICache.scala 296:28]
  wire  _write_data_code_T_92 = ^write_data_code_unit_23; // @[ECC.scala 81:55]
  wire [16:0] _write_data_code_T_94 = {_write_data_code_T_92,write_data_code_unit_23}; // @[Cat.scala 31:58]
  wire [15:0] write_data_code_unit_24 = io_write_bits_data[399:384]; // @[ICache.scala 296:28]
  wire  _write_data_code_T_96 = ^write_data_code_unit_24; // @[ECC.scala 81:55]
  wire [16:0] _write_data_code_T_98 = {_write_data_code_T_96,write_data_code_unit_24}; // @[Cat.scala 31:58]
  wire [15:0] write_data_code_unit_25 = io_write_bits_data[415:400]; // @[ICache.scala 296:28]
  wire  _write_data_code_T_100 = ^write_data_code_unit_25; // @[ECC.scala 81:55]
  wire [16:0] _write_data_code_T_102 = {_write_data_code_T_100,write_data_code_unit_25}; // @[Cat.scala 31:58]
  wire [15:0] write_data_code_unit_26 = io_write_bits_data[431:416]; // @[ICache.scala 296:28]
  wire  _write_data_code_T_104 = ^write_data_code_unit_26; // @[ECC.scala 81:55]
  wire [16:0] _write_data_code_T_106 = {_write_data_code_T_104,write_data_code_unit_26}; // @[Cat.scala 31:58]
  wire [15:0] write_data_code_unit_27 = io_write_bits_data[447:432]; // @[ICache.scala 296:28]
  wire  _write_data_code_T_108 = ^write_data_code_unit_27; // @[ECC.scala 81:55]
  wire [16:0] _write_data_code_T_110 = {_write_data_code_T_108,write_data_code_unit_27}; // @[Cat.scala 31:58]
  wire [15:0] write_data_code_unit_28 = io_write_bits_data[463:448]; // @[ICache.scala 296:28]
  wire  _write_data_code_T_112 = ^write_data_code_unit_28; // @[ECC.scala 81:55]
  wire [16:0] _write_data_code_T_114 = {_write_data_code_T_112,write_data_code_unit_28}; // @[Cat.scala 31:58]
  wire [15:0] write_data_code_unit_29 = io_write_bits_data[479:464]; // @[ICache.scala 296:28]
  wire  _write_data_code_T_116 = ^write_data_code_unit_29; // @[ECC.scala 81:55]
  wire [16:0] _write_data_code_T_118 = {_write_data_code_T_116,write_data_code_unit_29}; // @[Cat.scala 31:58]
  wire [15:0] write_data_code_unit_30 = io_write_bits_data[495:480]; // @[ICache.scala 296:28]
  wire  _write_data_code_T_120 = ^write_data_code_unit_30; // @[ECC.scala 81:55]
  wire [16:0] _write_data_code_T_122 = {_write_data_code_T_120,write_data_code_unit_30}; // @[Cat.scala 31:58]
  wire [15:0] write_data_code_unit_31 = io_write_bits_data[511:496]; // @[ICache.scala 296:28]
  wire  _write_data_code_T_124 = ^write_data_code_unit_31; // @[ECC.scala 81:55]
  wire [16:0] _write_data_code_T_126 = {_write_data_code_T_124,write_data_code_unit_31}; // @[Cat.scala 31:58]
  wire [7:0] write_data_code_lo_lo = {_write_data_code_T_30[16],_write_data_code_T_26[16],_write_data_code_T_22[16],
    _write_data_code_T_18[16],_write_data_code_T_14[16],_write_data_code_T_10[16],_write_data_code_T_6[16],
    _write_data_code_T_2[16]}; // @[ICache.scala 397:50]
  wire [15:0] write_data_code_lo = {_write_data_code_T_62[16],_write_data_code_T_58[16],_write_data_code_T_54[16],
    _write_data_code_T_50[16],_write_data_code_T_46[16],_write_data_code_T_42[16],_write_data_code_T_38[16],
    _write_data_code_T_34[16],write_data_code_lo_lo}; // @[ICache.scala 397:50]
  wire [7:0] write_data_code_hi_lo = {_write_data_code_T_94[16],_write_data_code_T_90[16],_write_data_code_T_86[16],
    _write_data_code_T_82[16],_write_data_code_T_78[16],_write_data_code_T_74[16],_write_data_code_T_70[16],
    _write_data_code_T_66[16]}; // @[ICache.scala 397:50]
  wire [15:0] write_data_code_hi = {_write_data_code_T_126[16],_write_data_code_T_122[16],_write_data_code_T_118[16],
    _write_data_code_T_114[16],_write_data_code_T_110[16],_write_data_code_T_106[16],_write_data_code_T_102[16],
    _write_data_code_T_98[16],write_data_code_hi_lo}; // @[ICache.scala 397:50]
  wire  _T_58 = io_cacheOp_req_bits_opCode == 64'h3; // @[CacheInstruction.scala 96:54]
  wire  _cacheOpShouldResp_T = dataArrays_0_io_read_req_0_ready & dataArrays_0_io_read_req_0_valid; // @[Decoupled.scala 50:35]
  wire  _cacheOpShouldResp_T_1 = dataArrays_0_io_read_req_1_ready & dataArrays_0_io_read_req_1_valid; // @[Decoupled.scala 50:35]
  wire [511:0] dataresp_0 = io_cacheOp_req_bits_bank_num[0] ? read_datas_1_0 : read_datas_0_0; // @[ICache.scala 424:21]
  wire [511:0] dataresp_1 = io_cacheOp_req_bits_bank_num[0] ? _read_datas_1_0_T[1023:512] : _read_datas_0_0_T[1023:512]; // @[ICache.scala 424:21]
  wire [511:0] dataresp_2 = io_cacheOp_req_bits_bank_num[0] ? read_datas_1_2 : read_datas_0_2; // @[ICache.scala 424:21]
  wire [511:0] dataresp_3 = io_cacheOp_req_bits_bank_num[0] ? _read_datas_1_2_T[1023:512] : _read_datas_0_2_T[1023:512]; // @[ICache.scala 424:21]
  wire [511:0] dataresp_4 = io_cacheOp_req_bits_bank_num[0] ? read_datas_1_4 : read_datas_0_4; // @[ICache.scala 424:21]
  wire [511:0] dataresp_5 = io_cacheOp_req_bits_bank_num[0] ? _read_datas_1_4_T[1023:512] : _read_datas_0_4_T[1023:512]; // @[ICache.scala 424:21]
  wire [511:0] dataresp_6 = io_cacheOp_req_bits_bank_num[0] ? read_datas_1_6 : read_datas_0_6; // @[ICache.scala 424:21]
  wire [511:0] dataresp_7 = io_cacheOp_req_bits_bank_num[0] ? _read_datas_1_6_T[1023:512] : _read_datas_0_6_T[1023:512]; // @[ICache.scala 424:21]
  wire  _GEN_4 = _T_58 ? ~io_cacheOp_req_bits_bank_num[0] : _dataArray_io_read_req_0_valid_T_5 & io_read_valid; // @[ICache.scala 324:36 415:6 418:36]
  wire [4:0] _GEN_5 = _T_58 ? io_cacheOp_req_bits_index[5:1] : bank_0_idx_vec_0[5:1]; // @[ICache.scala 415:6 420:26 325:40]
  wire  _GEN_6 = _T_58 ? io_cacheOp_req_bits_bank_num[0] : _dataArray_io_read_req_1_valid_T_3 & io_read_valid; // @[ICache.scala 326:36 415:6 419:36]
  wire [4:0] _GEN_7 = _T_58 ? io_cacheOp_req_bits_index[5:1] : bank_1_idx_vec_0[5:1]; // @[ICache.scala 415:6 420:26 327:40]
  wire  _GEN_8 = _T_58 ? ~io_cacheOp_req_bits_bank_num[0] : _dataArray_io_read_req_0_valid_T_12 & io_read_valid; // @[ICache.scala 324:36 415:6 418:36]
  wire [4:0] _GEN_9 = _T_58 ? io_cacheOp_req_bits_index[5:1] : bank_0_idx_vec_1[5:1]; // @[ICache.scala 415:6 420:26 325:40]
  wire  _GEN_10 = _T_58 ? io_cacheOp_req_bits_bank_num[0] : _dataArray_io_read_req_1_valid_T_8 & io_read_valid; // @[ICache.scala 326:36 415:6 419:36]
  wire [4:0] _GEN_11 = _T_58 ? io_cacheOp_req_bits_index[5:1] : bank_1_idx_vec_1[5:1]; // @[ICache.scala 415:6 420:26 327:40]
  wire  _GEN_12 = _T_58 ? ~io_cacheOp_req_bits_bank_num[0] : _dataArray_io_read_req_0_valid_T_19 & io_read_valid; // @[ICache.scala 324:36 415:6 418:36]
  wire [4:0] _GEN_13 = _T_58 ? io_cacheOp_req_bits_index[5:1] : bank_0_idx_vec_2[5:1]; // @[ICache.scala 415:6 420:26 325:40]
  wire  _GEN_14 = _T_58 ? io_cacheOp_req_bits_bank_num[0] : _dataArray_io_read_req_1_valid_T_13 & io_read_valid; // @[ICache.scala 326:36 415:6 419:36]
  wire [4:0] _GEN_15 = _T_58 ? io_cacheOp_req_bits_index[5:1] : bank_1_idx_vec_2[5:1]; // @[ICache.scala 415:6 420:26 327:40]
  wire  _GEN_16 = _T_58 ? ~io_cacheOp_req_bits_bank_num[0] : _dataArray_io_read_req_0_valid_T_26 & io_read_valid; // @[ICache.scala 324:36 415:6 418:36]
  wire [4:0] _GEN_17 = _T_58 ? io_cacheOp_req_bits_index[5:1] : bank_0_idx[5:1]; // @[ICache.scala 415:6 420:26 325:40]
  wire  _GEN_18 = _T_58 ? io_cacheOp_req_bits_bank_num[0] : _dataArray_io_read_req_1_valid_T_18 & io_read_valid; // @[ICache.scala 326:36 415:6 419:36]
  wire [4:0] _GEN_19 = _T_58 ? io_cacheOp_req_bits_index[5:1] : bank_1_idx[5:1]; // @[ICache.scala 415:6 420:26 327:40]
  wire  _GEN_20 = _T_58 & (_cacheOpShouldResp_T | _cacheOpShouldResp_T_1); // @[ICache.scala 415:6 423:25]
  wire  _T_62 = io_cacheOp_req_bits_opCode == 64'h7; // @[CacheInstruction.scala 100:54]
  wire [511:0] _dataArrays_0_io_write_bits_wdata_T = {io_cacheOp_req_bits_write_data_vec_7,
    io_cacheOp_req_bits_write_data_vec_6,io_cacheOp_req_bits_write_data_vec_5,io_cacheOp_req_bits_write_data_vec_4,
    io_cacheOp_req_bits_write_data_vec_3,io_cacheOp_req_bits_write_data_vec_2,io_cacheOp_req_bits_write_data_vec_1,
    io_cacheOp_req_bits_write_data_vec_0}; // @[ICache.scala 429:89]
  wire [31:0] _T_64 = 32'h1 << io_cacheOp_req_bits_wayNum[4:0]; // @[OneHot.scala 57:35]
  wire  _GEN_29 = _T_62 | io_write_valid; // @[ICache.scala 330:38 426:66 428:38]
  wire [511:0] _GEN_30 = _T_62 ? _dataArrays_0_io_write_bits_wdata_T : io_write_bits_data; // @[ICache.scala 331:38 426:66 429:43]
  wire  _GEN_31 = _T_62 ? io_cacheOp_req_bits_bank_num[0] : io_write_bits_bankIdx; // @[ICache.scala 333:38 426:66 430:46]
  wire [4:0] _GEN_32 = _T_62 ? io_cacheOp_req_bits_index[5:1] : io_write_bits_virIdx[5:1]; // @[ICache.scala 332:38 426:66 431:42]
  wire  _GEN_33 = _T_62 ? _T_64[0] : io_write_bits_waymask[0]; // @[ICache.scala 334:38 426:66 432:44]
  wire  _GEN_34 = _T_62 ? _T_64[1] : io_write_bits_waymask[1]; // @[ICache.scala 334:38 426:66 432:44]
  wire  _GEN_38 = _T_62 ? _T_64[2] : io_write_bits_waymask[2]; // @[ICache.scala 334:38 426:66 432:44]
  wire  _GEN_39 = _T_62 ? _T_64[3] : io_write_bits_waymask[3]; // @[ICache.scala 334:38 426:66 432:44]
  wire  _GEN_43 = _T_62 ? _T_64[4] : io_write_bits_waymask[4]; // @[ICache.scala 334:38 426:66 432:44]
  wire  _GEN_44 = _T_62 ? _T_64[5] : io_write_bits_waymask[5]; // @[ICache.scala 334:38 426:66 432:44]
  wire  _GEN_48 = _T_62 ? _T_64[6] : io_write_bits_waymask[6]; // @[ICache.scala 334:38 426:66 432:44]
  wire  _GEN_49 = _T_62 ? _T_64[7] : io_write_bits_waymask[7]; // @[ICache.scala 334:38 426:66 432:44]
  wire  _GEN_50 = _T_62 | _GEN_20; // @[ICache.scala 426:66 434:25]
  reg  io_cacheOp_resp_valid_REG; // @[ICache.scala 438:35]
  wire [511:0] _GEN_98 = 3'h1 == io_cacheOp_req_bits_wayNum[2:0] ? dataresp_1 : dataresp_0; // @[ICache.scala 442:{96,96}]
  wire [511:0] _GEN_99 = 3'h2 == io_cacheOp_req_bits_wayNum[2:0] ? dataresp_2 : _GEN_98; // @[ICache.scala 442:{96,96}]
  wire [511:0] _GEN_100 = 3'h3 == io_cacheOp_req_bits_wayNum[2:0] ? dataresp_3 : _GEN_99; // @[ICache.scala 442:{96,96}]
  wire [511:0] _GEN_101 = 3'h4 == io_cacheOp_req_bits_wayNum[2:0] ? dataresp_4 : _GEN_100; // @[ICache.scala 442:{96,96}]
  wire [511:0] _GEN_102 = 3'h5 == io_cacheOp_req_bits_wayNum[2:0] ? dataresp_5 : _GEN_101; // @[ICache.scala 442:{96,96}]
  wire [511:0] _GEN_103 = 3'h6 == io_cacheOp_req_bits_wayNum[2:0] ? dataresp_6 : _GEN_102; // @[ICache.scala 442:{96,96}]
  wire [511:0] _GEN_104 = 3'h7 == io_cacheOp_req_bits_wayNum[2:0] ? dataresp_7 : _GEN_103; // @[ICache.scala 442:{96,96}]
  ICachePartWayArray dataArrays_0 ( // @[ICache.scala 319:27]
    .clock(dataArrays_0_clock),
    .reset(dataArrays_0_reset),
    .io_read_req_0_ready(dataArrays_0_io_read_req_0_ready),
    .io_read_req_0_valid(dataArrays_0_io_read_req_0_valid),
    .io_read_req_0_bits_ridx(dataArrays_0_io_read_req_0_bits_ridx),
    .io_read_req_1_ready(dataArrays_0_io_read_req_1_ready),
    .io_read_req_1_valid(dataArrays_0_io_read_req_1_valid),
    .io_read_req_1_bits_ridx(dataArrays_0_io_read_req_1_bits_ridx),
    .io_read_resp_rdata_0_0(dataArrays_0_io_read_resp_rdata_0_0),
    .io_read_resp_rdata_0_1(dataArrays_0_io_read_resp_rdata_0_1),
    .io_read_resp_rdata_1_0(dataArrays_0_io_read_resp_rdata_1_0),
    .io_read_resp_rdata_1_1(dataArrays_0_io_read_resp_rdata_1_1),
    .io_write_valid(dataArrays_0_io_write_valid),
    .io_write_bits_wdata(dataArrays_0_io_write_bits_wdata),
    .io_write_bits_widx(dataArrays_0_io_write_bits_widx),
    .io_write_bits_wbankidx(dataArrays_0_io_write_bits_wbankidx),
    .io_write_bits_wmask_0(dataArrays_0_io_write_bits_wmask_0),
    .io_write_bits_wmask_1(dataArrays_0_io_write_bits_wmask_1)
  );
  ICachePartWayArray dataArrays_1 ( // @[ICache.scala 319:27]
    .clock(dataArrays_1_clock),
    .reset(dataArrays_1_reset),
    .io_read_req_0_ready(dataArrays_1_io_read_req_0_ready),
    .io_read_req_0_valid(dataArrays_1_io_read_req_0_valid),
    .io_read_req_0_bits_ridx(dataArrays_1_io_read_req_0_bits_ridx),
    .io_read_req_1_ready(dataArrays_1_io_read_req_1_ready),
    .io_read_req_1_valid(dataArrays_1_io_read_req_1_valid),
    .io_read_req_1_bits_ridx(dataArrays_1_io_read_req_1_bits_ridx),
    .io_read_resp_rdata_0_0(dataArrays_1_io_read_resp_rdata_0_0),
    .io_read_resp_rdata_0_1(dataArrays_1_io_read_resp_rdata_0_1),
    .io_read_resp_rdata_1_0(dataArrays_1_io_read_resp_rdata_1_0),
    .io_read_resp_rdata_1_1(dataArrays_1_io_read_resp_rdata_1_1),
    .io_write_valid(dataArrays_1_io_write_valid),
    .io_write_bits_wdata(dataArrays_1_io_write_bits_wdata),
    .io_write_bits_widx(dataArrays_1_io_write_bits_widx),
    .io_write_bits_wbankidx(dataArrays_1_io_write_bits_wbankidx),
    .io_write_bits_wmask_0(dataArrays_1_io_write_bits_wmask_0),
    .io_write_bits_wmask_1(dataArrays_1_io_write_bits_wmask_1)
  );
  ICachePartWayArray dataArrays_2 ( // @[ICache.scala 319:27]
    .clock(dataArrays_2_clock),
    .reset(dataArrays_2_reset),
    .io_read_req_0_ready(dataArrays_2_io_read_req_0_ready),
    .io_read_req_0_valid(dataArrays_2_io_read_req_0_valid),
    .io_read_req_0_bits_ridx(dataArrays_2_io_read_req_0_bits_ridx),
    .io_read_req_1_ready(dataArrays_2_io_read_req_1_ready),
    .io_read_req_1_valid(dataArrays_2_io_read_req_1_valid),
    .io_read_req_1_bits_ridx(dataArrays_2_io_read_req_1_bits_ridx),
    .io_read_resp_rdata_0_0(dataArrays_2_io_read_resp_rdata_0_0),
    .io_read_resp_rdata_0_1(dataArrays_2_io_read_resp_rdata_0_1),
    .io_read_resp_rdata_1_0(dataArrays_2_io_read_resp_rdata_1_0),
    .io_read_resp_rdata_1_1(dataArrays_2_io_read_resp_rdata_1_1),
    .io_write_valid(dataArrays_2_io_write_valid),
    .io_write_bits_wdata(dataArrays_2_io_write_bits_wdata),
    .io_write_bits_widx(dataArrays_2_io_write_bits_widx),
    .io_write_bits_wbankidx(dataArrays_2_io_write_bits_wbankidx),
    .io_write_bits_wmask_0(dataArrays_2_io_write_bits_wmask_0),
    .io_write_bits_wmask_1(dataArrays_2_io_write_bits_wmask_1)
  );
  ICachePartWayArray dataArrays_3 ( // @[ICache.scala 319:27]
    .clock(dataArrays_3_clock),
    .reset(dataArrays_3_reset),
    .io_read_req_0_ready(dataArrays_3_io_read_req_0_ready),
    .io_read_req_0_valid(dataArrays_3_io_read_req_0_valid),
    .io_read_req_0_bits_ridx(dataArrays_3_io_read_req_0_bits_ridx),
    .io_read_req_1_ready(dataArrays_3_io_read_req_1_ready),
    .io_read_req_1_valid(dataArrays_3_io_read_req_1_valid),
    .io_read_req_1_bits_ridx(dataArrays_3_io_read_req_1_bits_ridx),
    .io_read_resp_rdata_0_0(dataArrays_3_io_read_resp_rdata_0_0),
    .io_read_resp_rdata_0_1(dataArrays_3_io_read_resp_rdata_0_1),
    .io_read_resp_rdata_1_0(dataArrays_3_io_read_resp_rdata_1_0),
    .io_read_resp_rdata_1_1(dataArrays_3_io_read_resp_rdata_1_1),
    .io_write_valid(dataArrays_3_io_write_valid),
    .io_write_bits_wdata(dataArrays_3_io_write_bits_wdata),
    .io_write_bits_widx(dataArrays_3_io_write_bits_widx),
    .io_write_bits_wbankidx(dataArrays_3_io_write_bits_wbankidx),
    .io_write_bits_wmask_0(dataArrays_3_io_write_bits_wmask_0),
    .io_write_bits_wmask_1(dataArrays_3_io_write_bits_wmask_1)
  );
  SRAMTemplate_10 codeArrays_0 ( // @[ICache.scala 359:27]
    .clock(codeArrays_0_clock),
    .reset(codeArrays_0_reset),
    .io_rreq_ready(codeArrays_0_io_rreq_ready),
    .io_rreq_valid(codeArrays_0_io_rreq_valid),
    .io_rreq_bits_setIdx(codeArrays_0_io_rreq_bits_setIdx),
    .io_rresp_data_0(codeArrays_0_io_rresp_data_0),
    .io_rresp_data_1(codeArrays_0_io_rresp_data_1),
    .io_rresp_data_2(codeArrays_0_io_rresp_data_2),
    .io_rresp_data_3(codeArrays_0_io_rresp_data_3),
    .io_rresp_data_4(codeArrays_0_io_rresp_data_4),
    .io_rresp_data_5(codeArrays_0_io_rresp_data_5),
    .io_rresp_data_6(codeArrays_0_io_rresp_data_6),
    .io_rresp_data_7(codeArrays_0_io_rresp_data_7),
    .io_wreq_valid(codeArrays_0_io_wreq_valid),
    .io_wreq_bits_setIdx(codeArrays_0_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(codeArrays_0_io_wreq_bits_data_0),
    .io_wreq_bits_data_1(codeArrays_0_io_wreq_bits_data_1),
    .io_wreq_bits_data_2(codeArrays_0_io_wreq_bits_data_2),
    .io_wreq_bits_data_3(codeArrays_0_io_wreq_bits_data_3),
    .io_wreq_bits_data_4(codeArrays_0_io_wreq_bits_data_4),
    .io_wreq_bits_data_5(codeArrays_0_io_wreq_bits_data_5),
    .io_wreq_bits_data_6(codeArrays_0_io_wreq_bits_data_6),
    .io_wreq_bits_data_7(codeArrays_0_io_wreq_bits_data_7),
    .io_wreq_bits_waymask(codeArrays_0_io_wreq_bits_waymask)
  );
  SRAMTemplate_10 codeArrays_1 ( // @[ICache.scala 359:27]
    .clock(codeArrays_1_clock),
    .reset(codeArrays_1_reset),
    .io_rreq_ready(codeArrays_1_io_rreq_ready),
    .io_rreq_valid(codeArrays_1_io_rreq_valid),
    .io_rreq_bits_setIdx(codeArrays_1_io_rreq_bits_setIdx),
    .io_rresp_data_0(codeArrays_1_io_rresp_data_0),
    .io_rresp_data_1(codeArrays_1_io_rresp_data_1),
    .io_rresp_data_2(codeArrays_1_io_rresp_data_2),
    .io_rresp_data_3(codeArrays_1_io_rresp_data_3),
    .io_rresp_data_4(codeArrays_1_io_rresp_data_4),
    .io_rresp_data_5(codeArrays_1_io_rresp_data_5),
    .io_rresp_data_6(codeArrays_1_io_rresp_data_6),
    .io_rresp_data_7(codeArrays_1_io_rresp_data_7),
    .io_wreq_valid(codeArrays_1_io_wreq_valid),
    .io_wreq_bits_setIdx(codeArrays_1_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(codeArrays_1_io_wreq_bits_data_0),
    .io_wreq_bits_data_1(codeArrays_1_io_wreq_bits_data_1),
    .io_wreq_bits_data_2(codeArrays_1_io_wreq_bits_data_2),
    .io_wreq_bits_data_3(codeArrays_1_io_wreq_bits_data_3),
    .io_wreq_bits_data_4(codeArrays_1_io_wreq_bits_data_4),
    .io_wreq_bits_data_5(codeArrays_1_io_wreq_bits_data_5),
    .io_wreq_bits_data_6(codeArrays_1_io_wreq_bits_data_6),
    .io_wreq_bits_data_7(codeArrays_1_io_wreq_bits_data_7),
    .io_wreq_bits_waymask(codeArrays_1_io_wreq_bits_waymask)
  );
  assign io_read_ready = _io_read_ready_T_8 & _io_read_ready_T_9; // @[ICache.scala 385:90]
  assign io_readResp_datas_0_0 = port_0_read_1_reg ? read_datas_1_0 : read_datas_0_0; // @[ICache.scala 347:30]
  assign io_readResp_datas_0_1 = port_0_read_1_reg ? _read_datas_1_0_T[1023:512] : _read_datas_0_0_T[1023:512]; // @[ICache.scala 347:30]
  assign io_readResp_datas_0_2 = port_0_read_1_reg ? read_datas_1_2 : read_datas_0_2; // @[ICache.scala 347:30]
  assign io_readResp_datas_0_3 = port_0_read_1_reg ? _read_datas_1_2_T[1023:512] : _read_datas_0_2_T[1023:512]; // @[ICache.scala 347:30]
  assign io_readResp_datas_0_4 = port_0_read_1_reg ? read_datas_1_4 : read_datas_0_4; // @[ICache.scala 347:30]
  assign io_readResp_datas_0_5 = port_0_read_1_reg ? _read_datas_1_4_T[1023:512] : _read_datas_0_4_T[1023:512]; // @[ICache.scala 347:30]
  assign io_readResp_datas_0_6 = port_0_read_1_reg ? read_datas_1_6 : read_datas_0_6; // @[ICache.scala 347:30]
  assign io_readResp_datas_0_7 = port_0_read_1_reg ? _read_datas_1_6_T[1023:512] : _read_datas_0_6_T[1023:512]; // @[ICache.scala 347:30]
  assign io_readResp_datas_1_0 = port_1_read_0_reg ? read_datas_0_0 : read_datas_1_0; // @[ICache.scala 348:30]
  assign io_readResp_datas_1_1 = port_1_read_0_reg ? _read_datas_0_0_T[1023:512] : _read_datas_1_0_T[1023:512]; // @[ICache.scala 348:30]
  assign io_readResp_datas_1_2 = port_1_read_0_reg ? read_datas_0_2 : read_datas_1_2; // @[ICache.scala 348:30]
  assign io_readResp_datas_1_3 = port_1_read_0_reg ? _read_datas_0_2_T[1023:512] : _read_datas_1_2_T[1023:512]; // @[ICache.scala 348:30]
  assign io_readResp_datas_1_4 = port_1_read_0_reg ? read_datas_0_4 : read_datas_1_4; // @[ICache.scala 348:30]
  assign io_readResp_datas_1_5 = port_1_read_0_reg ? _read_datas_0_4_T[1023:512] : _read_datas_1_4_T[1023:512]; // @[ICache.scala 348:30]
  assign io_readResp_datas_1_6 = port_1_read_0_reg ? read_datas_0_6 : read_datas_1_6; // @[ICache.scala 348:30]
  assign io_readResp_datas_1_7 = port_1_read_0_reg ? _read_datas_0_6_T[1023:512] : _read_datas_1_6_T[1023:512]; // @[ICache.scala 348:30]
  assign io_readResp_codes_0_0 = port_0_read_1_reg ? read_codes_1_0 : read_codes_0_0; // @[ICache.scala 400:30]
  assign io_readResp_codes_0_1 = port_0_read_1_reg ? read_codes_1_1 : read_codes_0_1; // @[ICache.scala 400:30]
  assign io_readResp_codes_0_2 = port_0_read_1_reg ? read_codes_1_2 : read_codes_0_2; // @[ICache.scala 400:30]
  assign io_readResp_codes_0_3 = port_0_read_1_reg ? read_codes_1_3 : read_codes_0_3; // @[ICache.scala 400:30]
  assign io_readResp_codes_0_4 = port_0_read_1_reg ? read_codes_1_4 : read_codes_0_4; // @[ICache.scala 400:30]
  assign io_readResp_codes_0_5 = port_0_read_1_reg ? read_codes_1_5 : read_codes_0_5; // @[ICache.scala 400:30]
  assign io_readResp_codes_0_6 = port_0_read_1_reg ? read_codes_1_6 : read_codes_0_6; // @[ICache.scala 400:30]
  assign io_readResp_codes_0_7 = port_0_read_1_reg ? read_codes_1_7 : read_codes_0_7; // @[ICache.scala 400:30]
  assign io_readResp_codes_1_0 = port_1_read_0_reg ? read_codes_0_0 : read_codes_1_0; // @[ICache.scala 401:30]
  assign io_readResp_codes_1_1 = port_1_read_0_reg ? read_codes_0_1 : read_codes_1_1; // @[ICache.scala 401:30]
  assign io_readResp_codes_1_2 = port_1_read_0_reg ? read_codes_0_2 : read_codes_1_2; // @[ICache.scala 401:30]
  assign io_readResp_codes_1_3 = port_1_read_0_reg ? read_codes_0_3 : read_codes_1_3; // @[ICache.scala 401:30]
  assign io_readResp_codes_1_4 = port_1_read_0_reg ? read_codes_0_4 : read_codes_1_4; // @[ICache.scala 401:30]
  assign io_readResp_codes_1_5 = port_1_read_0_reg ? read_codes_0_5 : read_codes_1_5; // @[ICache.scala 401:30]
  assign io_readResp_codes_1_6 = port_1_read_0_reg ? read_codes_0_6 : read_codes_1_6; // @[ICache.scala 401:30]
  assign io_readResp_codes_1_7 = port_1_read_0_reg ? read_codes_0_7 : read_codes_1_7; // @[ICache.scala 401:30]
  assign io_cacheOp_resp_valid = io_cacheOp_resp_valid_REG; // @[ICache.scala 438:25]
  assign io_cacheOp_resp_bits_read_data_vec_0 = _GEN_104[63:0]; // @[ICache.scala 442:96]
  assign io_cacheOp_resp_bits_read_data_vec_1 = _GEN_104[127:64]; // @[ICache.scala 442:96]
  assign io_cacheOp_resp_bits_read_data_vec_2 = _GEN_104[191:128]; // @[ICache.scala 442:96]
  assign io_cacheOp_resp_bits_read_data_vec_3 = _GEN_104[255:192]; // @[ICache.scala 442:96]
  assign io_cacheOp_resp_bits_read_data_vec_4 = _GEN_104[319:256]; // @[ICache.scala 442:96]
  assign io_cacheOp_resp_bits_read_data_vec_5 = _GEN_104[383:320]; // @[ICache.scala 442:96]
  assign io_cacheOp_resp_bits_read_data_vec_6 = _GEN_104[447:384]; // @[ICache.scala 442:96]
  assign io_cacheOp_resp_bits_read_data_vec_7 = _GEN_104[511:448]; // @[ICache.scala 442:96]
  assign dataArrays_0_clock = clock;
  assign dataArrays_0_reset = reset;
  assign dataArrays_0_io_read_req_0_valid = io_cacheOp_req_valid ? _GEN_4 : _dataArray_io_read_req_0_valid_T_5 &
    io_read_valid; // @[ICache.scala 412:29 324:36]
  assign dataArrays_0_io_read_req_0_bits_ridx = io_cacheOp_req_valid ? _GEN_5 : bank_0_idx_vec_0[5:1]; // @[ICache.scala 412:29 325:40]
  assign dataArrays_0_io_read_req_1_valid = io_cacheOp_req_valid ? _GEN_6 : _dataArray_io_read_req_1_valid_T_3 &
    io_read_valid; // @[ICache.scala 412:29 326:36]
  assign dataArrays_0_io_read_req_1_bits_ridx = io_cacheOp_req_valid ? _GEN_7 : bank_1_idx_vec_0[5:1]; // @[ICache.scala 412:29 327:40]
  assign dataArrays_0_io_write_valid = io_cacheOp_req_valid ? _GEN_29 : io_write_valid; // @[ICache.scala 412:29 330:38]
  assign dataArrays_0_io_write_bits_wdata = io_cacheOp_req_valid ? _GEN_30 : io_write_bits_data; // @[ICache.scala 412:29 331:38]
  assign dataArrays_0_io_write_bits_widx = io_cacheOp_req_valid ? _GEN_32 : io_write_bits_virIdx[5:1]; // @[ICache.scala 412:29 332:38]
  assign dataArrays_0_io_write_bits_wbankidx = io_cacheOp_req_valid ? _GEN_31 : io_write_bits_bankIdx; // @[ICache.scala 412:29 333:38]
  assign dataArrays_0_io_write_bits_wmask_0 = io_cacheOp_req_valid ? _GEN_33 : io_write_bits_waymask[0]; // @[ICache.scala 412:29 334:38]
  assign dataArrays_0_io_write_bits_wmask_1 = io_cacheOp_req_valid ? _GEN_34 : io_write_bits_waymask[1]; // @[ICache.scala 412:29 334:38]
  assign dataArrays_1_clock = clock;
  assign dataArrays_1_reset = reset;
  assign dataArrays_1_io_read_req_0_valid = io_cacheOp_req_valid ? _GEN_8 : _dataArray_io_read_req_0_valid_T_12 &
    io_read_valid; // @[ICache.scala 412:29 324:36]
  assign dataArrays_1_io_read_req_0_bits_ridx = io_cacheOp_req_valid ? _GEN_9 : bank_0_idx_vec_1[5:1]; // @[ICache.scala 412:29 325:40]
  assign dataArrays_1_io_read_req_1_valid = io_cacheOp_req_valid ? _GEN_10 : _dataArray_io_read_req_1_valid_T_8 &
    io_read_valid; // @[ICache.scala 412:29 326:36]
  assign dataArrays_1_io_read_req_1_bits_ridx = io_cacheOp_req_valid ? _GEN_11 : bank_1_idx_vec_1[5:1]; // @[ICache.scala 412:29 327:40]
  assign dataArrays_1_io_write_valid = io_cacheOp_req_valid ? _GEN_29 : io_write_valid; // @[ICache.scala 412:29 330:38]
  assign dataArrays_1_io_write_bits_wdata = io_cacheOp_req_valid ? _GEN_30 : io_write_bits_data; // @[ICache.scala 412:29 331:38]
  assign dataArrays_1_io_write_bits_widx = io_cacheOp_req_valid ? _GEN_32 : io_write_bits_virIdx[5:1]; // @[ICache.scala 412:29 332:38]
  assign dataArrays_1_io_write_bits_wbankidx = io_cacheOp_req_valid ? _GEN_31 : io_write_bits_bankIdx; // @[ICache.scala 412:29 333:38]
  assign dataArrays_1_io_write_bits_wmask_0 = io_cacheOp_req_valid ? _GEN_38 : io_write_bits_waymask[2]; // @[ICache.scala 412:29 334:38]
  assign dataArrays_1_io_write_bits_wmask_1 = io_cacheOp_req_valid ? _GEN_39 : io_write_bits_waymask[3]; // @[ICache.scala 412:29 334:38]
  assign dataArrays_2_clock = clock;
  assign dataArrays_2_reset = reset;
  assign dataArrays_2_io_read_req_0_valid = io_cacheOp_req_valid ? _GEN_12 : _dataArray_io_read_req_0_valid_T_19 &
    io_read_valid; // @[ICache.scala 412:29 324:36]
  assign dataArrays_2_io_read_req_0_bits_ridx = io_cacheOp_req_valid ? _GEN_13 : bank_0_idx_vec_2[5:1]; // @[ICache.scala 412:29 325:40]
  assign dataArrays_2_io_read_req_1_valid = io_cacheOp_req_valid ? _GEN_14 : _dataArray_io_read_req_1_valid_T_13 &
    io_read_valid; // @[ICache.scala 412:29 326:36]
  assign dataArrays_2_io_read_req_1_bits_ridx = io_cacheOp_req_valid ? _GEN_15 : bank_1_idx_vec_2[5:1]; // @[ICache.scala 412:29 327:40]
  assign dataArrays_2_io_write_valid = io_cacheOp_req_valid ? _GEN_29 : io_write_valid; // @[ICache.scala 412:29 330:38]
  assign dataArrays_2_io_write_bits_wdata = io_cacheOp_req_valid ? _GEN_30 : io_write_bits_data; // @[ICache.scala 412:29 331:38]
  assign dataArrays_2_io_write_bits_widx = io_cacheOp_req_valid ? _GEN_32 : io_write_bits_virIdx[5:1]; // @[ICache.scala 412:29 332:38]
  assign dataArrays_2_io_write_bits_wbankidx = io_cacheOp_req_valid ? _GEN_31 : io_write_bits_bankIdx; // @[ICache.scala 412:29 333:38]
  assign dataArrays_2_io_write_bits_wmask_0 = io_cacheOp_req_valid ? _GEN_43 : io_write_bits_waymask[4]; // @[ICache.scala 412:29 334:38]
  assign dataArrays_2_io_write_bits_wmask_1 = io_cacheOp_req_valid ? _GEN_44 : io_write_bits_waymask[5]; // @[ICache.scala 412:29 334:38]
  assign dataArrays_3_clock = clock;
  assign dataArrays_3_reset = reset;
  assign dataArrays_3_io_read_req_0_valid = io_cacheOp_req_valid ? _GEN_16 : _dataArray_io_read_req_0_valid_T_26 &
    io_read_valid; // @[ICache.scala 412:29 324:36]
  assign dataArrays_3_io_read_req_0_bits_ridx = io_cacheOp_req_valid ? _GEN_17 : bank_0_idx[5:1]; // @[ICache.scala 412:29 325:40]
  assign dataArrays_3_io_read_req_1_valid = io_cacheOp_req_valid ? _GEN_18 : _dataArray_io_read_req_1_valid_T_18 &
    io_read_valid; // @[ICache.scala 412:29 326:36]
  assign dataArrays_3_io_read_req_1_bits_ridx = io_cacheOp_req_valid ? _GEN_19 : bank_1_idx[5:1]; // @[ICache.scala 412:29 327:40]
  assign dataArrays_3_io_write_valid = io_cacheOp_req_valid ? _GEN_29 : io_write_valid; // @[ICache.scala 412:29 330:38]
  assign dataArrays_3_io_write_bits_wdata = io_cacheOp_req_valid ? _GEN_30 : io_write_bits_data; // @[ICache.scala 412:29 331:38]
  assign dataArrays_3_io_write_bits_widx = io_cacheOp_req_valid ? _GEN_32 : io_write_bits_virIdx[5:1]; // @[ICache.scala 412:29 332:38]
  assign dataArrays_3_io_write_bits_wbankidx = io_cacheOp_req_valid ? _GEN_31 : io_write_bits_bankIdx; // @[ICache.scala 412:29 333:38]
  assign dataArrays_3_io_write_bits_wmask_0 = io_cacheOp_req_valid ? _GEN_48 : io_write_bits_waymask[6]; // @[ICache.scala 412:29 334:38]
  assign dataArrays_3_io_write_bits_wmask_1 = io_cacheOp_req_valid ? _GEN_49 : io_write_bits_waymask[7]; // @[ICache.scala 412:29 334:38]
  assign codeArrays_0_clock = clock;
  assign codeArrays_0_reset = reset;
  assign codeArrays_0_io_rreq_valid = io_read_valid & _dataArray_io_read_req_0_valid_T_26; // @[ICache.scala 369:49]
  assign codeArrays_0_io_rreq_bits_setIdx = bank_0_idx[5:1]; // @[ICache.scala 370:54]
  assign codeArrays_0_io_wreq_valid = io_write_valid & ~io_write_bits_bankIdx; // @[ICache.scala 352:46]
  assign codeArrays_0_io_wreq_bits_setIdx = io_write_bits_virIdx[5:1]; // @[ICache.scala 372:86]
  assign codeArrays_0_io_wreq_bits_data_0 = {write_data_code_hi,write_data_code_lo}; // @[ICache.scala 397:50]
  assign codeArrays_0_io_wreq_bits_data_1 = {write_data_code_hi,write_data_code_lo}; // @[ICache.scala 397:50]
  assign codeArrays_0_io_wreq_bits_data_2 = {write_data_code_hi,write_data_code_lo}; // @[ICache.scala 397:50]
  assign codeArrays_0_io_wreq_bits_data_3 = {write_data_code_hi,write_data_code_lo}; // @[ICache.scala 397:50]
  assign codeArrays_0_io_wreq_bits_data_4 = {write_data_code_hi,write_data_code_lo}; // @[ICache.scala 397:50]
  assign codeArrays_0_io_wreq_bits_data_5 = {write_data_code_hi,write_data_code_lo}; // @[ICache.scala 397:50]
  assign codeArrays_0_io_wreq_bits_data_6 = {write_data_code_hi,write_data_code_lo}; // @[ICache.scala 397:50]
  assign codeArrays_0_io_wreq_bits_data_7 = {write_data_code_hi,write_data_code_lo}; // @[ICache.scala 397:50]
  assign codeArrays_0_io_wreq_bits_waymask = io_write_bits_waymask; // @[SRAMTemplate.scala 54:24]
  assign codeArrays_1_clock = clock;
  assign codeArrays_1_reset = reset;
  assign codeArrays_1_io_rreq_valid = io_read_valid & _dataArray_io_read_req_1_valid_T_18; // @[ICache.scala 375:49]
  assign codeArrays_1_io_rreq_bits_setIdx = bank_1_idx[5:1]; // @[ICache.scala 376:54]
  assign codeArrays_1_io_wreq_valid = io_write_valid & io_write_bits_bankIdx; // @[ICache.scala 353:46]
  assign codeArrays_1_io_wreq_bits_setIdx = io_write_bits_virIdx[5:1]; // @[ICache.scala 378:86]
  assign codeArrays_1_io_wreq_bits_data_0 = {write_data_code_hi,write_data_code_lo}; // @[ICache.scala 397:50]
  assign codeArrays_1_io_wreq_bits_data_1 = {write_data_code_hi,write_data_code_lo}; // @[ICache.scala 397:50]
  assign codeArrays_1_io_wreq_bits_data_2 = {write_data_code_hi,write_data_code_lo}; // @[ICache.scala 397:50]
  assign codeArrays_1_io_wreq_bits_data_3 = {write_data_code_hi,write_data_code_lo}; // @[ICache.scala 397:50]
  assign codeArrays_1_io_wreq_bits_data_4 = {write_data_code_hi,write_data_code_lo}; // @[ICache.scala 397:50]
  assign codeArrays_1_io_wreq_bits_data_5 = {write_data_code_hi,write_data_code_lo}; // @[ICache.scala 397:50]
  assign codeArrays_1_io_wreq_bits_data_6 = {write_data_code_hi,write_data_code_lo}; // @[ICache.scala 397:50]
  assign codeArrays_1_io_wreq_bits_data_7 = {write_data_code_hi,write_data_code_lo}; // @[ICache.scala 397:50]
  assign codeArrays_1_io_wreq_bits_waymask = io_write_bits_waymask; // @[SRAMTemplate.scala 54:24]
  always @(posedge clock) begin
    if (_port_0_read_0_reg_T_3) begin // @[Reg.scala 17:18]
      port_0_read_1_reg <= _port_0_read_1_reg_T_1; // @[Reg.scala 17:22]
    end
    if (_port_0_read_0_reg_T_3) begin // @[Reg.scala 17:18]
      port_1_read_0_reg <= _port_1_read_0_reg_T_3; // @[Reg.scala 17:22]
    end
    io_cacheOp_resp_valid_REG <= io_cacheOp_req_valid & _GEN_50; // @[ICache.scala 412:29]
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
  port_0_read_1_reg = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  port_1_read_0_reg = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  io_cacheOp_resp_valid_REG = _RAND_2[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

