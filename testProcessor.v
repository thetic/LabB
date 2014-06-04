// TCES 330, Spring 2014
// Testbench  for the programmable processor
// Robert Gutmann

//`timescale 1 ns / 1 ns
module testProcessor;
 
  reg          Clk    ; // system clock
  reg          Reset  ; // system reset
  wire [15 :0] IR_Out ; // instruction register
  wire [4  :0] PC_Out ; // program counter
  wire [3  :0] StateO ; // state machine state
  wire [15 :0] ALU_A  ; // ALU output 
  wire [15 :0] ALU_B  ; // ALU output 
  wire [15 :0] ALU_Out; // ALU output 
  wire [15 :0] MuxOut ;
  wire [255:0] RQ0    ; // register 0 value
 
  Processor P2014( Clk, Reset, IR_Out, PC_Out, StateO,
    ALU_A, ALU_B, ALU_Out, RQ0, MuxOut );

initial // Clock generator
  begin
    Clk = 0;
    forever #10 Clk = !Clk;
  end
  
initial // Test stimulus
  begin
    Reset = 1;         // reset for one clock
    @ ( posedge Clk ) 
      Reset = 0;
    #1000 $stop;      // then run for a while
  end
  
initial
    $monitor("Time is %d : Reset = %d  State = %d Reg0 = %h, MuxOut = %h",
              $stime,      Reset,      StateO,    RQ0,       MuxOut); 
    
endmodule  