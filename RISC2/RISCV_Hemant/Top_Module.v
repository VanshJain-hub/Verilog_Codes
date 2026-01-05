module Top_Module(
input clk,
input reset,
output [31:0] display_result
);
//datapath-datamem
wire [31:0]PC;
wire [31:0]Instr;
wire [31:0]ReadData;
wire [31:0]WriteData;
wire [31:0]ALUResult;
//datapath-controlpath
wire Zero;
wire        RegWrite;
wire        ALUSrc;
wire        PCSrc;
wire [1:0]  ResultSrc;
wire [1:0]  ImmSrc;    
wire [3:0]  ALUControl;
wire        MemWrite;

assign display_result = WriteData;

InstrMem imem(
    .A(PC),  
    .RD(Instr)
);
control_path ctrl(
    .Instr(Instr),
    .zero(Zero),
    .RegWrite(RegWrite),
    .ALUSrc(ALUSrc),
    .PCSrc(PCSrc),
    .ResultSrc(ResultSrc),
    .ImmSrc(ImmSrc),       
    .ALUControl(ALUControl),
    .MemWrite(MemWrite)
);
datapath dp(
    .clk(clk),
    .reset(reset),
    .RegWrite(RegWrite),
    .ALUSrc(ALUSrc),
    .PCSrc(PCSrc),
    .ResultSrc(ResultSrc),
    .ImmSrc(ImmSrc),
    .ALUControl(ALUControl),
    .Instr(Instr),
    .ReadData(ReadData),
    .PC(PC),
    .ALUResult(ALUResult),
    .WriteData(WriteData),
    .Zero(Zero)
);
data_memory dmem(
    .clk(clk),
    .we(MemWrite),  
    .a(ALUResult),          
    .wd(WriteData),         
    .rd(ReadData)
);
endmodule
