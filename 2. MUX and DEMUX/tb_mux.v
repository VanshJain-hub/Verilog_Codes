module tb_mux;
    reg a,b,c,d;
    reg S1, S2;
    reg y;

    mux DUT ( .a(a), .b(b), .c(c), .d(d), .S1(S1), .S2(S2), .y(y));

    initial begin
        a=2'b00;
        b=2'b01;
        c=2'b10;
        d=2'b11;

        #5;
        {S2,S1} = 2'b00;
        #5;
        {S2,S1} = 2'b01;
        #5;
        {S2,S1} = 2'b10;
        #5;
        {S2,S1} = 2'b11;

        #5 $finish;
    end

    initial begin
        $monitor("Time = %d, S2 = %b, S1 = %b, y = %d", $time, S2, S1, y);
        $dumpfile("execute.vcd");
        $dumpvars();
    end
    
endmodule