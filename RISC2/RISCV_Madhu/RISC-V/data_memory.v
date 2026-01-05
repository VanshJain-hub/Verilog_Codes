module data_memory (
    input  wire        clk,        
    input  wire        we,  
    input  wire [31:0] a,          
    input  wire [31:0] wd,         
    output wire [31:0] rd      
);
    reg [31:0] RAM [0:63];
    integer i;

    initial begin
        for (i = 0; i < 64; i = i + 1)
            RAM[i] = 32'h00000000;
    end
    always @(posedge clk) begin
        if (we) begin
            RAM[a[31:2]] <= wd;  
        end
    end

    assign rd = RAM[a[31:2]];

endmodule
