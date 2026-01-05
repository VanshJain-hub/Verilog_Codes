module Dff(PC_Next, clk, reset, PC);
    input [31:0] PC_Next;
    input clk, reset;
    output reg [31:0] PC;

    always @ (posedge clk or posedge reset) begin
        if(reset) PC <= 32'b0;
        else PC <= PC_Next;

    end

endmodule