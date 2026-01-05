module Main_Decoder(
    input [6:0] op,
    output reg RegWrite,
    output reg [1:0] ImmSrc,
    output reg ALUSrc,
    output reg MemWrite,
    output reg [1:0] ResultSrc,
    output reg Branch,
    output reg [1:0] ALUOp,
    output reg Jump
);
    always@(*) begin
        case(op)
            7'b0000000 : begin RegWrite = 1'b0; ImmSrc = 2'b00; ALUSrc = 1'b0; MemWrite = 1'b0; ResultSrc = 2'b00; Branch = 1'b0; ALUOp = 2'b00; Jump = 1'b0; end //Zero
            7'b0000011 : begin RegWrite = 1'b1; ImmSrc = 2'b00; ALUSrc = 1'b1; MemWrite = 1'b0; ResultSrc = 2'b01; Branch = 1'b0; ALUOp = 2'b00; Jump = 1'b0; end //I-Type (lw/sw)
            7'b0100011 : begin RegWrite = 1'b0; ImmSrc = 2'b01; ALUSrc = 1'b1; MemWrite = 1'b1; ResultSrc = 2'b00; Branch = 1'b0; ALUOp = 2'b00; Jump = 1'b0; end //S-Type
            7'b0110011 : begin RegWrite = 1'b1; ImmSrc = 2'bxx; ALUSrc = 1'b0; MemWrite = 1'b0; ResultSrc = 2'b00; Branch = 1'b0; ALUOp = 2'b10; Jump = 1'b0; end //R-Type
            7'b0010011 : begin RegWrite = 1'b1; ImmSrc = 2'b00; ALUSrc = 1'b1; MemWrite = 1'b0; ResultSrc = 2'b00; Branch = 1'b0; ALUOp = 2'b10; Jump = 1'b0; end //I-Type (other ops)
            7'b1100011 : begin RegWrite = 1'b0; ImmSrc = 2'b10; ALUSrc = 1'b0; MemWrite = 1'b0; ResultSrc = 2'b00; Branch = 1'b1; ALUOp = 2'b01; Jump = 1'b0; end //B-Type
            7'b1101111 : begin RegWrite = 1'b1; ImmSrc = 2'b11; ALUSrc = 1'b0; MemWrite = 1'b0; ResultSrc = 2'b10; Branch = 1'b0; ALUOp = 2'b00; Jump = 1'b1; end //JAL
            7'b1100111 : begin RegWrite = 1'b1; ImmSrc = 2'b00; ALUSrc = 1'b1; MemWrite = 1'b0; ResultSrc = 2'b10; Branch = 1'b0; ALUOp = 2'b00; Jump = 1'b1; end //JALR
            7'b0110111 : begin RegWrite = 1'b1; ImmSrc = 2'b00; ALUSrc = 1'b1; MemWrite = 1'b0; ResultSrc = 2'b00; Branch = 1'b0; ALUOp = 2'b11; Jump = 1'b0; end //LUI
            7'b0010111 : begin RegWrite = 1'b1; ImmSrc = 2'b00; ALUSrc = 1'b1; MemWrite = 1'b0; ResultSrc = 2'b00; Branch = 1'b0; ALUOp = 2'b01; Jump = 1'b0; end //AUIPC
            default : begin RegWrite = 1'b0; ImmSrc = 2'b00; ALUSrc = 1'b0; MemWrite = 1'b0; ResultSrc = 2'b00; Branch = 1'b0; ALUOp = 2'b00; Jump = 1'b0; end //Zero
        endcase
    end
    
endmodule