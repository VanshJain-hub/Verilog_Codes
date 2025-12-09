module shift_register(
    input clock, reset,
    input [7:0] Din,
    output reg [7:0] Q0, Q1, Q2, Q3
);
    always @(posedge clock or negedge reset) 
    begin: SHIFT_REGISTER
        if(!reset) begin
            Q0 <= 8'd0;
            Q1 <= 8'd0;
            Q2 <= 8'd0;
            Q3 <= 8'd0;
        end
        else begin
            Q0 <= Din;
            Q1 <= Q0;
            Q2 <= Q1;
            Q3 <= Q2;
        end
        
                
    end
    

endmodule