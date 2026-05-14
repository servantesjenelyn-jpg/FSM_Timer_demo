module clk_div(clk_in,clk_led,clk_out);
input clk_in;
output reg clk_led= 1'b0;
output reg clk_out=1'b0;

parameter integer period=1;
parameter integer freq = 50_000_000;
localparam integer ticks = (period*freq)/2;
integer tick_cnt=0;
always@(posedge clk_in)begin
		if(tick_cnt==ticks-1)begin
		clk_led<=~clk_led;
		clk_out<=~clk_out;
		tick_cnt<=0;
		end
		else tick_cnt<=tick_cnt+1;
end
endmodule