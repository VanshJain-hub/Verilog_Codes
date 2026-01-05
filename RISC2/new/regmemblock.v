module REG_MEM_BLOCK(
    input wire [4:0] ra1,    
    input wire [4:0] ra2,    
    input wire [4:0] wa3,    
    input wire [31:0] wd3,   
    input wire we3,          
    input wire clk,          
    output reg [31:0] rd1,   
    output reg [31:0] rd2,
    output wire [31:0] display_reg  
);

    reg [31:0] regfile [0:31];
        always @(*) begin
        if (ra1 == 0)
            rd1 = 0;
        else
            rd1 = regfile[ra1];

        if (ra2 == 0)
            rd2 = 0;
        else
            rd2 = regfile[ra2];
    end
    always @(posedge clk) begin
        if (we3 && wa3 != 0)
            regfile[wa3] <= wd3;
    end
    assign display_reg = regfile[3];
endmodule

