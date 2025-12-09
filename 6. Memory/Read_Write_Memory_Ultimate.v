module ram_sp_sr_sw #(parameter DATA_WIDTH = 8, ADDR_WIDTH = 8, RAM_DEPTH = (1 << ADDR_WIDTH)) (
    input clock, cs, we, oe,
    input [ADDR_WIDTH-1 : 0] address,
    inout [DATA_WIDTH-1 : 0] data
);
    //cs: Chip Select [really dosen't matter here]
    //oe: Output Enable [again, dosen't matter here]
    reg [DATA_WIDTH-1 : 0] data_out;
    reg [DATA_WIDTH-1 : 0] mem [0 : RAM_DEPTH-1];

    assign data = (cs && oe && !we) ? data_out : 8'bz;

    //memory write block
    //Write operation when we=1 and cs=1
    always@(posedge clock)
    begin: MEM_WRITE
        if(cs && we) begin
            mem[address] = data;
        end
    end

    //memory read block
    always@(posedge clock)
    begin: MEM_READ
        if(cs && !we && oe) begin
            data_out = mem[address];
        end
    end
    
endmodule