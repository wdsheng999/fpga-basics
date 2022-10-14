`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/12 17:20:45
// Design Name: 
// Module Name: tb_waterled
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


module tb_waterled();
reg clk=0;
reg rstn;
reg led_pulse;
// waterled Outputs
wire  [3:0]  led                           ;

parameter CLK_FRE = 26'd5_000 ;


waterled#(.CLK_FRE(CLK_FRE))  u_waterled (
    .clk                     ( clk              ),
    .rstn                    ( rstn             ),
    .led_pulse               ( led_pulse        ),

    .led                     ( led         )//output reg [3:0] led
);
always #10 clk=~clk;//50MHz
initial begin
    #0 clk=0;
    
end
initial begin   
    #0 rstn=0;
        led_pulse=0;
    repeat(10)@(posedge clk);
        rstn=1;
// 模拟数据的抖动
//按下
    repeat(CLK_FRE<<2)@(posedge clk);// wait 4s times 左移放大
        led_pulse=1;
        #10 led_pulse=0;
        #30 led_pulse=1;
        #10 led_pulse=0;
        #20 led_pulse=1;
        #30 led_pulse=0;
        #10 led_pulse=1;
        #40 led_pulse=0;
        #10 led_pulse=1;
        //松开
    repeat(CLK_FRE>>4)@(posedge clk);//1s--62.5ms 右移缩小
        led_pulse=0;
        #10 led_pulse=1;
        #30 led_pulse=0;
        #10 led_pulse=1;
        #20 led_pulse=0;
        #30 led_pulse=1;
        #10 led_pulse=0;
        #40 led_pulse=1;
        #10 led_pulse=0;
    repeat(CLK_FRE<<2)@(posedge clk);// wait 4s times 左移放大 led status change
        led_pulse=1;
        #40 led_pulse=0;
        #40 led_pulse=1;
        #40 led_pulse=0;
        #40 led_pulse=1;
        #40 led_pulse=0;
        #40 led_pulse=1;
        #40 led_pulse=0;
        #40 led_pulse=1;
        #40 led_pulse=0;
    repeat(CLK_FRE<<2)@(posedge clk);// wait 4s times 左移放大
        led_pulse=1;
        #10 led_pulse=0;
        #30 led_pulse=1;
        #10 led_pulse=0;
        #20 led_pulse=1;
        #30 led_pulse=0;
        #10 led_pulse=1;
        #40 led_pulse=0;
        #10 led_pulse=1;
    repeat(CLK_FRE>>5)@(posedge clk);//1s--31.25ms    
        led_pulse=0;
        #10 led_pulse=1;
        #30 led_pulse=0;
        #10 led_pulse=1;
        #20 led_pulse=0;
        #30 led_pulse=1;
        #10 led_pulse=0;
        #40 led_pulse=1;
        #10 led_pulse=0;
 
end
endmodule
