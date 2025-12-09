module tb_fa_using_ha;
    reg a, b, cin;
    wire sum, cout;

    //replace with full_adder for it's testbench
    fa_using_ha DUT (.a(a), .b(b), .cin(cin), .cout(cout), .sum(sum));

    initial begin
        #5;
        a=0;
        b=0;
        cin=0;

        #5;
        a=0;
        b=1;
        cin=0;

        #5;
        a=1;
        b=0;
        cin=0;

        #5;
        a=1;
        b=1;
        cin=0;

        #5;
        a=0;
        b=0;
        cin=1;

        #5;
        a=0;
        b=1;
        cin=1;

        #5;
        a=1;
        b=0;
        cin=1;

        #5;
        a=1;
        b=1;
        cin=1;

        #5 $finish;
    end
    
    initial begin
        $monitor("Time = %d, a = %d, b = %d, cin = %d | cout = %d, sum = %d", $time, a, b, cin, cout, sum);
    end

    initial begin
        $dumpfile("execute.vcd");
        $dumpvars();
    end
    
endmodule