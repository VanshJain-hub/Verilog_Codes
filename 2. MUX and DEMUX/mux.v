module mux(
    input a,b,c,d,
    input S1, S2,
    output y
);
    always@(S1, S2) begin
        case ({S2, S1})
            2'b00 : y = a;
            2'b01 : y = b;
            2'b10 : y = c;
            2'b11 : y = d;
            default : y = a;
        endcase
        
    end

endmodule