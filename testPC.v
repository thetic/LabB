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
			Reset = 1; //Reset for one clock
			@(posedge Clock)
				Reset = 0;
			#1000 $stop; //then run for a while
		end

	initial
		$monitor("Time is %d | Reset = %d | D_addr = %h", $stime, Reset, D_addr);



endmodule