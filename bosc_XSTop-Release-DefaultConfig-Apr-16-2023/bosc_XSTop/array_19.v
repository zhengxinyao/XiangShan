module array_19(
  input  [6:0]  RW0_addr,
  input         RW0_en,
  input         RW0_clk,
  input         RW0_wmode,
  input  [22:0] RW0_wdata_0,
  input  [22:0] RW0_wdata_1,
  input  [22:0] RW0_wdata_2,
  input  [22:0] RW0_wdata_3,
  input  [22:0] RW0_wdata_4,
  input  [22:0] RW0_wdata_5,
  input  [22:0] RW0_wdata_6,
  input  [22:0] RW0_wdata_7,
  input  [22:0] RW0_wdata_8,
  input  [22:0] RW0_wdata_9,
  output [22:0] RW0_rdata_0,
  output [22:0] RW0_rdata_1,
  output [22:0] RW0_rdata_2,
  output [22:0] RW0_rdata_3,
  output [22:0] RW0_rdata_4,
  output [22:0] RW0_rdata_5,
  output [22:0] RW0_rdata_6,
  output [22:0] RW0_rdata_7,
  output [22:0] RW0_rdata_8,
  output [22:0] RW0_rdata_9,
  input         RW0_wmask_0,
  input         RW0_wmask_1,
  input         RW0_wmask_2,
  input         RW0_wmask_3,
  input         RW0_wmask_4,
  input         RW0_wmask_5,
  input         RW0_wmask_6,
  input         RW0_wmask_7,
  input         RW0_wmask_8,
  input         RW0_wmask_9
);
  wire [6:0] array_19_ext_RW0_addr;
  wire  array_19_ext_RW0_en;
  wire  array_19_ext_RW0_clk;
  wire  array_19_ext_RW0_wmode;
  wire [229:0] array_19_ext_RW0_wdata;
  wire [229:0] array_19_ext_RW0_rdata;
  wire [9:0] array_19_ext_RW0_wmask;
  wire [114:0] _GEN_6 = {RW0_wdata_9,RW0_wdata_8,RW0_wdata_7,RW0_wdata_6,RW0_wdata_5};
  wire [114:0] _GEN_7 = {RW0_wdata_4,RW0_wdata_3,RW0_wdata_2,RW0_wdata_1,RW0_wdata_0};
  wire [4:0] _GEN_14 = {RW0_wmask_9,RW0_wmask_8,RW0_wmask_7,RW0_wmask_6,RW0_wmask_5};
  wire [4:0] _GEN_15 = {RW0_wmask_4,RW0_wmask_3,RW0_wmask_2,RW0_wmask_1,RW0_wmask_0};
  array_19_ext array_19_ext (
    .RW0_addr(array_19_ext_RW0_addr),
    .RW0_en(array_19_ext_RW0_en),
    .RW0_clk(array_19_ext_RW0_clk),
    .RW0_wmode(array_19_ext_RW0_wmode),
    .RW0_wdata(array_19_ext_RW0_wdata),
    .RW0_rdata(array_19_ext_RW0_rdata),
    .RW0_wmask(array_19_ext_RW0_wmask)
  );
  assign array_19_ext_RW0_clk = RW0_clk;
  assign array_19_ext_RW0_en = RW0_en;
  assign array_19_ext_RW0_addr = RW0_addr;
  assign RW0_rdata_0 = array_19_ext_RW0_rdata[22:0];
  assign RW0_rdata_1 = array_19_ext_RW0_rdata[45:23];
  assign RW0_rdata_2 = array_19_ext_RW0_rdata[68:46];
  assign RW0_rdata_3 = array_19_ext_RW0_rdata[91:69];
  assign RW0_rdata_4 = array_19_ext_RW0_rdata[114:92];
  assign RW0_rdata_5 = array_19_ext_RW0_rdata[137:115];
  assign RW0_rdata_6 = array_19_ext_RW0_rdata[160:138];
  assign RW0_rdata_7 = array_19_ext_RW0_rdata[183:161];
  assign RW0_rdata_8 = array_19_ext_RW0_rdata[206:184];
  assign RW0_rdata_9 = array_19_ext_RW0_rdata[229:207];
  assign array_19_ext_RW0_wmode = RW0_wmode;
  assign array_19_ext_RW0_wdata = {_GEN_6,_GEN_7};
  assign array_19_ext_RW0_wmask = {_GEN_14,_GEN_15};
endmodule

