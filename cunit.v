/*
 * TCES 330, Spring 2014
 * Lab B
 * Brian Crabtree
 * Control Unit module
 */

module cunit (Clock, Reset, D_addr, D_wr, RF_s, RF_W_addr, RF_W_wr,
    RF_Ra_addr, RF_Ra_rd, RF_Rb_addr, RF_Rb_rd, Alu_s0, IR_Out, PC_Out,
    StateO);

    input         Clock     ; //System Clock
    input         Reset     ; //System reset
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
    wire pc_up; // pc increment
    wire ir_ld; // load instruction
    wire [15:0] mem_instruction_out;
    wire pc_clr;
	 wire ir_ld_wire = Reset ? 1'b1 : ir_ld;
	 wire [15:0] IR_in = Reset ? 16'b0 : mem_instruction_out;
	 wire pc_clr_wire = Reset ? 1'b1 : pc_clr;

    PC pc0(PC_Out, pc_clr_wire, pc_up, Clock);

    instruction_register #(.N(16)) instruction_register0 (Clock,
        IR_in, IR_Out, ir_ld_wire);

    controller state_machine0(IR_Out, Clock, Reset, D_addr, D_wr, pc_clr,
        pc_up, ir_ld, RF_s, RF_W_addr, RF_W_wr, RF_Ra_addr, RF_Ra_rd,
        RF_Rb_addr, RF_Rb_rd, Alu_s0, StateO);

    imemlpm I0(PC_Out, Clock, mem_instruction_out);

endmodule
