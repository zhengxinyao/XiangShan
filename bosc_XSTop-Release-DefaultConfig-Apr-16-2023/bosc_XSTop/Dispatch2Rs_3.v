module Dispatch2Rs_3(
  output       io_in_0_ready,
  output       io_in_1_ready,
  input  [3:0] io_in_1_bits_ctrl_fuType,
  input        io_out_0_ready,
  input        io_out_1_ready
);
  wire  _thisCanAccept_T_1 = |(4'h6 == io_in_1_bits_ctrl_fuType); // @[Exu.scala 108:45]
  wire  _thisCanAccept_T_2 = 4'h4 == io_in_1_bits_ctrl_fuType; // @[Exu.scala 108:32]
  wire  _thisCanAccept_T_3 = 4'h5 == io_in_1_bits_ctrl_fuType; // @[Exu.scala 108:32]
  wire  _thisCanAccept_T_4 = 4'h7 == io_in_1_bits_ctrl_fuType; // @[Exu.scala 108:32]
  wire [2:0] _thisCanAccept_T_5 = {_thisCanAccept_T_2,_thisCanAccept_T_3,_thisCanAccept_T_4}; // @[Cat.scala 31:58]
  wire  _thisCanAccept_T_6 = |_thisCanAccept_T_5; // @[Exu.scala 108:45]
  wire  thisCanAccept = _thisCanAccept_T_1 | _thisCanAccept_T_6; // @[Dispatch2Rs.scala 126:87]
  assign io_in_0_ready = io_out_0_ready; // @[Dispatch2Rs.scala 122:15 135:31 136:17]
  assign io_in_1_ready = io_out_1_ready & thisCanAccept; // @[Dispatch2Rs.scala 128:41]
endmodule

