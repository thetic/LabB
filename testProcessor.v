// TCES 330, Spring 2014
// Testbench for the programmables processor
// Simiulation should be run in ModelSim
// Robert Gutmann

//'timescale 1 ns / 1 ns
module testProcessor;

	reg Clk; //System clock
	reg Reset; //System reset
	wire [15:0] IR_Out; //instruction register
	wire [4:0] PC_Out; //program counter
	wire [3:0] StateO; //State machine state
	wire [15:0] ALU_A, ALU_B, ALU_Out; //ALU inputs and output
	wire [15:0] MuxOut; //Mux output
	wire [15:0] RQ0; //Register 0 value (you might want to change this)
	
	//reference: module Porcessor( Clk, Reset, IR_Out, PC_Out, StateO, ALU_A, ALU_B, ALU_Out, RQ0, Mux_out );
	Processor P2014( Clk, Reset, IR_Out, PC_Out, StateO, ALU_A, ALU_B, ALU_Out, RQ0, MuxOut );
	
	initial //Clock generator
		begin
			Clk = 0;
			forever #10 Clk = !Clk;
		end
		
	initial //Test stimulus
		begin
			Reset = 1; //Reset for one clock
			@ (posedge Clk)
			Reset = 0;
			#1000 $stop; //then run for a while
		end
	
	initial
		$monitor("Time is %d : Reset = %d State = %d Reg0 = %h, MuxOut = %h", $stime, Reset, StateO, RQ0, MuxOut);
		
endmodule
