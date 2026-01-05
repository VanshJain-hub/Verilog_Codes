module PC_Mux(PC_Next, PC_Target, PC_Plus_4, PCSrc);
    input  [31:0] PC_Target;
    input  [31:0] PC_Plus_4;
    output [31:0] PC_Next;
    input PCSrc;
     
        assign PC_Next = (PCSrc) ? PC_Target : PC_Plus_4; 
    

endmodule