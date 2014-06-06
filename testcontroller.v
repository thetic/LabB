// TCES 330, Spring 2014
// Testbench for the controller module
// Ben Foster
`timescale 1ns / 1 ns
module testcontroller;
  	reg 	[15:0] 	instruction,  // instruction
  	reg 			clk        ,  // clock
  	reg 			Reset	   ,  // Reset
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

	// Reference module controller(instruction, clk, Reset, D_addr, D_wr, PC_clr, PC_up, IR_ld, RF_s, RF_W_addr, RF_W_wr, RF_Ra_addr, RF_Ra_rd, RF_Rb_rd, Alu_s0, State);
	//Module under test 
	controller CT2014(instruction, clk, Reset, D_addr, D_wr, PC_clr, PC_up, IR_ld, RF_s, RF_W_addr, RF_W_wr, RF_Ra_addr, RF_Ra_rd, RF_Rb_rd, Alu_s0, State);

	initial //Clock generator
		begin
			Clock = 0;
			forever #10 Clock = !Clock;
		end

	initial //Test stimulus
		begin
			Reset = 1; //Reset for one clock
			always @(posedge Clock) Reset = 0;

			//Test NOOP instruction
			//0000 0000 0000 0000
			instruction = 16'h0000;
			#100 Reset = 1; //Reset for next instruction
			#20;

			//Test STORE instruction
			//0001 r[3:0] read from register d[7:0] store to address
 			instruction = 16'b0001010100000101
 			#100 Reset = 1; //Reset for next instruction
 			#20;

 			//Test LOAD instruction
 			//0010 d[7:0] read from address r[3:0] load into register
 			instruction = 16'b001000000110011
 			#100 Reset = 1; //Reset for next instruction
 			#20;

 			//Test ADD instruction
 			//0011 ra[3:0] + rb[3:0] = rc[3:0] store in rc register
 			instruction = 16'b0011000100100011
 			#100 Reset = 1; //Reset for next instruction
 			#20;

 			//Test SUB instruction
 			//0100 ra[3:0] - rb[3:0] = rc[3:0] store in rc register
 			instruction = 16'b0100011001010100
 			#100 Reset = 1; //Reset for next instruction
 			#20;

 			//Test HALT instruction
 			//0101 0000 0000 0000
 			instruction = 16'b0101000000000000;
 			#100 Reset = 1; //Reset for next instruction
			#20 $stop; //then run for a while
		end

	initial
		$monitor("Time is %d | Reset = %d | State = %h | D_addr = %h | D_wr = %d | PC_clr = %d | PC_up = %d | IR_ld = %d | RF_s = %d | RF_Ra_addr = %h | RF_W_wr = %d | RF_Ra_addr = %h | RF_Ra_rd = %d | RF_Rb_addr = %h | RF_Rb_rd = %d | Alu_s0 = %d", $stime, Reset, State, D_addr, D_wr, PC_clr, PC_up, IR_ld, RF_s, RF_Ra_addr, RF_W_wr, RF_Ra_addr, RF_Ra_rd, RF_Rb_addr, RF_Rb_rd, Alu_s0);



endmodule