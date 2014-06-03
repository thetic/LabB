module PCAdder(I, O);
	input [7:0]I;
	output [7:0]O;
	
	assign O = I + 7'b0001;
endmodule
