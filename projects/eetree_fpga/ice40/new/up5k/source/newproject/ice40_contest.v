`timescale 1ns/1ns

//module
module ice40_contest
{
input clk_12m,
input [3:0] key_n,
//spi connection
input spi_csn,
input spi_sck,
input spi_mosi,
output spi_miso,
//connect adc
output adc_clk,
input [9:0] adc_dat,
//connect dac
output dac_clk,
input [9:0] dac_dat
};

reg [9:0] cnt=1'b0;

wire clk_120m,clk_120m_g;
wire spi_valid_rx;
wire [7:0] spi_data_rx;
wire mode, up, down, source;
wire [3:0] key_pulse, key_state;
wire [1:0] wave;
wire [23:0] f_inc;
wire [23:0] p_inc=24'b0;
wire [9:0] dds_dat;

//logic for cnt
always @(posedge clk_12m) begin
	if (&cnt) cnt <= cnt;
	else cnt <= cnt +1'b1;
end

pll_120m u_pll_120m{
	.ref_clk_i(clk_12m),
    .rst_n_i(rst_n), 
    .outcore_o(clk_120m), 
    .outglobal_o(clk_120g)
};

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

Debounce u_Debounce [3:0]{
	.clk,
	.rst_n,
	.key_n,
	.key_pulse,
	.key_state
};

assign mode = key_pulse[3];
assign up = key_pulse[2];
assign down = key_pulse[1];
assign source = key_pulse[0];
//data got from spi, control the wave
Logic_ctrl u_Logic_ctrl{
	.clk,
	.clk_120m,
	.rst_n,
	.mode,
	.up,
	.down,
	.spi_valid_rx,
	.spi_data_rx,
	.wave,
	.f_inc
};

DDS u_DDS{
	.clk (clk),
	.rst_n (rst_n),
	.wave (wave),
	.f_inc (f_inc),
	.p_inc (p_inc),
	.dac_dat (dac_dat)
};

assign adc_clk=clk_12m;
assign dac_clk=clk_12m;
assign dac_dat=(source)?adc_data:dds_dat;

endmodule


