`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Abhishek Khurana
// 
// Create Date:    00:14:48 04/15/2021 
// Module Name:    flipFlop1Bit 
//////////////////////////////////////////////////////////////////////////////////
module flipFlop1Bit(
    input d,
    input clk,
    input reset,//active low
    output reg q
    );

always@(posedge clk, negedge reset) begin
	if(reset==0)begin
		q=1'b1;
	end
	else begin
		q=d;
	end
end

endmodule
