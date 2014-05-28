// TCES 330, Spring 2014
// Lab B
// Control Unit

module cunit (Clock, D_addr, D_wr, RF_s, RF_W_addr, RF_W_wr, RF_Ra_addr, RF_Ra_rd, RF_Rb_addr, RF_Rb_rd, Alu_s0);

	input Clock;
	
	// outputs per the diagram
	output [7:0] D_addr;
	output [3:0] RF_W_addr, RF_Ra_addr, RF_Rb_addr, D_wr, RF_s; 
	output [2:0] Alu_s0;
	output [0:0] RF_W_wr, RF_Ra_rd, RF_Rb_rd;
	
	// internal
	wire [4:0] address; // PC current address
	wire [15:0] instruction; // current instruction
	wire pc_clr; // clears pc
	wire pc_up;	// pc increment
	wire ir_ld; // load instruction
	wire [15:0] mem_instruction_out;
	
	// PC
	PC pc0(address, pc_clr, pc_up, Clock)
	
	// IR
	instruction_register instruction_register0 #(16)(Clock, mem_instruction_out, instruction, ir_ld);
	
	// State Machine
	controller state_machine0(instruction, Clock, pc_clr, pc_up, ir_ld, D_addr, D_wr, RF_s, 
		RF_W_addr, RF_W_wr, RF_Ra_addr, RF_Ra_rd, RF_Rb_addr, RF_Rb_rd, Alu_s0);
	
	// Instruction memory
	imemlpm (address, Clock, mem_instruction_out);
	
endmodule