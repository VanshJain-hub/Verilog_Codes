module MultiDropBus(
    input clock, reset,
    input [7:0] Data_bus,
    input A_EN, B_EN, C_EN,
    output reg [7:0] A, B, C
);
    always@(posedge clock or negedge reset)
    begin: A_REG
        if(!reset) A <= 8'd0;
        else if(A_EN == 1) A <= Data_bus;
    end

    always@(posedge clock or negedge reset)
    begin: B_REG
        if(!reset) C <= 8'd0;
        else if(B_EN == 1) B <= Data_bus;
    end
    
    always@(posedge clock or negedge reset)
    begin: C_REG
        if(!reset) C <= 8'd0;
        else if(C_EN == 1) C <= Data_bus;
    end    
endmodule