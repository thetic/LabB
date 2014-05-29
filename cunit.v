/* Lab B cunit module
 * TCES 330 5/27/14
 * depends: PC, instruction_register, controller, imemlpm
 * This module 
 */

module cunit (Clock, D_addr, D_wr, RF_s, RF_W_addr, RF_W_wr, RF_Ra_addr, RF_Ra_rd, RF_Rb_addr, RF_Rb_rd, Alu_s0);

	input Clock; //System Clock
	
	output [7:0] D_addr; //Data Address.
	output [3:0] RF_W_addr; //Write address for RegisterFile.
	output [3:0] RF_Ra_addr; //Read address A for RegisterFile.
	output [3:0] RF_Rb_addr; //Read address B for RegisterFile.
	output [3:0] D_wr; //Data write enable for ramlpm.
	output RF_s; //Select line for data mux.
	output [2:0] Alu_s0; //Select line for ALU.
	output RF_W_wr; //write enable for RegisterFile.
	output RF_Ra_rd; //Read address A enable for RegisterFile.
	output RF_Rb_rd; //Read address B enable for RegisterFile.

	output [4:0] PC_Out; //PC current address
	output [15:0] IR_Out; //Instruction register output
	output [3:0] State0; //current state
	
	// internal wires
	wire [4:0] address; // PC current address
	wire [15:0] instruction; // current instruction
	wire pc_clr; // clears pc
	wire pc_up;	// pc increment
	wire ir_ld; // load instruction
	wire [15:0] mem_instruction_out;
	
	assign PC_Out = address;

	// Reference PC(O, Clear, Up, Clock);
	PC pc0(address, pc_clr, pc_up, Clock)
	
	// Reference instruction_register #(param N)(Clk, d, q);
	instruction_register instruction_register0 #(16)(Clock, mem_instruction_out, instruction, ir_ld);
	
	// Reference controller(instruction, clk, PC_clr, PC_up, IR_ld, D_addr, D_wr, RF_s, RF_W_addr, RF_W_wr, RF_Ra_addr, RF_Ra_rd, RF_Rb_addr, RF_Rb_rd, Alu_s0);
	controller state_machine0(instruction, Clock, pc_clr, pc_up, ir_ld, D_addr, D_wr, RF_s, RF_W_addr, RF_W_wr, RF_Ra_addr, RF_Ra_rd, RF_Rb_addr, RF_Rb_rd, Alu_s0);
	
	// Reference imemlpm(address, clock, q);
	imemlpm I0(address, Clock, mem_instruction_out);
	
endmodule