// TCES 330, Spring 2009
// Implements a register file
// Size: four 32-bit registers

module RegisterFile(Clk, Reset, W_data, W_addr, W_en, R_addr0, R_addr1, R_en0, R_en1, R_data0, R_data1);
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
  
  wire [15:0] W_d, R_d0, R_d1;
  
  // write decoder
  DecoderN #(.N(4)) WriteDecoder(W_addr, W_en, W_d);
  
  // read decoder 0
  DecoderN #(.N(4)) ReadDecoder0(R_addr0, R_en0, R_d0);
  
  // read decoder 1
  DecoderN #(.N(4)) ReadDecoder1(R_addr1, R_en1, R_d1);
  
  // registers with output enable
  // reference: module RegisterOEN( Clk, Rst, Ld, I, Oe, Qz );
  RegisterOEN #(.N(16)) Reg0(Clk, Reset, W_d[0], W_data, R_d0[0], R_d1[0], R_data0, R_data1);
  RegisterOEN #(.N(16)) Reg1(Clk, Reset, W_d[1], W_data, R_d0[1], R_d1[1], R_data0, R_data1);
  RegisterOEN #(.N(16)) Reg2(Clk, Reset, W_d[2], W_data, R_d0[2], R_d1[2], R_data0, R_data1);
  RegisterOEN #(.N(16)) Reg3(Clk, Reset, W_d[3], W_data, R_d0[3], R_d1[3], R_data0, R_data1);
  RegisterOEN #(.N(16)) Reg4(Clk, Reset, W_d[4], W_data, R_d0[4], R_d1[4], R_data0, R_data1);
  RegisterOEN #(.N(16)) Reg5(Clk, Reset, W_d[5], W_data, R_d0[5], R_d1[5], R_data0, R_data1);
  RegisterOEN #(.N(16)) Reg6(Clk, Reset, W_d[6], W_data, R_d0[6], R_d1[6], R_data0, R_data1);
  RegisterOEN #(.N(16)) Reg7(Clk, Reset, W_d[7], W_data, R_d0[7], R_d1[7], R_data0, R_data1);
  RegisterOEN #(.N(16)) Reg8(Clk, Reset, W_d[8], W_data, R_d0[8], R_d1[8], R_data0, R_data1);
  RegisterOEN #(.N(16)) Reg9(Clk, Reset, W_d[9], W_data, R_d0[9], R_d1[9], R_data0, R_data1);
  RegisterOEN #(.N(16)) Reg10(Clk, Reset, W_d[10], W_data, R_d0[10], R_d1[10], R_data0, R_data1);
  RegisterOEN #(.N(16)) Reg11(Clk, Reset, W_d[11], W_data, R_d0[11], R_d1[11], R_data0, R_data1);
  RegisterOEN #(.N(16)) Reg12(Clk, Reset, W_d[12], W_data, R_d0[12], R_d1[12], R_data0, R_data1);
  RegisterOEN #(.N(16)) Reg13(Clk, Reset, W_d[13], W_data, R_d0[13], R_d1[13], R_data0, R_data1);
  RegisterOEN #(.N(16)) Reg14(Clk, Reset, W_d[14], W_data, R_d0[14], R_d1[14], R_data0, R_data1);
  RegisterOEN #(.N(16)) Reg15(Clk, Reset, W_d[15], W_data, R_d0[15], R_d1[15], R_data0, R_data1);
  
endmodule
