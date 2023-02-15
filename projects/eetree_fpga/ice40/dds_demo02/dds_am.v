module dds_am(
	input clk,				//����ʱ��
	input rst_n,
	input enc_pulse_l,
	input enc_pulse_r,
	input [2:0] enc_st,
	output reg [7:0] dds_am_factor   //��������
);
//״̬��
parameter ENC_STATE_FM = 3'b110; 	//��Ƶ
parameter ENC_STATE_AM = 3'b101;     //����

//����
always @(posedge clk or negedge rst_n) 
begin
	if(!rst_n) 
		dds_am_factor <= 8'hff;
	else
		case(enc_st)
			ENC_STATE_AM: 
				if(enc_pulse_l)
					dds_am_factor <= dds_am_factor - 8'h0f;
				else if(enc_pulse_r)
					dds_am_factor <= dds_am_factor + 8'h0f;
				else
					dds_am_factor <= dds_am_factor;
			default: 
				dds_am_factor <= dds_am_factor;
		endcase
end

endmodule