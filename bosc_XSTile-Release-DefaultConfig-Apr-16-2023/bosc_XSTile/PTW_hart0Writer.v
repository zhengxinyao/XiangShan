import "DPI-C" function void PTW_hart0_write
(
  input longint source,
  input longint vpn,
  input longint stamp,
  input string site
);
module PTW_hart0Writer(
  input clock,
  input reset,
  input en,
  input [1:0] data_source,
  input [26:0] data_vpn,
  input [63:0] stamp
);
  parameter string site;

  always@(posedge clock) begin
    if(en && !reset) begin
      PTW_hart0_write(data_source, data_vpn, stamp, site);
    end
  end
endmodule

