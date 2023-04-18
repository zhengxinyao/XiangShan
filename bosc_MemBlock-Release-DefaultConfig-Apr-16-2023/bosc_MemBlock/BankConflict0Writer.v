import "DPI-C" function void BankConflict0_write
(
  input longint fake_rr_bank_conflict,
  input longint way_index,
  input longint bank_index_0,
  input longint bank_index_1,
  input longint set_index_0,
  input longint set_index_1,
  input longint addr_0,
  input longint addr_1,
  input longint stamp,
  input string site
);
module BankConflict0Writer(
  input clock,
  input reset,
  input en,
  input [0:0] data_fake_rr_bank_conflict,
  input [2:0] data_way_index,
  input [2:0] data_bank_index_0,
  input [2:0] data_bank_index_1,
  input [5:0] data_set_index_0,
  input [5:0] data_set_index_1,
  input [35:0] data_addr_0,
  input [35:0] data_addr_1,
  input [63:0] stamp
);
  parameter string site;

  always@(posedge clock) begin
    if(en && !reset) begin
      BankConflict0_write(data_fake_rr_bank_conflict, data_way_index, data_bank_index_0, data_bank_index_1, data_set_index_0, data_set_index_1, data_addr_0, data_addr_1, stamp, site);
    end
  end
endmodule

