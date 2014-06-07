// TCES 330, Spring 2014
// Testbench for the PC module
// Ben Foster
`timescale 1ns / 1 ns
module testPC;
  	reg 			Clear 	; 	//PC clear
  	reg 			Up 		; 	//PC increment
  	reg 			Clock 	; 	//System clock
	wire	[4:0]	O 		;   // PC Output

	// Reference module PC(O, Clear, Up, Clock);
	//Module under test 
	PC PC2014(O, Clear, Up, Clock);

	initial //Clock generator
		begin
			Clock = 0;
			forever #10 Clock = !Clock;
		end

	initial //Test stimulus
		begin
			Up = 1'b1;
			#30;
			Up = 1'b0;
			#30;
			Clear = 1'b1;
			#30 $stop;
		end

	initial
		$monitor("Time is %d | Clock = %d | Clear = %d | O = %h", $stime, Clock, Clear, O);



endmodule