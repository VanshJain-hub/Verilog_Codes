module PBWC(
    input clock,
    input reset, 
    input Press,
    output reg Open_CW, Close_CCW
);

    //Modeling States
    reg current_state, next_state;
    parameter w_closed = 1'b0, w_open = 1'b1;

    //The State Memory Block
    always@(posedge clock or negedge reset)
    begin : STATE_MEMORY
        if(!reset)
            current_state <= w_closed;
        else
            current_state <= next_state;
    end

    //The Nex State Logic Block
    always@(current_state or Press)
    begin : NEXT_STATE_LOGIC
        case(current_state)
            w_closed: begin 
                if(Press == 1'b1)
                    next_state = w_open;
                else    
                    next_state = w_closed;
            end
            w_open: begin
                if(Press == 1'b1)
                    next_state = w_closed;
                else
                    next_state = w_open;
            end
            default: next_state = w_closed;
        endcase
    end

    //The Output Logic Block
    always@(current_state or Press)
    begin : OUTPUT_LOGIC
        case(current_state)
            w_closed: begin
                if(Press == 1'b1) begin
                    Open_CW = 1'b1;
                    Close_CCW = 1'b0;
                end
                else begin
                    Open_CW = 1'b0;
                    Close_CCW = 1'b0;
                end
            end
            w_open: begin
                if(Press == 1'b1) begin
                    Open_CW = 1'b0;
                    Close_CCW = 1'b1;
                end
                else begin
                    Open_CW = 1'b0;
                    Close_CCW = 1'b0;
                end               
            end
            default: begin
                Open_CW = 1'b0;
                Close_CCW = 1'b0;
            end          
        endcase
    end
    
endmodule
