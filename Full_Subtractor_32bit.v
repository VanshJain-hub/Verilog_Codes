module Full_Subtractor_32bit(
    input [31:0] a, b,
    input bin,
    output [31:0] difference,
    output borrow
);
    
    //assign difference = a ^ (~b) ^ bin;
    //assign borrow = (~(a^b))*bin + a*b;

    //THE ABOVE CODE IS VALID ONLY FOR SINGLE BIT SUBTRACTION


    //Code for 32-bit difference
    assign {borrow, difference} = {1'b0, a} - {1'b0, b} - bin;

endmodule