module encoder
(
input					clk_in,			//ϵͳʱ��
input					rst_n_in,		//ϵͳ��λ������Ч
input					key_a,			//��ת������A�ܽ�
input					key_b,			//��ת������B�ܽ�
input					key_ok,			//��ת������D�ܽ�
output	reg				Left_pulse,		//����ת�������
output	reg				Right_pulse,	//����ת�������
output					OK_pulse		//�����������
);
 
localparam				NUM_500US	=	6_000;	
 
reg				[12:0]	cnt;
//����������Ϊ500us�����Ƽ�ֵ����Ƶ��
always@(posedge clk_in or negedge rst_n_in) begin
	if(!rst_n_in) cnt <= 0;
	else if(cnt >= NUM_500US-1) cnt <= 1'b0;
	else cnt <= cnt + 1'b1;
end
 
reg				[5:0]	cnt_20ms;
reg						key_a_r,key_a_r1;
reg						key_b_r,key_b_r1;
reg						key_ok_r;
 
//���A��B��D�ܽŷֱ�����ȥ��������
//�������ת��������Ҫ��Ƚϸߣ������ֶ���ת��������������ϸ�������������������ת������������
//����ת�����������뻺�棬��������̬ͬʱ��ʱ����
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
		if(cnt_20ms >= 6'd40) begin	//���ڰ���D�źŻ��ǲ���20ms���ڲ����ķ�����40*500us = 20ms
			cnt_20ms <= 6'd0;
			key_ok_r <= key_ok;
		end else begin 
			cnt_20ms <= cnt_20ms + 1'b1;
			key_ok_r <=	key_ok_r;
		end
	end
end
 
reg						key_ok_r1;
//�԰���D�źŽ�����ʱ����
always@(posedge clk_in or negedge rst_n_in) begin
	if(!rst_n_in) key_ok_r1 <= 1'b1;
	else key_ok_r1 <= key_ok_r;
end
 
wire	A_state		= key_a_r1 && key_a_r && key_a;	//��ת������A�źŸߵ�ƽ״̬���
wire	B_state		= key_b_r1 && key_b_r && key_b;	//��ת������B�źŸߵ�ƽ״̬���
assign	OK_pulse	= key_ok_r1 && (!key_ok_r);		//��ת������D�ź��½��ؼ��
 
reg						A_state_reg;
//��ʱ����
always@(posedge clk_in or negedge rst_n_in) begin
	if(!rst_n_in) A_state_reg <= 1'b1;
	else A_state_reg <= A_state;
end
 
//��ת������A�źŵ������غ��½��ؼ��
wire	A_pos	= (!A_state_reg) && A_state;
wire	A_neg	= A_state_reg && (!A_state);
 
//ͨ����ת������A�źŵı��غ�B�źŵĵ�ƽ״̬������ж���ת�������Ĳ������������Ӧ�������ź�
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