/*
 * TCES 330, Spring 2014
 * Final
 * Chad Condon
 * This module takes in inputs from the Controller state machine
 * and does stuff to it depending on what goes into the ALU.
 */
module Datapath(
  input         Clock     , // System clock.
  input         Reset     , // System Reset.
  input  [7 :0] D_addr    , // Data Address.
  input         D_wr      , // Data write enable for ramlpm.
  input         RF_s      , // Select line for data mux.
  input  [3 :0] RF_W_addr , // Write address for Register file.
  input         RF_W_wr   , // Write enable for RegisterFile
  input  [3 :0] RF_Ra_addr, // Read address a for RegisterFile.
  input         RF_Ra_rd  , // Read address a enable for RegisterFile.
  input  [3 :0] RF_Rb_addr, // Read address b for RegisterFile.
  input         RF_Rb_rd  , // Read address b enable for RegisterFile.
  input         S_wr      , // stack write enable
  input  [2 :0] Alu_s0    , // Select line for ALU.
  input  [7 :0] S_addr    , // Stack pointer address.
  output [15:0] ALU_A     , // ALU A-Side input.
  output [15:0] ALU_B     , // ALU B-Side input.
  output [15:0] ALU_Out   , // ALU Output.
  output [15:0] RQ0       , // RF[0] contents
  output [15:0] Mux_out     // Output of the two to one mux.
);


  wire [15:0] R_data     ; // Read data is the data output from ramlpm
  wire [15:0] W_data     ; // Write data to the ramlpm.
  wire [15:0] Ra_data    ; // a data output from RegisterFile.
  wire [15:0] Rb_data    ; // b data output from RegisterFile.
  wire [15:0] ALUdata    ; // output data from the ALU.
  wire [15:0] S_out      ; // stack output data.
  reg  [15:0] regFileData; // reg that is used in the mux.

  assign ALU_A   = Ra_data    ; //A input to ALU = RF Ra data.
  assign ALU_B   = Rb_data    ; //B input to ALU = RF Rb data.
  assign ALU_Out = ALUdata    ; //output of ALU = ALUdata.
  assign Mux_out = regFileData; //output of Mux = regFileData.

  initial
    begin
      regFileData = 0;
    end

  //two to one mux.
  always @(*)
    begin
      if(RF_s)
        begin
          regFileData = R_data;
        end
      else
        begin
          regFileData = ALUdata;
        end
    end //always mux.

  ramlpm RLPM (
    D_addr,
    Clock,
    Ra_data,
    D_wr,
    R_data
  );

  RegisterFile RegFile (
    .Clk    (Clock      ),
    .Reset  (Reset      ),
    .W_data (regFileData),
    .W_addr (RF_W_addr  ),
    .W_en   (RF_W_wr    ),
    .R_addr0(RF_Ra_addr ),
    .R_addr1(RF_Rb_addr ),
    .R_en0  (RF_Ra_rd   ),
    .R_en1  (RF_Rb_rd   ),
    .R_data0(ALU_A      ),
    .R_data1(ALU_B      ),
    .RQ     (RQ0        )
  );

  ALU ALU (
    .Sel(Alu_s0 ),
    .A  (Ra_data),
    .B  (Rb_data),
    .Q  (ALUdata)
  );

  stack_memory stack_memory (
    .address(S_addr ),
    .clock  (Clock  ),
    .data   (Ra_data),
    .wren   (S_wr   ),
    .q      (S_out  )
  );
endmodule

