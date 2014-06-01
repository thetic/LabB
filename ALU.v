/*
  TCES HW6
  Part 4
  Spring 2014
  Chad Condon
  8 function ALU
*/
// This ALU has eight functions:
// if s == 0 the output is 0
// if s == 1 the output is A + B
// if s == 2 the output is A – B
// if s == 3 the output is A (pass-through)
// if s == 4 the output is A ^ B
// if s == 5 the output is A | B
// if s == 6 the output is A & B
// if s == 7 the output is A + 1;
// the additional functions are for future expansion
module ALU(
  input      [2 :0] Sel,    // function select
  input      [15:0] A  ,    // input data
  input      [15:0] B  ,    // input data
  output reg [15:0] Q       // ALU output (result)
);
  
  localparam ZERO      = 3'd0;
  localparam ADD       = 3'd1;
  localparam SUBTRACT  = 3'd2;
  localparam PASSTHRU  = 3'd3;
  localparam XOR       = 3'd4;
  localparam OR        = 3'd5;
  localparam AND       = 3'd6;
  localparam INCREMENT = 3'd7;
  
  always @(Sel, A, B)
    begin
      case (Sel)
        ZERO:
          begin
            Q = 0;
          end
        
        ADD:
          begin
            Q = A + B;
          end
        
        SUBTRACT:
          begin
            Q = A - B;
          end
        
        PASSTHRU:
          begin
            Q = A;
          end
        
        XOR:
          begin
            Q = A ^ B;
          end
        
        OR:
          begin
            Q = A | B;
          end
          
        AND:
          begin
            Q = A & B;
          end
          
        INCREMENT:
          begin
            Q = A + 16'b1;
          end
        endcase
    end
  
endmodule
