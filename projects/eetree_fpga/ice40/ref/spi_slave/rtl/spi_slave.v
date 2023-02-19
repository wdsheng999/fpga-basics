//
//  SPI slave interface
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

/*
  This is the implementation of a very simple SPI slave interface.
  It can be used where registers are at a premium, e.g. a CPLD.
  This design uses 24 registers, 
   - 10 Are for the SPI core itself
   -  2 Are read address bits
   - 12 Are for the two 6-bit outputs
   The design does NOT need any clock or reset signals alongside
   the standard SPI signals.
  
  The arriving SPI signal timing must be:
  Clock polarity = 1  (Clock default low starts with rising edge)
  Data  polarity = 1  (MISO on rising edge. MOSI on falling edge)
  
           +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+      
           |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      
   --------+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--------
      
   ----+                                                     +---
       |                                                     |
       +-----------------------------------------------------+
            ____  ____  ____  ____  ____  ____  ____  _______  
  MISO_____/    \/    \/    \/    \/    \/    \/    \/       \___
           \____/\____/\____/\____/\____/\____/\____/\_______/
      
  MOSI sample ^    ^     ^     ^     ^     ^     ^     ^ 
     point    |    |     |     |     |     |     |     |       

  Description.
  This example implementation uses an 8 bit SPI shift register.
  It reads two 8 bits values.
  It writes two 6 bits values and an address register.
  On writing bits 7,6 are the address bits of the register-to-write.
  This allows writing of up to four register of 6 bits.
    - The first register is the read-back address register
      Here it is 2 bits wide which allows reading of up to 4 values.
      It can be expanded to 6 bits to read up to 64 8-bit values.
    - The next two addresses are for two 6-bit values
    - The forth address is unused.
  Writing 'register' 0 selects which value to read on the next access
  To save logic the writeable registers cannot be read back.
  However it is trivial to implement that.
  
  For a 16-bit version with direct read addressable registers 
  see spi_slave2.v
  That version uses only one clock pin.
    
*/
 

module spi_slave (
   // The well-known four SPI interface signals
   input  wire  spi_clk,   // This must be an FPGA/CPLD clock pin!
   input  wire  spi_cs_n,  // This must be an FPGA/CPLD clock pin!
   input  wire  spi_mosi,   
   output wire  spi_miso,   
   
   // Example I/O ports 
   output reg   [5:0] out1,   // 6-bit writable register 1
   output reg   [5:0] out2,   // 6-bit writable register 2
   input  wire  [7:0] status1,// First  8-bit readable values
   input  wire  [7:0] status2 // Second 8-bit readable values
   );

// The 10 SPI core registers 
reg  [7:0] shift;
reg        load;
reg        bit_in;   

// Two read adress bits allows reading of up to 
// four 8-bit values
reg  [1:0] read;

wire [7:0] serial_in;


   // MOSI bit is stored on falling SPI clock edge 
   always @(negedge spi_clk)
   begin
      if (!spi_cs_n)
         bit_in <= spi_mosi;
   end
   
   // Combines MOSI bit with shift register bits
   // This producing 8 bits which are then used 
   // at the next rising clock edge
   assign serial_in = { bit_in,shift[7:1]};

   // The serial shift register 
   // This also produces the MISO data bit
   // The SPI cs is used as asynchronous active high reset 
   always @(posedge spi_clk or posedge spi_cs_n)
   begin
      if (spi_cs_n)
         load <= 1'b1;
      else
      begin
         load <= 1'b0;
         // First rising clock edge load the shift register
         // with the read data 
         if (load)
         begin
            case (read)
            2'b00 : shift <= status1;
            2'b01 : shift <= status2;
            endcase
         end
         else
         begin // The other cycles shift the data in
            shift <= serial_in;      
         end
      end
   end
 
  // The chip select rising edge is used to transfer 
  // the shift register data (the data just arrived)
  // to local registers.
  // The MS two bits are used to select which register the data should
  // go into, leaving 6 data bits to store.
  // BEWARE that this makes the spi_cs_n a clock signal!
   always @(posedge spi_cs_n) 
   begin
      case (serial_in[7:6])
      4'h0 : read <= serial_in[1:0]; 
      4'h1 : out1 <= serial_in[5:0];
      4'h2 : out2 <= serial_in[5:0];
      // Unused entry 
      endcase
   end
      
   // The MISO port is tri-stated when not selected
   // Otherwise it outputs the shift data
   assign spi_miso =  spi_cs_n ? 1'bz : shift[0];
   
endmodule  