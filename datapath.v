module datapath(
    input clk,
    input clr,
    input ldA, ldB, ldM,
    input add, decB,     
    output eqz,           
    input [7:0] data_in   
);

    reg [7:0] A, B, M;

    always @(posedge clk or posedge clr)
        if (clr)
            A <= 8'b0;
        else if (ldA)
            A <= data_in;

    always @(posedge clk or posedge clr)
        if (clr)
            B <= 8'b0;
        else if (ldB)
            B <= data_in;

    always @(posedge clk or posedge clr)
        if (clr)
            M <= 8'b0;
        else if (ldM)
            M <= 8'b0;     
        else if (add)
            M <= M + A;    

    always @(posedge clk or posedge clr)
        if (clr)
            B <= 8'b0;
        else if (decB)
            B <= B - 1;

    assign eqz = (B == 0);

endmodule
