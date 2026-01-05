module ALU32 (A, B, ALU_Control, Zero, Overflow, Carry, Negative, ALUResult);
    input [31:0] A, B;
    input [3:0] ALU_Control;
    output reg Zero, Overflow, Carry, Negative;
    output reg [31:0] ALUResult;

    reg [32:0] sum;
    reg slt, sltu;

    always @ (*) begin

        slt = (A[31] == B[31]) ? (A < B) : A[31];
        sltu = A < B;

        Carry = 1'b0; Overflow = 1'b0; Zero = 1'b0; ALUResult = 32'b0; Negative = 1'b0;

        case(ALU_Control)
            
            4'b0000: begin
                sum = {1'b0, A} + {1'b0, B};
                ALUResult = sum[31:0];
                Carry = sum[32];
                Overflow = (~A[31] & B[31] & ALUResult[31]) | (A[31] & B[31] & ~ALUResult[31]);
            end

            4'b0001: begin
                /*diff = {1'b0, A} - {1'b0, B};
                Result = diff[31:0];
                Negative = Result[31];*/
                ALUResult = A - B;
                Negative = ALUResult[31];
                Overflow = (A[31] & ~B[31] & ~ALUResult[31]) | (~A[31] & B[31] & ALUResult[31]);
            end

            4'b0010 : ALUResult = A & B;
            4'b0011 : ALUResult = A | B;
            4'b0100 : ALUResult = A ^ B;
            4'b0101 : ALUResult = {31'b0, slt};
            4'b0110 : ALUResult = {31'b0, sltu};
            4'b0111 : ALUResult = {A[31:12], 12'b0};
            4'b1000 : ALUResult = A + {B[31:12], 12'b0};
            4'b1001 : ALUResult = {B[31:12], 12'b0};
            4'b1010 : ALUResult = $signed(A) >> B;
            4'b1011 : ALUResult = A << B;

            default : ALUResult = 32'bx;
        endcase

        Zero = (ALUResult == 32'b0);
    end
endmodule