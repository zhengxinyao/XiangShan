import "DPI-C" function void L1MissQMissTrace_hart0_write
(
  input longint pc,
  input longint source,
  input longint paddr,
  input longint vaddr,
  input longint stamp,
  input string site
);
module L1MissQMissTrace_hart0Writer(
  input clock,
  input reset,
  input en,
  input [38:0] data_pc,
  input [3:0] data_source,
  input [35:0] data_paddr,
  input [38:0] data_vaddr,
  input [63:0] stamp
);
  parameter string site;

  always@(posedge clock) begin
    if(en && !reset) begin
      L1MissQMissTrace_hart0_write(data_pc, data_source, data_paddr, data_vaddr, stamp, site);
    end
  end
endmodule

