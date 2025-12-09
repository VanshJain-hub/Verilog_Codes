module NextStateLogic(NextToggle, Toggle, EN);
    input  [1:0] Toggle;
    input        EN;          // latch enable
    output [1:0] NextToggle;
    reg    [1:0] NextToggle;

    reg [1:0] next_val;

    always @(*) begin
        case (Toggle)
            2'b01: next_val = 2'b10;
            2'b10: next_val = 2'b01;
            default: next_val = 2'b01; 
        endcase
    end

    // Level-sensitive D latch
    always @(EN or next_val) begin
        if (EN)
            NextToggle = next_val;
    end

endmodule