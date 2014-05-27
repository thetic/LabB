module Processor( Clk, Reset, IR_Out, PC_Out, StateO, ALU_A, ALU_B, ALU_Out, RQ0, Mux_out );
	input Clk;             // system clock
	input Reset;           // system reset
	output [15:0] IR_Out;  // Instruction register
	output [4:0] PC_Out;   // Program counter
	output [3:0] StateO;   // FSM current state
	output [15:0] ALU_A;   // ALU A-Side Input
	output [15:0] ALU_B;   // ALU B-Side Input
	output [15:0] ALU_Out; // ALU current output
	output [15:0] RQ0;     // RF[0] contents
	output [15:0] Mux_out; // Datapath mux output

endmodule
