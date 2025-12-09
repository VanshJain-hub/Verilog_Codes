module fa_using_ha (
    input a, b,
    input cin,
    output cout, 
    output sum
);
    wire w1, w2, w3;

    half_adder ha1( .a(a), .b(b), .cout(w1), .sum(w2));
    half_adder ha2( .a(w2), .b(cin), .cout(w3), .sum(sum));


    assign cout = w1 ^ w3;

endmodule