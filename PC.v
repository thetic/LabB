/*
  TCES Lab B
  Spring 2014
  Final
  Chad Condon
  Program Counter
*/
module PC(O, Clear, Up, Clock);
	input Clear, Up, Clock; // Clear, Increment, Clock
	output reg [4:0]O;      // PC Output

	localparam zero = 5'b0; // For clearing the PC

    initial O = 0;

	wire [4:0]m0i, mc, I; // Mux 0 Input, Mux 0-1 Connector, PC Input

	PCAdder PCAdder (O, m0i); // Increments the PC

	muxlpm m0 (O, m0i, Up, mc); // Determines whether or not to increment

	muxlpm m1 (mc, zero, Clear, I); // Determines whether or not to clear

	always @(posedge Clock) O = I; // Update PC on posedge Clock

endmodule
