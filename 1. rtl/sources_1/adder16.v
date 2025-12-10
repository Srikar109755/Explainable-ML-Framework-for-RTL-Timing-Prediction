`timescale 1ns / 1ps

module adder16 (
    input         clk,
    input  [15:0] a,
    input  [15:0] b,
    output reg [15:0] sum
);

    // Launch registers
    (* KEEP = "TRUE" *) reg [15:0] a_reg, b_reg;
    // Internal register
    (* KEEP = "TRUE" *) reg [15:0] sum_reg;

    // Register the inputs
    always @(posedge clk) begin
        a_reg <= a;
        b_reg <= b;
    end

    // Combinational add between registered inputs
    always @(*) begin
        sum_reg = a_reg + b_reg;
    end

    // Register the result (capture FF)
    always @(posedge clk) begin
        sum <= sum_reg;
    end

endmodule
