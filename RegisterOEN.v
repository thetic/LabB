// TECES 330, Spring 2014
// Final
// Chad Condon
// Generic Register with output enable
// Used to build register files
module RegisterOEN( Clk, Rst, Ld, I, Oe0, Oe1, Qz0, Qz1, RQ );
  parameter N = 16;

  input          Clk;
  input          Rst;
  input          Ld ; // load signal
  input          Oe0; // output enable (this is new)
  input          Oe1;
  input  [N-1:0] I  ; // data to load
  output [N-1:0] Qz0; // switched output
  output [N-1:0] Qz1; // switched output
  output [N-1:0] RQ ; // unswitched output

  reg    [N-1:0] Q  ; // standard (unswitched) output

  initial Q = 0;

  assign RQ = Q;

  // Register Procedure
  always @(posedge Clk) begin
    if (Rst == 1)
      Q <= 0;
    else if (Ld == 1)
      Q <= I;
  end

  // Output
  assign Qz0 = Oe0 ? Q : {N{1'bZ}};
  assign Qz1 = Oe1 ? Q : {N{1'bZ}};

endmodule

