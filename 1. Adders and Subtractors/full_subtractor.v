module full_subtractor(
    input a, b, bin,
    output diff, borrow
);
    assign diff = a^b^bin;
    assign borrow = (~a)*b + (~(a^b))*bin;
endmodule