module control_path(
    input  wire [31:0] Instr,
    input  wire        zero,

    output wire        RegWrite,
    output wire        ALUSrc,
    output wire        PCSrc,
    output wire [1:0]  ResultSrc,
    output wire [1:0]  ImmSrc,       
    output wire [3:0]  ALUControl,
    output wire        MemWrite
);

    wire [1:0] ALUOp;
    wire Jump;
    wire Branch;

    Main_Decoder decoder (
        .op(Instr[6:0]),
        .RegWrite(RegWrite),
        .ImmSrc(ImmSrc),
        .ALUSrc(ALUSrc),
        .MemWrite(MemWrite),
        .ResultSrc(ResultSrc),
        .Branch(Branch),
        .ALUOp(ALUOp),
        .Jump(Jump)
    );

    assign PCSrc = (zero & Branch) | Jump;

    ALUDecoder aludec (
        .ALUOp(ALUOp),
        .funct3(Instr[14:12]),
        .funct7b5(Instr[30]),
        .opb5(Instr[5]),
        .ALUControl(ALUControl)
    );

endmodule