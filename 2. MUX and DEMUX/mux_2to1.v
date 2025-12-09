module mux_2to1(
    input a,b,
    input S1, 
    output y
);
    always@(S1) begin
        case (S1)
            'b0 : y = a;
            'b1 : y = b;
            default : y = 0;
        endcase
        
    end

endmodule