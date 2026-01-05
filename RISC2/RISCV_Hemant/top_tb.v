module top_tb;

    reg clk;
    reg reset;
    Top_Module dut (
        .clk(clk),
        .reset(reset)
    );
    always #5 clk = ~clk;
    initial begin
        //initialize
        clk = 0;
        reset = 1;
        #20;
        reset = 0;
        #2000;

        $display("Simulation finished");
        $finish;
    end
    //monitor signals
    initial begin
        $monitor("%0t\t%h\t%h",
                  $time,
                  dut.PC,
                  dut.ALUResult);
    end
    initial begin
        $dumpfile("cpu_wave.vcd");
        $dumpvars(0,top_tb);
    end

endmodule