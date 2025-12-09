module tb_full_subtractor;
    reg a, b, bin;
    wire borrow, diff;

    full_subtractor DUT (.a(a), .b(b), .bin(bin), .diff(diff), .borrow(borrow));

        initial begin
        a=0;
        b=0;
        bin=0;

        #5;
        a=4'b0110;
        b=4'b0101;

        #5;
        a=4'b1101;
        b=4'b0111;

        #5;
        a=4'b0001;
        b=4'b1001;
        bin = 1;

        #5;
        a=4'b1111;
        b=4'b1111;

        #5 $finish;
    end
    
    initial begin
        $monitor("Time = %d, a = %b, b = %b, bin = %b | Borrow = %b, Difference = %b", $time, a, b, bin, borrow, diff);
    end

    initial begin
        $dumpfile("execute.vcd");
        $dumpvars();
    end

endmodule