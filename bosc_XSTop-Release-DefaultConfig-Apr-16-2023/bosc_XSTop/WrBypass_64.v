module WrBypass_64(
  input         clock,
  input         reset,
  input         io_wen,
  input  [10:0] io_write_idx,
  input  [1:0]  io_write_data_0,
  input  [1:0]  io_write_data_1,
  input         io_write_way_mask_0,
  input         io_write_way_mask_1,
  output        io_hit,
  output        io_hit_data_0_valid,
  output [1:0]  io_hit_data_0_bits,
  output        io_hit_data_1_valid,
  output [1:0]  io_hit_data_1_bits
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
`endif // RANDOMIZE_REG_INIT
  wire  idx_tag_cam_clock; // @[WrBypass.scala 57:27]
  wire [10:0] idx_tag_cam_io_rreq_0_idx; // @[WrBypass.scala 57:27]
  wire  idx_tag_cam_io_rresp_0_0; // @[WrBypass.scala 57:27]
  wire  idx_tag_cam_io_rresp_0_1; // @[WrBypass.scala 57:27]
  wire  idx_tag_cam_io_rresp_0_2; // @[WrBypass.scala 57:27]
  wire  idx_tag_cam_io_rresp_0_3; // @[WrBypass.scala 57:27]
  wire  idx_tag_cam_io_rresp_0_4; // @[WrBypass.scala 57:27]
  wire  idx_tag_cam_io_rresp_0_5; // @[WrBypass.scala 57:27]
  wire  idx_tag_cam_io_rresp_0_6; // @[WrBypass.scala 57:27]
  wire  idx_tag_cam_io_rresp_0_7; // @[WrBypass.scala 57:27]
  wire  idx_tag_cam_io_wvalid; // @[WrBypass.scala 57:27]
  wire [10:0] idx_tag_cam_io_wdata_idx; // @[WrBypass.scala 57:27]
  wire [2:0] idx_tag_cam_io_windex; // @[WrBypass.scala 57:27]
  reg [1:0] data_mem_0 [0:7]; // @[WrBypass.scala 58:21]
  wire  data_mem_0_io_hit_data_0_bits_MPORT_en; // @[WrBypass.scala 58:21]
  wire [2:0] data_mem_0_io_hit_data_0_bits_MPORT_addr; // @[WrBypass.scala 58:21]
  wire [1:0] data_mem_0_io_hit_data_0_bits_MPORT_data; // @[WrBypass.scala 58:21]
  wire  data_mem_0_io_hit_data_1_bits_MPORT_en; // @[WrBypass.scala 58:21]
  wire [2:0] data_mem_0_io_hit_data_1_bits_MPORT_addr; // @[WrBypass.scala 58:21]
  wire [1:0] data_mem_0_io_hit_data_1_bits_MPORT_data; // @[WrBypass.scala 58:21]
  wire [1:0] data_mem_0_MPORT_data; // @[WrBypass.scala 58:21]
  wire [2:0] data_mem_0_MPORT_addr; // @[WrBypass.scala 58:21]
  wire  data_mem_0_MPORT_mask; // @[WrBypass.scala 58:21]
  wire  data_mem_0_MPORT_en; // @[WrBypass.scala 58:21]
  reg [1:0] data_mem_1 [0:7]; // @[WrBypass.scala 58:21]
  wire  data_mem_1_io_hit_data_0_bits_MPORT_en; // @[WrBypass.scala 58:21]
  wire [2:0] data_mem_1_io_hit_data_0_bits_MPORT_addr; // @[WrBypass.scala 58:21]
  wire [1:0] data_mem_1_io_hit_data_0_bits_MPORT_data; // @[WrBypass.scala 58:21]
  wire  data_mem_1_io_hit_data_1_bits_MPORT_en; // @[WrBypass.scala 58:21]
  wire [2:0] data_mem_1_io_hit_data_1_bits_MPORT_addr; // @[WrBypass.scala 58:21]
  wire [1:0] data_mem_1_io_hit_data_1_bits_MPORT_data; // @[WrBypass.scala 58:21]
  wire [1:0] data_mem_1_MPORT_data; // @[WrBypass.scala 58:21]
  wire [2:0] data_mem_1_MPORT_addr; // @[WrBypass.scala 58:21]
  wire  data_mem_1_MPORT_mask; // @[WrBypass.scala 58:21]
  wire  data_mem_1_MPORT_en; // @[WrBypass.scala 58:21]
  reg  valids_0_0; // @[WrBypass.scala 60:23]
  reg  valids_0_1; // @[WrBypass.scala 60:23]
  reg  valids_1_0; // @[WrBypass.scala 60:23]
  reg  valids_1_1; // @[WrBypass.scala 60:23]
  reg  valids_2_0; // @[WrBypass.scala 60:23]
  reg  valids_2_1; // @[WrBypass.scala 60:23]
  reg  valids_3_0; // @[WrBypass.scala 60:23]
  reg  valids_3_1; // @[WrBypass.scala 60:23]
  reg  valids_4_0; // @[WrBypass.scala 60:23]
  reg  valids_4_1; // @[WrBypass.scala 60:23]
  reg  valids_5_0; // @[WrBypass.scala 60:23]
  reg  valids_5_1; // @[WrBypass.scala 60:23]
  reg  valids_6_0; // @[WrBypass.scala 60:23]
  reg  valids_6_1; // @[WrBypass.scala 60:23]
  reg  valids_7_0; // @[WrBypass.scala 60:23]
  reg  valids_7_1; // @[WrBypass.scala 60:23]
  reg  ever_written_0; // @[WrBypass.scala 61:29]
  reg  ever_written_1; // @[WrBypass.scala 61:29]
  reg  ever_written_2; // @[WrBypass.scala 61:29]
  reg  ever_written_3; // @[WrBypass.scala 61:29]
  reg  ever_written_4; // @[WrBypass.scala 61:29]
  reg  ever_written_5; // @[WrBypass.scala 61:29]
  reg  ever_written_6; // @[WrBypass.scala 61:29]
  reg  ever_written_7; // @[WrBypass.scala 61:29]
  reg  enq_ptr_flag; // @[WrBypass.scala 63:24]
  reg [2:0] enq_ptr_value; // @[WrBypass.scala 63:24]
  wire  hits_oh_0 = idx_tag_cam_io_rresp_0_0 & ever_written_0; // @[WrBypass.scala 67:83]
  wire  hits_oh_1 = idx_tag_cam_io_rresp_0_1 & ever_written_1; // @[WrBypass.scala 67:83]
  wire  hits_oh_2 = idx_tag_cam_io_rresp_0_2 & ever_written_2; // @[WrBypass.scala 67:83]
  wire  hits_oh_3 = idx_tag_cam_io_rresp_0_3 & ever_written_3; // @[WrBypass.scala 67:83]
  wire  hits_oh_4 = idx_tag_cam_io_rresp_0_4 & ever_written_4; // @[WrBypass.scala 67:83]
  wire  hits_oh_5 = idx_tag_cam_io_rresp_0_5 & ever_written_5; // @[WrBypass.scala 67:83]
  wire  hits_oh_6 = idx_tag_cam_io_rresp_0_6 & ever_written_6; // @[WrBypass.scala 67:83]
  wire  hits_oh_7 = idx_tag_cam_io_rresp_0_7 & ever_written_7; // @[WrBypass.scala 67:83]
  wire [7:0] _hit_idx_T = {hits_oh_7,hits_oh_6,hits_oh_5,hits_oh_4,hits_oh_3,hits_oh_2,hits_oh_1,hits_oh_0}; // @[Cat.scala 31:58]
  wire [3:0] hit_idx_hi_1 = _hit_idx_T[7:4]; // @[OneHot.scala 30:18]
  wire [3:0] hit_idx_lo_1 = _hit_idx_T[3:0]; // @[OneHot.scala 31:18]
  wire  _hit_idx_T_1 = |hit_idx_hi_1; // @[OneHot.scala 32:14]
  wire [3:0] _hit_idx_T_2 = hit_idx_hi_1 | hit_idx_lo_1; // @[OneHot.scala 32:28]
  wire [1:0] hit_idx_hi_2 = _hit_idx_T_2[3:2]; // @[OneHot.scala 30:18]
  wire [1:0] hit_idx_lo_2 = _hit_idx_T_2[1:0]; // @[OneHot.scala 31:18]
  wire  _hit_idx_T_3 = |hit_idx_hi_2; // @[OneHot.scala 32:14]
  wire [1:0] _hit_idx_T_4 = hit_idx_hi_2 | hit_idx_lo_2; // @[OneHot.scala 32:28]
  wire [1:0] _hit_idx_T_6 = {_hit_idx_T_3,_hit_idx_T_4[1]}; // @[Cat.scala 31:58]
  wire [2:0] hit_idx = {_hit_idx_T_1,_hit_idx_T_3,_hit_idx_T_4[1]}; // @[Cat.scala 31:58]
  wire  hit = hits_oh_0 | hits_oh_1 | hits_oh_2 | hits_oh_3 | hits_oh_4 | hits_oh_5 | hits_oh_6 | hits_oh_7; // @[WrBypass.scala 69:29]
  wire  _GEN_11 = 3'h0 == hit_idx | valids_0_0; // @[WrBypass.scala 60:23 91:{30,30}]
  wire  _GEN_12 = 3'h1 == hit_idx | valids_1_0; // @[WrBypass.scala 60:23 91:{30,30}]
  wire  _GEN_13 = 3'h2 == hit_idx | valids_2_0; // @[WrBypass.scala 60:23 91:{30,30}]
  wire  _GEN_14 = 3'h3 == hit_idx | valids_3_0; // @[WrBypass.scala 60:23 91:{30,30}]
  wire  _GEN_15 = 3'h4 == hit_idx | valids_4_0; // @[WrBypass.scala 60:23 91:{30,30}]
  wire  _GEN_16 = 3'h5 == hit_idx | valids_5_0; // @[WrBypass.scala 60:23 91:{30,30}]
  wire  _GEN_17 = 3'h6 == hit_idx | valids_6_0; // @[WrBypass.scala 60:23 91:{30,30}]
  wire  _GEN_18 = 3'h7 == hit_idx | valids_7_0; // @[WrBypass.scala 60:23 91:{30,30}]
  wire  _GEN_179 = 3'h0 == enq_ptr_value; // @[WrBypass.scala 61:29 94:{31,31}]
  wire  _GEN_27 = 3'h0 == enq_ptr_value | ever_written_0; // @[WrBypass.scala 61:29 94:{31,31}]
  wire  _GEN_180 = 3'h1 == enq_ptr_value; // @[WrBypass.scala 61:29 94:{31,31}]
  wire  _GEN_28 = 3'h1 == enq_ptr_value | ever_written_1; // @[WrBypass.scala 61:29 94:{31,31}]
  wire  _GEN_181 = 3'h2 == enq_ptr_value; // @[WrBypass.scala 61:29 94:{31,31}]
  wire  _GEN_29 = 3'h2 == enq_ptr_value | ever_written_2; // @[WrBypass.scala 61:29 94:{31,31}]
  wire  _GEN_182 = 3'h3 == enq_ptr_value; // @[WrBypass.scala 61:29 94:{31,31}]
  wire  _GEN_30 = 3'h3 == enq_ptr_value | ever_written_3; // @[WrBypass.scala 61:29 94:{31,31}]
  wire  _GEN_183 = 3'h4 == enq_ptr_value; // @[WrBypass.scala 61:29 94:{31,31}]
  wire  _GEN_31 = 3'h4 == enq_ptr_value | ever_written_4; // @[WrBypass.scala 61:29 94:{31,31}]
  wire  _GEN_184 = 3'h5 == enq_ptr_value; // @[WrBypass.scala 61:29 94:{31,31}]
  wire  _GEN_32 = 3'h5 == enq_ptr_value | ever_written_5; // @[WrBypass.scala 61:29 94:{31,31}]
  wire  _GEN_185 = 3'h6 == enq_ptr_value; // @[WrBypass.scala 61:29 94:{31,31}]
  wire  _GEN_33 = 3'h6 == enq_ptr_value | ever_written_6; // @[WrBypass.scala 61:29 94:{31,31}]
  wire  _GEN_186 = 3'h7 == enq_ptr_value; // @[WrBypass.scala 61:29 94:{31,31}]
  wire  _GEN_34 = 3'h7 == enq_ptr_value | ever_written_7; // @[WrBypass.scala 61:29 94:{31,31}]
  wire  _GEN_35 = 3'h0 == enq_ptr_value ? 1'h0 : valids_0_0; // @[WrBypass.scala 60:23 95:{28,28}]
  wire  _GEN_36 = 3'h1 == enq_ptr_value ? 1'h0 : valids_1_0; // @[WrBypass.scala 60:23 95:{28,28}]
  wire  _GEN_37 = 3'h2 == enq_ptr_value ? 1'h0 : valids_2_0; // @[WrBypass.scala 60:23 95:{28,28}]
  wire  _GEN_38 = 3'h3 == enq_ptr_value ? 1'h0 : valids_3_0; // @[WrBypass.scala 60:23 95:{28,28}]
  wire  _GEN_39 = 3'h4 == enq_ptr_value ? 1'h0 : valids_4_0; // @[WrBypass.scala 60:23 95:{28,28}]
  wire  _GEN_40 = 3'h5 == enq_ptr_value ? 1'h0 : valids_5_0; // @[WrBypass.scala 60:23 95:{28,28}]
  wire  _GEN_41 = 3'h6 == enq_ptr_value ? 1'h0 : valids_6_0; // @[WrBypass.scala 60:23 95:{28,28}]
  wire  _GEN_42 = 3'h7 == enq_ptr_value ? 1'h0 : valids_7_0; // @[WrBypass.scala 60:23 95:{28,28}]
  wire  _GEN_43 = _GEN_179 | _GEN_35; // @[WrBypass.scala 97:{30,30}]
  wire  _GEN_44 = _GEN_180 | _GEN_36; // @[WrBypass.scala 97:{30,30}]
  wire  _GEN_45 = _GEN_181 | _GEN_37; // @[WrBypass.scala 97:{30,30}]
  wire  _GEN_46 = _GEN_182 | _GEN_38; // @[WrBypass.scala 97:{30,30}]
  wire  _GEN_47 = _GEN_183 | _GEN_39; // @[WrBypass.scala 97:{30,30}]
  wire  _GEN_48 = _GEN_184 | _GEN_40; // @[WrBypass.scala 97:{30,30}]
  wire  _GEN_49 = _GEN_185 | _GEN_41; // @[WrBypass.scala 97:{30,30}]
  wire  _GEN_50 = _GEN_186 | _GEN_42; // @[WrBypass.scala 97:{30,30}]
  wire  _GEN_67 = hit ? ever_written_0 : _GEN_27; // @[WrBypass.scala 89:18 61:29]
  wire  _GEN_68 = hit ? ever_written_1 : _GEN_28; // @[WrBypass.scala 89:18 61:29]
  wire  _GEN_69 = hit ? ever_written_2 : _GEN_29; // @[WrBypass.scala 89:18 61:29]
  wire  _GEN_70 = hit ? ever_written_3 : _GEN_30; // @[WrBypass.scala 89:18 61:29]
  wire  _GEN_71 = hit ? ever_written_4 : _GEN_31; // @[WrBypass.scala 89:18 61:29]
  wire  _GEN_72 = hit ? ever_written_5 : _GEN_32; // @[WrBypass.scala 89:18 61:29]
  wire  _GEN_73 = hit ? ever_written_6 : _GEN_33; // @[WrBypass.scala 89:18 61:29]
  wire  _GEN_74 = hit ? ever_written_7 : _GEN_34; // @[WrBypass.scala 89:18 61:29]
  wire  _GEN_83 = io_wen ? _GEN_67 : ever_written_0; // @[WrBypass.scala 88:19 61:29]
  wire  _GEN_84 = io_wen ? _GEN_68 : ever_written_1; // @[WrBypass.scala 88:19 61:29]
  wire  _GEN_85 = io_wen ? _GEN_69 : ever_written_2; // @[WrBypass.scala 88:19 61:29]
  wire  _GEN_86 = io_wen ? _GEN_70 : ever_written_3; // @[WrBypass.scala 88:19 61:29]
  wire  _GEN_87 = io_wen ? _GEN_71 : ever_written_4; // @[WrBypass.scala 88:19 61:29]
  wire  _GEN_88 = io_wen ? _GEN_72 : ever_written_5; // @[WrBypass.scala 88:19 61:29]
  wire  _GEN_89 = io_wen ? _GEN_73 : ever_written_6; // @[WrBypass.scala 88:19 61:29]
  wire  _GEN_90 = io_wen ? _GEN_74 : ever_written_7; // @[WrBypass.scala 88:19 61:29]
  wire  _GEN_91 = 3'h0 == hit_idx | valids_0_1; // @[WrBypass.scala 60:23 91:{30,30}]
  wire  _GEN_92 = 3'h1 == hit_idx | valids_1_1; // @[WrBypass.scala 60:23 91:{30,30}]
  wire  _GEN_93 = 3'h2 == hit_idx | valids_2_1; // @[WrBypass.scala 60:23 91:{30,30}]
  wire  _GEN_94 = 3'h3 == hit_idx | valids_3_1; // @[WrBypass.scala 60:23 91:{30,30}]
  wire  _GEN_95 = 3'h4 == hit_idx | valids_4_1; // @[WrBypass.scala 60:23 91:{30,30}]
  wire  _GEN_96 = 3'h5 == hit_idx | valids_5_1; // @[WrBypass.scala 60:23 91:{30,30}]
  wire  _GEN_97 = 3'h6 == hit_idx | valids_6_1; // @[WrBypass.scala 60:23 91:{30,30}]
  wire  _GEN_98 = 3'h7 == hit_idx | valids_7_1; // @[WrBypass.scala 60:23 91:{30,30}]
  wire  _GEN_107 = _GEN_179 | _GEN_83; // @[WrBypass.scala 94:{31,31}]
  wire  _GEN_108 = _GEN_180 | _GEN_84; // @[WrBypass.scala 94:{31,31}]
  wire  _GEN_109 = _GEN_181 | _GEN_85; // @[WrBypass.scala 94:{31,31}]
  wire  _GEN_110 = _GEN_182 | _GEN_86; // @[WrBypass.scala 94:{31,31}]
  wire  _GEN_111 = _GEN_183 | _GEN_87; // @[WrBypass.scala 94:{31,31}]
  wire  _GEN_112 = _GEN_184 | _GEN_88; // @[WrBypass.scala 94:{31,31}]
  wire  _GEN_113 = _GEN_185 | _GEN_89; // @[WrBypass.scala 94:{31,31}]
  wire  _GEN_114 = _GEN_186 | _GEN_90; // @[WrBypass.scala 94:{31,31}]
  wire  _GEN_115 = 3'h0 == enq_ptr_value ? 1'h0 : valids_0_1; // @[WrBypass.scala 60:23 95:{28,28}]
  wire  _GEN_116 = 3'h1 == enq_ptr_value ? 1'h0 : valids_1_1; // @[WrBypass.scala 60:23 95:{28,28}]
  wire  _GEN_117 = 3'h2 == enq_ptr_value ? 1'h0 : valids_2_1; // @[WrBypass.scala 60:23 95:{28,28}]
  wire  _GEN_118 = 3'h3 == enq_ptr_value ? 1'h0 : valids_3_1; // @[WrBypass.scala 60:23 95:{28,28}]
  wire  _GEN_119 = 3'h4 == enq_ptr_value ? 1'h0 : valids_4_1; // @[WrBypass.scala 60:23 95:{28,28}]
  wire  _GEN_120 = 3'h5 == enq_ptr_value ? 1'h0 : valids_5_1; // @[WrBypass.scala 60:23 95:{28,28}]
  wire  _GEN_121 = 3'h6 == enq_ptr_value ? 1'h0 : valids_6_1; // @[WrBypass.scala 60:23 95:{28,28}]
  wire  _GEN_122 = 3'h7 == enq_ptr_value ? 1'h0 : valids_7_1; // @[WrBypass.scala 60:23 95:{28,28}]
  wire  _GEN_123 = _GEN_179 | _GEN_115; // @[WrBypass.scala 97:{30,30}]
  wire  _GEN_124 = _GEN_180 | _GEN_116; // @[WrBypass.scala 97:{30,30}]
  wire  _GEN_125 = _GEN_181 | _GEN_117; // @[WrBypass.scala 97:{30,30}]
  wire  _GEN_126 = _GEN_182 | _GEN_118; // @[WrBypass.scala 97:{30,30}]
  wire  _GEN_127 = _GEN_183 | _GEN_119; // @[WrBypass.scala 97:{30,30}]
  wire  _GEN_128 = _GEN_184 | _GEN_120; // @[WrBypass.scala 97:{30,30}]
  wire  _GEN_129 = _GEN_185 | _GEN_121; // @[WrBypass.scala 97:{30,30}]
  wire  _GEN_130 = _GEN_186 | _GEN_122; // @[WrBypass.scala 97:{30,30}]
  wire  enq_en = io_wen & ~hit; // @[WrBypass.scala 103:23]
  wire [3:0] _enq_ptr_new_ptr_T = {enq_ptr_flag,enq_ptr_value}; // @[Cat.scala 31:58]
  wire [3:0] _GEN_219 = {{3'd0}, enq_en}; // @[CircularQueuePtr.scala 39:46]
  wire [3:0] _enq_ptr_new_ptr_T_2 = _enq_ptr_new_ptr_T + _GEN_219; // @[CircularQueuePtr.scala 39:46]
  CAMTemplate_64 idx_tag_cam ( // @[WrBypass.scala 57:27]
    .clock(idx_tag_cam_clock),
    .io_rreq_0_idx(idx_tag_cam_io_rreq_0_idx),
    .io_rresp_0_0(idx_tag_cam_io_rresp_0_0),
    .io_rresp_0_1(idx_tag_cam_io_rresp_0_1),
    .io_rresp_0_2(idx_tag_cam_io_rresp_0_2),
    .io_rresp_0_3(idx_tag_cam_io_rresp_0_3),
    .io_rresp_0_4(idx_tag_cam_io_rresp_0_4),
    .io_rresp_0_5(idx_tag_cam_io_rresp_0_5),
    .io_rresp_0_6(idx_tag_cam_io_rresp_0_6),
    .io_rresp_0_7(idx_tag_cam_io_rresp_0_7),
    .io_wvalid(idx_tag_cam_io_wvalid),
    .io_wdata_idx(idx_tag_cam_io_wdata_idx),
    .io_windex(idx_tag_cam_io_windex)
  );
  assign data_mem_0_io_hit_data_0_bits_MPORT_en = 1'h1;
  assign data_mem_0_io_hit_data_0_bits_MPORT_addr = {_hit_idx_T_1,_hit_idx_T_6};
  assign data_mem_0_io_hit_data_0_bits_MPORT_data = data_mem_0[data_mem_0_io_hit_data_0_bits_MPORT_addr]; // @[WrBypass.scala 58:21]
  assign data_mem_0_io_hit_data_1_bits_MPORT_en = 1'h1;
  assign data_mem_0_io_hit_data_1_bits_MPORT_addr = {_hit_idx_T_1,_hit_idx_T_6};
  assign data_mem_0_io_hit_data_1_bits_MPORT_data = data_mem_0[data_mem_0_io_hit_data_1_bits_MPORT_addr]; // @[WrBypass.scala 58:21]
  assign data_mem_0_MPORT_data = io_write_data_0;
  assign data_mem_0_MPORT_addr = hit ? hit_idx : enq_ptr_value;
  assign data_mem_0_MPORT_mask = io_write_way_mask_0;
  assign data_mem_0_MPORT_en = io_wen;
  assign data_mem_1_io_hit_data_0_bits_MPORT_en = 1'h1;
  assign data_mem_1_io_hit_data_0_bits_MPORT_addr = {_hit_idx_T_1,_hit_idx_T_6};
  assign data_mem_1_io_hit_data_0_bits_MPORT_data = data_mem_1[data_mem_1_io_hit_data_0_bits_MPORT_addr]; // @[WrBypass.scala 58:21]
  assign data_mem_1_io_hit_data_1_bits_MPORT_en = 1'h1;
  assign data_mem_1_io_hit_data_1_bits_MPORT_addr = {_hit_idx_T_1,_hit_idx_T_6};
  assign data_mem_1_io_hit_data_1_bits_MPORT_data = data_mem_1[data_mem_1_io_hit_data_1_bits_MPORT_addr]; // @[WrBypass.scala 58:21]
  assign data_mem_1_MPORT_data = io_write_data_1;
  assign data_mem_1_MPORT_addr = hit ? hit_idx : enq_ptr_value;
  assign data_mem_1_MPORT_mask = io_write_way_mask_1;
  assign data_mem_1_MPORT_en = io_wen;
  assign io_hit = hits_oh_0 | hits_oh_1 | hits_oh_2 | hits_oh_3 | hits_oh_4 | hits_oh_5 | hits_oh_6 | hits_oh_7; // @[WrBypass.scala 69:29]
  assign io_hit_data_0_valid = hits_oh_0 & valids_0_0 | hits_oh_1 & valids_1_0 | hits_oh_2 & valids_2_0 | hits_oh_3 &
    valids_3_0 | hits_oh_4 & valids_4_0 | hits_oh_5 & valids_5_0 | hits_oh_6 & valids_6_0 | hits_oh_7 & valids_7_0; // @[Mux.scala 27:73]
  assign io_hit_data_0_bits = data_mem_0_io_hit_data_0_bits_MPORT_data; // @[WrBypass.scala 74:26]
  assign io_hit_data_1_valid = hits_oh_0 & valids_0_1 | hits_oh_1 & valids_1_1 | hits_oh_2 & valids_2_1 | hits_oh_3 &
    valids_3_1 | hits_oh_4 & valids_4_1 | hits_oh_5 & valids_5_1 | hits_oh_6 & valids_6_1 | hits_oh_7 & valids_7_1; // @[Mux.scala 27:73]
  assign io_hit_data_1_bits = data_mem_1_io_hit_data_1_bits_MPORT_data; // @[WrBypass.scala 74:26]
  assign idx_tag_cam_clock = clock;
  assign idx_tag_cam_io_rreq_0_idx = io_write_idx; // @[WrBypass.scala 53:16]
  assign idx_tag_cam_io_wvalid = io_wen & ~hit; // @[WrBypass.scala 103:23]
  assign idx_tag_cam_io_wdata_idx = io_write_idx; // @[WrBypass.scala 53:16]
  assign idx_tag_cam_io_windex = enq_ptr_value; // @[WrBypass.scala 105:31]
  always @(posedge clock) begin
    if (data_mem_0_MPORT_en & data_mem_0_MPORT_mask) begin
      data_mem_0[data_mem_0_MPORT_addr] <= data_mem_0_MPORT_data; // @[WrBypass.scala 58:21]
    end
    if (data_mem_1_MPORT_en & data_mem_1_MPORT_mask) begin
      data_mem_1[data_mem_1_MPORT_addr] <= data_mem_1_MPORT_data; // @[WrBypass.scala 58:21]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[WrBypass.scala 88:19]
      valids_0_0 <= 1'h0; // @[WrBypass.scala 89:18 60:{23,23} 90:35 95:{28,28} 96:35]
    end else if (io_wen) begin // @[WrBypass.scala 60:23]
      if (hit) begin
        if (io_write_way_mask_0) begin
          valids_0_0 <= _GEN_11;
        end
      end else if (io_write_way_mask_0) begin
        valids_0_0 <= _GEN_43;
      end else if (3'h0 == enq_ptr_value) begin
        valids_0_0 <= 1'h0;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[WrBypass.scala 88:19]
      valids_0_1 <= 1'h0; // @[WrBypass.scala 89:18 60:{23,23} 90:35 95:{28,28} 96:35]
    end else if (io_wen) begin // @[WrBypass.scala 60:23]
      if (hit) begin
        if (io_write_way_mask_1) begin
          valids_0_1 <= _GEN_91;
        end
      end else if (io_write_way_mask_1) begin
        valids_0_1 <= _GEN_123;
      end else if (3'h0 == enq_ptr_value) begin
        valids_0_1 <= 1'h0;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[WrBypass.scala 88:19]
      valids_1_0 <= 1'h0; // @[WrBypass.scala 89:18 60:{23,23} 90:35 95:{28,28} 96:35]
    end else if (io_wen) begin // @[WrBypass.scala 60:23]
      if (hit) begin
        if (io_write_way_mask_0) begin
          valids_1_0 <= _GEN_12;
        end
      end else if (io_write_way_mask_0) begin
        valids_1_0 <= _GEN_44;
      end else if (3'h1 == enq_ptr_value) begin
        valids_1_0 <= 1'h0;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[WrBypass.scala 88:19]
      valids_1_1 <= 1'h0; // @[WrBypass.scala 89:18 60:{23,23} 90:35 95:{28,28} 96:35]
    end else if (io_wen) begin // @[WrBypass.scala 60:23]
      if (hit) begin
        if (io_write_way_mask_1) begin
          valids_1_1 <= _GEN_92;
        end
      end else if (io_write_way_mask_1) begin
        valids_1_1 <= _GEN_124;
      end else if (3'h1 == enq_ptr_value) begin
        valids_1_1 <= 1'h0;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[WrBypass.scala 88:19]
      valids_2_0 <= 1'h0; // @[WrBypass.scala 89:18 60:{23,23} 90:35 95:{28,28} 96:35]
    end else if (io_wen) begin // @[WrBypass.scala 60:23]
      if (hit) begin
        if (io_write_way_mask_0) begin
          valids_2_0 <= _GEN_13;
        end
      end else if (io_write_way_mask_0) begin
        valids_2_0 <= _GEN_45;
      end else if (3'h2 == enq_ptr_value) begin
        valids_2_0 <= 1'h0;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[WrBypass.scala 88:19]
      valids_2_1 <= 1'h0; // @[WrBypass.scala 89:18 60:{23,23} 90:35 95:{28,28} 96:35]
    end else if (io_wen) begin // @[WrBypass.scala 60:23]
      if (hit) begin
        if (io_write_way_mask_1) begin
          valids_2_1 <= _GEN_93;
        end
      end else if (io_write_way_mask_1) begin
        valids_2_1 <= _GEN_125;
      end else if (3'h2 == enq_ptr_value) begin
        valids_2_1 <= 1'h0;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[WrBypass.scala 88:19]
      valids_3_0 <= 1'h0; // @[WrBypass.scala 89:18 60:{23,23} 90:35 95:{28,28} 96:35]
    end else if (io_wen) begin // @[WrBypass.scala 60:23]
      if (hit) begin
        if (io_write_way_mask_0) begin
          valids_3_0 <= _GEN_14;
        end
      end else if (io_write_way_mask_0) begin
        valids_3_0 <= _GEN_46;
      end else if (3'h3 == enq_ptr_value) begin
        valids_3_0 <= 1'h0;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[WrBypass.scala 88:19]
      valids_3_1 <= 1'h0; // @[WrBypass.scala 89:18 60:{23,23} 90:35 95:{28,28} 96:35]
    end else if (io_wen) begin // @[WrBypass.scala 60:23]
      if (hit) begin
        if (io_write_way_mask_1) begin
          valids_3_1 <= _GEN_94;
        end
      end else if (io_write_way_mask_1) begin
        valids_3_1 <= _GEN_126;
      end else if (3'h3 == enq_ptr_value) begin
        valids_3_1 <= 1'h0;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[WrBypass.scala 88:19]
      valids_4_0 <= 1'h0; // @[WrBypass.scala 89:18 60:{23,23} 90:35 95:{28,28} 96:35]
    end else if (io_wen) begin // @[WrBypass.scala 60:23]
      if (hit) begin
        if (io_write_way_mask_0) begin
          valids_4_0 <= _GEN_15;
        end
      end else if (io_write_way_mask_0) begin
        valids_4_0 <= _GEN_47;
      end else if (3'h4 == enq_ptr_value) begin
        valids_4_0 <= 1'h0;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[WrBypass.scala 88:19]
      valids_4_1 <= 1'h0; // @[WrBypass.scala 89:18 60:{23,23} 90:35 95:{28,28} 96:35]
    end else if (io_wen) begin // @[WrBypass.scala 60:23]
      if (hit) begin
        if (io_write_way_mask_1) begin
          valids_4_1 <= _GEN_95;
        end
      end else if (io_write_way_mask_1) begin
        valids_4_1 <= _GEN_127;
      end else if (3'h4 == enq_ptr_value) begin
        valids_4_1 <= 1'h0;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[WrBypass.scala 88:19]
      valids_5_0 <= 1'h0; // @[WrBypass.scala 89:18 60:{23,23} 90:35 95:{28,28} 96:35]
    end else if (io_wen) begin // @[WrBypass.scala 60:23]
      if (hit) begin
        if (io_write_way_mask_0) begin
          valids_5_0 <= _GEN_16;
        end
      end else if (io_write_way_mask_0) begin
        valids_5_0 <= _GEN_48;
      end else if (3'h5 == enq_ptr_value) begin
        valids_5_0 <= 1'h0;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[WrBypass.scala 88:19]
      valids_5_1 <= 1'h0; // @[WrBypass.scala 89:18 60:{23,23} 90:35 95:{28,28} 96:35]
    end else if (io_wen) begin // @[WrBypass.scala 60:23]
      if (hit) begin
        if (io_write_way_mask_1) begin
          valids_5_1 <= _GEN_96;
        end
      end else if (io_write_way_mask_1) begin
        valids_5_1 <= _GEN_128;
      end else if (3'h5 == enq_ptr_value) begin
        valids_5_1 <= 1'h0;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[WrBypass.scala 88:19]
      valids_6_0 <= 1'h0; // @[WrBypass.scala 89:18 60:{23,23} 90:35 95:{28,28} 96:35]
    end else if (io_wen) begin // @[WrBypass.scala 60:23]
      if (hit) begin
        if (io_write_way_mask_0) begin
          valids_6_0 <= _GEN_17;
        end
      end else if (io_write_way_mask_0) begin
        valids_6_0 <= _GEN_49;
      end else if (3'h6 == enq_ptr_value) begin
        valids_6_0 <= 1'h0;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[WrBypass.scala 88:19]
      valids_6_1 <= 1'h0; // @[WrBypass.scala 89:18 60:{23,23} 90:35 95:{28,28} 96:35]
    end else if (io_wen) begin // @[WrBypass.scala 60:23]
      if (hit) begin
        if (io_write_way_mask_1) begin
          valids_6_1 <= _GEN_97;
        end
      end else if (io_write_way_mask_1) begin
        valids_6_1 <= _GEN_129;
      end else if (3'h6 == enq_ptr_value) begin
        valids_6_1 <= 1'h0;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[WrBypass.scala 88:19]
      valids_7_0 <= 1'h0; // @[WrBypass.scala 89:18 60:{23,23} 90:35 95:{28,28} 96:35]
    end else if (io_wen) begin // @[WrBypass.scala 60:23]
      if (hit) begin
        if (io_write_way_mask_0) begin
          valids_7_0 <= _GEN_18;
        end
      end else if (io_write_way_mask_0) begin
        valids_7_0 <= _GEN_50;
      end else if (3'h7 == enq_ptr_value) begin
        valids_7_0 <= 1'h0;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[WrBypass.scala 88:19]
      valids_7_1 <= 1'h0; // @[WrBypass.scala 89:18 60:{23,23} 90:35 95:{28,28} 96:35]
    end else if (io_wen) begin // @[WrBypass.scala 60:23]
      if (hit) begin
        if (io_write_way_mask_1) begin
          valids_7_1 <= _GEN_98;
        end
      end else if (io_write_way_mask_1) begin
        valids_7_1 <= _GEN_130;
      end else if (3'h7 == enq_ptr_value) begin
        valids_7_1 <= 1'h0;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[WrBypass.scala 88:19]
      ever_written_0 <= 1'h0; // @[WrBypass.scala 89:18]
    end else if (io_wen) begin
      if (hit) begin
        ever_written_0 <= _GEN_83;
      end else begin
        ever_written_0 <= _GEN_107;
      end
    end else begin
      ever_written_0 <= _GEN_83;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[WrBypass.scala 88:19]
      ever_written_1 <= 1'h0; // @[WrBypass.scala 89:18]
    end else if (io_wen) begin
      if (hit) begin
        ever_written_1 <= _GEN_84;
      end else begin
        ever_written_1 <= _GEN_108;
      end
    end else begin
      ever_written_1 <= _GEN_84;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[WrBypass.scala 88:19]
      ever_written_2 <= 1'h0; // @[WrBypass.scala 89:18]
    end else if (io_wen) begin
      if (hit) begin
        ever_written_2 <= _GEN_85;
      end else begin
        ever_written_2 <= _GEN_109;
      end
    end else begin
      ever_written_2 <= _GEN_85;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[WrBypass.scala 88:19]
      ever_written_3 <= 1'h0; // @[WrBypass.scala 89:18]
    end else if (io_wen) begin
      if (hit) begin
        ever_written_3 <= _GEN_86;
      end else begin
        ever_written_3 <= _GEN_110;
      end
    end else begin
      ever_written_3 <= _GEN_86;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[WrBypass.scala 88:19]
      ever_written_4 <= 1'h0; // @[WrBypass.scala 89:18]
    end else if (io_wen) begin
      if (hit) begin
        ever_written_4 <= _GEN_87;
      end else begin
        ever_written_4 <= _GEN_111;
      end
    end else begin
      ever_written_4 <= _GEN_87;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[WrBypass.scala 88:19]
      ever_written_5 <= 1'h0; // @[WrBypass.scala 89:18]
    end else if (io_wen) begin
      if (hit) begin
        ever_written_5 <= _GEN_88;
      end else begin
        ever_written_5 <= _GEN_112;
      end
    end else begin
      ever_written_5 <= _GEN_88;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[WrBypass.scala 88:19]
      ever_written_6 <= 1'h0; // @[WrBypass.scala 89:18]
    end else if (io_wen) begin
      if (hit) begin
        ever_written_6 <= _GEN_89;
      end else begin
        ever_written_6 <= _GEN_113;
      end
    end else begin
      ever_written_6 <= _GEN_89;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[WrBypass.scala 88:19]
      ever_written_7 <= 1'h0; // @[WrBypass.scala 89:18]
    end else if (io_wen) begin
      if (hit) begin
        ever_written_7 <= _GEN_90;
      end else begin
        ever_written_7 <= _GEN_114;
      end
    end else begin
      ever_written_7 <= _GEN_90;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[CircularQueuePtr.scala 39:59]
      enq_ptr_flag <= 1'h0;
    end else begin
      enq_ptr_flag <= _enq_ptr_new_ptr_T_2[3];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[CircularQueuePtr.scala 39:59]
      enq_ptr_value <= 3'h0;
    end else begin
      enq_ptr_value <= _enq_ptr_new_ptr_T_2[2:0];
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
  for (initvar = 0; initvar < 8; initvar = initvar+1)
    data_mem_0[initvar] = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  for (initvar = 0; initvar < 8; initvar = initvar+1)
    data_mem_1[initvar] = _RAND_1[1:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  valids_0_0 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  valids_0_1 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  valids_1_0 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  valids_1_1 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  valids_2_0 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  valids_2_1 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  valids_3_0 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  valids_3_1 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  valids_4_0 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  valids_4_1 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  valids_5_0 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  valids_5_1 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  valids_6_0 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  valids_6_1 = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  valids_7_0 = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  valids_7_1 = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  ever_written_0 = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  ever_written_1 = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  ever_written_2 = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  ever_written_3 = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  ever_written_4 = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  ever_written_5 = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  ever_written_6 = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  ever_written_7 = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  enq_ptr_flag = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  enq_ptr_value = _RAND_27[2:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    valids_0_0 = 1'h0;
  end
  if (reset) begin
    valids_0_1 = 1'h0;
  end
  if (reset) begin
    valids_1_0 = 1'h0;
  end
  if (reset) begin
    valids_1_1 = 1'h0;
  end
  if (reset) begin
    valids_2_0 = 1'h0;
  end
  if (reset) begin
    valids_2_1 = 1'h0;
  end
  if (reset) begin
    valids_3_0 = 1'h0;
  end
  if (reset) begin
    valids_3_1 = 1'h0;
  end
  if (reset) begin
    valids_4_0 = 1'h0;
  end
  if (reset) begin
    valids_4_1 = 1'h0;
  end
  if (reset) begin
    valids_5_0 = 1'h0;
  end
  if (reset) begin
    valids_5_1 = 1'h0;
  end
  if (reset) begin
    valids_6_0 = 1'h0;
  end
  if (reset) begin
    valids_6_1 = 1'h0;
  end
  if (reset) begin
    valids_7_0 = 1'h0;
  end
  if (reset) begin
    valids_7_1 = 1'h0;
  end
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
    ever_written_4 = 1'h0;
  end
  if (reset) begin
    ever_written_5 = 1'h0;
  end
  if (reset) begin
    ever_written_6 = 1'h0;
  end
  if (reset) begin
    ever_written_7 = 1'h0;
  end
  if (reset) begin
    enq_ptr_flag = 1'h0;
  end
  if (reset) begin
    enq_ptr_value = 3'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

