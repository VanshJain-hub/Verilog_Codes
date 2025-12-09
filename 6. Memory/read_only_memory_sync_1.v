module read_only_memory_sync_1(
    input [1:0] address,
    input clock,
    output reg [7:0] data_out
);

    always@(posedge clock) begin
        case (address)
            0: data_out = 4'b1110;
            1: data_out = 4'b0010;
            2: data_out = 4'b1111;
            3: data_out = 4'b0100;
            default: data_out = 4'bxxxx;
        endcase
    end
    
endmodule