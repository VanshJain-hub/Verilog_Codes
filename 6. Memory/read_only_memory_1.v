module rom_4x4_async_1(
    input [1:0] address,
    output reg [3:0] data_out
);
    always@(address) begin
        case (address)
            0: data_out = 4'b1110;
            1: data_out = 4'b0010;
            2: data_out = 4'b1111;
            3: data_out = 4'b0100;
            default: data_out = 4'bxxxx;
        endcase
    end
    
endmodule