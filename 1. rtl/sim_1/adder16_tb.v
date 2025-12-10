`timescale 1ns / 1ps

module adder16_tb;
    reg clk;
    reg [15:0] a, b;
    wire [15:0] sum;

    adder16 dut (
        .clk(clk),
        .a(a),
        .b(b),
        .sum(sum)
    );

    initial clk = 0;
    always #5 clk = ~clk; // 100 MHz clock

    initial begin
        a = 0; b = 0;
        #20; a = 10; b = 5;
        #20; a = 100; b = 200;
        #20; a = 16'hFFFF; b = 1;
        #40; $finish;
    end
endmodule
