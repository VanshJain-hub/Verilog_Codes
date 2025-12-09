module SFF_latch_struct (clk, reset, set, cs, ns);
    input        clk, reset, set;
    input  [3:0] cs;
    output [3:0] ns;

    wire [3:0] d;

    assign d = reset ? 4'b1101 :
               set   ? 4'b0110 :
                        cs;

    DLATCH latch0 (.en(clk), .d(d[0]), .q(ns[0]));
    DLATCH latch1 (.en(clk), .d(d[1]), .q(ns[1]));
    DLATCH latch2 (.en(clk), .d(d[2]), .q(ns[2]));
    DLATCH latch3 (.en(clk), .d(d[3]), .q(ns[3]));

endmodule
