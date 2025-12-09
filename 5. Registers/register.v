module RegX(
    input clock, reset, enable,
    input [7:0] Reg_in,
    output reg [7:0] Reg_out
);
    always @(posedge clock or negedge reset) begin
        begin: REGISTER
            if(!reset) Reg_out <= 8'bx;
            else if(enable) Reg_out <= Reg_in;
        end
    end
    
endmodule