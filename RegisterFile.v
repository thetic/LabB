// TCES 330, Spring 2009
// Implements a register file
// Size: four 32-bit registers

module RegisterFile(Clk, Reset, W_data, W_addr, W_en, R_addr0, R_addr1, R_en0, R_en1, R_data0, R_data1, RQ);
  input Clk;           // system clock
  input Reset;         // reset signal
  input [15:0] W_data; // data to write
  input [3:0] W_addr;  // write address
  input W_en;          // write enable
  input [3:0] R_addr0; // read address 0
  input [3:0] R_addr1; // read address 1
  input R_en0;         // read enable 0
  input R_en1;         // read enable 1

  output [15:0] RQ;	//RF[0] contents.
  
  // only uses data from enabled register
  output [15:0] R_data0 = rd0[0] | rd0[1] | rd0[2] | rd0[3] | rd0[4] | rd0[5] | rd0[6] | rd0[7] | 
			rd0[8] | rd0[9] | rd0[10] | rd0[11] | rd0[12] | rd0[13] | rd0[14] | rd0[15];
  
  output [15:0] R_data1 = rd1[0] | rd1[1] | rd1[2] | rd1[3] | rd1[4] | rd1[5] | rd1[6] | rd1[7] | 
			rd1[8] | rd1[9] | rd1[10] | rd1[11] | rd1[12] | rd1[13] | rd1[14] | rd1[15];
  
  wire [15:0] W_d, R_d0, R_d1;
  wire [255:0] Q; //register file outputs
  
  wire [15:0]rd0[15:0]; // R_data0 and R_data1 wires for each register
  wire [15:0]rd1[15:0]; // 16 wires, each 16 bits wide
  
  
  
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
      RegisterOEN #(.N(16)) U(Clk, Reset, W_d[I], W_data, R_d0[I], R_d1[I], rd0[I][15:0], rd1[I][15:0], Q[I * 16 + 15 : I * 16]);
    end
  endgenerate

  //grab Register 0 output.
  assign RQ = Q[15:0];
  

endmodule
