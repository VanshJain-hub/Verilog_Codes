module Main_Decoder(
    input  [6:0] op,
    output reg       RegWrite,
    output reg [2:0] ImmSrc,
    output reg       ALUSrc,
    output reg       MemWrite,
    output reg [1:0] ResultSrc,
    output reg       Branch,
    output reg [1:0] ALUOp,
    output reg       Jump,
    output reg       JumpReg //For JALR
);

    always @(*) begin
        case (op)

            7'b0000000 : begin //Zero
                RegWrite  = 1'b0;
                ImmSrc    = 3'b000;
                ALUSrc    = 1'b0;
                MemWrite  = 1'b0;
                ResultSrc = 2'b00;
                Branch    = 1'b0;
                ALUOp     = 2'b00;
                Jump      = 1'b0;
                JumpReg   = 1'b0;
            end

            7'b0000011 : begin //I-Type (lw/sw)
                RegWrite  = 1'b1;
                ImmSrc    = 3'b000;
                ALUSrc    = 1'b1;
                MemWrite  = 1'b0;
                ResultSrc = 2'b01;
                Branch    = 1'b0;
                ALUOp     = 2'b00;
                Jump      = 1'b0;
                JumpReg   = 1'b0;
            end

            7'b0100011 : begin //S-Type
                RegWrite  = 1'b0;
                ImmSrc    = 3'b001;
                ALUSrc    = 1'b1;
                MemWrite  = 1'b1;
                ResultSrc = 2'b00;
                Branch    = 1'b0;
                ALUOp     = 2'b00;
                Jump      = 1'b0;
                JumpReg   = 1'b0;
            end

            7'b0110011 : begin //R-Type
                RegWrite  = 1'b1;
                ImmSrc    = 3'bxxx;
                ALUSrc    = 1'b0;
                MemWrite  = 1'b0;
                ResultSrc = 2'b00;
                Branch    = 1'b0;
                ALUOp     = 2'b10;
                Jump      = 1'b0;
                JumpReg   = 1'b0;
            end

            7'b0010011 : begin //I-Type (other ops)
                RegWrite  = 1'b1;
                ImmSrc    = 3'b000;
                ALUSrc    = 1'b1;
                MemWrite  = 1'b0;
                ResultSrc = 2'b00;
                Branch    = 1'b0;
                ALUOp     = 2'b10;
                Jump      = 1'b0;
                JumpReg   = 1'b0;
            end

            7'b1100011 : begin //B-Type
                RegWrite  = 1'b0;
                ImmSrc    = 3'b010;
                ALUSrc    = 1'b0;
                MemWrite  = 1'b0;
                ResultSrc = 2'b00;
                Branch    = 1'b1;
                ALUOp     = 2'b01;
                Jump      = 1'b0;
                JumpReg   = 1'b0;
            end

            7'b1101111 : begin //JAL
                RegWrite  = 1'b1;
                ImmSrc    = 3'b011;
                ALUSrc    = 1'b0;
                MemWrite  = 1'b0;
                ResultSrc = 2'b10;
                Branch    = 1'b0;
                ALUOp     = 2'b00;
                Jump      = 1'b1;
                JumpReg   = 1'b0;
            end

            7'b1100111 : begin //JALR
                RegWrite  = 1'b1;
                ImmSrc    = 3'b000;
                ALUSrc    = 1'b1;
                MemWrite  = 1'b0;
                ResultSrc = 2'b10;
                Branch    = 1'b0;
                ALUOp     = 2'b00;
                Jump      = 1'b1;
                JumpReg   = 1'b1;
            end

            7'b0110111 : begin //LUI
                RegWrite  = 1'b1;
                ImmSrc    = 3'b100;
                ALUSrc    = 1'b1;
                MemWrite  = 1'b0;
                ResultSrc = 2'b00;
                Branch    = 1'b0;
                ALUOp     = 2'b11;
                Jump      = 1'b0;
                JumpReg   = 1'b0;
            end

            7'b0010111 : begin //AUIPC (PC+Imm)
                RegWrite  = 1'b1;
                ImmSrc    = 3'b100;
                ALUSrc    = 1'b1;
                MemWrite  = 1'b0;
                ResultSrc = 2'b11;
                Branch    = 1'b0;
                ALUOp     = 2'b00;
                Jump      = 1'b0;
                JumpReg   = 1'b0;
            end

            default : begin //Zero
                RegWrite  = 1'b0;
                ImmSrc    = 3'b000;
                ALUSrc    = 1'b0;
                MemWrite  = 1'b0;
                ResultSrc = 2'b00;
                Branch    = 1'b0;
                ALUOp     = 2'b00;
                Jump      = 1'b0;
                JumpReg   = 1'b0;
            end

        endcase
    end

endmodule
