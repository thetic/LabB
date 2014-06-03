/* Lab B Datapath module
 * TCES 330 5/27/14
 * depends: ramlpm, RegisterFile, ALU
 * This module takes in inputs from the Controller state machine
 * and does stuff to it depending on what goes into the ALU.
 */

module Datapath(Clock, Reset, D_addr, D_wr, RF_s, RF_W_addr, RF_W_wr, RF_Ra_addr, RF_Ra_rd, RF_Rb_addr, RF_Rb_rd, Alu_s0, ALU_A, ALU_B, ALU_Out, RQ0, Mux_out);
  input Clock; //System clock.
  input Reset; //System Reset.
  input  [7 :0] D_addr    ; //Data Address.
  input         D_wr      ; //Data write enable for ramlpm.
  input         RF_s      ; //Select line for data mux.
  input  [3 :0] RF_W_addr ; //Write address for Register file.
  input         RF_W_wr   ; //Write enable for RegisterFile
  input  [3 :0] RF_Ra_addr; //Read address a for RegisterFile.
  input         RF_Ra_rd  ; //Read address a enable for RegisterFile.
  input  [3 :0] RF_Rb_addr; //Read address b for RegisterFile.
  input         RF_Rb_rd  ; //Read address b enable for RegisterFile.
  input  [2 :0] Alu_s0    ; //Select line for ALU.
  output [15:0] ALU_A     ; //ALU A-Side input.
  output [15:0] ALU_B     ; //ALU B-Side input.
  output [15:0] ALU_Out   ; //ALU Output.
  output [15:0] RQ0       ; //RF[0] contents
  output [15:0] Mux_out   ; //Output of the two to one mux.
	
  wire [15:0] R_data          ; //Read data is the data output from ramlpm.
  wire [15:0] W_data          ; //Write data to the ramlpm.
  wire [15:0] Ra_data, Rb_data; //a and b data output from RegisterFile.
  wire [15:0] ALUdata         ; //output data from the ALU.
  reg  [15:0] regFileData     ; //reg that is used in the mux.

  assign ALU_A = Ra_data; //A input to ALU = RF Ra data.
  assign ALU_B = Rb_data; //B input to ALU = RF Rb data.
  assign ALU_Out = ALUdata; //output of ALU = ALUdata.
  assign Mux_out = regFileData; //output of Mux = regFileData.
  
  //reference ramlpm (address, clock, data, wren, q);
  ramlpm RLPM(D_addr, Clock, Ra_data, D_wr, R_data);
  
  //two to one mux.
  always @* begin
  
    //if RF_s is one, then the W_data going to 
    //the register file is R_data, which comes
    //from ramlpm module.
    if(RF_s) regFileData = R_data;
  	
    //if RF_s is zero, then the W_data going to
    //the register file is what comes from the
    //ALU output.
    else regFileData = ALUdata;

  end //always mux.
	
  //regerence RegisterFile(Clk, Reset, W_data, W_addr, W_en, R_addr0, R_addr1, R_en0, R_en1, R_data0, R_data1, RQ0);
  RegisterFile RegFile(Clock, Reset, regFileData, RF_W_addr, RF_W_wr, RF_Ra_addr, RF_Rb_addr, RF_Ra_rd, RF_Rb_rd, ALU_A, ALU_B, RQ0);
  
  ALU ALU (
    .Sel(Alu_s0),
    .A  (Ra_data),
    .B  (Rb_data),
    .Q  (ALUdata)
  );
	
endmodule
	