module PC_Target (PC_Target, PC, ImmExt);
    input [31:0] PC, ImmExt;
    output [31:0] PC_Target;

    assign PC_Target = PC + ImmExt;

endmodule