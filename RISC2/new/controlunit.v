module Control_Unit(
    input [6:0] op,         
    input [2:0] funct3,     
    input funct7b5,        
    input opb5,            
    input Zero,            

    output RegWrite,        
    output [1:0] ImmSrc,    
    output ALUSrc,          
    output MemWrite,        
    output [1:0] ResultSrc,
    output Branch,         
    output Jump,            
    output [3:0] ALUControl,
    output Pc_Src          
);
    wire [1:0] ALUOp;
    Main_Decoder MainDecoder_inst(
        .op(op),
        .RegWrite(RegWrite),
        .ImmSrc(ImmSrc),
        .ALUSrc(ALUSrc),
        .MemWrite(MemWrite),
        .ResultSrc(ResultSrc),
        .Branch(Branch),
        .ALUop(ALUOp),
        .Jump(Jump)
    );
    ALUDecoder ALUDecoder_inst(
        .ALUOp(ALUOp),
        .funct3(funct3),
        .funct7b5(funct7b5),
        .opb5(opb5),
        .ALUControl(ALUControl)
    );
    assign Pc_Src = (Branch & Zero) | Jump;

endmodule

