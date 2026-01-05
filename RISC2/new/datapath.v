module Core_Datapath(
    input clk,
    input reset,
    input [31:0] instr, 
    input RegWrite,
    input [1:0] ImmSrc,
    input ALUSrc,
    input [1:0] ResultSrc,
    input MemWrite,
    input [3:0] ALUControl,
    output Zero,
    output [6:0] op,
    output [2:0] funct3,
    output funct7b5,
    output opb5,
    output [31:0] ALUOut,
    output [31:0] WriteData,
    output [31:0] display_reg,  
    input [31:0] ReadData,
    output [31:0] PC_out,
    input Branch,
    input Jump
);

    wire [31:0] Pc;
    wire [31:0] Pc_Plus_4;
    wire [31:0] Pc_Target;
    wire [31:0] Pc_Next;
    wire [31:0] ReadData1;
    wire [31:0] ReadData2;
    wire [31:0] ImmExt;
    wire [31:0] SrcB;
    wire [31:0] Result;
    assign PC_out = Pc;
    assign ALUOut = ALUResult;
    assign WriteData = ReadData2;
    assign op = instr[6:0];
    assign funct3 = instr[14:12];
    assign funct7b5 = instr[30];
    assign opb5 = instr[5];
    PC Pc_inst(
        .PCNext(Pc_Next),
        .reset(reset),
        .clk(clk),
        .Pc(Pc)
    );
    Pc_Plus_4 Pc_Plus_4_inst(
        .Pc(Pc),
        .PCPlus4(Pc_Plus_4)
    );
    Extend Extend_inst(
        .Instr(instr),
        .ImmSrc(ImmSrc),
        .ImmExt(ImmExt)
    );
    Pc_Target Pc_Target_inst(
        .ImmExt(ImmExt),
        .Pc(Pc),
        .PcTarget(Pc_Target)
    );
    assign Pc_Src = (Branch & Zero) | Jump;
    PC_Mux Pc_Mux_inst(
        .PC_Plus_4(Pc_Plus_4),
        .PC_Target(Pc_Target),
        .PCSrc(Pc_Src),
        .PC_Next(Pc_Next)
    );
    REG_MEM_BLOCK REG_MEM_BLOCK_inst(
        .clk(clk),
        .we3(RegWrite),
        .ra1(instr[19:15]),
        .ra2(instr[24:20]),
        .wa3(instr[11:7]),
        .wd3(Result),
        .rd1(ReadData1),
        .rd2(ReadData2),
        .display_reg(display_reg)
    );
    ALU_Mux ALU_Mux_inst(
        .WD(ReadData2),
        .ImmExt(ImmExt),
        .ALUSrc(ALUSrc),
        .B(SrcB)
    );
    wire [31:0] ALUResult;
    ALU ALU_inst(
        .A(ReadData1),
        .B(SrcB),
        .con(ALUControl),
        .res(ALUResult),
        .zero(Zero)
    );
    Result_Mux Result_Mux_inst(
        .ALUResult(ALUResult),
        .ReadData(ReadData),
        .Pc_Plus_4(Pc_Plus_4),
        .ResultSrc(ResultSrc),
        .Result(Result)
    );

endmodule

