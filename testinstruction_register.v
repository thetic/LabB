// TCES 330, Spring 2014
// Testbench for the instruction_register module
// Ben Foster
`timescale 1ns / 1 ns
module testinstruction_register;
  	reg             clk 	;  	// clock
  	reg 	[15:0]	d    	;	// input data
  	reg 			ir_ld 	; 	//load instruction signal
  	wire	[15:0] q 		;	// output data           

	// Reference module instruction_register #(.N(16)) instruction_register0 (Clock, d, q, ir_ld);
	//Module under test 
	instruction_register #(.N(16)) instruction_register0 (clk, d, q, ir_ld);

	integer I;

	initial //Clock generator
		begin
			Clock = 0;
			forever #10 Clock = !Clock;
		end

	initial //Test stimulus
		begin
			ir_ld = 1'b1; //Set ir_ld to 1 in order to test
			for(I = 0; I < 65536; I = I + 1) begin
				d = I;
		end

	initial
		$monitor("Time is %d | input = %h | output = %h", $stime, d, q);



endmodule