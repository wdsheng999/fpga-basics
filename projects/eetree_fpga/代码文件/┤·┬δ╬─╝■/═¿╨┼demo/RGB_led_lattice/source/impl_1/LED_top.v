module RGB_LED(
	input clk,
	input rst,
	output reg [2:0] rgb_led
	);

	wire pwm_wave;
	wire next;
	wire [1:0] state;

	PWM_loop pwm (
		.clk(clk),
		.rst(rst),
		.pwm(pwm_wave),
		.state(state)
		);

	always @(state)
	begin
		
		case(state)
			2'd0:
			begin
				rgb_led[0]<=pwm_wave;
				rgb_led[1]<=~pwm_wave;
				rgb_led[2]<=1'b1;
			end
			2'd1:
			begin
				rgb_led[0]<=1'b1;
				rgb_led[1]<=pwm_wave;
				rgb_led[2]<=~pwm_wave;
			end
			2'd2:
			begin 
				rgb_led[0]<=~pwm_wave;
				rgb_led[1]<=1'b1;
				rgb_led[2]<=pwm_wave;
			end
			default:
				rgb_led=3'b111;
		endcase	

	end

endmodule