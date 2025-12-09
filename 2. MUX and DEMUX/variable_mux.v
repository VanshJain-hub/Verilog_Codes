module variable_mux #(parameter M = 8, N = 3)
    (
    input [M-1:0] A, //4-bit input
    input [N-1:0] S, //2-bit select
    output reg Y
);

    always@(*) begin
        Y = A[S];
      
    end
    

endmodule