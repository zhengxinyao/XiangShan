module StoreUnit_S3(
  input         io_in_valid,
  input         io_in_bits_uop_cf_exceptionVec_6,
  input         io_in_bits_uop_cf_exceptionVec_7,
  input         io_in_bits_uop_cf_exceptionVec_15,
  input         io_in_bits_uop_cf_trigger_backendEn_0,
  input         io_in_bits_uop_robIdx_flag,
  input  [4:0]  io_in_bits_uop_robIdx_value,
  input  [38:0] io_in_bits_vaddr,
  input         io_in_bits_mmio,
  output        io_stout_valid,
  output        io_stout_bits_uop_cf_exceptionVec_6,
  output        io_stout_bits_uop_cf_exceptionVec_7,
  output        io_stout_bits_uop_cf_exceptionVec_15,
  output        io_stout_bits_uop_cf_trigger_backendEn_0,
  output        io_stout_bits_uop_robIdx_flag,
  output [4:0]  io_stout_bits_uop_robIdx_value,
  output        io_stout_bits_debug_isMMIO,
  output [38:0] io_stout_bits_debug_vaddr
);
  assign io_stout_valid = io_in_valid; // @[StoreUnit.scala 217:18]
  assign io_stout_bits_uop_cf_exceptionVec_6 = io_in_bits_uop_cf_exceptionVec_6; // @[StoreUnit.scala 218:21]
  assign io_stout_bits_uop_cf_exceptionVec_7 = io_in_bits_uop_cf_exceptionVec_7; // @[StoreUnit.scala 218:21]
  assign io_stout_bits_uop_cf_exceptionVec_15 = io_in_bits_uop_cf_exceptionVec_15; // @[StoreUnit.scala 218:21]
  assign io_stout_bits_uop_cf_trigger_backendEn_0 = io_in_bits_uop_cf_trigger_backendEn_0; // @[StoreUnit.scala 218:21]
  assign io_stout_bits_uop_robIdx_flag = io_in_bits_uop_robIdx_flag; // @[StoreUnit.scala 218:21]
  assign io_stout_bits_uop_robIdx_value = io_in_bits_uop_robIdx_value; // @[StoreUnit.scala 218:21]
  assign io_stout_bits_debug_isMMIO = io_in_bits_mmio; // @[StoreUnit.scala 222:30]
  assign io_stout_bits_debug_vaddr = io_in_bits_vaddr; // @[StoreUnit.scala 224:29]
endmodule

