module RISCV_TopModule_tb ();
    
    reg clk, reset;
    RISCV_TopModule u_RISCV_TopModule (
        .clk  (clk),
        .reset(reset)
    );

    initial begin 
        reset = 1;//active reset 
        clk = 0; 
        #10 reset = 0; 
        #1000;
        $finish; 
    end

        initial begin 
            $dumpfile("RISCV_TM_tb.vcd");
            $dumpvars(0, RISCV_TopModule_tb); 
        end
    
    initial begin 
        forever begin
            #5 clk = ~clk;
        end 
    end
endmodule