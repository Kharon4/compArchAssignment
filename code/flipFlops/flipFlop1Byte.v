`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Abhishek Khurana
// 
// Create Date:    00:17:38 04/15/2021 
// Module Name:    flipFlop1Byte 
//////////////////////////////////////////////////////////////////////////////////
module flipFlop1Byte(
    input [7:0] d,
    input clk,
    input reset,
    output reg [7:0] q
    );
	 
	 
always@(posedge clk, negedge reset) begin
	if(reset==0)begin
		q=8'b00000000;
	end
	else begin
		q=d;
	end
end


endmodule
