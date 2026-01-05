module Data_Memory (
    input [31:0] A,
    input [31:0] WD,
    input clk,
    input WE,
    output [31:0] RD
);
    reg [31:0] mem [0:63];
    integer i;
    initial begin
        for (i = 0; i < 64; i = i + 1)
            mem[i] = 32'd0;
    end
    //Reading from the memory
    assign RD = mem[A[31:2]];
    // Writing in the memory
    always @(posedge clk) begin
        if (WE)
            mem[A[31:2]] <= WD;
    end
endmodule