`timescale 1ns / 1ps

module fsm_traffic (
    input  clk,
    input  rst_n,
    output reg [1:0] ns_light, // 00=red,01=yellow,10=green
    output reg [1:0] ew_light
);
    localparam NS_GREEN   = 2'b00;
    localparam NS_YELLOW  = 2'b01;
    localparam EW_GREEN   = 2'b10;
    localparam EW_YELLOW  = 2'b11;

    reg [1:0] state, next_state;

    // State register
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            state <= NS_GREEN;
        else
            state <= next_state;
    end

    // Next-state logic & outputs
    always @(*) begin
        next_state = state;
        ns_light   = 2'b00;
        ew_light   = 2'b00;

        case (state)
            NS_GREEN: begin
                ns_light   = 2'b10; // green
                ew_light   = 2'b00; // red
                next_state = NS_YELLOW;
            end
            NS_YELLOW: begin
                ns_light   = 2'b01;
                ew_light   = 2'b00;
                next_state = EW_GREEN;
            end
            EW_GREEN: begin
                ns_light   = 2'b00;
                ew_light   = 2'b10;
                next_state = EW_YELLOW;
            end
            EW_YELLOW: begin
                ns_light   = 2'b00;
                ew_light   = 2'b01;
                next_state = NS_GREEN;
            end
            default: begin
                ns_light   = 2'b00;
                ew_light   = 2'b00;
                next_state = NS_GREEN;
            end
        endcase
    end

endmodule
