// Top module synthesized using 4 D-FFs
module ASFF (clk, reset, set, cs, ns);
    input        clk, reset, set;
    input  [3:0] cs;
    output [3:0] ns;

    wire [3:0] d;

    assign d = (reset) ? 4'b1101 :
               (set)   ? 4'b0110 :
                        cs;

    DFF_AR_AS ff0 (.clk(clk), .reset(reset), .set(set), .d(d[0]), .q(ns[0]));
    DFF_AR_AS ff1 (.clk(clk), .reset(reset), .set(set), .d(d[1]), .q(ns[1]));
    DFF_AR_AS ff2 (.clk(clk), .reset(reset), .set(set), .d(d[2]), .q(ns[2]));
    DFF_AR_AS ff3 (.clk(clk), .reset(reset), .set(set), .d(d[3]), .q(ns[3]));

endmodule