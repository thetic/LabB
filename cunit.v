/* Lab B cunit module
 * TCES 330 5/27/14
 * depends: PC, instruction_register, controller, imemlpm
 * This module 
 */

module cunit (Clock, D_addr, D_wr, RF_s, RF_W_addr, RF_W_wr, RF_Ra_addr, RF_Ra_rd, RF_Rb_addr, RF_Rb_rd, Alu_s0, IR_Out, PC_Out, StateO);

	input Clock; //System Clock
	output [7 :0] D_addr    ; //Data Address.
	output [3 :0] RF_W_addr ; //Write address for RegisterFile.
	output [3 :0] RF_Ra_addr; //Read address A for RegisterFile.
	output [3 :0] RF_Rb_addr; //Read address B for RegisterFile.
	output        D_wr      ; //Data write enable for ramlpm.
	output        RF_s      ; //Select line for data mux.
	output [2 :0] Alu_s0    ; //Select line for ALU.
	output        RF_W_wr   ; //write enable for RegisterFile.
	output        RF_Ra_rd  ; //Read address A enable for RegisterFile.
	output        RF_Rb_rd  ; //Read address B enable for RegisterFile.
	output [4 :0] PC_Out    ; //PC current address
	output [15:0] IR_Out    ; //Current instruction
	output [3 :0] StateO    ; //current state
	
	// internal wires
	wire pc_clr; // clears pc
	wire pc_up;	// pc increment
	wire ir_ld; // load instruction
	wire [15:0] mem_instruction_out;

	// Reference PC(O, Clear, Up, Clock);
	PC pc0(PC_Out, pc_clr, pc_up, Clock);
	
	// Reference instruction_register #(param N)(Clk, d, q);
	instruction_register #(.N(16)) instruction_register0 (Clock, mem_instruction_out, IR_Out, ir_ld);
	
// reference controller (
//  input      [15:0] instruction,  // instruction
//  input             clk        ,  // clock
//  output reg [7 :0] D_addr     ,  // data memory address
//  output reg        D_wr       ,  // data memory write enable signal
//  output reg        PC_clr      ,  // load instruction signal
//  output reg        PC_up      ,  // load instruction signal
//  output reg        IR_ld      ,  // load instruction signal
//  output reg        RF_s       ,  // register file select signal
//  output reg [3 :0] RF_W_addr  ,  // register file write address
//  output reg        RF_W_wr    ,  // register file write enable signal
//  output reg [3 :0] RF_Ra_addr ,  // register file read address a
//  output reg        RF_Ra_rd   ,  // register file read enable signal a
//  output reg [3 :0] RF_Rb_addr ,  // register file read address b
//  output reg        RF_Rb_rd   ,  // register file read enable signal b
//  output reg [2 :0] Alu_s0     ,  // alu function select signal
//  output     [3 :0] State         // current state output

	controller state_machine0(IR_Out, Clock, D_addr, D_wr, pc_clr, pc_up, ir_ld, RF_s, RF_W_addr, RF_W_wr, RF_Ra_addr, RF_Ra_rd, RF_Rb_addr, RF_Rb_rd, Alu_s0, StateO);
	
	// Reference imemlpm(address, clock, q);
	imemlpm I0(PC_Out, Clock, mem_instruction_out);
	
endmodule