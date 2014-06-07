/*
 * TCES 330, Spring 2014
 * Lab B
 * Chad Condon
 * Controller state machine.
 */
module controller (
  input      [15:0] instruction,  // instruction
  input             clk        ,  // clock
  input             Reset      ,  // Reset
  output reg [7 :0] D_addr     ,  // data memory address
  output reg        D_wr       ,  // data memory write enable signal
  output reg        PC_clr      , // load instruction signal
  output reg        PC_up      ,  // load instruction signal
  output reg        IR_ld      ,  // load instruction signal
  output reg        RF_s       ,  // register file select signal
  output reg [3 :0] RF_W_addr  ,  // register file write address
  output reg        RF_W_wr    ,  // register file write enable signal
  output reg [3 :0] RF_Ra_addr ,  // register file read address a
  output reg        RF_Ra_rd   ,  // register file read enable signal a
  output reg [3 :0] RF_Rb_addr ,  // register file read address b
  output reg        RF_Rb_rd   ,  // register file read enable signal b
  output reg [2 :0] Alu_s0     ,  // alu function select signal
  output     [3 :0] State         // current state output
);

  // name states:
  localparam INIT   = 4'd0;
  localparam FETCH  = 4'd1;
  localparam DECODE = 4'd2;
  localparam NOOP   = 4'd3;
  localparam LOAD_A = 4'd4;
  localparam LOAD_B = 4'd5;
  localparam STORE  = 4'd6;
  localparam ADD    = 4'd7;
  localparam SUB    = 4'd8;
  localparam HALT   = 4'd9;

  // store states:
  reg [3:0] current_state;
  reg [3:0] next_state   ;

  initial
    begin
      D_addr     = 0;
      D_wr       = 0;
      PC_clr     = 0;
      PC_up      = 0;
      IR_ld      = 0;
      RF_s       = 0;
      RF_W_addr  = 0;
      RF_W_wr    = 0;
      RF_Ra_addr = 0;
      RF_Ra_rd   = 0;
      RF_Rb_addr = 0;
      RF_Rb_rd   = 0;
      Alu_s0     = 0;
    end

  assign State = current_state; // output current state

  // state table:
  always @*
    begin
      PC_clr     = 0;
      IR_ld      = 0;
      PC_up      = 0;
      RF_W_addr  = 0;
      RF_W_wr    = 0;
      RF_Ra_addr = 0;
      RF_Ra_rd   = 0;
      RF_Rb_addr = 0;
      RF_Rb_rd   = 0;
      Alu_s0     = 0;
      D_addr     = 0;
      D_wr       = 0;
      RF_s       = 0;

      case (current_state)
        INIT:
          begin
            next_state = FETCH;
            PC_clr     = 1    ;
          end

        FETCH:
          begin
            next_state = DECODE;
            IR_ld      = 1     ;
            PC_up      = 1     ;
          end

        DECODE:
          begin
            case (instruction[15:12])
              4'b0000:
                begin
                  next_state = NOOP;
                end

              4'b0010:
                begin
                  next_state = LOAD_A           ;
                  D_addr     = instruction[11:4];
                  RF_s       = 1                ;
                  RF_W_addr  = instruction[3 :0];
                end

              4'b0001:
                begin
                  next_state = STORE            ;
                  D_addr     = instruction[11:4];
                  RF_s       = 1                ;
                  RF_W_addr  = instruction[3 :0];
                  RF_W_wr    = 1                ;
                end

              4'b0011:
                begin
                  next_state = ADD              ;
                  D_addr     = instruction[7 :0];
                  D_wr       = 1                ;
                  RF_Ra_addr = instruction[11:8];
                  RF_Ra_rd   = 1                ;
                  RF_Rb_addr = instruction[7 :4];
                  RF_Rb_rd   = 1                ;
                  Alu_s0     = 1                ;
                end

              4'b0100:
                begin
                  next_state = SUB              ;
                  RF_W_addr  = instruction[3 :0];
                  RF_W_wr    = 1                ;
                  RF_Ra_addr = instruction[11:8];
                  RF_Ra_rd   = 1                ;
                  RF_Rb_addr = instruction[7 :4];
                  RF_Rb_rd   = 1                ;
                  Alu_s0     = 3'd2             ;
                end

              4'b0101:
                begin
                  next_state = HALT;
                end

              default:
                begin
                  next_state = NOOP;
                end

            endcase
          end

        NOOP:
          begin
            next_state = FETCH;
          end

        LOAD_A:
          begin
        RF_W_addr  = instruction[3:0];
        D_addr     = instruction[11:4];
        RF_s       = 1;

            next_state = LOAD_B;
          end

        LOAD_B:
          begin
        RF_W_wr    = 1;
        RF_W_addr  = instruction[3:0];
        D_addr     = instruction[11:4];
        RF_s       = 1;

            next_state = FETCH;
          end

        STORE:
          begin
        RF_Ra_addr = instruction[11:8];
        RF_Ra_rd   = 1;
        D_addr     = instruction[7:0];
        D_wr       = 1;

            next_state = FETCH;
          end

        ADD:
          begin
        RF_W_addr = instruction[3:0];
        RF_W_wr    = 1;
        RF_Ra_addr = instruction[11:8];
        RF_Ra_rd   = 1;
        RF_Rb_addr = instruction[7:4];
        RF_Rb_rd   = 1;
        Alu_s0     = 1;
            next_state = FETCH;
          end

        SUB:
          begin
        RF_W_addr = instruction[3:0];
        RF_W_wr = 1;
        RF_Ra_addr = instruction[11:8];
        RF_Ra_rd = 1;
        RF_Rb_addr = instruction[7:4];
        RF_Rb_rd = 1;
        Alu_s0 = 2;
            next_state = FETCH;
       end

        HALT:
          begin
            next_state = HALT;
          end

        default:
          begin
            next_state = INIT;
          end
      endcase
    end

    // flop:
    always @(posedge clk)
      begin
      if(Reset)
        begin
          current_state <= INIT;
        end
      else
        begin
          current_state <= next_state;
        end
      end

endmodule
