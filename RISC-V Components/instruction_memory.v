module Instruction_Memory (
    input  [31:0] A,    // Address input (32-bit)
    output [31:0] RD    // Data output (32-bit)
);

    reg [31:0] mem [0:13];
    initial begin
        // mem[0] = 32'h000000B3;  
        // mem[1] = 32'h00000233;  
        // mem[2] = 32'h00A08113;  
        // mem[3] = 32'h000081B3;  
        // mem[4] = 32'h00218863;  
        // mem[5] = 32'h00418233;  
        // mem[6] = 32'h00118193;
        // mem[7] = 32'hfe000ae3;
        // mem[8] = 32'h000200b3;
        // mem[9] = 32'h00a0a023;
        // mem[10] = 32'h0000a083;      
        $readmemh("test_prog.hex", mem);
    end  

    assign RD = mem[A[31:2]];

endmodule