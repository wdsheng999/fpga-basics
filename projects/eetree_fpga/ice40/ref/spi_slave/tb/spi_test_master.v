//
// Behavioural model of an SPI master
//
/*
Copyright (c) 2021 Fen Logic Ltd

Permission is hereby granted, free of charge, to any person obtaining a copy
of this code and associated documentation files (the "Code"), to deal
in the Code without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Code, and to permit persons to whom the Code is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Code.

THE CODE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE CODE OR THE USE OR OTHER DEALINGS IN THE
CODE.
*/

module spi_test_master 
#(parameter SIZE = 16
 )
(
   input  wire        sys_clk,
   input  wire        reset_n,
   
   output reg         spi_clk,  
   output reg   [3:0] spi_cs_n,
   output reg         spi_mosi, 
   input  wire        spi_miso
   );
   
reg  [7:0] speed,speed_count;
reg        speed_tick;

initial
begin
   spi_clk  = 1'b0;
   spi_cs_n = 4'b1111;
   spi_mosi = 1'b1;
end

   always @(posedge sys_clk or negedge reset_n)
   begin
      if (!reset_n)
      begin
         speed_count <= 0;
         speed_tick  <= 1'b0;
      end
      else
      begin
         
         // System clock divider 
         if (speed_count)
         begin
            speed_count <= speed_count - 1;
            speed_tick  <= 1'b0;
         end
         else
         begin
            speed_tick  <= 1'b1;
            speed_count <= speed;            
         end
         
         
      end

   end // always 

task set_speed(input [7:0] speed_arg);
begin
   speed = speed_arg;
   speed_count <= 0;
   speed_tick  <= 1'b0;
   @(posedge sys_clk);
  
end
endtask // set speed 

task access(
   input       [1:0] cs,  
   input  [SIZE-1:0] wdata, 
   output [SIZE-1:0] rdata
   );
integer l;   
begin
   @(negedge sys_clk);
   wait (speed_tick)
   @(posedge sys_clk)
   case (cs)
   2'b00 : spi_cs_n <= 4'b1110;
   2'b01 : spi_cs_n <= 4'b1110;
   2'b10 : spi_cs_n <= 4'b1110;
   2'b11 : spi_cs_n <= 4'b1110;
   endcase
   @(negedge sys_clk);
   wait (speed_tick);
   @(posedge sys_clk);
   for (l=0; l<SIZE; l=l+1)
   begin
      @(negedge sys_clk);
      wait (speed_tick===1'b1);
      @(posedge sys_clk);
      begin
         spi_mosi <= wdata[l];
         spi_clk  <= 1'b1;
      end
         
      @(negedge sys_clk);
      wait (speed_tick===1'b1);
      @(posedge sys_clk)
      begin
         spi_clk  <= 1'b0;
         rdata[l] <= spi_miso;
      end
   end
   // Make sure there is at least 1 SPI clock high time 
   @(negedge sys_clk);
   wait (speed_tick)
   @(posedge sys_clk)
       spi_cs_n <= 4'b11111;
   @(negedge sys_clk);
   wait (speed_tick);
   @(posedge sys_clk);
 
end   

endtask
      
endmodule  