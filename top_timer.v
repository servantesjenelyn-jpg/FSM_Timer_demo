module top_timer(ovr,out,rst,clk_in,clk_led,shex,thex);
input ovr;
input rst;
input clk_in;
output clk_led;
output out;
output [0:6]shex;
output [0:6]thex;

wire [3:0] timer_w;
wire [3:0] state_w;
wire signal_w;
wire[3:0] t_w;
wire clk_w;

clk_div dut(
.clk_in(clk_in),
.clk_led(clk_led),
.clk_out(clk_w));

timer timer_seq(
 .ovr(ovr),
 .clk(clk_w),
 .state(state_w),
 .timer(timer_w),
 .out(out),
 .rst(rst),
 );
 
 bcd_7seg timer_seg(
 .hex(thex),
 .state(timer_w)
 );

 bcd_7seg state_seg(
 .hex(shex),
 .state(state_w)
 );

 
 
 endmodule
