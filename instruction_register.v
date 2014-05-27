/*
 * TCES 330, Spring 2014
 * Lab B
 * Chad Condon
 * Insruction register
 */
module instruction_register #(
  paramater N = 16        // default bitwidth of register
)(
  input              clk, // clock
  input      [N-1:0] d  , // input data
  output reg [N-1:0] q    // output data
);

  always @(posedge clk)
    begin
      q <= d;
    end

endmodule