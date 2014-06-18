/*
  TCES Lab B, Spring 2014
  Final
  Chad Condon
  Stack Pointer
*/
module SP (
  input            clk   , // clock
  input            rst   , // active high reset
  input            SP_inc, // increment signal
  input            SP_dec, // decrement signal
  output reg [7:0] q       // pointer address
);

  initial
    begin
      q = 0;
    end

  always @(posedge clk)
    begin
      if (rst)
        begin
          q <= 8'b0;
        end
      else if (SP_inc)
        begin
          q <= q + 8'b1;
        end
      else if (SP_dec)
        begin
          q <= q - 8'b1;
        end
      else
        begin
          q <= q;
        end
    end

endmodule
