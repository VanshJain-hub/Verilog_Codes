module top_tb;
    reg clk, reset;

    top_module DUT(.clk(clk), .reset(reset));

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