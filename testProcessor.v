`timescale 1ns/1ns
module testProcessor;

  //inputs to Processor are regs
  reg Clk;
  reg Reset;
  
  //outputs from Processor are wires.
  wire [15:0] IR_Out;
  wire [4:0] PC_Out;
  wire [3:0] StateO;
  wire [15:0] ALU_A;
  wire [15:0] ALU_B;
  wire [15:0] ALU_Out;
  wire [15:0] RQ0;
  wire [15:0] Mux_out;

  //reference Processor(Clk, Reset, IR_Out, PC_Out, StateO, ALU_A, ALU_B, 
    //ALU_Out, RQ0, Mux_out);
  Processor(Clk, Reset, IR_Out, PC_Out, StateO, ALU_A, ALU_B, ALU_Out,
    RQ0, Mux_out);

  //Generate clock
  always begin
    Clk = 1'b0;
    #10;
    Clk = 1'b1;
    #10;
  end //clock

  initial //Test stimulus
  begin
    
    //clear
    Reset = 1'b1;
    #20 Reset = 1'b0;

    //Since there are no other inputs besides
    //the clock and the reset, then we need to
    //wait some amount of time in order to let
    //the processor do its thing.
    #50000; //alter this based on actual wait time.

    #20 $stop; //done

  end //test
  
  initial //output to monitor
    $monitor($stime, , "Clk: ", Clk, , "IR_Out: ", IR_Out, , "PC_Out: ", 
      PC_Out, , "StateO: ", StateO, , "ALU_A: ", ALU_A, , "ALU_B: ", 
      ALU_B, , "ALU_Out: ", ALU_Out, , "RQ0: ", RQ0, , "Mux_out: ", Mux_out);

endmodule
  
