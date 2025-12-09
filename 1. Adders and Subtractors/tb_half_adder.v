module tb_ha;
    reg x, y;
    wire C, S;

    half_adder ha( .a(x), .b(y), .cout(C), .sum(S));

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
       $monitor("Time = %d, a = %d, b = %d | Cout = %d, Sum = %d", $time, x, y, C, S);
       $dumpfile("execute.vcd");
       $dumpvars(); 
    end
    
endmodule