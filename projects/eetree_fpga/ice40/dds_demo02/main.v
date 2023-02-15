module main
(
	input clk		,    //时钟
	input rst_n		,    //复位
	input 	      [1:0] key,
	input 	          enc_a,
	input 	          enc_b,
	input 	          enc_ok,
	
	output 		  [9:0] dac_data,            //10位的并行数据输出到DAC 
	output 				dac_clk,             //输出给DAC的并行时钟
	output	  reg [5:0]	led_out        //2：0给wave，5：3给enc
);
	//消抖后的按键,按下是一个高脉冲
	wire  [1:0] key_pulse;
	//编码器输出,也是高电平脉冲
	wire  enc_pulse_l,
		  enc_pulse_r,
		  enc_pulse_ok;
	//状态机wave
	parameter WAVE_STATE_SIN = 3'b110;	//正弦波
	parameter WAVE_STATE_SQUARE = 3'b101;//方波
	parameter WAVE_STATE_TRI = 3'b011;  //三角波
	reg [2:0] curr_wave_st;
	reg [2:0] next_wave_st;
	//状态机enc
	parameter ENC_STATE_FM = 3'b110; //调频
	parameter ENC_STATE_AM = 3'b101;     //调幅
	reg [2:0] curr_enc_st;
	reg [2:0] next_enc_st;
	//第一段 同步逻辑 描述次态到现态的转移
	always @ (posedge clk or negedge rst_n)
	begin
		if(!rst_n) 
			curr_wave_st <= WAVE_STATE_SIN;
        else 
			curr_wave_st <= next_wave_st;
	end
	//第二段 组合逻辑描述状态转移的判断
	always @ (curr_wave_st or rst_n or key_pulse)
	begin
		if(!rst_n) begin
		        next_wave_st = WAVE_STATE_SIN;
			end
		else begin
			case(curr_wave_st)
				WAVE_STATE_SIN: begin
					if(key_pulse[0]) 
						next_wave_st = WAVE_STATE_TRI;
					else if(key_pulse[1])
						next_wave_st = WAVE_STATE_SQUARE;
					else
						next_wave_st = WAVE_STATE_SIN;
				end
 
                WAVE_STATE_SQUARE: begin
					if(key_pulse[0]) 
						next_wave_st = WAVE_STATE_SIN;
					else if(key_pulse[1])
						next_wave_st = WAVE_STATE_TRI;
					else
						next_wave_st = WAVE_STATE_SQUARE;
				end
 
                WAVE_STATE_TRI: begin
					if(key_pulse[0]) 
						next_wave_st = WAVE_STATE_SQUARE;
					else if(key_pulse[1])
						next_wave_st = WAVE_STATE_SIN;
					else
						next_wave_st = WAVE_STATE_TRI;
				end
 
				default: next_wave_st = WAVE_STATE_SIN;
			endcase
		end
	end
	//第三段  同步逻辑 描述次态的输出动作
	always @ (posedge clk or negedge rst_n)
	begin
		if(!rst_n==1) begin
			led_out[2:0] <= WAVE_STATE_SIN;
			end 
		else begin
			case(next_wave_st)
				WAVE_STATE_SIN: begin
					led_out[2:0] <= WAVE_STATE_SIN;
				end
 
				WAVE_STATE_SQUARE: begin
					led_out[2:0] <= WAVE_STATE_SQUARE;
				end
 
				WAVE_STATE_TRI: begin
					led_out[2:0] <= WAVE_STATE_TRI;
				end
 
				default:begin
					led_out[2:0] <= WAVE_STATE_SIN;
					end
			endcase
		end
	end
	
	//编码器的状态机，和上面一样
	always @ (posedge clk or negedge rst_n)
	begin
		if(!rst_n) 
			curr_enc_st <= ENC_STATE_FM;
        else 
			curr_enc_st <= next_enc_st;
	end
	//第二段 组合逻辑描述状态转移的判断
	always @ (curr_enc_st or rst_n or enc_pulse_ok)
	begin
		if(!rst_n) begin
		        next_enc_st = ENC_STATE_FM;
			end
		else begin
			case(curr_enc_st)
				ENC_STATE_FM: begin
					if(enc_pulse_ok) 
						next_enc_st = ENC_STATE_AM;
					else
						next_enc_st = ENC_STATE_FM;
				end
 
                ENC_STATE_AM: begin
					if(enc_pulse_ok) 
						next_enc_st = ENC_STATE_FM;
					else
						next_enc_st = ENC_STATE_AM;
				end
 
				default: next_enc_st = ENC_STATE_FM;
			endcase
		end
	end
	//第三段  同步逻辑 描述次态的输出动作
	always @ (posedge clk or negedge rst_n)
	begin
		if(!rst_n==1) begin
			led_out[5:3] <= ENC_STATE_FM;
			end 
		else begin
			case(next_enc_st)
				ENC_STATE_FM: begin
					led_out[5:3] <= ENC_STATE_FM;
				end
 
				ENC_STATE_AM: begin
					led_out[5:3] <= ENC_STATE_AM;
				end
 
				default:begin
					led_out[5:3] <= ENC_STATE_FM;
					end
			endcase
		end
	end
	
	 //例化消抖按键module    
	 button  #( .N (2'd2) ) u_button (                               
			   .clk (clk),
			   .rst (rst_n),
			   .key (key),
			   .key_pulse (key_pulse)
				);
	 
	 //编码器
	 encoder u_encoder (                               
			   .clk_in (clk),
			   .rst_n_in (rst_n),
			   .key_a (enc_a),
			   .key_b (enc_b),
			   .key_ok(enc_ok),
			   .Left_pulse(enc_pulse_l),
			   .Right_pulse(enc_pulse_r),
			   .OK_pulse(enc_pulse_ok)
			   );
	
	//dds调频
	wire [31:0] dds_fm_step;
	dds_fm u_dds_fm(
	.clk(clk),				//输入时钟
	.rst_n(rst_n),
	.enc_pulse_l(enc_pulse_l),
	.enc_pulse_r(enc_pulse_r),
	.enc_st(curr_enc_st),
	.dds_fm_step(dds_fm_step) //调频累加值
	);
	
	//dds调幅
	wire [7:0] dds_am_factor;
	dds_am u_dds_am(
	.clk(clk),				//输入时钟
	.rst_n(rst_n),
	.enc_pulse_l(enc_pulse_l),
	.enc_pulse_r(enc_pulse_r),
	.enc_st(curr_enc_st),
	.dds_am_factor(dds_am_factor) //调频累加值
	);
	
	
		//锁相环
	wire clk_pll;
	dds_pll u_dds_pll(  .CLKI(clk), .CLKOP(clk_pll)  );
	
	//dac时钟,120M
	assign dac_clk = clk_pll;
	//dds
	dds u_dds(
		 .clk_pll(clk_pll),				//输入时钟
		 .wave_st(curr_wave_st),
		 .fm_step(dds_fm_step),
		 .am_factor(dds_am_factor),
		 .dds_out(dac_data)		//输出设置成reg，可去毛刺
	);
	
	
endmodule