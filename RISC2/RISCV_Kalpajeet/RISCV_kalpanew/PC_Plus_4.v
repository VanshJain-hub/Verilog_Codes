module PC_Plus_4 (PC_Plus_4, PC);

    output [31:0] PC_Plus_4;
    input [31:0] PC;

    assign PC_Plus_4 = PC + 32'd4;

endmodule