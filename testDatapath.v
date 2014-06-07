// TCES 330, Spring 2014
// Testbench for the Datapath module
// Ben Foster
`timescale 1ns / 1 ns
module testDatapath;
  	reg 			    Clock     ; //System clock.
  	reg         	Reset     ; //System Reset.
  	reg		[7 :0]	D_addr    ; //Data Address.
  	reg         	D_wr      ; //Data write enable for ramlpm.
  	reg         	RF_s      ; //Select line for data mux.
  	reg  	[3 :0] 	RF_W_addr ; //Write address for Register file.
  	reg         	RF_W_wr   ; //Write enable for RegisterFile
  	reg  	[3 :0] 	RF_Ra_addr; //Read address a for RegisterFile.
  	reg         	RF_Ra_rd  ; //Read address a enable for RegisterFile.
  	reg  	[3 :0] 	RF_Rb_addr; //Read address b for RegisterFile.
  	reg         	RF_Rb_rd  ; //Read address b enable for RegisterFile.
  	reg  	[2 :0] 	Alu_s0    ; //Select line for ALU.
  	wire 	[15:0] 	ALU_A     ; //ALU A-Side input.
  	wire 	[15:0] 	ALU_B     ; //ALU B-Side input.
  	wire 	[15:0] 	ALU_Out   ; //ALU wire.
  	wire 	[15:0] 	RQ0       ; //RF[0] contents
  	wire 	[15:0] 	Mux_out   ; //output of the two to one mux.

	// Reference module Datapath(Clock, Reset, D_addr, D_wr, RF_s, RF_W_addr, RF_W_wr, RF_Ra_addr, RF_Ra_rd, RF_Rb_addr, RF_Rb_rd, Alu_s0, ALU_A, ALU_B, ALU_Out, RQ0, Mux_out)
	//Module under test
	Datapath D2014(Clock, Reset, D_addr, D_wr, RF_s, RF_W_addr, RF_W_wr, RF_Ra_addr, RF_Ra_rd, RF_Rb_addr, RF_Rb_rd, Alu_s0, ALU_A, ALU_B, ALU_Out, RQ0, Mux_out);

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
