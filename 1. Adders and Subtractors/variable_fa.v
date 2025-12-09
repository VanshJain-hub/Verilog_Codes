module variable_fa
    #(parameter N = 4)
    (
        input [N-1:0] a,b,
        input cin,
        output [N-1:0]sum,
        output cout
);

    assign {cout, sum} = a + b + cin;

endmodule