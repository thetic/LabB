/*
 * TCES 330, Spring 2014
 * Final
 * Chad Condon
 * Implements an N to 2**N decoder
 */
module DecoderN( W, E, Y );
  parameter  N = 16  ;
  localparam M = 2**N;

  input      [N-1:0]  W; // the inputs
  input               E; // enable
  output reg [M-1:0]  Y; // the outputs

  initial Y = 0;

  always @(W, E) begin
    if ( E ) begin
      Y = 1'b1 << W;  // shift a '1' into position
    end
    else begin
      Y = 0;
    end
  end  // always
endmodule
