/**
 * TCES 330, Spring 2014
 * Final
 * Chad Condon
 * Simple incrementer
 */
module PCAdder(I, O);
	input [4:0]I;
	output [4:0]O;

	assign O = I + 5'b00001;
endmodule
