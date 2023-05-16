module CAMTemplate_75(
  input        clock,
  input  [8:0] io_rreq_0_idx,
  input  [8:0] io_rreq_0_tag,
  output       io_rresp_0_0,
  output       io_rresp_0_1,
  output       io_rresp_0_2,
  output       io_rresp_0_3,
  input        io_wvalid,
  input  [8:0] io_wdata_idx,
  input  [8:0] io_wdata_tag,
  input  [1:0] io_windex
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [17:0] array_0; // @[MMUBundle.scala 125:18]
  reg [17:0] array_1; // @[MMUBundle.scala 125:18]
  reg [17:0] array_2; // @[MMUBundle.scala 125:18]
  reg [17:0] array_3; // @[MMUBundle.scala 125:18]
  wire [17:0] _T = {io_rreq_0_idx,io_rreq_0_tag}; // @[MMUBundle.scala 128:32]
  wire [17:0] _array_T = {io_wdata_idx,io_wdata_tag}; // @[MMUBundle.scala 132:46]
  assign io_rresp_0_0 = _T == array_0; // @[MMUBundle.scala 128:39]
  assign io_rresp_0_1 = _T == array_1; // @[MMUBundle.scala 128:39]
  assign io_rresp_0_2 = _T == array_2; // @[MMUBundle.scala 128:39]
  assign io_rresp_0_3 = _T == array_3; // @[MMUBundle.scala 128:39]
  always @(posedge clock) begin
    if (io_wvalid) begin // @[MMUBundle.scala 131:21]
      if (2'h0 == io_windex) begin // @[MMUBundle.scala 132:28]
        array_0 <= _array_T; // @[MMUBundle.scala 132:28]
      end
    end
    if (io_wvalid) begin // @[MMUBundle.scala 131:21]
      if (2'h1 == io_windex) begin // @[MMUBundle.scala 132:28]
        array_1 <= _array_T; // @[MMUBundle.scala 132:28]
      end
    end
    if (io_wvalid) begin // @[MMUBundle.scala 131:21]
      if (2'h2 == io_windex) begin // @[MMUBundle.scala 132:28]
        array_2 <= _array_T; // @[MMUBundle.scala 132:28]
      end
    end
    if (io_wvalid) begin // @[MMUBundle.scala 131:21]
      if (2'h3 == io_windex) begin // @[MMUBundle.scala 132:28]
        array_3 <= _array_T; // @[MMUBundle.scala 132:28]
      end
    end
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
  array_0 = _RAND_0[17:0];
  _RAND_1 = {1{`RANDOM}};
  array_1 = _RAND_1[17:0];
  _RAND_2 = {1{`RANDOM}};
  array_2 = _RAND_2[17:0];
  _RAND_3 = {1{`RANDOM}};
  array_3 = _RAND_3[17:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

