module bcd_7seg(hex,state);
input [3:0] state;
output reg[0:6]hex;

always@(state)begin;
case(state)
4'd0: hex = 7'b1111110;
4'd1: hex = 7'b0110000;
4'd2: hex = 7'b1101101;
4'd3: hex = 7'b1111001;
4'd4: hex = 7'b0110011;
default hex = 7'b1111110;
endcase
end

endmodule