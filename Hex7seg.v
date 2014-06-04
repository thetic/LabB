// TCES 330
// R. Gutmann
// Generic 7-Segment Hex Decoder, long version
// This module implements a 7-segment decoder '0' through 'F'
// 
module Hex7seg( C, Display );
  input  [3:0] C      ; // input code
  output [0:6] Display; // seven-segment display output

  // implement the truth table (active low segments)
  assign Display[0] = (~C[3] & ~C[2] & ~C[1] &  C[0])
                    + (~C[3] &  C[2] & ~C[1] & ~C[0])
                    + ( C[3] & ~C[2] &  C[1] &  C[0])
                    + ( C[3] &  C[2] & ~C[1] &  C[0]);

  assign Display[1] = (~C[3] &  C[2] & ~C[1] &  C[0])
                    + (~C[3] &  C[2] &  C[1] & ~C[0])
                    + ( C[3] & ~C[2] &  C[1] &  C[0])
                    + ( C[3] &  C[2] & ~C[1] & ~C[0])
                    + ( C[3] &  C[2] &  C[1] & ~C[0])
                    + ( C[3] &  C[2] &  C[1] &  C[0]);

  assign Display[2] = (~C[3] & ~C[2] &  C[1] & ~C[0])
                    + ( C[3] &  C[2] & ~C[1] & ~C[0])
                    + ( C[3] &  C[2] &  C[1] & ~C[0])
                    + ( C[3] &  C[2] &  C[1] &  C[0]);

  assign Display[3] = (~C[3] & ~C[2] & ~C[1] &  C[0])
                    + (~C[3] &  C[2] & ~C[1] & ~C[0])
                    + (~C[3] &  C[2] &  C[1] &  C[0])
                    + ( C[3] & ~C[2] &  C[1] & ~C[0])
                    + ( C[3] &  C[2] &  C[1] &  C[0]);

  assign Display[4] = (~C[3] & ~C[2] & ~C[1] &  C[0])
                    + (~C[3] & ~C[2] &  C[1] &  C[0])
                    + (~C[3] &  C[2] & ~C[1] & ~C[0])
                    + (~C[3] &  C[2] & ~C[1] &  C[0])
                    + (~C[3] &  C[2] &  C[1] &  C[0])
                    + ( C[3] & ~C[2] & ~C[1] &  C[0]);

  assign Display[5] = (~C[3] & ~C[2] & ~C[1] &  C[0])
                    + (~C[3] & ~C[2] &  C[1] & ~C[0])
                    + (~C[3] & ~C[2] &  C[1] &  C[0])
                    + (~C[3] &  C[2] &  C[1] &  C[0])
                    + ( C[3] &  C[2] & ~C[1] &  C[0]);

  assign Display[6] = (~C[3] & ~C[2] & ~C[1] & ~C[0])
                    + (~C[3] & ~C[2] & ~C[1] &  C[0])
                    + (~C[3] &  C[2] &  C[1] &  C[0])
                    + ( C[3] &  C[2] & ~C[1] & ~C[0]);
  
endmodule
