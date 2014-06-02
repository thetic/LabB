module Processor( Clk, Reset, IR_Out, PC_Out, StateO, ALU_A, ALU_B, ALU_Out, RQ0, Mux_out );
  input         Clk    ;  // system clock
  input         Reset  ;  // system reset
  output [15:0] IR_Out ;  // Instruction register
  output [4 :0] PC_Out ;  // Program counter
  output [3 :0] StateO ;  // FSM current state
  output [15:0] ALU_A  ;  // ALU A-Side Input
  output [15:0] ALU_B  ;  // ALU B-Side Input
  output [15:0] ALU_Out;  // ALU current output
  output [15:0] RQ0    ;  // RF[0] contents
  output [15:0] Mux_out;  // Datapath mux output

  wire [7:0] D_addr;
  wire [3:0] RF_W_addr;
  wire [3:0] RF_Ra_addr;
  wire [3:0] RF_Rb_addr;
  wire       D_wr;
  wire       RF_s;
  wire [2:0] Alu_s0;
  wire       RF_W_wr;
  wire       RF_Ra_rd;
  wire       RF_Rb_rd;

  //need to alter to include IR_Out, PC_Out, and State0.
  //Reference cunit (Clock, D_addr, D_wr, RF_s, RF_W_addr, RF_W_wr, RF_Ra_addr, RF_Ra_rd, RF_Rb_addr, RF_Rb_rd, Alu_s0, IR_Out, PC_Out, StateO);
  cunit UNI(Clk, D_addr, D_wr, RF_s, RF_W_Addr, RF_W_wr, RF_Ra_addr, RF_Ra_rd, RF_Rb_addr, RF_Rb_rd, Alu_s0, IR_Out, PC_Out, StateO);

  //reference Datapath(Clock, Reset, D_addr, D_wr, RF_s, RF_W_addr, RF_W_wr, RF_Ra_addr, RF_Ra_rd, RF_Rb_addr, RF_Rb_rd, Alu_s0, ALU_A, ALU_B, ALU_Out, RQ0, Mux_out);
  Datapath DP(Clk, Reset, D_addr, D_wr, RF_s, RF_W_addr, RF_W_wr, RF_Ra_addr, RF_Ra_rd, RF_Rb_addr, RF_Rb_rd, Alu_s0, ALU_A, ALU_B, ALU_Out, RQ0, Mux_out);

endmodule
