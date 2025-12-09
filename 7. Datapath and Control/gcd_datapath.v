module gcd_datapath #(parameter W = 16)
(
    input clk,
    input [W-1:0] inA, inB,
    input [1:0] mux_sel_A,
    input mux_sel_B,
    input A_reg_en, B_reg_en,
    output zero, lt, 
    output [W-1:0] vout
);

    reg [W-1:0] A, B;
    wire [W-1:0] A_mux_out, B_mux_out, diff;

    // Multiplexers
    assign A_mux_out = (mux_sel_A == 2'b00) ? inA :
                       (mux_sel_A == 2'b01) ? B :
                       (mux_sel_A == 2'b10) ? diff :
                       A;

    assign B_mux_out = (mux_sel_B == 1'b0) ? inB : A;

    // Registers (update on clk edge when enabled)
    always @(posedge clk) begin
        if(A_reg_en) A <= A_mux_out;
        if(B_reg_en) B <= B_mux_out;
    end

    assign diff = A - B;
    assign zero = (B == 0);
    assign lt = (A < B);
    assign vout = A;

endmodule
