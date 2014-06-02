// TCES 330, Spring 2009
// Implements a register file
// Size: four 32-bit registers

module RegisterFile(Clk, Reset, W_data, W_addr, W_en, R_addr0, R_addr1, R_en0, R_en1, R_data0, R_data1, RQ0);
  input Clk;           // system clock
  input Reset;         // reset signal
  input [15:0] W_data; // data to write
  input [3:0] W_addr;  // write address
  input W_en;          // write enable
  input [3:0] R_addr0; // read address 0
  input [3:0] R_addr1; // read address 1
  input R_en0;         // read enable 0
  input R_en1;         // read enable 1
  output [15:0] R_data0;// output data 0
  output [15:0] R_data1;// output data 1
  output [15:0] RQ0;	//RF[0] contents.
  
  wire [15:0] W_d, R_d0, R_d1;
  wire [255:0] Q; //register file outputs
  
  genvar I; //we are going to generate the registers

  //reference DecoderN( W, E, Y );
  // write decoder
  DecoderN #(.N(4)) WriteDecoder(W_addr, W_en, W_d);
  
  // read decoder 0
  DecoderN #(.N(4)) ReadDecoder0(R_addr0, R_en0, R_d0);
  
  // read decoder 1
  DecoderN #(.N(4)) ReadDecoder1(R_addr1, R_en1, R_d1);

  // instantiate the 16 dial-output registers
  // reference: module RegisterOEN( Clk, Rst, Ld, I, Oe0, Oe1, Qz0, Qz1, RQ );
  generate
    for(I = 0; I < 16; I = I + 1) begin : rgen
      RegisterOEN #(.N(16)) U(Clk, Reset, W_d[I], W_Data, R_d0[I], R_d1[I], R_data0, R_data1, Q[I * 16 + 15 : I * 16]);
    end
  endgenerate

  //grab Register 0 output.
  assign RQ0 = Q[15:0];

endmodule
