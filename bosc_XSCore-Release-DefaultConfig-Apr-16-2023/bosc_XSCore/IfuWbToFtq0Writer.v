import "DPI-C" function void IfuWbToFtq0_write
(
  input longint checkInvalidTaken,
  input longint checkNotCFIFault,
  input longint checkTargetFault,
  input longint checkRetFault,
  input longint checkJalFault,
  input longint miss_pred_offset,
  input longint is_miss_pred,
  input longint start_addr,
  input longint stamp,
  input string site
);
module IfuWbToFtq0Writer(
  input clock,
  input reset,
  input en,
  input [0:0] data_checkInvalidTaken,
  input [0:0] data_checkNotCFIFault,
  input [0:0] data_checkTargetFault,
  input [0:0] data_checkRetFault,
  input [0:0] data_checkJalFault,
  input [31:0] data_miss_pred_offset,
  input [0:0] data_is_miss_pred,
  input [38:0] data_start_addr,
  input [63:0] stamp
);
  parameter string site;

  always@(posedge clock) begin
    if(en && !reset) begin
      IfuWbToFtq0_write(data_checkInvalidTaken, data_checkNotCFIFault, data_checkTargetFault, data_checkRetFault, data_checkJalFault, data_miss_pred_offset, data_is_miss_pred, data_start_addr, stamp, site);
    end
  end
endmodule

