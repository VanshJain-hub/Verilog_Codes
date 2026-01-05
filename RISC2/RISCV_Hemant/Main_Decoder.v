module Main_Decoder (
  input  [6:0] op,
  output reg RegWrite,
  output reg [1:0] ImmSrc,
  output reg ALUSrc,
  output reg MemWrite,
  output reg [1:0] ResultSrc,
  output reg Branch,
  output reg [1:0] ALUOp,
  output reg Jump
);

  always @(*) begin
    // Default values
    RegWrite = 0;
    ImmSrc   = 2'b00;
    ALUSrc   = 0;
    MemWrite = 0;
    ResultSrc= 2'b00;
    Branch   = 0;
    ALUOp    = 2'b00;
    Jump     = 0;

    case (op)
      7'b0000011: begin  // Load (LW)
        RegWrite = 1; ImmSrc = 2'b00; ALUSrc = 1;
        MemWrite = 0; ResultSrc = 2'b01;
        ALUOp = 2'b00;
      end

      7'b0100011: begin  // Store (SW)
        RegWrite = 0; ImmSrc = 2'b01; ALUSrc = 1;
        MemWrite = 1; ResultSrc = 2'b00;
        ALUOp = 2'b00;
      end

      7'b0110011: begin  // R-type
        RegWrite = 1; ALUSrc = 0; ALUOp = 2'b10;
      end

      7'b0010011: begin  // I-type arithmetic
        RegWrite = 1; ImmSrc = 2'b00; ALUSrc = 1; ALUOp = 2'b10;
      end

      7'b1100011: begin  // Branch (B-type)
        RegWrite = 0; ImmSrc = 2'b10; ALUSrc = 0;
        Branch = 1; ALUOp = 2'b01;
      end

      7'b1101111: begin  // JAL
        RegWrite = 1; ImmSrc = 2'b11; ResultSrc = 2'b10; Jump = 1;
      end

      7'b1100111: begin  // JALR
        RegWrite = 1; ImmSrc = 2'b00; ALUSrc = 1;
        ResultSrc = 2'b10; Jump = 1;
      end

      7'b0110111: begin  // LUI
        RegWrite = 1; ALUSrc = 1; ALUOp = 2'b11;
      end

      7'b0010111: begin  // AUIPC
        RegWrite = 1; ALUSrc = 1; ALUOp = 2'b01;
      end

      default: begin
        // NOP or undefined instruction
      end
    endcase
  end
endmodule



