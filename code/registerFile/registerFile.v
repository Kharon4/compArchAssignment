`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Abhishek Khurana
// 
// Create Date:    17:13:20 04/14/2021 
// Module Name:    registerFile
//////////////////////////////////////////////////////////////////////////////////
module registerFile(
    input [2:0] readRegId,
    input [2:0] writeRegId,
    input [7:0] writeRegVal,
    input writeEnable,//active low
    input clk,
    input reset,//active low
    output [7:0] readVal
    );

//register bank
reg [7:0] mem[7:0];

//setup output
assign readVal = mem[readRegId];

//write and reset
always @(posedge clk, negedge reset) begin
 if(reset == 0)begin
	mem[0]=8'b00000000;
	mem[1]=8'b00000001;
	mem[2]=8'b00000010;
	mem[3]=8'b00000011;
	mem[4]=8'b00000100;
	mem[5]=8'b00000101;
	mem[6]=8'b00000110;
	mem[7]=8'b00000111;
 end
 else begin
	if(writeEnable==0) begin
		mem[writeRegId] = writeRegVal;
	end
 end
end

endmodule
