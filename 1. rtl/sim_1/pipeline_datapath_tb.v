`timescale 1ns / 1ps

module pipeline_datapath_tb;
    reg        clk;
    reg        rst_n;
    reg [15:0] in_data;
    wire [15:0] out_data;

    pipeline_datapath dut (
        .clk(clk),
        .rst_n(rst_n),
        .in_data(in_data),
        .out_data(out_data)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        rst_n   = 0;
        in_data = 16'd0;
        #20;
        rst_n   = 1;

        // feed a few inputs
        #10 in_data = 16'd10;
        #10 in_data = 16'd20;
        #10 in_data = 16'd30;
        #10 in_data = 16'd40;
        #50;
        $finish;
    end
endmodule
