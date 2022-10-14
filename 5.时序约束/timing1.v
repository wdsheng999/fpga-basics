`timescale 1ns/1ps

module timing1 (
    input clk,
    input a,
    input b,
    output reg c 
    );
    reg a_reg;
    reg b_reg;

    always @(posedge clk) begin
        a_reg<=a;
    end
    always @(posedge clk) begin
        b_reg<=b;
    end
    always @(posedge clk) begin
        c<=a_reg+b_reg;
    end

endmodule