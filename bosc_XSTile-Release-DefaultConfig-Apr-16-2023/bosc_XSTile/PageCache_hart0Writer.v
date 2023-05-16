import "DPI-C" function void PageCache_hart0_write
(
  input longint hit,
  input longint l1Hit,
  input longint l2Hit,
  input longint prefetch,
  input longint prefetched,
  input longint is_first,
  input longint bypassed,
  input longint source,
  input longint vpn,
  input longint stamp,
  input string site
);
module PageCache_hart0Writer(
  input clock,
  input reset,
  input en,
  input [0:0] data_hit,
  input [0:0] data_l1Hit,
  input [0:0] data_l2Hit,
  input [0:0] data_prefetch,
  input [0:0] data_prefetched,
  input [0:0] data_is_first,
  input [0:0] data_bypassed,
  input [1:0] data_source,
  input [26:0] data_vpn,
  input [63:0] stamp
);
  parameter string site;

  always@(posedge clock) begin
    if(en && !reset) begin
      PageCache_hart0_write(data_hit, data_l1Hit, data_l2Hit, data_prefetch, data_prefetched, data_is_first, data_bypassed, data_source, data_vpn, stamp, site);
    end
  end
endmodule

