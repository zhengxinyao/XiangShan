module array_1(
  input  [4:0]  RW0_addr,
  input         RW0_en,
  input         RW0_clk,
  input         RW0_wmode,
  input  [31:0] RW0_wdata_0,
  input  [31:0] RW0_wdata_1,
  input  [31:0] RW0_wdata_2,
  input  [31:0] RW0_wdata_3,
  input  [31:0] RW0_wdata_4,
  input  [31:0] RW0_wdata_5,
  input  [31:0] RW0_wdata_6,
  input  [31:0] RW0_wdata_7,
  output [31:0] RW0_rdata_0,
  output [31:0] RW0_rdata_1,
  output [31:0] RW0_rdata_2,
  output [31:0] RW0_rdata_3,
  output [31:0] RW0_rdata_4,
  output [31:0] RW0_rdata_5,
  output [31:0] RW0_rdata_6,
  output [31:0] RW0_rdata_7,
  input         RW0_wmask_0,
  input         RW0_wmask_1,
  input         RW0_wmask_2,
  input         RW0_wmask_3,
  input         RW0_wmask_4,
  input         RW0_wmask_5,
  input         RW0_wmask_6,
  input         RW0_wmask_7
);
  wire [4:0] array_1_ext_RW0_addr;
  wire  array_1_ext_RW0_en;
  wire  array_1_ext_RW0_clk;
  wire  array_1_ext_RW0_wmode;
  wire [255:0] array_1_ext_RW0_wdata;
  wire [255:0] array_1_ext_RW0_rdata;
  wire [7:0] array_1_ext_RW0_wmask;
  wire [127:0] _GEN_4 = {RW0_wdata_7,RW0_wdata_6,RW0_wdata_5,RW0_wdata_4};
  wire [127:0] _GEN_5 = {RW0_wdata_3,RW0_wdata_2,RW0_wdata_1,RW0_wdata_0};
  wire [3:0] _GEN_10 = {RW0_wmask_7,RW0_wmask_6,RW0_wmask_5,RW0_wmask_4};
  wire [3:0] _GEN_11 = {RW0_wmask_3,RW0_wmask_2,RW0_wmask_1,RW0_wmask_0};
  array_1_ext array_1_ext (
    .RW0_addr(array_1_ext_RW0_addr),
    .RW0_en(array_1_ext_RW0_en),
    .RW0_clk(array_1_ext_RW0_clk),
    .RW0_wmode(array_1_ext_RW0_wmode),
    .RW0_wdata(array_1_ext_RW0_wdata),
    .RW0_rdata(array_1_ext_RW0_rdata),
    .RW0_wmask(array_1_ext_RW0_wmask)
  );
  assign array_1_ext_RW0_clk = RW0_clk;
  assign array_1_ext_RW0_en = RW0_en;
  assign array_1_ext_RW0_addr = RW0_addr;
  assign RW0_rdata_0 = array_1_ext_RW0_rdata[31:0];
  assign RW0_rdata_1 = array_1_ext_RW0_rdata[63:32];
  assign RW0_rdata_2 = array_1_ext_RW0_rdata[95:64];
  assign RW0_rdata_3 = array_1_ext_RW0_rdata[127:96];
  assign RW0_rdata_4 = array_1_ext_RW0_rdata[159:128];
  assign RW0_rdata_5 = array_1_ext_RW0_rdata[191:160];
  assign RW0_rdata_6 = array_1_ext_RW0_rdata[223:192];
  assign RW0_rdata_7 = array_1_ext_RW0_rdata[255:224];
  assign array_1_ext_RW0_wmode = RW0_wmode;
  assign array_1_ext_RW0_wdata = {_GEN_4,_GEN_5};
  assign array_1_ext_RW0_wmask = {_GEN_10,_GEN_11};
endmodule

