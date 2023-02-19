module dds(
	input clk_pll,				//����ʱ��
	input [2:0] wave_st,
	input [31:0] fm_step,
	input [7:0] am_factor,
	output reg [9:0]dds_out		//������ó�reg����ȥë��
);
//״̬��
parameter WAVE_STATE_SIN = 3'b110;	//���Ҳ�
parameter WAVE_STATE_SQUARE = 3'b101;//����
parameter WAVE_STATE_TRI = 3'b011;  //���ǲ�

//������data
reg [17:0] am_out;
//ԭʼ���
reg [9:0] ori_out;

//�ۼ���
reg [31:0] cnt;
always @(posedge clk_pll) cnt <= cnt + fm_step;

//sin table
wire [9:0] dds_out_sin_temp;
wire sin_clk_en = 1'b1;
wire sin_reset = 1'b0;
dds_sin_table u_dds_sin_table(
	.Clock(clk_pll),  
	.ClkEn(sin_clk_en),
	.Reset(sin_reset),
	.Theta(cnt[31:24]),
	.Sine(dds_out_sin_temp)
);

always @ (posedge clk_pll) 
begin
	case(wave_st)
		WAVE_STATE_SIN:
			ori_out <= dds_out_sin_temp + 10'd512;
		WAVE_STATE_SQUARE:
			ori_out <= {10{ cnt[31] }};
		WAVE_STATE_TRI:
			ori_out <= (cnt[31])?cnt[30:21]:~cnt[30:21];
		default:
			ori_out <= dds_out_sin_temp + 10'd512;
	endcase
	//����
	am_out <= ori_out * am_factor;
	dds_out <= am_out[17:8];
end

endmodule