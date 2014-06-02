module LabB(KEY, SW, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7);
  input  [1 :0 ] KEY;	//Input KEYs
  input  [17:15] SW ;	//Input Switches
  //7 segment hex displays
  output [0 :6 ] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7;

  wire        Clk    =  KEY[0    ];
  wire        Reset  = !KEY[1    ];
  wire [2 :0] switch =  SW [17:15];
  wire [15:0] IR_Out              ;
  wire [15:0] ALU_A               ;
  wire [15:0] ALU_B               ;
  wire [15:0] ALU_Out             ;
  wire [15:0] RQ0                 ;
  wire [7 :0] PC_Out              ;
  wire [3 :0] StateO              ;
  wire [15:0] Mux_out             ;
  reg  [15:0] HexMux              ;

  //Reference Processor( Clk, Reset, IR_Out, PC_Out, StateO, ALU_A, ALU_B, ALU_Out, RQ0, Mux_out );
  Processor P0( Clk, Reset, IR_Out, PC_Out, StateO, ALU_A, ALU_B, ALU_Out, RQ0, Mux_out );
  
  //use a switch case statement to determine
  //what the top 4 hex displays show
  always @* begin
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

      6 : HexMux = Mux_out;

      7 : HexMux = 16'd0;

      default: HexMux = 16'd0;

    endcase
  end//always
  
  //Reference Hex7Seg(in, HEX);
  //Display IR
  Hex7seg H0(IR_Out[3:0], HEX0);
  Hex7seg H1(IR_Out[7:4], HEX1);
  Hex7seg H2(IR_Out[11:8], HEX2);
  Hex7seg H3(IR_Out[15:12], HEX3);

  //Variable display
  Hex7seg H4(HexMux[3:0], HEX4);
  Hex7seg H5(HexMux[7:4], HEX5);
  Hex7seg H6(HexMux[11:8], HEX6);
  Hex7seg H7(HexMux[15:12], HEX7);

  
endmodule
