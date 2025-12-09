module gcd_controlpath(
    input clk, 
    input reset,
    //Data signals
    input input_available, 
    output reg result_ready,
    input result_taken,
    //Control signals (ctrl to datapath)
    output reg A_en, B_en, 
    output reg [1:0] A_mux_sel,
    output reg B_mux_sel,
    //Control Signals (datapath to control)
    input zero,
    input lt
);

    //local parameters are scoped constants
    localparam WAIT = 2'd0;
    localparam CALC = 2'd1;
    localparam DONE = 2'd2;

    reg [1:0] state_next;
    wire [1:0] state;

    RD_FF state_ff