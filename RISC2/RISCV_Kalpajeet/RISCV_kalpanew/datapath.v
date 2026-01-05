module datapath(
    input clk, reset,
    input RegSrc, PCSrc, ALUSrc, RegWrite,
    input [1:0] ResultSrc, ImmSrc,
    input [3:0] ALU_Control,
    input [31:0] Instr, ReadData,
    output Zero, Overflow, Carry, Negative,
    output [31:0] display_data,    
    output [31:0] PC, ALUResult, WriteData
);
    wire [31:0] PC_Plus_4, PC_Target, ImmExt, PC_Next;
    wire [31:0] RD1, RD2;
    wire [31:0] B;
    wire [31:0] Result;
    


    PC_Plus_4 u_PC_Plus_4(.PC(PC), .PC_Plus_4(PC_Plus_4));
    PC_Target u_PC_Target(.PC(PC), .ImmExt(ImmExt), .PC_Target(PC_Target));
    PC_Mux u_PC_Mux(.PCSrc(PCSrc), .PC_Target(PC_Target), .PC_Plus_4(PC_Plus_4), .PC_Next(PC_Next));
    Extend u_Extend(.Instr(Instr), .ImmSrc(ImmSrc), .ImmExt(ImmExt));

    Dff u_Dff(.PC_Next(PC_Next), .clk(clk), .reset(reset), .PC(PC));

    //Register File: (WD3 is the ResultMux output, which is 'Result')
    Register_File u_Register_File(.RA1(Instr[19:15]), .RA2(Instr[24:20]), .WA3(Instr[11:7]), .WD3(Result), .WE3(RegWrite), .clk(clk), 
    .RD1(RD1), .RD2(RD2), .display_data(display_data));

    assign WriteData = RD2;

    //ALU_Mux
    ALU_Mux u_ALU_Mux(.WD(RD2), .ImmExt(ImmExt), .ALUSrc(ALUSrc), .B(B));

    //ALU
    ALU32 u_ALU32(.A(RD1), .B(B), .ALU_Control(ALU_Control), .ALUResult(ALUResult), .Zero(Zero), .Overflow(Overflow), .Carry(Carry), .Negative(Negative));

    //ResultMux
    Result_Mux u_Result_Mux(.ALUResult(ALUResult), .ReadData(ReadData), .PC_Plus_4(PC_Plus_4), .ResultSrc(ResultSrc), .Result(Result));


endmodule