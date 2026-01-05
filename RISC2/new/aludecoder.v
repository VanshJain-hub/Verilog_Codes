module ALUDecoder(ALUOp, funct3, funct7b5, opb5, ALUControl);
    input [1:0] ALUOp;
    input [2:0] funct3;
    input funct7b5, opb5;
    output reg [3:0] ALUControl;

    always @(*)
    begin
        case (ALUOp)
            2'b00: ALUControl = 4'b0000;

            2'b01: ALUControl = 4'b0001;

            2'b10:
            begin
                if (funct3 == 3'b000)
                begin
                    if (funct7b5 == 1'b1 && opb5 == 1'b1)
                        ALUControl = 4'b0001;
                    else
                        ALUControl = 4'b0000;
                end
                else if (funct3 == 3'b001)
                    ALUControl = 4'b1010;
                else if (funct3 == 3'b010)
                    ALUControl = 4'b0101;
                else if (funct3 == 3'b011)
                    ALUControl = 4'b0110;
                else if (funct3 == 3'b100)
                    ALUControl = 4'b0100;
                else if (funct3 == 3'b101)
                begin
                    if (funct7b5 == 1'b1)
                        ALUControl = 4'b1011;
                    else
                        ALUControl = 4'b1100;
                end
                else if (funct3 == 3'b110)
                    ALUControl = 4'b0011;
                else if (funct3 == 3'b111)
                    ALUControl = 4'b0010;
                else
                    ALUControl = 4'bxxxx; 
            end
            2'b11:
            begin
                if (funct3 == 3'b000)
                    ALUControl = 4'b1000;
                else if (funct3 == 3'b001)
                    ALUControl = 4'b1001;
                else
                    ALUControl = 4'bxxxx; 
            end
            default: ALUControl = 4'bxxxx; 
        endcase
    end
endmodule

