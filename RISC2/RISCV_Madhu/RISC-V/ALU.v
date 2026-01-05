module ALU (
  input  [31:0] A, B,
  input  [3:0] ALUControl,
  output wire [31:0] Result,
  output Zero, Carry, Overflow, Negative
);
  reg [32:0] tmp;
  wire slt, sltu;
  
  // Set-less-than logic
  assign slt  = (A[31] == B[31]) ? (A < B) : A[31];
  assign sltu = (A < B);
  
  always @(*) begin
    case (ALUControl)
      4'b0000: tmp = A + B;                    // ADD
      4'b0001: tmp = A - B;                    // SUB
      4'b0010: tmp = {1'b0, (A & B)};          // AND
      4'b0011: tmp = {1'b0, (A | B)};          // OR
      4'b0100: tmp = {1'b0, (A ^ B)};          // XOR
      4'b0101: tmp = {31'b0, slt};             // SLT
      4'b0110: tmp = {31'b0, sltu};            // SLTU
      4'b0111: tmp = {A[31:12], 12'b0};        // LUI-type
      4'b1000: tmp = A + {B[31:12], 12'b0};    // AUIPC
      4'b1001: tmp = {B[31:12], 12'b0};        // LUI
      4'b1010: tmp = {1'b0, (A << B)};         // SLL
      4'b1011: tmp = {1'b0, (A >> B)};         // SRL
      4'b1100: tmp = {1'b0, ($signed(A) >>> B)}; // SRA
      default: tmp = 33'bx;
    endcase
  end

  assign Result   = tmp[31:0];
  assign Carry    = tmp[32];
  assign Zero     = (Result == 0);
  assign Negative = Result[31];

  // Overflow detection
  assign Overflow = (ALUControl == 4'b0000) ? 
                    ((~A[31] & ~B[31] & Result[31]) | (A[31] & B[31] & ~Result[31])) :
                    (ALUControl == 4'b0001) ? 
                    ((A[31] & ~B[31] & ~Result[31]) | (~A[31] & B[31] & Result[31])) :
                    1'b0;
endmodule
