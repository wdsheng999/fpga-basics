// 3 bit counter with asynchronous reset
module count(c,clk,rst);

input clk,rst; 
output [2:0]c;
reg [2:0]c;

always @(posedge clk or posedge rst)
     begin
        if (rst)
           c = 3'b000;
          else
           c = c + 1;
      end

endmodule

