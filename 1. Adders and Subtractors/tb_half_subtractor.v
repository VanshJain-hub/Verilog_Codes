module tb_hs;
    reg x, y;
    wire B, D;

    half_subtractor DUT ( .a(x), .b(y), .diff(D), .borrow(B));

    initial begin
        #5;
        x=1;
        y=1;

        #5;
        x=1;
        y=0;

        #5;
        x=0;
        y=1;

        #5;
        x=0;
        y=0;

        #5 $finish;
    end

    initial begin
       $monitor("Time = %d, a = %d, b = %d | Borrow = %d, Difference = %d", $time, x, y, B, D);
       $dumpfile("execute.vcd");
       $dumpvars(); 
    end
    
endmodule