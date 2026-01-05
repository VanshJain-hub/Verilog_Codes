module PC_Mux(
    input PCSrc,
    input [31:0] PC_Target, 
    input [31:0] PC_Plus_4,
    output reg [31:0] PC_Next
);

    always@(*) begin
        case (PCSrc)
            1'b1 : PC_Next = PC_Target;
            1'b0 : PC_Next = PC_Plus_4;
        endcase
    end
    
endmodule