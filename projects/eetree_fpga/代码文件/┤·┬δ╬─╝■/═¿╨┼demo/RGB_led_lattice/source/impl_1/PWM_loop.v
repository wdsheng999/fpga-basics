module PWM_loop(
	input clk,
	input rst,
	output reg pwm,
	output reg [1:0] state
	);

	reg[7:0] high;//determine the duty 0~255
	reg[7:0] counter;//0~255
	reg[8:0] times;//loop times of any duty cycle

	always @(posedge clk or negedge rst)
	begin
		if(!rst)
		begin
			counter<=0;
			state<=0;
			high<=0;
			pwm<=0;
		end
		else if(counter==255)
			begin
				counter<=0;
				pwm<=0;

				if(times==182)
				begin
					times<=0;

					if(high==255)
					begin
						high<=0;

						if(state==2)
							state<=0;
						else
							state<=state+1;
					end
					else
					begin
						high<=high+1;
					end
				end
				else
				begin
					times<=times+1;
				end
			end
		else
		begin 
			counter<=counter+1;
			if(counter<=high)
				pwm<=1;
			else
				pwm<=0;
		end
	end

endmodule