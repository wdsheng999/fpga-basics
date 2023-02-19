//
// Test bench for simple PSI slave 
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

module spi_slave_test;

// These depend on the SPI internal configuration:
// The location of the register and the read decoder

`define WRITE_REG_ADRS 8'h00
`define WRITE_REG_OUT1 8'h40
`define WRITE_REG_OUT2 8'h80

`define READ_STATUS1 8'h00
`define READ_STATUS2 8'h01

localparam CLK_PERIOD=100;
localparam SIZE=8;

reg          clk;
reg          reset_n;

wire         spi_clk;
wire   [3:0] spi_cs_n;
wire         spi_mosi;
tri1         spi_miso;
   

wire [  5:0] out1;
wire [  5:0] out2;
reg  [  7:0] status1;
reg  [  7:0] status2;

reg  [7:0] write_value;
reg  [7:0] spi_read;
integer    loop;

   initial
   begin
      reset_n   = 1'b0;
      status1   = 8'b00111100;
      status2   = 8'b10011001;
      #(5*CLK_PERIOD) reset_n=1'b1;
      #(50*CLK_PERIOD);
      
      spi_master_0.set_speed(4);
      
      // Test writing out1
      // 6 bits is 64 possible values
      for (loop=0; loop<64; loop=loop+1)
      begin
         // Set the MS 2 address bits and add the data to write 
         write_value = `WRITE_REG_OUT1 | loop;
         spi_master_0.access(0,write_value,spi_read);
         if (out1!==loop)
         begin
            $display("@%0t: Write %d to out1 failed",$time,loop);
            #(5*CLK_PERIOD) $stop;
         end         
      end
      // Test writing out2
      // 6 bits is 64 possible values
      for (loop=0; loop<64; loop=loop+1)
      begin
         // Set the MS 2 address bits and add the data to write 
         write_value = `WRITE_REG_OUT2 | loop;
         spi_master_0.access(0,write_value,spi_read);
         if (out2!==loop)
         begin
            $display("@%0t: Write %d to out2 failed",$time,loop);
            #(5*CLK_PERIOD) $stop;
         end         
      end
      $display("Write Out1/2 test passed");
            
      // Test reading status1
      // Select status 1 for reading
      write_value = `WRITE_REG_ADRS | `READ_STATUS1;
      spi_master_0.access(0,write_value,spi_read);
      for (loop=0; loop<256; loop=loop+1)
      begin
         // Set the status bits 
         status1 = loop;
         // Keep using the old write value  
         spi_master_0.access(0,write_value,spi_read);
         if (spi_read!==loop)
         begin
            $display("@%0t: Read %d from status1 failed",$time,loop);
            #(5*CLK_PERIOD) $stop;
         end         
      end
      // Test reading status2
      // Select status 2 for reading
      write_value = `WRITE_REG_ADRS | `READ_STATUS2;
      spi_master_0.access(0,write_value,spi_read);
      for (loop=0; loop<256; loop=loop+1)
      begin
         // Set the status bits 
         status2 = loop;
         // Keep using the old write value  
         spi_master_0.access(0,write_value,spi_read);
         if (spi_read!==loop)
         begin
            $display("@%0t: Read %d from status2 failed",$time,loop);
            #(5*CLK_PERIOD) $stop;
         end         
      end
      
      // Do a consecutive read of status1 followed by status2
      status1 = 8'hA5;
      status2 = 8'hC3;
      // Prepare reading status1
      write_value = `WRITE_REG_ADRS | `READ_STATUS1;
      spi_master_0.access(0,write_value,spi_read);
      // Read status1 but at the same time write address register 
      // to read status 2 so we get status 2 on the next read 
      write_value = `WRITE_REG_ADRS | `READ_STATUS2;
      spi_master_0.access(0,write_value,spi_read);
      if (spi_read!==status1)
      begin
         $display("@%0t: Read %d from status1 failed",$time,loop);
         #(5*CLK_PERIOD) $stop;
      end         
      spi_master_0.access(0,write_value,spi_read);
      if (spi_read!==status2)
      begin
         $display("@%0t: Read %d from status2 failed",$time,loop);
         #(5*CLK_PERIOD) $stop;
      end         

      $display("Read Status1/2 test passed");
      
      // If we get here all tests passed
      // (Which is not the same as the code works)
      $display("**************************\n***  All tests passed  ***\n**************************");
      
      #(50*CLK_PERIOD) $stop;
   end
   

spi_slave
spi_slave_0 (
      .spi_clk (spi_clk),
      .spi_cs_n(spi_cs_n[0]),
      .spi_mosi(spi_mosi),
      .spi_miso(spi_miso),
      .out1    (out1),
      .out2    (out2),
      .status1 (status1),
      .status2 (status2) 
   );


spi_test_master
   #(
      .SIZE (SIZE)
   ) // parameters
spi_master_0 (
      .sys_clk (clk),
      .reset_n (reset_n),
   
      .spi_clk (spi_clk),
      .spi_cs_n(spi_cs_n),
      .spi_mosi(spi_mosi),
      .spi_miso(spi_miso) 
   );

   // Generate clock.
   initial
   begin
      clk = 1'b0;
      forever
         #(CLK_PERIOD/2) clk = ~clk;
   end

endmodule
