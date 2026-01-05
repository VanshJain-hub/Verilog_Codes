module single_cycle_top(
    input clk,
    input reset,
    output [31:0] display_reg  
);
    wire [31:0] PC_out;
    wire [31:0] instr;
    wire [31:0] RD;       
    wire [31:0] WD;       
    wire [31:0] ALU_out;  
    wire MemWrite;        
    Single_Cycle_Core core (
        .clk(clk),
        .reset(reset),
        .instr(instr),    
        .PC_out(PC_out),
        .MemWrite(MemWrite), 
        .ALU_out(ALU_out),   
        .WD(WD),             
        .RD(RD),
        .display_reg(display_reg)              
    );
    Instruction_Memory imem (
        .address(PC_out),
        .data(instr)
    );
    Data_mem dmem (
        .A(ALU_out),
        .WD(WD),
        .CLK(clk),
        .WE(MemWrite),
        .RD(RD)
    );

endmodule
