// TCES 330, Spring 2014
// Testbench for the cunit module
// Ben Foster
`timescale 1ns / 1 ns
module testcunit;
  	reg 		clock     ; //System Clock
	wire [7 :0] D_addr    ; //Data Address.
	wire [3 :0] RF_W_addr ; //Write address for RegisterFile.
	wire [3 :0] RF_Ra_addr; //Read address A for RegisterFile.
	wire [3 :0] RF_Rb_addr; //Read address B for RegisterFile.
	wire        D_wr      ; //Data write enable for ramlpm.
	wire        RF_s      ; //Select line for data mux.
	wire [2 :0] Alu_s0    ; //Select line for ALU.
	wire        RF_W_wr   ; //write enable for RegisterFile.
	wire        RF_Ra_rd  ; //Read address A enable for RegisterFile.
	wire        RF_Rb_rd  ; //Read address B enable for RegisterFile.
	wire [4 :0] PC_Out    ; //PC current address
	wire [15:0] IR_Out    ; //Current instruction
	wire [3 :0] StateO    ; //current state

	// Reference module cunit (Clock, D_addr, D_wr, RF_s, RF_W_addr, RF_W_wr, RF_Ra_addr, RF_Ra_rd, RF_Rb_addr, RF_Rb_rd, Alu_s0, IR_Out, PC_Out, StateO)
	//Module under test 
	cunit C2014(Clock, D_addr, D_wr, RF_s, RF_W_addr, RF_W_wr, RF_Ra_addr, 
	RF_Ra_rd, RF_Rb_addr, RF_Rb_rd, Alu_s0, IR_Out, PC_Out, StateO);

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