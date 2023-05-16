module DelayN_42(
  input  [2:0] io_in,
  output [2:0] io_out
);
  assign io_out = io_in; // @[Hold.scala 92:10]
endmodule

