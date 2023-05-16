import "DPI-C" function void L1Tlb_hart0_write
(
  input longint vpn,
  input longint stamp,
  input string site
);
module L1Tlb_hart0Writer(
  input clock,
  input reset,
  input en,
  input [26:0] data_vpn,
  input [63:0] stamp
);
  parameter string site;

  always@(posedge clock) begin
    if(en && !reset) begin
      L1Tlb_hart0_write(data_vpn, stamp, site);
    end
  end
endmodule

