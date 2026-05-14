module timer(ovr,clk,state,timer,out,rst);
input ovr;
input clk;
input rst;
output reg [3:0]state;
output[3:0]timer;
output reg out;
reg [3:0]pre;
reg [3:0]nxt;
reg [3:0]t = 4'b0;
localparam [3:0] s0  = 4'b0000;
localparam [3:0] s1 = 4'b0001;
localparam [3:0] s2 = 4'b0010;
localparam [3:0] s3  = 4'b0011;

always@(pre,ovr)begin
if(ovr)begin
nxt<=s3;
end
else begin
case(pre)
s0: nxt = (t==2)? s1:s0;
s1: nxt = (t==3)? s2:s1;
s2: nxt = (t==2)? s0:s2;
default: nxt = s0;
endcase
end
end

always@(negedge rst, posedge clk)begin
if(!rst)begin
	pre=s0;
	t<=0;
end
else if(ovr)begin
 pre<=nxt;
 t<=0;
 end
else begin
pre <=nxt;
case(pre)
s0: t <=(t==2)? (4'b0):(t+1);
s1: t <=(t==3)? (4'b0):(t+1);
s2: t <=(t==2)? (4'b0):(t+1); 
s3:begin
if(t==0)t<=0;
end
endcase
end
end

always@(pre)begin
case(pre)
s0: begin
out=0;
state=s0;
end
s1:begin
out=1;
state=s1;
end
s2:begin
out=0;
state=s2;
end
s3:begin
out=1;
state=s3;
end
endcase
end
assign timer=t;
endmodule