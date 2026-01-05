module datapath (
    input  wire        clk,
    input  wire        reset,

    // Control Path inputs
    input  wire        RegWrite,
    input  wire        ALUSrc,
    input  wire        PCSrc,
    input  wire [1:0]  ResultSrc,
    input  wire [1:0]  ImmSrc,
    input  wire [3:0]  ALUControl,
    //input  wire        RegSrc,
    // From instruction memory
    input  wire [31:0] Instr,
    // From data memory
    input  wire [31:0] ReadData,
    // Datapath outputs
    output wire [31:0] PC,
    output wire [31:0] ALUResult,
    output wire [31:0] WriteData,
    output wire        Zero
);

    wire [31:0] PCNext;
    wire [31:0] PCPlus4;
    wire [31:0] PCTarget;

    wire [31:0] ImmExt;
    wire [31:0] ImmShift;

    wire [31:0] RD1, RD2;
    wire [31:0] SrcB;
    wire [31:0] Result;

    PC pc_reg (
        .clk(clk),
        .reset(reset),
        .PCNext(PCNext),
        .PC(PC)
    );


    pc_plus_4 pc4 (
        .PC(PC),
        .PCPlus4(PCPlus4)
    );

    Adder pc_adder (
        .PC(PC),
        .ImmExt(ImmExt),   
        .PCTarget(PCTarget)
    );
    assign ImmShift = ImmExt <<1;
    sign_extension immgen (
        .Instr(Instr),
        .ImmSrc(ImmSrc),
        .ImmExt(ImmExt)
    );


    PCMux pcmux (
        .PCPlus4(PCPlus4),
        .PCTarget(PCTarget),
        .PCSrc(PCSrc),
        .PCNext(PCNext)
    );


    RegFile rf (
        .clk(clk),
        .RegWrite(RegWrite),
        .A1(Instr[19:15]),
        .A2(Instr[24:20]),
        .A3(Instr[11:7]),
        .WD3(Result),
        .RD1(RD1),
        .RD2(RD2)
    );

    assign WriteData = Result;

    ALUSrcMux alusrc (
        .RD2(RD2),
        .ImmExt(ImmExt),
        .ALUSrc(ALUSrc),
        .SrcB(SrcB)
    );

    ALU alu (
        .A(RD1),
        .B(SrcB),
        .ALUControl(ALUControl),
        .Result(ALUResult),
        .Zero(Zero),
        .Carry(),      
        .Overflow(),   
        .Negative()   
    );

    ResultMux resultmux (
        .ALUResult(ALUResult),
        .ReadData(ReadData),
        .PCPlus4(PCPlus4),
        .ResultSrc(ResultSrc),
        .Result(Result)
    );

endmodule
