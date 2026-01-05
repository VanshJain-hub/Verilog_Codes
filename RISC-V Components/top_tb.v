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
        reset = 1;
        #20;
        reset = 0;

        #1000 $finish;
    end
    
    integer k;
    initial begin
        $dumpfile("execute.vcd");
        $dumpvars();
        $dumpvars(0, DUT.DP1.RF.regfile[0]);
        $dumpvars(0, DUT.DP1.RF.regfile[1]);
        $dumpvars(0, DUT.DP1.RF.regfile[2]);
        $dumpvars(0, DUT.DP1.RF.regfile[3]);
        $dumpvars(0, DUT.DP1.RF.regfile[4]);
        $dumpvars(0, DUT.DP1.RF.regfile[5]);
        $dumpvars(0, DUT.DP1.RF.regfile[6]);
        $dumpvars(0, DUT.DP1.RF.regfile[7]);
        $dumpvars(0, DUT.DP1.RF.regfile[8]);
        $dumpvars(0, DUT.DP1.RF.regfile[9]);
        $dumpvars(0, DUT.DP1.RF.regfile[10]);

    end



endmodule