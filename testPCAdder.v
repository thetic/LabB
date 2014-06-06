// TCES 330, Spring 2014
// Testbench for the PCAdder module
// Ben Foster
`timescale 1ns / 1 ns
module testPCAdder;
  	reg 	[4:0]	I 	;	//Input
	wire	[4:0]	O 	;	//Input + 1

	// Reference module PCAdder(I, O);
	//Module under test 
	PCAdder PCAdder2014(I, O);

	integer J;

	initial //Test stimulus
		begin
			for(J = 0; J < 32; J = J + 1) begin
				I = J;
				#10;
			end
			#10 $stop;
		end

	initial
		$monitor("Time is %d | I = %h | O = %h", $stime, I, O);

endmodule