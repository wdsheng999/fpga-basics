module encoder
(
input					clk_in,			//系统时钟
input					rst_n_in,		//系统复位，低有效
input					key_a,			//旋转编码器A管脚
input					key_b,			//旋转编码器B管脚
input					key_ok,			//旋转编码器D管脚
output	reg				Left_pulse,		//左旋转脉冲输出
output	reg				Right_pulse,	//右旋转脉冲输出
output					OK_pulse		//按动脉冲输出
);
 
localparam				NUM_500US	=	6_000;	
 
reg				[12:0]	cnt;
//计数器周期为500us，控制键值采样频率
always@(posedge clk_in or negedge rst_n_in) begin
	if(!rst_n_in) cnt <= 0;
	else if(cnt >= NUM_500US-1) cnt <= 1'b0;
	else cnt <= cnt + 1'b1;
end
 
reg				[5:0]	cnt_20ms;
reg						key_a_r,key_a_r1;
reg						key_b_r,key_b_r1;
reg						key_ok_r;
 
//针对A、B、D管脚分别做简单去抖操作，
//如果对旋转编码器的要求比较高，建议现对旋转编码器的输出做严格的消抖处理后再来做旋转编码器的驱动
//对旋转编码器的输入缓存，消除亚稳态同时延时锁存
always@(posedge clk_in or negedge rst_n_in) begin
	if(!rst_n_in) begin
		key_a_r		<=	1'b1;
		key_a_r1	<=	1'b1;
		key_b_r		<=	1'b1;
		key_b_r1	<=	1'b1;
		cnt_20ms	<=	1'b1;
		key_ok_r	<=	1'b1;
	end else if(cnt == NUM_500US-1) begin
		key_a_r		<=	key_a;
		key_a_r1	<=	key_a_r;
		key_b_r		<=	key_b;
		key_b_r1	<=	key_b_r;
		if(cnt_20ms >= 6'd40) begin	//对于按键D信号还是采用20ms周期采样的方法，40*500us = 20ms
			cnt_20ms <= 6'd0;
			key_ok_r <= key_ok;
		end else begin 
			cnt_20ms <= cnt_20ms + 1'b1;
			key_ok_r <=	key_ok_r;
		end
	end
end
 
reg						key_ok_r1;
//对按键D信号进行延时锁存
always@(posedge clk_in or negedge rst_n_in) begin
	if(!rst_n_in) key_ok_r1 <= 1'b1;
	else key_ok_r1 <= key_ok_r;
end
 
wire	A_state		= key_a_r1 && key_a_r && key_a;	//旋转编码器A信号高电平状态检测
wire	B_state		= key_b_r1 && key_b_r && key_b;	//旋转编码器B信号高电平状态检测
assign	OK_pulse	= key_ok_r1 && (!key_ok_r);		//旋转编码器D信号下降沿检测
 
reg						A_state_reg;
//延时锁存
always@(posedge clk_in or negedge rst_n_in) begin
	if(!rst_n_in) A_state_reg <= 1'b1;
	else A_state_reg <= A_state;
end
 
//旋转编码器A信号的上升沿和下降沿检测
wire	A_pos	= (!A_state_reg) && A_state;
wire	A_neg	= A_state_reg && (!A_state);
 
//通过旋转编码器A信号的边沿和B信号的电平状态的组合判断旋转编码器的操作，并输出对应的脉冲信号
always@(posedge clk_in or negedge rst_n_in)begin
	if(!rst_n_in)begin
		Right_pulse <= 1'b0;
		Left_pulse <= 1'b0;
	end else begin
		if(A_pos && B_state) Left_pulse <= 1'b1;	
		else if(A_neg && B_state) Right_pulse <= 1'b1;
		else begin
			Right_pulse <= 1'b0;
			Left_pulse <= 1'b0;
		end
	end
end
 
endmodule