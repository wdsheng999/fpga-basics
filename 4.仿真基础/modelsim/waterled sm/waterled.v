`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/12 16:53:33
// Design Name: 
// Module Name: waterled
// Project Name: 
// Target Devices: xc7z010clg400-1
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

module waterled#(parameter  CLK_FRE = 26'd50_000_000)
(
    input              clk,
    input              rstn,
    
    input              led_pulse,
    
    output   reg [3:0] led
);
    //led counter
    reg [25:0] water_led_cnt;
    always @(posedge clk) begin
        if (!rstn) begin
           water_led_cnt<= `UD 26'd0; 
        end
        else begin
            if(water_led_cnt==CLK_FRE-1'b1)
            water_led_cnt<=`UD 26'd0;
            else
            water_led_cnt<=`UD water_led_cnt+1'b1;
        end
    end
    wire statue_trig;
    btndeb#(.CLK_FRE(CLK_FRE),.BTN_WIDTH(4'd1))btndeb(
        .clk(clk),
        .btnin(led_pulse),
        .btndeb(statue_trig)
    );

    //change led trigger
    reg statue_trig_1d=0,statue_trig_2d=0;
    always @(posedge clk) begin
        statue_trig_1d<=`UD statue_trig;
        statue_trig_2d<=`UD statue_trig_1d; 
    end 
    always @(posedge clk) begin
        if(!rstn)
        led<=`UD 4'b0001;
        else if(~statue_trig_2d & statue_trig_1d)
        led<=`UD ~led;
        else if (water_led_cnt==CLK_FRE-1'b1)
        led<=`UD {led[2:0],led[3]};
        
    end

endmodule
