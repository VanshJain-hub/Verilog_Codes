module tb_demux();
    reg [3:0] y;
    reg [2:0] S;
    wire a,b,c,d;
    
    demux DUT (.y(y), .S(S), .a(a), .b(b), .c(c), .d(d));

    integer i;
    initial begin
        y=0;
        #5 y = 4'b1011;

        for (i=0; i<4; i=i+1) begin
            S[2:0] = i;
            #5;
        end

        #5 y = 4'b0000;
        for(i=4; i>=0; i=i-1) begin
            if(i==5) #5;
            else begin
                S[2:0] = i;
                #5;
            end
        end
        #5 $finish;
    end
    
    initial begin
        $monitor("Time = %d, S=%d | a=%d, b=%d, c=%d, d=%d", $time, S, a, b, c, d);
    end
    
endmodule