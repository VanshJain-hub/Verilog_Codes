module RISCV_final_tb ();
    
    reg clk, reset;
    RISCV_final u_RISCV_final (
        .clk  (clk),
        .reset(reset)
    );

    initial begin 
        reset = 1; 
        clk = 0; 
        #10 reset = 0; 
        #1000;
        $finish; 
    end

        initial begin 
            $dumpfile("RISCV_final_tb.vcd");
            $dumpvars(0, RISCV_final_tb); 
        end
    
    initial begin 
        forever begin
            #5 clk = ~clk;
        end 
    end
endmodule