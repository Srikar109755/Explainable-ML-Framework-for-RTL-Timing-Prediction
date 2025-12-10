`timescale 1ns / 1ps

module pipeline_datapath (
    input         clk,
    input         rst_n,
    input  [15:0] in_data,
    output [15:0] out_data
);
    (* KEEP = "TRUE" *) reg [15:0] stage1_reg, stage2_reg, stage3_reg;

    // Stage 1: add constant
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            stage1_reg <= 16'd0;
        else
            stage1_reg <= in_data + 16'd5;
    end

    // Stage 2: multiply by 3 (shift + add)
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            stage2_reg <= 16'd0;
        else
            stage2_reg <= (stage1_reg << 1) + stage1_reg;
    end

    // Stage 3: mask and xor
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            stage3_reg <= 16'd0;
        else
            stage3_reg <= (stage2_reg & 16'h0FFF) ^ 16'h00AA;
    end

    assign out_data = stage3_reg;

endmodule
