import "DPI-C" function void FetchToIBuffer0_write
(
  input longint is_cache_hit,
  input longint exception,
  input longint instr_count,
  input longint start_addr,
  input longint stamp,
  input string site
);
module FetchToIBuffer0Writer(
  input clock,
  input reset,
  input en,
  input [0:0] data_is_cache_hit,
  input [0:0] data_exception,
  input [31:0] data_instr_count,
  input [38:0] data_start_addr,
  input [63:0] stamp
);
  parameter string site;

  always@(posedge clock) begin
    if(en && !reset) begin
      FetchToIBuffer0_write(data_is_cache_hit, data_exception, data_instr_count, data_start_addr, stamp, site);
    end
  end
endmodule

