//simple implementation, always sending
`timescale 1ns/1ns

module spi_slave #(parameter DATA_W=8)(
	input clk,
	
	output reg spi_valid_rx,//high when a byte is received
	output reg [DATA_W-1:0] spi_data_rx,
	input [DATA_W-1:0] spi_data_tx,
	
	input spi_csn,
	input spi_clk,
	input spi_mosi,
	output spi_miso
	);

// 1.sync spi_clk, using 3bits shifr register
reg [2:0] spi_sckr;
always @(posedge clk) spi_sckr<={spi_sckr[1:0],spi_sck};
wire spi_sck_risingedge = (spi_sckr[2:1]==2'b01);//now we can detect SCK rising edges
wire spi_sck_fallingedge = (spi_sckr[2:1]==2'b10);//falling edge

// 2.same thing for spi_scn
reg [2:0] spi_csnr;
always @(posedge clk) spi_csnr<={spi_scnr[1:0],spi_csn};
wire spi_scn_active=~spi_csnr[1];
wire spi_csn_startmessage = (spi_csnr[2:1]==2'b01);//now we can detect SCK rising edges
wire spi_csn_endmessage = (spi_csnr[2:1]==2'b10);//falling edge

//3.for mosi
reg [1:0] spi_mosir;
always @(posedge clk) spi_mosir<={spi_mosir[0],spi_mosi};
wire spi_mosi_data=spi_mosir[1];


////////////////////////////////////////////
//Now receiving data from the SPI bus is easy.
///////////////////////////////////////////////
// we handle spi in 8 bits format-->3 bit counter
reg [2:0] spi_bitcnt;


reg [7:0] spi_byte_data_received;

always @(posedge clk)
begin
	if(~spi_scn_active)
		spi_bitcnt=3'b000;
	else if(spi_sck_risingedge)
	begin
		bit_cnt<=bit_cnt+3'b001;
		// implement a shift-left register (since we receive the data MSB first)
		spi_data_rx<={spi_data_rx[6:0],spi_mosi_data};
	end
end

always @(posedge clk) spi_valid_rx<=spi_scn_active&&spi_sck_risingedge&&3'b111;
///////////////////////////////////////////////////////////
//Finally the transmission part.
///////////////////////////////////////////////////
reg [7:0] byte_data_sent;

always@(posedge clk)
if (spi_csn_active)
begin 
	if(spi_csn_startmessage)
		byte_data_sent<=spi_data_tx;
	else if(spi_csn_endmessage)
	begin
		if(bit_cnt==3'b000)
			byte_data_sent<=spi_data_tx;
		else
			byte_data_sent<={byte_data_sent[6:0],1'b0};
	end
end

//assume only one user on the spi bus
//send MSB first.
assign spi_miso = byte_data_sent[7];

endmodule
