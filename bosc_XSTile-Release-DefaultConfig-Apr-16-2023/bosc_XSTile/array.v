module array(
  input  [4:0]  RW0_addr,
  input         RW0_en,
  input         RW0_clk,
  input         RW0_wmode,
  input  [26:0] RW0_wdata_0,
  input  [26:0] RW0_wdata_1,
  input  [26:0] RW0_wdata_2,
  input  [26:0] RW0_wdata_3,
  input  [26:0] RW0_wdata_4,
  input  [26:0] RW0_wdata_5,
  input  [26:0] RW0_wdata_6,
  input  [26:0] RW0_wdata_7,
  output [26:0] RW0_rdata_0,
  output [26:0] RW0_rdata_1,
  output [26:0] RW0_rdata_2,
  output [26:0] RW0_rdata_3,
  output [26:0] RW0_rdata_4,
  output [26:0] RW0_rdata_5,
  output [26:0] RW0_rdata_6,
  output [26:0] RW0_rdata_7,
  input         RW0_wmask_0,
  input         RW0_wmask_1,
  input         RW0_wmask_2,
  input         RW0_wmask_3,
  input         RW0_wmask_4,
  input         RW0_wmask_5,
  input         RW0_wmask_6,
  input         RW0_wmask_7
);
  wire [4:0] array_ext_RW0_addr;
  wire  array_ext_RW0_en;
  wire  array_ext_RW0_clk;
  wire  array_ext_RW0_wmode;
  wire [215:0] array_ext_RW0_wdata;
  wire [215:0] array_ext_RW0_rdata;
  wire [7:0] array_ext_RW0_wmask;
  wire [107:0] _GEN_4 = {RW0_wdata_7,RW0_wdata_6,RW0_wdata_5,RW0_wdata_4};
  wire [107:0] _GEN_5 = {RW0_wdata_3,RW0_wdata_2,RW0_wdata_1,RW0_wdata_0};
  wire [3:0] _GEN_10 = {RW0_wmask_7,RW0_wmask_6,RW0_wmask_5,RW0_wmask_4};
  wire [3:0] _GEN_11 = {RW0_wmask_3,RW0_wmask_2,RW0_wmask_1,RW0_wmask_0};
  array_ext array_ext (
    .RW0_addr(array_ext_RW0_addr),
    .RW0_en(array_ext_RW0_en),
    .RW0_clk(array_ext_RW0_clk),
    .RW0_wmode(array_ext_RW0_wmode),
    .RW0_wdata(array_ext_RW0_wdata),
    .RW0_rdata(array_ext_RW0_rdata),
    .RW0_wmask(array_ext_RW0_wmask)
  );
  assign array_ext_RW0_clk = RW0_clk;
  assign array_ext_RW0_en = RW0_en;
  assign array_ext_RW0_addr = RW0_addr;
  assign RW0_rdata_0 = array_ext_RW0_rdata[26:0];
  assign RW0_rdata_1 = array_ext_RW0_rdata[53:27];
  assign RW0_rdata_2 = array_ext_RW0_rdata[80:54];
  assign RW0_rdata_3 = array_ext_RW0_rdata[107:81];
  assign RW0_rdata_4 = array_ext_RW0_rdata[134:108];
  assign RW0_rdata_5 = array_ext_RW0_rdata[161:135];
  assign RW0_rdata_6 = array_ext_RW0_rdata[188:162];
  assign RW0_rdata_7 = array_ext_RW0_rdata[215:189];
  assign array_ext_RW0_wmode = RW0_wmode;
  assign array_ext_RW0_wdata = {_GEN_4,_GEN_5};
  assign array_ext_RW0_wmask = {_GEN_10,_GEN_11};
endmodule

