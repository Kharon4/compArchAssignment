`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Abhishek Khurana
// 
// Create Date:    00:01:46 04/15/2021 
// Module Name:    CU 
//////////////////////////////////////////////////////////////////////////////////
module CU(
    input [7:0] instruction,
    output reg writeEnable,
    output reg [7:0]pcVal,
    output reg pcOverride
    );


//CU implementation

initial begin
	pcVal = 8'b00000000;
	pcOverride = 1'b1;
	writeEnable = 1'b1;
end

always @(instruction) begin
	writeEnable = instruction[7];
	if(instruction[7:6] == 2'b11) begin
		pcOverride = 1'b0;
		pcVal = {{2{instruction[5]}},instruction[5:0]};
	end
	else begin
		pcOverride = 1'b1;
	end
	
end

endmodule
