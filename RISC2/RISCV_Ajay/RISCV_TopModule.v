module RISCV_TopModule(
    input reset, clk, 
    output [31:0] display_data
);
    wire Zero; 
    wire MemWrite, RegWrite, ALUSrc, PCSrc, RegSrc;
    wire [1:0] ImmSrc, ResultSrc;
    wire [3:0] ALU_Control;

    wire [31:0] PC, Instr, ALUResult, WriteData, ReadData;

    wire Overflow, Carry, Negative;

    //Instantiation Modules: datapath, controlpath, instruction_memory, data_memory
    datapath u_datapath(.RegWrite(RegWrite), .ALUSrc(ALUSrc), .PCSrc(PCSrc), .RegSrc(RegSrc), .ImmSrc(ImmSrc), 
    .ResultSrc(ResultSrc), .ALU_Control(ALU_Control), .clk(clk), .reset(reset), .ReadData(ReadData), .Instr(Instr), 
    .Zero(Zero), .Overflow(Overflow), .Carry(Carry), .Negative(Negative), .PC(PC), .WriteData(WriteData), 
    .ALUResult(ALUResult), .display_data(display_data));
  
    controlpath u_controlpath(.Zero(Zero), .Instr(Instr), .MemWrite(MemWrite), .RegWrite(RegWrite), .ALUSrc(ALUSrc), .PCSrc(PCSrc), .RegSrc(RegSrc), .ALU_Control(ALU_Control), .ResultSrc(ResultSrc), .ImmSrc(ImmSrc));

    Instruction_Memory u_Instruction_Memory(.A(PC), .RD(Instr));

    Data_Memory u_Data_Memory(.A(ALUResult), .WD(WriteData), .clk(clk), .WE(MemWrite), .RD(ReadData));

endmodule