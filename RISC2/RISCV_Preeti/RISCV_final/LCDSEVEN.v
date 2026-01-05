module seven_seg(
    input clk_100mhz,
    input reset,
    output reg [3:0] Anode_Activate,
    output reg [6:0] LED_out
);

reg [26:0] one_second_counter; 
wire one_second_enable;
reg [15:0] displayed_number;
reg [3:0] LED_BCD;
reg [19:0] refresh_counter;
wire [1:0] LED_activating_counter;
wire [31:0] result;
wire MemWrite;  

reg clk_1hz;
reg [31:0] count;

RISCV_final uut(
    .clk(clk_1hz),
    .reset(reset),
    .display_data(result)   
);

always @(posedge clk_100mhz or posedge reset) begin
    if (reset)
    begin
        clk_1hz <= 0;
        count <= 0;
     end
    else if (count==49999999)
    begin
        clk_1hz <= ~clk_1hz;
        count <=0;
    end
    else
        count <= count + 1;
end


always @(posedge clk_100mhz or posedge reset) begin
    if (reset)
        displayed_number <= 0;
    else
        displayed_number <= result[15:0]; 
end

always @(posedge clk_100mhz or posedge reset) begin
    if (reset)
        refresh_counter <= 0;
    else
        refresh_counter <= refresh_counter + 1;
end

assign LED_activating_counter = refresh_counter[19:18];


always @(*) begin
    case (LED_activating_counter)
        2'b00: begin
            Anode_Activate = 4'b0111;
            LED_BCD = displayed_number / 1000;
        end
        2'b01: begin
            Anode_Activate = 4'b1011;
            LED_BCD = (displayed_number % 1000) / 100;
        end
        2'b10: begin
            Anode_Activate = 4'b1101;
            LED_BCD = ((displayed_number % 1000) % 100) / 10;
        end
        2'b11: begin
            Anode_Activate = 4'b1110;
            LED_BCD = ((displayed_number % 1000) % 100) % 10;
        end
    endcase
end


always @(*) begin
    case (LED_BCD)
        4'd0: LED_out = 7'b0000001; 
        4'd1: LED_out = 7'b1001111; 
        4'd2: LED_out = 7'b0010010; 
        4'd3: LED_out = 7'b0000110; 
        4'd4: LED_out = 7'b1001100; 
        4'd5: LED_out = 7'b0100100; 
        4'd6: LED_out = 7'b0100000; 
        4'd7: LED_out = 7'b0001111; 
        4'd8: LED_out = 7'b0000000; 
        4'd9: LED_out = 7'b0000100; 
        default: LED_out = 7'b0000001; 
    endcase
end

endmodule