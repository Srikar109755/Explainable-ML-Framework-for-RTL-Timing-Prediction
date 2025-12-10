`timescale 1ns / 1ps

module counter_modN_tb;
    reg clk;
    reg rst_n;
    wire [3:0] count; // for N=16

    // instantiate with N=16
    counter_modN #(.N(16)) dut (
        .clk(clk),
        .rst_n(rst_n),
        .count(count)
    );

    initial clk = 0;
    always #5 clk = ~clk;  // 100 MHz

    initial begin
        rst_n = 0;
        #20;
        rst_n = 1;

        #200;

        // pulse reset again
        rst_n = 0;
        #20;
        rst_n = 1;

        #200;
        $finish;
    end
endmodule
