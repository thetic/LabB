/*
 * TCES 330, Spring 2014
 * Final
 * Chad Condon
 * Control Unit module
 */
module cunit (
  input         Clock     , // System Clock
  input         Reset     , // System reset
  output [7 :0] D_addr    , // Data Address.
  output [3 :0] RF_W_addr , // Write address for RegisterFile.
  output [3 :0] RF_Ra_addr, // Read address A for RegisterFile.
  output [3 :0] RF_Rb_addr, // Read address B for RegisterFile.
  output        D_wr      , // Data write enable for ramlpm.
  output        RF_s      , // Select line for data mux.
  output [2 :0] Alu_s0    , // Select line for ALU.
  output        RF_W_wr   , // write enable for RegisterFile.
  output        RF_Ra_rd  , // Read address A enable for RegisterFile.
  output        RF_Rb_rd  , // Read address B enable for RegisterFile.
  output [4 :0] PC_Out    , // PC current address
  output [15:0] IR_Out    , // Current instruction
  output [3 :0] StateO    , // current state
  output [7 :0] S_addr    , // stack pointer address
  output        S_wr        // stack write enable
);

  // internal wires
  wire        pc_up              ; // pc increment
  wire        ir_ld              ; // load instruction
  wire [15:0] mem_instruction_out;
  wire        pc_clr             ;
  wire        SP_inc             ;
  wire        ir_ld_wire  = Reset ? 1'b1  : ir_ld              ;
  wire [15:0] IR_in       = Reset ? 16'b0 : mem_instruction_out;
  wire        pc_clr_wire = Reset ? 1'b1  : pc_clr             ;

  PC pc0 (
    PC_Out,
    pc_clr_wire,
    pc_up,
    Clock
  );

  SP SP (
    .clk   (Clock ),
    .rst   (Reset ),
    .SP_inc(SP_inc),
    .SP_dec(1'b0  ),
    .q     (S_addr)
  );

  instruction_register #(.N(16)) instruction_register0 (
    Clock,
    IR_in,
    IR_Out,
    ir_ld_wire
  );

  controller controller (
    .instruction(IR_Out    ),
    .clk        (Clock     ),
    .Reset      (Reset     ),
    .D_addr     (D_addr    ),
    .D_wr       (D_wr      ),
    .PC_clr     (pc_clr    ),
    .PC_up      (pc_up     ),
    .IR_ld      (ir_ld     ),
    .RF_s       (RF_s      ),
    .RF_W_addr  (RF_W_addr ),
    .RF_W_wr    (RF_W_wr   ),
    .RF_Ra_addr (RF_Ra_addr),
    .RF_Ra_rd   (RF_Ra_rd  ),
    .RF_Rb_addr (RF_Rb_addr),
    .RF_Rb_rd   (RF_Rb_rd  ),
    .Alu_s0     (Alu_s0    ),
    .State      (StateO    ),
    .SP_inc     (SP_inc    ),
    .S_wr       (S_wr      )
  );

  imemlpm I0(
    PC_Out,
    Clock,
    mem_instruction_out
  );

endmodule
