module tb_variable_fa;
    parameter N = 4;
    reg [N-1:0] a, b;
    reg cin;
    wire [N-1:0] sum; 
    wire cout;

    //replace with full_adder for it's testbench
    variable_fa DUT (.a(a), .b(b), .cin(cin), .cout(cout), .sum(sum));

    initial begin
        #5;
        a=0;
        b=0;
        cin=0;

        #5;
        a=4'b0110;
        b=4'b0101;

        #5;
        a=4'b1101;
        b=4'b0111;

        #5;
        a=4'b0001;
        b=4'b1001;

        #5;
        a=4'b1111;
        b=4'b1111;

        #5 $finish;
    end
    
    initial begin
        $monitor("Time = %d, a = %b, b = %b, cin = %b | cout = %b, sum = %b", $time, a, b, cin, cout, sum);
    end

    initial begin
        $dumpfile("execute.vcd");
        $dumpvars();
    end
    
endmodule