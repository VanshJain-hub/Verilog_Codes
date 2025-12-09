module tb_mux #(parameter N = 3, M = 8);
    reg [M-1:0] A;
    reg [N-1:0] S;
    wire Y;

    variable_mux DUT ( .A(A), .S(S), .Y(Y));

    integer i;
    initial begin
        A = 8'b01011010;
        for(i=0; i<M; i=i+1) begin
            S = i;
            #5;
        end
    end

    initial begin
        $monitor("Time = %d, S = %d, Y = %d", $time, S, Y);
        $dumpfile("execute.vcd");
        $dumpvars();
    end
    
endmodule