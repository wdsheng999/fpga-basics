module button (clk,rst,key,key_pulse);
 
parameter       N  =  1;                      //Ҫ�����İ���������
 
input             clk;
input             rst;
input 	[N-1:0]   key;                        //����İ���					
output  [N-1:0]   key_pulse;                  //������������������	
 
reg     [N-1:0]   key_rst_pre;                //����һ���Ĵ����ͱ����洢��һ������ʱ�İ���ֵ
reg     [N-1:0]   key_rst;                    //����һ���Ĵ����������洢��ǰʱ�̴����İ���ֵ

wire    [N-1:0]   key_edge;                   //��⵽�����ɸߵ��ͱ仯�ǲ���һ��������
 
//���÷�������ֵ�ص㣬������ʱ�Ӵ���ʱ����״̬�洢�������Ĵ���������
always @(posedge clk  or  negedge rst)
  begin
	 if (!rst) begin
		 key_rst <= {N{1'b1}};                //��ʼ��ʱ��key_rst��ֵȫΪ1��{}�б�ʾN��1
		 key_rst_pre <= {N{1'b1}};
	 end
	 else begin
		 key_rst <= key;                     //��һ��ʱ�������ش���֮��key��ֵ����key_rst,ͬʱkey_rst��ֵ����key_rst_pre
		 key_rst_pre <= key_rst;             //��������ֵ���൱�ھ�������ʱ�Ӵ�����key_rst�洢���ǵ�ǰʱ��key��ֵ��key_rst_pre�洢����ǰһ��ʱ�ӵ�key��ֵ
	 end    
   end

assign  key_edge = key_rst_pre & (~key_rst);//������ؼ�⡣��key��⵽�½���ʱ��key_edge����һ��ʱ�����ڵĸߵ�ƽ

reg	[17:0]	  cnt;                       //������ʱ���õļ�������ϵͳʱ��12MHz��Ҫ��ʱ20ms����ʱ�䣬������Ҫ18λ������     

//����20ms��ʱ������⵽key_edge��Ч�Ǽ��������㿪ʼ����
always @(posedge clk or negedge rst)
   begin
	 if(!rst)
		cnt <= 18'h0;
	 else if(key_edge)
		cnt <= 18'h0;
	 else
		cnt <= cnt + 1'h1;
	 end  

reg     [N-1:0]   key_sec_pre;                //��ʱ�����ƽ�Ĵ�������
reg     [N-1:0]   key_sec;                    


//��ʱ����key���������״̬��Ͳ���һ��ʱ�ӵĸ����塣�������״̬�ǸߵĻ�˵��������Ч
always @(posedge clk  or  negedge rst)
  begin
	 if (!rst) 
		 key_sec <= {N{1'b1}};                
	 else if (cnt==18'h3ffff)
		 key_sec <= key;  
  end
always @(posedge clk  or  negedge rst)
  begin
	 if (!rst)
		 key_sec_pre <= {N{1'b1}};
	 else                   
		 key_sec_pre <= key_sec;             
 end      
assign  key_pulse = key_sec_pre & (~key_sec);     
 
endmodule