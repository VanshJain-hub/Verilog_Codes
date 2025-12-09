// D-FF with asynchronous reset and asynchronous set
module DFF_AR_AS (clk, reset, set, d, q);
    input  clk, reset, set, d;
    output reg q;

    always @(posedge clk or posedge reset or posedge set) begin
        if (reset)
            q <= 1'b0; 
        else if (set)
            q <= 1'b1;      
        else
            q <= d;
    end
endmodule
