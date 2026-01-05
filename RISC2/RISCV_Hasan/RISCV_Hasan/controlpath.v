module controlpath(
    input Zero, 
    input [31:0] Instr, 
    output MemWrite, RegWrite, ALUSrc, RegSrc,
    output PCSrc,
    output [3:0] ALU_Control,
    output [1:0] ResultSrc, ImmSrc //ALUOp 
);

    //ALU_Decoder: output: ALUControl 
    //MAin Decoder: output: ALUSrc, MemWrite, 
    //Not Used: Main Decoder: Jump, Branch

    wire [1:0] ALUOp; //From Main Decoder to ALU_Decoder
    wire Branch, Jump;
    wire WE;
    //funct3: Instr[14:12]
    //funct7b5: Instr[30]
    //opb5: Instr[4]
    
    Main_Decoder u_Main_Decoder(.op(Instr[6:0]), .RegWrite(RegWrite), .ImmSrc(ImmSrc), .ALUSrc(ALUSrc), .MemWrite(MemWrite), .ResultSrc(ResultSrc), .Branch(Branch), .ALUop(ALUOp), .Jump(Jump));
    //MemWrite going to DataMemory
    assign WE = MemWrite;
    //Assigning PCSrc 
    assign PCSrc = Branch & Zero;
    
    ALUDecoder u_ALUDecoder(.ALUOp(ALUOp), .funct3(Instr[14:12]), .funct7b5(Instr[30]), .opb5(Instr[4]), .ALU_Control(ALU_Control));

    
    
endmodule