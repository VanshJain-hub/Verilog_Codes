//Non-synthesizable GCD Code
module gcd #(parameter W = 16)
(
    input [W-1:0] inA, inB,
    output reg [W-1:0] vout
);
    reg [W-1:0] swap, A, B;
    integer done;

    always@(*) begin
        A = inA;
        B = inB;
        done = 0;

        while(!done) begin
            if(B < A) begin //swap variables
                // swap = A;
                // A = B;
                // B = swap;
                A <= B;
                B <= A;
            end
            else if (A!=0) begin 
                B = B - A;
            end
            else begin
                done = 1;
            end            
        end
        vout = B;
    end
    
endmodule