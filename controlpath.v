module controlpath(
    input clk,
    input start,
    input eqz,
    output reg ldA, ldB, ldM, add, decB, clr, done
);
    reg [2:0] state;
    parameter S0=3'b000, S1=3'b001, S2=3'b010, S3=3'b011, S4=3'b100, S5=3'b101;

    always @(posedge clk) begin
        case(state)
            S0: if(start) state <= S1; else state <= S0;
            S1: state <= S2;
            S2: state <= S3;
            S3: if(eqz) state <= S5; else state <= S4;
            S4: state <= S3;
            S5: state <= S5;
            default: state <= S0;
        endcase
    end

    always @(state) begin
        {ldA, ldB, ldM, add, decB, clr, done} = 7'b0000000;
        case(state)
            S0: clr = 1;
            S1: ldA = 1;
            S2: ldB = 1;
            S3: ldM = 1;
            S4: begin add = 1; decB = 1; end
            S5: done = 1;
        endcase
    end
endmodule
