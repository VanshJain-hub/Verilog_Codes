module read_only_memory_sync_2(
    input [1:0] address,
    input clock,
    output reg [7:0] data_out
);

    reg [3:0] ROM [0:3];

    initial begin
        ROM[0] = 4'b1110;
        ROM[1] = 4'b0010;
        ROM[2] = 4'b1111;
        ROM[3] = 4'b0100;
    end


    always@(posedge clock) begin
        data_out = ROM[address];
    end
    
endmodule