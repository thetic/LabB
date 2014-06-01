module LabB(KEY, SW, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7);
  input [1:0]KEY;	//Input KEYs
  input [17:15]SW;	//Input Switches
  //7 segment hex displays
  output [0:6]HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7;

  wire Clk = KEY[0];
  wire Reset = !KEY[1];

  //Reference Processor( Clk, Reset, IR_Out, PC_Out, StateO, ALU_A, ALU_B, ALU_Out, RQ0, Mux_out );
  Processor P0( Clk, Reset, IR_Out, PC_Out, StateO, ALU_A, ALU_B, ALU_Out, RQ0, Mux_out );
  
  //use a switch case statement to determine
  //what the top 4 hex displays show
  always @(switch) begin
    case(switch)

      0 : begin
        HexMux[15:12] = 4'b0000;
        HexMux[11:4] = PC_Out;
        HexMux[3:0] = StateO;
      end

      1 : HexMux = ALU_A;

      2 : HexMux = ALU_B;

      3 : HexMux = ALU_Out;

      4 : HexMux = 16'd0;

      5 : HexMux = RQ0;

      6 : HexMux = Mux_Out;

      7 : HexMux = 16'd0;

      default: HexMux = 16'd0;

    endcase
  end//always
  
  //Reference Hex7Seg(in, HEX);
  Hex7Seg H0(IR[3:0], HEX0);
  Hex7Seg H1(IR[7:4], HEX1);
  Hex7Seg H2(IR[11:8], HEX2);
  Hex7Seg H3(IR[15:12], HEX3);

  Hex7Seg H4(HexMux[3:0], HEX4);
  Hex7Seg H5(HexMux[7:4], HEX5);
  Hex7Seg H6(HexMux[11:8], HEX6);
  Hex7Seg H7(HexMux[15:12], HEX7);

  
endmodule
