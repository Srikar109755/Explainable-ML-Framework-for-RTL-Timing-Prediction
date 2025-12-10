`timescale 1ns / 1ps

module alu_simple_tb;
    reg  [15:0] a, b;
    reg  [1:0]  sel;
    wire [15:0] y;

    alu_simple dut (
        .a(a),
        .b(b),
        .sel(sel),
        .y(y)
    );

    initial begin
        a = 16'd15; b = 16'd4; sel = 2'b00; // add
        #10 sel = 2'b01;                     // sub
        #10 sel = 2'b10;                     // and
        #10 sel = 2'b11;                     // or
        #10 a = 16'h0F0F; b = 16'h00FF; sel = 2'b00;
        #20 $finish;
    end
endmodule
