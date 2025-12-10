`timescale 1ns / 1ps

module alu_simple (
    input         clk,
    input  [15:0] a,
    input  [15:0] b,
    input  [1:0]  sel,
    output reg [15:0] y
);

    (* KEEP = "TRUE" *) reg [15:0] a_reg, b_reg;
    reg [15:0] y_comb;

    // Register inputs
    always @(posedge clk) begin
        a_reg <= a;
        b_reg <= b;
    end

    // Combinational ALU
    always @(*) begin
        case (sel)
            2'b00: y_comb = a_reg + b_reg;
            2'b01: y_comb = a_reg - b_reg;
            2'b10: y_comb = a_reg & b_reg;
            2'b11: y_comb = a_reg | b_reg;
            default: y_comb = 16'h0000;
        endcase
    end

    // Register output
    always @(posedge clk) begin
        y <= y_comb;
    end

endmodule
