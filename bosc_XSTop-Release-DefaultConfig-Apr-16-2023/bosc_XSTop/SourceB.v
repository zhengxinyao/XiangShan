module SourceB(
  input          clock,
  input          reset,
  input          io_bready,
  output         io_bvalid,
  output [1:0]   io_bparam,
  output [5:0]   io_bsource,
  output [35:0]  io_baddress,
  output [255:0] io_bdata,
  output         io_task_ready,
  input          io_task_valid,
  input  [9:0]   io_task_bits_set,
  input  [19:0]  io_task_bits_tag,
  input  [2:0]   io_task_bits_param,
  input  [1:0]   io_task_bits_clients,
  input          io_task_bits_needData
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] workVec; // @[SourceB.scala 35:24]
  wire  _T = io_task_ready & io_task_valid; // @[Decoupled.scala 50:35]
  wire  busy = |workVec; // @[SourceB.scala 39:22]
  wire  _io_task_ready_T = ~busy; // @[SourceB.scala 40:20]
  wire [1:0] pendingClient = busy ? workVec : io_task_bits_clients; // @[SourceB.scala 41:26]
  wire [1:0] chosenClient = pendingClient[0] ? 2'h1 : 2'h2; // @[ParallelMux.scala 90:77]
  wire  _T_1 = io_bready & io_bvalid; // @[Decoupled.scala 50:35]
  wire [1:0] _workVec_T = ~chosenClient; // @[SourceB.scala 46:32]
  wire [1:0] _workVec_T_1 = pendingClient & _workVec_T; // @[SourceB.scala 46:30]
  reg [9:0] taskLatch_rset; // @[Reg.scala 16:16]
  reg [19:0] taskLatch_rtag; // @[Reg.scala 16:16]
  reg [2:0] taskLatch_rparam; // @[Reg.scala 16:16]
  reg  taskLatch_rneedData; // @[Reg.scala 16:16]
  wire [9:0] taskLatch_set = _io_task_ready_T ? io_task_bits_set : taskLatch_rset; // @[SourceB.scala 50:22]
  wire [19:0] taskLatch_tag = _io_task_ready_T ? io_task_bits_tag : taskLatch_rtag; // @[SourceB.scala 50:22]
  wire [2:0] taskLatch_param = _io_task_ready_T ? io_task_bits_param : taskLatch_rparam; // @[SourceB.scala 50:22]
  wire  taskLatch_needData = _io_task_ready_T ? io_task_bits_needData : taskLatch_rneedData; // @[SourceB.scala 50:22]
  wire [4:0] _io_bsource_T_3 = chosenClient[1] ? 5'h18 : 5'h0; // @[Mux.scala 27:73]
  wire [29:0] io_baddress_hi = {taskLatch_tag,taskLatch_set}; // @[Cat.scala 31:58]
  wire [2:0] _io_bdata_T = {2'h0,taskLatch_needData}; // @[Cat.scala 31:58]
  assign io_bvalid = busy | io_task_valid; // @[SourceB.scala 52:22]
  assign io_bparam = taskLatch_param[1:0]; // @[SourceB.scala 54:19]
  assign io_bsource = {{1'd0}, _io_bsource_T_3}; // @[SourceB.scala 56:20]
  assign io_baddress = {io_baddress_hi,6'h0}; // @[Cat.scala 31:58]
  assign io_bdata = {{253'd0}, _io_bdata_T}; // @[SourceB.scala 59:18]
  assign io_task_ready = ~busy; // @[SourceB.scala 40:20]
  always @(posedge clock) begin
    if (_T) begin // @[Reg.scala 17:18]
      taskLatch_rset <= io_task_bits_set; // @[Reg.scala 17:22]
    end
    if (_T) begin // @[Reg.scala 17:18]
      taskLatch_rtag <= io_task_bits_tag; // @[Reg.scala 17:22]
    end
    if (_T) begin // @[Reg.scala 17:18]
      taskLatch_rparam <= io_task_bits_param; // @[Reg.scala 17:22]
    end
    if (_T) begin // @[Reg.scala 17:18]
      taskLatch_rneedData <= io_task_bits_needData; // @[Reg.scala 17:22]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[SourceB.scala 45:19]
      workVec <= 2'h0; // @[SourceB.scala 46:13]
    end else if (_T_1) begin // @[SourceB.scala 36:22]
      workVec <= _workVec_T_1; // @[SourceB.scala 37:13]
    end else if (_T) begin // @[SourceB.scala 35:24]
      workVec <= io_task_bits_clients;
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
  workVec = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  taskLatch_rset = _RAND_1[9:0];
  _RAND_2 = {1{`RANDOM}};
  taskLatch_rtag = _RAND_2[19:0];
  _RAND_3 = {1{`RANDOM}};
  taskLatch_rparam = _RAND_3[2:0];
  _RAND_4 = {1{`RANDOM}};
  taskLatch_rneedData = _RAND_4[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    workVec = 2'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

