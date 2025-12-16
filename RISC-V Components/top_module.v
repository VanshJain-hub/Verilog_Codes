module top_module(
    input reset, clk,
    output [31:0] display_data
);
    wire Zero; 
    wire MemWrite, RegWrite, ALUSrc, PCSrc, RegSrc;
    wire [1:0] ImmSrc, ResultSrc;
    wire [3:0] ALUControl;

    wire [31:0] PC, Instr, DataAddr, WriteData, ReadData;

    wire Overflow, Carry, Negative;

    //Instantiation Modules: datapath, controlpath, instruction_memory, data_memory
    datapath DP1(.RegWrite(RegWrite), .ALUSrc(ALUSrc), .PCSrc(PCSrc), .RegSrc(RegSrc), .ImmSrc(ImmSrc), 
    .ResultSrc(ResultSrc), .ALUControl(ALUControl), .clk(clk), .reset(reset), .RD(ReadData), .Instr(Instr), 
    .Zero(Zero), .Overflow(Overflow), .Carry(Carry), .Negative(Negative), .PC(PC), .WD(WriteData), 
    .ALUResult(DataAddr), .display_data(display_data));
  
    controlpath CP1(.Zero(Zero), .Instr(Instr), .MemWrite(MemWrite), .RegWrite(RegWrite), .ALUSrc(ALUSrc), .PCSrc(PCSrc), .RegSrc(RegSrc), .ALUControl(ALUControl), .ResultSrc(ResultSrc), .ImmSrc(ImmSrc));

    Instruction_Memory IM1(.A(PC), .RD(Instr));

    Data_Memory DM1(.A(DataAddr), .WD(WriteData), .CLK(clk), .WE(MemWrite), .RD(ReadData));

endmodule