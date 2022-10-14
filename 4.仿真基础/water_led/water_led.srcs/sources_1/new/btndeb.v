`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/13 09:59:29
// Design Name: 
// Module Name: btndeb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`define UD #1

module btndeb#(parameter CLK_FRE = 26'd50_000_000, parameter BTN_WIDTH=4'd8    )(
    input clk,//12M
    input [BTN_WIDTH-1:0] btnin,
    output reg[BTN_WIDTH-1:0] btndeb
);
parameter TIME_20MS_CNT=CLK_FRE*20/1000;
//------------------------------------------------------------------
reg [25:0] time_cnt = 18'd0;
always @(posedge clk) begin
   if (time_cnt == TIME_20MS_CNT-1'b1) 
        time_cnt<=`UD 26'd0;
   else 
        time_cnt<=`UD time_cnt+26'd1;
end
always @(posedge clk) begin
    if(time_cnt==26'd0)
        btndeb<=`UD btnin;
end
endmodule
