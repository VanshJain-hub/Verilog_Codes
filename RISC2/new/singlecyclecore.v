module Single_Cycle_Core(
    input clk,
    input reset,
    input [31:0] instr,
    output [31:0] PC_out,
    output MemWrite,
    output [31:0] ALU_out,
    output [31:0] WD,
    output [31:0] display_reg,  
    input [31:0] RD
);
    wire RegWrite, ALUSrc, Jump, Branch;
    wire [1:0] ImmSrc, ResultSrc;
    wire [3:0] ALUControl;
    Control_Unit CU (
        .op(instr[6:0]),
        .funct3(instr[14:12]),
        .funct7b5(instr[30]),
        .opb5(instr[5]),
        .Zero(Zero),
        .RegWrite(RegWrite),
        .ImmSrc(ImmSrc),
        .ALUSrc(ALUSrc),
        .MemWrite(MemWrite),
        .ResultSrc(ResultSrc),
        .Branch(Branch),
        .Jump(Jump),
        .ALUControl(ALUControl)
    );
    Core_Datapath datapath (
        .clk(clk),
        .reset(reset),
        .instr(instr),
        .RegWrite(RegWrite),
        .ImmSrc(ImmSrc),
        .ALUSrc(ALUSrc),
        .MemWrite(MemWrite),
        .ResultSrc(ResultSrc),
        .Branch(Branch),
        .Jump(Jump),
        .ALUControl(ALUControl),
        .ReadData(RD),
        .PC_out(PC_out),
        .Zero(Zero),
        .ALUOut(ALU_out),
        .WriteData(WD),
        .display_reg(display_reg)
    );

endmodule

