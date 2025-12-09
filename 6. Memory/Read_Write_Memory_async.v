module read_write_memory_async(
    input [1:0] address,
    input [3:0] data_in,
    input WE,
    output reg [3:0] data_out
);
    reg [3:0] RW [0:3];

        initial begin
        RW[0] = 4'b1110;
        RW[1] = 4'b0010;
        RW[2] = 4'b1111;
        RW[3] = 4'b0100;
    end

    always@(address or WE or data_in) begin
        if(WE)
            RW[address] = data_in;
        else   
            data_out = RW[address];
    end
endmodule