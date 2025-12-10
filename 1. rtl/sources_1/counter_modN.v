`timescale 1ns / 1ps

module counter_modN #(
    parameter N = 16
)(
    input  clk,
    input  rst_n,
    output reg [$clog2(N)-1:0] count
);
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            count <= 0;
        else if (count == N-1)
            count <= 0;
        else
            count <= count + 1'b1;
    end
endmodule
