module Main_Decoder(op, RegWrite, ImmSrc, ALUSrc, MemWrite, ResultSrc, Branch, ALUop, Jump);
    input [6:0] op;
    output reg [1:0] ImmSrc, ResultSrc, ALUop;
    output reg MemWrite, RegWrite, ALUSrc, Branch, Jump;

    always @ (*) begin
        case (op)
            7'b0000000 : begin
                RegWrite = 1'b0;
                ImmSrc = 2'b0;
                ALUSrc = 1'b0;
                MemWrite = 1'b0;
                ResultSrc = 2'b0;
                Branch = 1'b0;
                ALUop = 2'b0;
                Jump = 1'b0;
            end

            7'b0000011 : begin
                RegWrite = 1'b1;
                ImmSrc = 2'b0;
                ALUSrc = 1'b1;
                MemWrite = 1'b0;
                ResultSrc = 2'b01;
                Branch = 1'b0;
                ALUop = 2'b0;
                Jump = 1'b0;
            end

            7'b0100011 : begin
                RegWrite = 1'b0;
                ImmSrc = 2'b01;
                ALUSrc = 1'b1;
                MemWrite = 1'b1;
                ResultSrc = 2'b0;
                Branch = 1'b0;
                ALUop = 2'b0;
                Jump = 1'b0;
            end

            7'b0110011 : begin
                RegWrite = 1'b1;
                ImmSrc = 2'bx;
                ALUSrc = 1'b0;
                MemWrite = 1'b0;
                ResultSrc = 2'b0;
                Branch = 1'b0;
                ALUop = 2'b10;
                Jump = 1'b0;
            end

            7'b0010011 : begin
                RegWrite = 1'b1;
                ImmSrc = 2'b0;
                ALUSrc = 1'b1;
                MemWrite = 1'b0;
                ResultSrc = 2'b0;
                Branch = 1'b0;
                ALUop = 2'b10;
                Jump = 1'b0;
            end

            7'b1100011 : begin
                RegWrite = 1'b0;
                ImmSrc = 2'b10;
                ALUSrc = 1'b0;
                MemWrite = 1'b0;
                ResultSrc = 2'b00;
                Branch = 1'b1;
                ALUop = 2'b01;
                Jump = 1'b0;
            end

            7'b1101111 : begin
                RegWrite = 1'b1;
                ImmSrc = 2'b11;
                ALUSrc = 1'b0;
                MemWrite = 1'b0;
                ResultSrc = 2'b10;
                Branch = 1'b0;
                ALUop = 2'b0;
                Jump = 1'b1;
            end

            7'b1100111 : begin
                RegWrite = 1'b1;
                ImmSrc = 2'b0;
                ALUSrc = 1'b1;
                MemWrite = 1'b0;
                ResultSrc = 2'b10;
                Branch = 1'b0;
                ALUop = 2'b0;
                Jump = 1'b1;
            end

            7'b0110111 : begin
                RegWrite = 1'b1;
                ImmSrc = 2'b0;
                ALUSrc = 1'b1;
                MemWrite = 0;
                ResultSrc = 2'b0;
                Branch = 1'b0;
                ALUop = 2'b1;
                Jump = 1'b0;
            end

            7'b0010111 : begin
                RegWrite = 1'b1;
                ImmSrc = 2'b0;
                ALUSrc = 1'b1;
                MemWrite = 1'b0;
                ResultSrc = 2'b0;
                Branch = 1'b0;
                ALUop = 2'b01;
                Jump = 1'b0;
            end

        endcase
    end
endmodule