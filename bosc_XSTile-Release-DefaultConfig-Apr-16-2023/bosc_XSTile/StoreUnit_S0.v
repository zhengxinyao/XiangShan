module StoreUnit_S0(
  input         io_in_valid,
  input         io_in_bits_uop_cf_trigger_backendEn_0,
  input         io_in_bits_uop_cf_storeSetHit,
  input  [4:0]  io_in_bits_uop_cf_ssid,
  input  [2:0]  io_in_bits_uop_cf_ftqPtr_value,
  input  [2:0]  io_in_bits_uop_cf_ftqOffset,
  input  [6:0]  io_in_bits_uop_ctrl_fuOpType,
  input  [19:0] io_in_bits_uop_ctrl_imm,
  input         io_in_bits_uop_robIdx_flag,
  input  [4:0]  io_in_bits_uop_robIdx_value,
  input         io_in_bits_uop_sqIdx_flag,
  input  [3:0]  io_in_bits_uop_sqIdx_value,
  input  [63:0] io_in_bits_src_0,
  input  [3:0]  io_rsIdx,
  output        io_out_valid,
  output        io_out_bits_uop_cf_exceptionVec_6,
  output        io_out_bits_uop_cf_trigger_backendEn_0,
  output [2:0]  io_out_bits_uop_cf_ftqPtr_value,
  output [2:0]  io_out_bits_uop_cf_ftqOffset,
  output [6:0]  io_out_bits_uop_ctrl_fuOpType,
  output        io_out_bits_uop_robIdx_flag,
  output [4:0]  io_out_bits_uop_robIdx_value,
  output        io_out_bits_uop_sqIdx_flag,
  output [3:0]  io_out_bits_uop_sqIdx_value,
  output [38:0] io_out_bits_vaddr,
  output [15:0] io_out_bits_mask,
  output        io_out_bits_wlineflag,
  output [3:0]  io_out_bits_rsIdx,
  output        io_dtlbReq_valid,
  output [38:0] io_dtlbReq_bits_vaddr
);
  wire [11:0] imm12 = io_in_bits_uop_ctrl_imm[11:0]; // @[StoreUnit.scala 43:47]
  wire [12:0] _saddr_lo_T_1 = {1'h0,imm12}; // @[Cat.scala 31:58]
  wire [12:0] _GEN_1 = {{1'd0}, io_in_bits_src_0[11:0]}; // @[StoreUnit.scala 44:42]
  wire [12:0] saddr_lo = _GEN_1 + _saddr_lo_T_1; // @[StoreUnit.scala 44:42]
  wire [26:0] _saddr_hi_T_5 = io_in_bits_src_0[38:12] + 27'h1; // @[StoreUnit.scala 46:90]
  wire [26:0] _saddr_hi_T_6 = imm12[11] ? io_in_bits_src_0[38:12] : _saddr_hi_T_5; // @[StoreUnit.scala 46:8]
  wire [26:0] _saddr_hi_T_12 = io_in_bits_src_0[38:12] + 27'h7ffffff; // @[StoreUnit.scala 47:54]
  wire [26:0] _saddr_hi_T_14 = imm12[11] ? _saddr_hi_T_12 : io_in_bits_src_0[38:12]; // @[StoreUnit.scala 47:8]
  wire [26:0] saddr_hi = saddr_lo[12] ? _saddr_hi_T_6 : _saddr_hi_T_14; // @[StoreUnit.scala 45:21]
  wire  _io_out_bits_mask_T_1 = 2'h0 == io_in_bits_uop_ctrl_fuOpType[1:0]; // @[LookupTree.scala 24:34]
  wire  _io_out_bits_mask_T_2 = 2'h1 == io_in_bits_uop_ctrl_fuOpType[1:0]; // @[LookupTree.scala 24:34]
  wire  _io_out_bits_mask_T_3 = 2'h2 == io_in_bits_uop_ctrl_fuOpType[1:0]; // @[LookupTree.scala 24:34]
  wire  _io_out_bits_mask_T_4 = 2'h3 == io_in_bits_uop_ctrl_fuOpType[1:0]; // @[LookupTree.scala 24:34]
  wire [1:0] _io_out_bits_mask_T_6 = _io_out_bits_mask_T_2 ? 2'h3 : 2'h0; // @[Mux.scala 27:73]
  wire [3:0] _io_out_bits_mask_T_7 = _io_out_bits_mask_T_3 ? 4'hf : 4'h0; // @[Mux.scala 27:73]
  wire [7:0] _io_out_bits_mask_T_8 = _io_out_bits_mask_T_4 ? 8'hff : 8'h0; // @[Mux.scala 27:73]
  wire [1:0] _GEN_2 = {{1'd0}, _io_out_bits_mask_T_1}; // @[Mux.scala 27:73]
  wire [1:0] _io_out_bits_mask_T_9 = _GEN_2 | _io_out_bits_mask_T_6; // @[Mux.scala 27:73]
  wire [3:0] _GEN_3 = {{2'd0}, _io_out_bits_mask_T_9}; // @[Mux.scala 27:73]
  wire [3:0] _io_out_bits_mask_T_10 = _GEN_3 | _io_out_bits_mask_T_7; // @[Mux.scala 27:73]
  wire [7:0] _GEN_4 = {{4'd0}, _io_out_bits_mask_T_10}; // @[Mux.scala 27:73]
  wire [7:0] _io_out_bits_mask_T_11 = _GEN_4 | _io_out_bits_mask_T_8; // @[Mux.scala 27:73]
  wire [22:0] _GEN_0 = {{15'd0}, _io_out_bits_mask_T_11}; // @[MemCommon.scala 49:8]
  wire [22:0] _io_out_bits_mask_T_13 = _GEN_0 << io_out_bits_vaddr[3:0]; // @[MemCommon.scala 49:8]
  wire  _addrAligned_T_2 = ~io_out_bits_vaddr[0]; // @[StoreUnit.scala 88:40]
  wire  _addrAligned_T_4 = io_out_bits_vaddr[1:0] == 2'h0; // @[StoreUnit.scala 89:42]
  wire  _addrAligned_T_6 = io_out_bits_vaddr[2:0] == 3'h0; // @[StoreUnit.scala 90:42]
  wire  addrAligned = _io_out_bits_mask_T_1 | _io_out_bits_mask_T_2 & _addrAligned_T_2 | _io_out_bits_mask_T_3 &
    _addrAligned_T_4 | _io_out_bits_mask_T_4 & _addrAligned_T_6; // @[Mux.scala 27:73]
  assign io_out_valid = io_in_valid; // @[StoreUnit.scala 79:16]
  assign io_out_bits_uop_cf_exceptionVec_6 = ~addrAligned; // @[StoreUnit.scala 93:59]
  assign io_out_bits_uop_cf_trigger_backendEn_0 = io_in_bits_uop_cf_trigger_backendEn_0; // @[StoreUnit.scala 70:19]
  assign io_out_bits_uop_cf_ftqPtr_value = io_in_bits_uop_cf_ftqPtr_value; // @[StoreUnit.scala 70:19]
  assign io_out_bits_uop_cf_ftqOffset = io_in_bits_uop_cf_ftqOffset; // @[StoreUnit.scala 70:19]
  assign io_out_bits_uop_ctrl_fuOpType = io_in_bits_uop_ctrl_fuOpType; // @[StoreUnit.scala 70:19]
  assign io_out_bits_uop_robIdx_flag = io_in_bits_uop_robIdx_flag; // @[StoreUnit.scala 70:19]
  assign io_out_bits_uop_robIdx_value = io_in_bits_uop_robIdx_value; // @[StoreUnit.scala 70:19]
  assign io_out_bits_uop_sqIdx_flag = io_in_bits_uop_sqIdx_flag; // @[StoreUnit.scala 70:19]
  assign io_out_bits_uop_sqIdx_value = io_in_bits_uop_sqIdx_value; // @[StoreUnit.scala 70:19]
  assign io_out_bits_vaddr = {saddr_hi,saddr_lo[11:0]}; // @[Cat.scala 31:58]
  assign io_out_bits_mask = _io_out_bits_mask_T_13[15:0]; // @[StoreUnit.scala 76:20]
  assign io_out_bits_wlineflag = io_in_bits_uop_ctrl_fuOpType == 7'h7; // @[StoreUnit.scala 78:57]
  assign io_out_bits_rsIdx = io_rsIdx; // @[StoreUnit.scala 72:21]
  assign io_dtlbReq_valid = io_in_valid; // @[StoreUnit.scala 52:20]
  assign io_dtlbReq_bits_vaddr = {saddr_hi,saddr_lo[11:0]}; // @[Cat.scala 31:58]
endmodule

