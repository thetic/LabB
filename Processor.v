/*
 * TCES 330, Spring 2014
 * Final
 * Chad Condon
 * Processor module that ties together the control unit and datapath
 */

module Processor(
  input         Clk    , // system clock
  input         Reset  , // system reset
  output [15:0] IR_Out , // Instruction register
  output [4 :0] PC_Out , // Program counter
  output [3 :0] StateO , // FSM current state
  output [15:0] ALU_A  , // ALU A-Side Input
  output [15:0] ALU_B  , // ALU B-Side Input
  output [15:0] ALU_Out, // ALU current output
  output [15:0] RQ0    , // RF[0] contents
  output [15:0] Mux_out  // Datapath mux output
);

  wire [7:0] D_addr    ;
  wire [3:0] RF_W_addr ;
  wire [3:0] RF_Ra_addr;
  wire [3:0] RF_Rb_addr;
  wire       D_wr      ;
  wire       RF_s      ;
  wire [2:0] Alu_s0    ;
  wire       RF_W_wr   ;
  wire       RF_Ra_rd  ;
  wire       RF_Rb_rd  ;
  wire [7:0] S_addr    ;
  wire       S_wr      ;

  cunit cunit (
    .Clock     (Clk       ),
    .Reset     (Reset     ),
    .D_addr    (D_addr    ),
    .RF_W_addr (RF_W_addr ),
    .RF_Ra_addr(RF_Ra_addr),
    .RF_Rb_addr(RF_Rb_addr),
    .D_wr      (D_wr      ),
    .RF_s      (RF_s      ),
    .Alu_s0    (Alu_s0    ),
    .RF_W_wr   (RF_W_wr   ),
    .RF_Ra_rd  (RF_Ra_rd  ),
    .RF_Rb_rd  (RF_Rb_rd  ),
    .PC_Out    (PC_Out    ),
    .IR_Out    (IR_Out    ),
    .StateO    (StateO    ),
    .S_addr    (S_addr    ),
    .S_wr      (S_wr      )
  );

  Datapath Datapath (
    .Clock     (Clk       ),
    .Reset     (Reset     ),
    .D_addr    (D_addr    ),
    .D_wr      (D_wr      ),
    .RF_s      (RF_s      ),
    .RF_W_addr (RF_W_addr ),
    .RF_W_wr   (RF_W_wr   ),
    .RF_Ra_addr(RF_Ra_addr),
    .RF_Ra_rd  (RF_Ra_rd  ),
    .RF_Rb_addr(RF_Rb_addr),
    .RF_Rb_rd  (RF_Rb_rd  ),
    .Alu_s0    (Alu_s0    ),
    .S_addr    (S_addr    ),
    .ALU_A     (ALU_A     ),
    .ALU_B     (ALU_B     ),
    .ALU_Out   (ALU_Out   ),
    .RQ0       (RQ0       ),
    .Mux_out   (Mux_out   ),
    .S_wr      (S_wr      )
  );

endmodule
