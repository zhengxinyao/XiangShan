import "DPI-C" function void branch_prediction_helper
(
  input  longint    rIdx,
  output longint target1, 
  output longint target2, 
  output longint target3, 
  output longint target4, 
  output longint target5, 
  output longint target6, 
  output longint target7, 
  output longint target8, 
  output longint target9, 
  output longint target10,
  output longint target11,
  output longint target12,
  output longint target13,
  output longint target14,
  output longint target15,
  output longint target16,
  output longint pc1, 
  output longint pc2, 
  output longint pc3, 
  output longint pc4, 
  output longint pc5, 
  output longint pc6, 
  output longint pc7, 
  output longint pc8, 
  output longint pc9, 
  output longint pc10,
  output longint pc11,
  output longint pc12,
  output longint pc13,
  output longint pc14,
  output longint pc15,
  output longint pc16,
  output bit taken1, 
  output bit taken2, 
  output bit taken3, 
  output bit taken4, 
  output bit taken5, 
  output bit taken6, 
  output bit taken7, 
  output bit taken8, 
  output bit taken9, 
  output bit taken10,
  output bit taken11,
  output bit taken12,
  output bit taken13,
  output bit taken14,
  output bit taken15,
  output bit taken16
);

module BranchPredictionHelper(
  input  [63:0] rIdx,
  output [64*16-1:0] pc,
  output [15:0] taken,
  output [64*16-1:0] target
);

  always @(*) begin
    branch_prediction_helper(rIdx,
      target[63:0], target[64*2-1:64*1], target[64*3-1:64*2], target[64*4-1:64*3], target[64*5-1:64*4], target[64*6-1:64*5], target[64*7-1:64*6], target[64*8-1:64*7], target[64*9-1:64*8], target[64*10-1:64*9], target[64*11-1:64*10], target[64*12-1:64*11], target[64*13-1:64*12], target[64*14-1:64*13], target[64*15-1:64*14], target[64*16-1:64*15],
      pc[63:0], pc[64*2-1:64*1], pc[64*3-1:64*2], pc[64*4-1:64*3], pc[64*5-1:64*4], pc[64*6-1:64*5], pc[64*7-1:64*6], pc[64*8-1:64*7], pc[64*9-1:64*8], pc[64*10-1:64*9], pc[64*11-1:64*10], pc[64*12-1:64*11], pc[64*13-1:64*12], pc[64*14-1:64*13], pc[64*15-1:64*14], pc[64*16-1:64*15],
      taken[0], taken[1], taken[2], taken[3], taken[4], taken[5], taken[6], taken[7], taken[8], taken[9], taken[10], taken[11], taken[12], taken[13], taken[14], taken[15]);
  end

endmodule