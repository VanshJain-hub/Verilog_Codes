module Data_mem(
    input [31:0] A,
    input [31:0] WD,
    input CLK,
    input WE,
    output [31:0] RD
);
    reg [31:0] MEM [0:255];

    always @(posedge CLK)
    begin
        if (WE)
            MEM[A[5:0]] <= WD;
    end

    assign RD = MEM[A[5:0]];
endmodule
