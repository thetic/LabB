// TCES 330, Spring 2014
// Testbench for the controller module
// Ben Foster
`timescale 1ns / 1 ns
module testcontroller;
  	reg 	[15:0] 	instruction,  // instruction
  	reg 			clk        ,  // clock
  	wire 	[7 :0] 	D_addr     ,  // data memory address
	wire           	D_wr       ,  // data memory write enable signal
    wire      		PC_clr     ,  // load instruction signal
    wire      		PC_up      ,  // load instruction signal
    wire      		IR_ld      ,  // load instruction signal
    wire      		RF_s       ,  // register file select signal
   	wire	[3 :0] 	RF_W_addr  ,  // register file write address
    wire      		RF_W_wr    ,  // register file write enable signal
   	wire	[3 :0] 	RF_Ra_addr ,  // register file read address a
    wire      		RF_Ra_rd   ,  // register file read enable signal a
   	wire	[3 :0] 	RF_Rb_addr ,  // register file read address b
    wire      		RF_Rb_rd   ,  // register file read enable signal b
   	wire	[2 :0] 	Alu_s0     ,  // alu function select signal
    wire   	[3 :0] 	State         // current state output
);

	// Reference module controller(instruction, clk, D_addr, D_wr, PC_clr, PC_up, IR_ld, RF_s, RF_W_addr, RF_W_wr, RF_Ra_addr, RF_Ra_rd, RF_Rb_rd, Alu_s0, State);
	//Module under test 
	controller CT2014(instruction, clk, D_addr, D_wr, PC_clr, PC_up, IR_ld, RF_s, RF_W_addr, RF_W_wr, RF_Ra_addr, RF_Ra_rd, RF_Rb_rd, Alu_s0, State);

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