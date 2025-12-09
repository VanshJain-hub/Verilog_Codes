module StateUpdate(CurrentState, EN, Zip);
    input  [1:0] CurrentState;
    input        EN;           // latch enable
    output [1:0] Zip;
    reg    [1:0] Zip;

    parameter S0 = 2'b00,
              S1 = 2'b01,
              S2 = 2'b10,
              S3 = 2'b11;

    reg [1:0] nextZip;

    always @(*) begin
        case (CurrentState)
            S0: nextZip = 2'b00;
            S1: nextZip = 2'b11;
            S2: nextZip = 2'b00;
            S3: nextZip = 2'b00;
            default: nextZip = 2'b00;
        endcase
    end

    // Level-sensitive D-latch
    always @(EN or nextZip) begin
        if (EN)
            Zip = nextZip;
    end

endmodule
