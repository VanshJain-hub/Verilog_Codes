
module RegFile (
  input clk,
  input RegWrite,
  input  [4:0]  A1, A2, A3,
  input  [31:0] WD3,
  output [31:0] RD1, RD2
);
  reg [31:0] rf [31:0];

  // Write
  always @(posedge clk)
    if (RegWrite && (A3 != 5'b0))
      rf[A3] <= WD3;

  // Read
  assign RD1 = (A1 == 0) ? 32'b0 : rf[A1];
  assign RD2 = (A2 == 0) ? 32'b0 : rf[A2];
endmodule
