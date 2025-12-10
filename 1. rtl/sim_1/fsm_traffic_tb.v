`timescale 1ns / 1ps

module fsm_traffic_tb;
    reg clk;
    reg rst_n;
    wire [1:0] ns_light;
    wire [1:0] ew_light;

    fsm_traffic dut (
        .clk(clk),
        .rst_n(rst_n),
        .ns_light(ns_light),
        .ew_light(ew_light)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        rst_n = 0;
        #20;
        rst_n = 1;

        // run for several cycles
        #200;
        $finish;
    end
endmodule
