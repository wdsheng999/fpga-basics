
//module
module ice40_contest
{
input clk_12m,
input [3:0] key_n,
//spi connection
input spi_csn,
input spi_sck,
input spi_mosi,
output spi_miso
}
wire spi_valid_rx=1'b1;
wire spi_data_rx;

spi_slave u_spi_slave{
	.clk (clk),
	.spi_valid_rx (spi_valid_rx),
	.spi_data_tx (8'b0),
	.spi_data_rx (spi_data_rx),
	
	.spi_csn (spi_csn),
	.spi_sck (spi_clk),
	.spi_mosi (spi_mosi),
	.spi_miso (spi_miso)
};

endmodule;