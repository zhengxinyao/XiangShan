module StoreUnit_S2(
  input         io_in_valid,
  input         io_in_bits_uop_cf_exceptionVec_6,
  input         io_in_bits_uop_cf_exceptionVec_7,
  input         io_in_bits_uop_cf_exceptionVec_15,
  input         io_in_bits_uop_cf_trigger_backendEn_0,
  input         io_in_bits_uop_robIdx_flag,
  input  [4:0]  io_in_bits_uop_robIdx_value,
  input  [38:0] io_in_bits_vaddr,
  input         io_in_bits_mmio,
  input         io_in_bits_atomic,
  input         io_pmpResp_st,
  input         io_pmpResp_mmio,
  input         io_pmpResp_atomic,
  input         io_static_pm_valid,
  input         io_static_pm_bits,
  output        io_out_valid,
  output        io_out_bits_uop_cf_exceptionVec_6,
  output        io_out_bits_uop_cf_exceptionVec_7,
  output        io_out_bits_uop_cf_exceptionVec_15,
  output        io_out_bits_uop_cf_trigger_backendEn_0,
  output        io_out_bits_uop_robIdx_flag,
  output [4:0]  io_out_bits_uop_robIdx_value,
  output [38:0] io_out_bits_vaddr,
  output        io_out_bits_mmio,
  output        io_out_bits_atomic
);
  wire  pmp_st = io_static_pm_valid ? 1'h0 : io_pmpResp_st; // @[StoreUnit.scala 191:29 193:12]
  wire  pmp_mmio = io_static_pm_valid ? io_static_pm_bits : io_pmpResp_mmio; // @[StoreUnit.scala 191:29 195:14]
  wire [15:0] _s2_exception_T = {io_out_bits_uop_cf_exceptionVec_15,1'h0,2'h0,4'h0,io_out_bits_uop_cf_exceptionVec_7,
    io_out_bits_uop_cf_exceptionVec_6,2'h0,4'h0}; // @[StoreUnit.scala 198:86]
  wire  s2_exception = |_s2_exception_T; // @[StoreUnit.scala 198:93]
  wire  is_mmio = io_in_bits_mmio | pmp_mmio; // @[StoreUnit.scala 199:33]
  assign io_out_valid = io_in_valid & (~is_mmio | s2_exception); // @[StoreUnit.scala 206:31]
  assign io_out_bits_uop_cf_exceptionVec_6 = io_in_bits_uop_cf_exceptionVec_6; // @[StoreUnit.scala 202:15]
  assign io_out_bits_uop_cf_exceptionVec_7 = io_in_bits_uop_cf_exceptionVec_7 | pmp_st; // @[StoreUnit.scala 205:105]
  assign io_out_bits_uop_cf_exceptionVec_15 = io_in_bits_uop_cf_exceptionVec_15; // @[StoreUnit.scala 202:15]
  assign io_out_bits_uop_cf_trigger_backendEn_0 = io_in_bits_uop_cf_trigger_backendEn_0; // @[StoreUnit.scala 202:15]
  assign io_out_bits_uop_robIdx_flag = io_in_bits_uop_robIdx_flag; // @[StoreUnit.scala 202:15]
  assign io_out_bits_uop_robIdx_value = io_in_bits_uop_robIdx_value; // @[StoreUnit.scala 202:15]
  assign io_out_bits_vaddr = io_in_bits_vaddr; // @[StoreUnit.scala 202:15]
  assign io_out_bits_mmio = is_mmio & ~s2_exception; // @[StoreUnit.scala 203:31]
  assign io_out_bits_atomic = io_in_bits_atomic | io_pmpResp_atomic; // @[StoreUnit.scala 204:43]
endmodule

