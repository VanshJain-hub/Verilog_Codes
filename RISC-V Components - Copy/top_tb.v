module top_tb;
    reg clk, reset;
    wire [31:0] display_data;
    
    top_module DUT(.clk(clk), .reset(reset), .display_data(display_data));

    //initializing the clock
    always begin
        #5 clk = ~clk;
    end

    initial begin
        clk = 0;
        reset = 0;
        #20;
        reset = 1;

        #1000 $finish;
    end
    
    initial begin
        $dumpfile("execute.vcd");
        $dumpvars();
    end

endmodule