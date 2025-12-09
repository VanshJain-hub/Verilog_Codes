module multiplier_top(
    input clk,
    input start,
    input [7:0] data_in,
    output done
);
    wire ldA, ldB, ldM, add, decB, clr, eqz;

    datapath DP(clk, clr, ldA, ldB, ldM, add, decB, eqz, data_in);
    controlpath CP(clk, start, eqz, ldA, ldB, ldM, add, decB, clr, done);

endmodule
