module WrBypass_75(
  input        clock,
  input        reset,
  input        io_wen,
  input  [8:0] io_write_idx,
  input  [8:0] io_write_tag,
  input  [1:0] io_write_data_0,
  output       io_hit,
  output [1:0] io_hit_data_0_bits
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  idx_tag_cam_clock; // @[WrBypass.scala 57:27]
  wire [8:0] idx_tag_cam_io_rreq_0_idx; // @[WrBypass.scala 57:27]
  wire [8:0] idx_tag_cam_io_rreq_0_tag; // @[WrBypass.scala 57:27]
  wire  idx_tag_cam_io_rresp_0_0; // @[WrBypass.scala 57:27]
  wire  idx_tag_cam_io_rresp_0_1; // @[WrBypass.scala 57:27]
  wire  idx_tag_cam_io_rresp_0_2; // @[WrBypass.scala 57:27]
  wire  idx_tag_cam_io_rresp_0_3; // @[WrBypass.scala 57:27]
  wire  idx_tag_cam_io_wvalid; // @[WrBypass.scala 57:27]
  wire [8:0] idx_tag_cam_io_wdata_idx; // @[WrBypass.scala 57:27]
  wire [8:0] idx_tag_cam_io_wdata_tag; // @[WrBypass.scala 57:27]
  wire [1:0] idx_tag_cam_io_windex; // @[WrBypass.scala 57:27]
  reg [1:0] data_mem_0 [0:3]; // @[WrBypass.scala 58:21]
  wire  data_mem_0_io_hit_data_0_bits_MPORT_en; // @[WrBypass.scala 58:21]
  wire [1:0] data_mem_0_io_hit_data_0_bits_MPORT_addr; // @[WrBypass.scala 58:21]
  wire [1:0] data_mem_0_io_hit_data_0_bits_MPORT_data; // @[WrBypass.scala 58:21]
  wire [1:0] data_mem_0_MPORT_data; // @[WrBypass.scala 58:21]
  wire [1:0] data_mem_0_MPORT_addr; // @[WrBypass.scala 58:21]
  wire  data_mem_0_MPORT_mask; // @[WrBypass.scala 58:21]
  wire  data_mem_0_MPORT_en; // @[WrBypass.scala 58:21]
  reg  ever_written_0; // @[WrBypass.scala 61:29]
  reg  ever_written_1; // @[WrBypass.scala 61:29]
  reg  ever_written_2; // @[WrBypass.scala 61:29]
  reg  ever_written_3; // @[WrBypass.scala 61:29]
  reg  enq_ptr_flag; // @[WrBypass.scala 63:24]
  reg [1:0] enq_ptr_value; // @[WrBypass.scala 63:24]
  wire  hits_oh_0 = idx_tag_cam_io_rresp_0_0 & ever_written_0; // @[WrBypass.scala 67:83]
  wire  hits_oh_1 = idx_tag_cam_io_rresp_0_1 & ever_written_1; // @[WrBypass.scala 67:83]
  wire  hits_oh_2 = idx_tag_cam_io_rresp_0_2 & ever_written_2; // @[WrBypass.scala 67:83]
  wire  hits_oh_3 = idx_tag_cam_io_rresp_0_3 & ever_written_3; // @[WrBypass.scala 67:83]
  wire [3:0] _hit_idx_T = {hits_oh_3,hits_oh_2,hits_oh_1,hits_oh_0}; // @[Cat.scala 31:58]
  wire [1:0] hit_idx_hi_1 = _hit_idx_T[3:2]; // @[OneHot.scala 30:18]
  wire [1:0] hit_idx_lo_1 = _hit_idx_T[1:0]; // @[OneHot.scala 31:18]
  wire  _hit_idx_T_1 = |hit_idx_hi_1; // @[OneHot.scala 32:14]
  wire [1:0] _hit_idx_T_2 = hit_idx_hi_1 | hit_idx_lo_1; // @[OneHot.scala 32:28]
  wire [1:0] hit_idx = {_hit_idx_T_1,_hit_idx_T_2[1]}; // @[Cat.scala 31:58]
  wire  hit = hits_oh_0 | hits_oh_1 | hits_oh_2 | hits_oh_3; // @[WrBypass.scala 69:29]
  wire  _GEN_15 = 2'h0 == enq_ptr_value | ever_written_0; // @[WrBypass.scala 61:29 94:{31,31}]
  wire  _GEN_16 = 2'h1 == enq_ptr_value | ever_written_1; // @[WrBypass.scala 61:29 94:{31,31}]
  wire  _GEN_17 = 2'h2 == enq_ptr_value | ever_written_2; // @[WrBypass.scala 61:29 94:{31,31}]
  wire  _GEN_18 = 2'h3 == enq_ptr_value | ever_written_3; // @[WrBypass.scala 61:29 94:{31,31}]
  wire  enq_en = io_wen & ~hit; // @[WrBypass.scala 103:23]
  wire [2:0] _enq_ptr_new_ptr_T = {enq_ptr_flag,enq_ptr_value}; // @[Cat.scala 31:58]
  wire [2:0] _GEN_59 = {{2'd0}, enq_en}; // @[CircularQueuePtr.scala 39:46]
  wire [2:0] _enq_ptr_new_ptr_T_2 = _enq_ptr_new_ptr_T + _GEN_59; // @[CircularQueuePtr.scala 39:46]
  CAMTemplate_75 idx_tag_cam ( // @[WrBypass.scala 57:27]
    .clock(idx_tag_cam_clock),
    .io_rreq_0_idx(idx_tag_cam_io_rreq_0_idx),
    .io_rreq_0_tag(idx_tag_cam_io_rreq_0_tag),
    .io_rresp_0_0(idx_tag_cam_io_rresp_0_0),
    .io_rresp_0_1(idx_tag_cam_io_rresp_0_1),
    .io_rresp_0_2(idx_tag_cam_io_rresp_0_2),
    .io_rresp_0_3(idx_tag_cam_io_rresp_0_3),
    .io_wvalid(idx_tag_cam_io_wvalid),
    .io_wdata_idx(idx_tag_cam_io_wdata_idx),
    .io_wdata_tag(idx_tag_cam_io_wdata_tag),
    .io_windex(idx_tag_cam_io_windex)
  );
  assign data_mem_0_io_hit_data_0_bits_MPORT_en = 1'h1;
  assign data_mem_0_io_hit_data_0_bits_MPORT_addr = {_hit_idx_T_1,_hit_idx_T_2[1]};
  assign data_mem_0_io_hit_data_0_bits_MPORT_data = data_mem_0[data_mem_0_io_hit_data_0_bits_MPORT_addr]; // @[WrBypass.scala 58:21]
  assign data_mem_0_MPORT_data = io_write_data_0;
  assign data_mem_0_MPORT_addr = hit ? hit_idx : enq_ptr_value;
  assign data_mem_0_MPORT_mask = 1'h1;
  assign data_mem_0_MPORT_en = io_wen;
  assign io_hit = hits_oh_0 | hits_oh_1 | hits_oh_2 | hits_oh_3; // @[WrBypass.scala 69:29]
  assign io_hit_data_0_bits = data_mem_0_io_hit_data_0_bits_MPORT_data; // @[WrBypass.scala 74:26]
  assign idx_tag_cam_clock = clock;
  assign idx_tag_cam_io_rreq_0_idx = io_write_idx; // @[WrBypass.scala 53:16]
  assign idx_tag_cam_io_rreq_0_tag = io_write_tag; // @[WrBypass.scala 54:22]
  assign idx_tag_cam_io_wvalid = io_wen & ~hit; // @[WrBypass.scala 103:23]
  assign idx_tag_cam_io_wdata_idx = io_write_idx; // @[WrBypass.scala 53:16]
  assign idx_tag_cam_io_wdata_tag = io_write_tag; // @[WrBypass.scala 54:22]
  assign idx_tag_cam_io_windex = enq_ptr_value; // @[WrBypass.scala 105:31]
  always @(posedge clock) begin
    if (data_mem_0_MPORT_en & data_mem_0_MPORT_mask) begin
      data_mem_0[data_mem_0_MPORT_addr] <= data_mem_0_MPORT_data; // @[WrBypass.scala 58:21]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[WrBypass.scala 88:19]
      ever_written_0 <= 1'h0; // @[WrBypass.scala 89:18 61:29]
    end else if (io_wen) begin // @[WrBypass.scala 61:29]
      if (!(hit)) begin
        ever_written_0 <= _GEN_15;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[WrBypass.scala 88:19]
      ever_written_1 <= 1'h0; // @[WrBypass.scala 89:18 61:29]
    end else if (io_wen) begin // @[WrBypass.scala 61:29]
      if (!(hit)) begin
        ever_written_1 <= _GEN_16;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[WrBypass.scala 88:19]
      ever_written_2 <= 1'h0; // @[WrBypass.scala 89:18 61:29]
    end else if (io_wen) begin // @[WrBypass.scala 61:29]
      if (!(hit)) begin
        ever_written_2 <= _GEN_17;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[WrBypass.scala 88:19]
      ever_written_3 <= 1'h0; // @[WrBypass.scala 89:18 61:29]
    end else if (io_wen) begin // @[WrBypass.scala 61:29]
      if (!(hit)) begin
        ever_written_3 <= _GEN_18;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[CircularQueuePtr.scala 39:59]
      enq_ptr_flag <= 1'h0;
    end else begin
      enq_ptr_flag <= _enq_ptr_new_ptr_T_2[2];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[CircularQueuePtr.scala 39:59]
      enq_ptr_value <= 2'h0;
    end else begin
      enq_ptr_value <= _enq_ptr_new_ptr_T_2[1:0];
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    data_mem_0[initvar] = _RAND_0[1:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  ever_written_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  ever_written_1 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  ever_written_2 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  ever_written_3 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  enq_ptr_flag = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  enq_ptr_value = _RAND_6[1:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    ever_written_0 = 1'h0;
  end
  if (reset) begin
    ever_written_1 = 1'h0;
  end
  if (reset) begin
    ever_written_2 = 1'h0;
  end
  if (reset) begin
    ever_written_3 = 1'h0;
  end
  if (reset) begin
    enq_ptr_flag = 1'h0;
  end
  if (reset) begin
    enq_ptr_value = 2'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

