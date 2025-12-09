module Instruction_Memory (
    input  [31:0] A,    // Address input (32-bit)
    output [31:0] RD    // Data output (32-bit)
);
    reg [31:0] mem [0:63];
    initial begin
        mem[0]  = 32'h00000000;
        mem[1]  = 32'h00000293;
        mem[2]  = 32'h00100313;
        mem[3]  = 32'h006283B3;
        mem[4]  = 32'h3E602FA3;
        mem[5]  = 32'h3FF02283;
        mem[6]  = 32'h3E702FA3;
        mem[7]  = 32'h3FF02303;
        mem[8]  = 32'hFEDFF0EF;
    end
    assign RD = mem[A[31:2]]; 
endmodule
