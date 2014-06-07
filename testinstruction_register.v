// TCES 330, Spring 2014
// Testbench for the instruction_register module
// Simiulation should be run in ModelSim
// Ben Foster
`timescale 1ns / 1 ns
module testinstruction_register;
    reg          clk  ; // clock
    reg   [15:0] d    ; // input data
    reg          ir_ld; //load instruction signal
    wire  [15:0] q    ; // output data

  // Reference module instruction_register #(.N(16)) instruction_register0 (Clock, d, q, ir_ld);
  //Module under test
  instruction_register #(.N(16)) instruction_register0 (clk, d, q, ir_ld);

  integer I;

  initial //Clock generator
    begin
      clk = 0;
      d = 0;
      ir_ld = 1;
      forever #10 clk = !clk;
    end

  initial //Test stimulus
    begin
      #20 d = 16'hb0b0;
      #20 ir_ld = 1'b0; //make sure d isn't changed
      #20 d = 16'hd0d0;
      #20 $stop;
    end

  initial
    $monitor("Time is %d | input = %h | output = %h", $stime, d, q);



endmodule
