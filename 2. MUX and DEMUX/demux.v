module demux(
    input [3:0]y,
    input [2:0]S,
    output reg a, b, c, d
);

    always@(S) begin
        case(S[2:0])
            2'b00: a = y[0];
            2'b01: b = y[1];
            2'b10: c = y[2];
            2'b11: d = y[3];
            default: begin
                a=0; b=0; c=0; d=0;
            end
        endcase
    end
endmodule