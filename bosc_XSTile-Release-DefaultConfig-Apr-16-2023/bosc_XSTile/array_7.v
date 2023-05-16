module array_7(
  input  [6:0]  RW0_addr,
  input         RW0_en,
  input         RW0_clk,
  input         RW0_wmode,
  input  [49:0] RW0_wdata_0,
  output [49:0] RW0_rdata_0
);
  wire [6:0] array_7_ext_RW0_addr;
  wire  array_7_ext_RW0_en;
  wire  array_7_ext_RW0_clk;
  wire  array_7_ext_RW0_wmode;
  wire [49:0] array_7_ext_RW0_wdata;
  wire [49:0] array_7_ext_RW0_rdata;
  array_7_ext array_7_ext (
    .RW0_addr(array_7_ext_RW0_addr),
    .RW0_en(array_7_ext_RW0_en),
    .RW0_clk(array_7_ext_RW0_clk),
    .RW0_wmode(array_7_ext_RW0_wmode),
    .RW0_wdata(array_7_ext_RW0_wdata),
    .RW0_rdata(array_7_ext_RW0_rdata)
  );
  assign array_7_ext_RW0_clk = RW0_clk;
  assign array_7_ext_RW0_en = RW0_en;
  assign array_7_ext_RW0_addr = RW0_addr;
  assign RW0_rdata_0 = array_7_ext_RW0_rdata;
  assign array_7_ext_RW0_wmode = RW0_wmode;
  assign array_7_ext_RW0_wdata = RW0_wdata_0;
endmodule

