module dds_fm(
	input clk,				//输入时钟
	input rst_n,
	input enc_pulse_l,
	input enc_pulse_r,
	input [2:0] enc_st,
	output reg [31:0] dds_fm_step //调频累加值
);
//状态机
parameter ENC_STATE_FM = 3'b110; 	//调频
parameter ENC_STATE_AM = 3'b101;     //调幅


//调频
always @(posedge clk or negedge rst_n) 
begin
	if(!rst_n) 
		dds_fm_step <= 32'h00_00_ff_ff;
	else
		case(enc_st)
			ENC_STATE_FM: 
				if(enc_pulse_l)
					dds_fm_step <= dds_fm_step - 8'hff;
				else if(enc_pulse_r)
					dds_fm_step <= dds_fm_step + 8'hff;
				else
					dds_fm_step <= dds_fm_step;
			default: 
				dds_fm_step <= dds_fm_step;
		endcase
end


endmodule