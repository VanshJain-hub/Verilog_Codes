module ALU_Mux(B, WD, ImmExt, ALUSrc);
    output [31:0] B;
    input [31:0] WD, ImmExt;
    input ALUSrc;
    
    
assign B = (ALUSrc) ? ImmExt : WD;
    
    
endmodule