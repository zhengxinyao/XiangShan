import "DPI-C" function void FTQTable0_write
(
  input longint predStage,
  input longint isTaken,
  input longint misPred,
  input longint isRet,
  input longint isCall,
  input longint isJmp,
  input longint isBr,
  input longint target,
  input longint pc,
  input longint stamp,
  input string site
);
module FTQTable0Writer(
  input clock,
  input reset,
  input en,
  input [1:0] data_predStage,
  input [0:0] data_isTaken,
  input [0:0] data_misPred,
  input [0:0] data_isRet,
  input [0:0] data_isCall,
  input [0:0] data_isJmp,
  input [0:0] data_isBr,
  input [38:0] data_target,
  input [38:0] data_pc,
  input [63:0] stamp
);
  parameter string site;

  always@(posedge clock) begin
    if(en && !reset) begin
      FTQTable0_write(data_predStage, data_isTaken, data_misPred, data_isRet, data_isCall, data_isJmp, data_isBr, data_target, data_pc, stamp, site);
    end
  end
endmodule

