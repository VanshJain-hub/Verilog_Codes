module ALUDecoder (ALU_Control, ALUOp, funct3, funct7b5, opb5);
    output reg [3:0] ALU_Control;
    input wire funct7b5, opb5;
    input [2:0] funct3;
    input [1:0] ALUOp;

    always @ (*) begin

        if (ALUOp == 2'b00)
            ALU_Control = 4'b0000;

        else if (ALUOp == 2'b01)
            ALU_Control = 4'b0001;

        else if (ALUOp == 2'b10) begin
            case (funct3)
                3'b000 : ALU_Control = (funct7b5 & opb5) ? 4'b0001 :  4'b0000;
                3'b001 : ALU_Control = 4'b1010;
                3'b010 : ALU_Control = 4'b0101;
                3'b011 : ALU_Control = 4'b0110;
                3'b100 : ALU_Control = 4'b0100;
                3'b101 : ALU_Control = funct7b5 ? 4'b1011 : 4'b1100;
                3'b110 : ALU_Control = 4'b0011;
                3'b111 : ALU_Control = 4'b0010;
                default : ALU_Control = 4'bx;

            endcase
        end

        else if (ALUOp == 2'b11) begin
            case (funct3)
                3'b000 : ALU_Control = 4'b1000;
                3'b001 : ALU_Control = 4'b1001;

                default : ALU_Control = 4'bx;
            endcase
        end

        else ALU_Control = 4'bx;
    end
endmodule