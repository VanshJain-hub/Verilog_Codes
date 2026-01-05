module ALUDecoder (
  input [1:0] ALUOp,
  input [2:0] funct3,
  input funct7b5,
  input opb5,
  output reg [3:0] ALUControl
);
  always @(*) begin
    case (ALUOp)
      // ALUOp = 00 → Used for LOAD (LW) and STORE (SW)
      // Always perform ADD to compute Effective Address:
      //      ALUResult = rs1 + immediate
      2'b00: ALUControl = 4'b0000; // ADD
      // ALUOp = 01 → Used for BRANCH instructions (BEQ, BNE)
      // ALU must do SUB so that Zero flag can be checked:
      //      Zero = (rs1 - rs2 == 0)
      2'b01: ALUControl = 4'b0001; // SUB
      // ALUOp = 10 → R-type or I-type arithmetic instructions
      // funct3 and funct7 decide the exact ALU operation
    
      2'b10: begin
        case (funct3)
          
          // ADD / SUB
          // SUB only when funct7[5] = 1 and opcode[5] = 1 → R-type SUB
          // Otherwise ADD (ADDI or ADD)
          3'b000: ALUControl = (funct7b5 & opb5) ? 4'b0001 : 4'b0000;

          // SLL (Shift Left Logical)
          3'b001: ALUControl = 4'b1010;

          // SLT (Set Less Than, signed)
          3'b010: ALUControl = 4'b0101;

          // SLTU (Set Less Than, unsigned)
          3'b011: ALUControl = 4'b0110;

          // XOR
          3'b100: ALUControl = 4'b0100;

          // SRL / SRA (Shift Right Logical / Shift Right Arithmetic)
          // If funct7b5 = 1 → SRA, else SRL
          3'b101: ALUControl = (funct7b5) ? 4'b1011 : 4'b1100;

          // OR
          3'b110: ALUControl = 4'b0011;

          // AND
          3'b111: ALUControl = 4'b0010;

          default: ALUControl = 4'bxxxx;
        endcase
      end

      // ALUOp = 11 → Used for LUI and AUIPC type instructions
      // funct3 further decides exact ALU behavior
     
      2'b11: begin
        case (funct3)
          // AUIPC: PC + (imm << 12)
          3'b000: ALUControl = 4'b1000;

          // LUI: imm << 12
          3'b001: ALUControl = 4'b1001;

          default: ALUControl = 4'bxxxx;
        endcase
      end

      // DEFAULT CASE → Invalid ALUOp
    
      default: ALUControl = 4'bxxxx;
    endcase
end
endmodule
