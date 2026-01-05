module Result_Mux (Result, ResultSrc, ALUResult, ReadData, PC_Plus_4);
    output [31:0] Result;
    input [31:0] ALUResult, ReadData, PC_Plus_4;
    input [1:0] ResultSrc;

    assign Result = (ResultSrc == 2'b11) ? PC_Plus_4 : (ResultSrc == 2'b10) ? PC_Plus_4 
    : (ResultSrc == 2'b01) ? ReadData : ALUResult;
    
endmodule