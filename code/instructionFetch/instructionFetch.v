`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Abhishek Khurana
// 
// Create Date:    15:28:41 04/14/2021 
// Module Name:    instructionFetch
//////////////////////////////////////////////////////////////////////////////////
module instructionFetch(
    input clk,
    input reset,//active low
    input [7:0] pcVal,
    input pcOverride,//active low
	 output [7:0] instruction
    );
	 
//set up program counter	 
reg [7:0] pc;

//handle pc updates
always @(posedge clk, negedge reset) begin
	if(reset == 0) begin
		pc=0;
	end
	else begin
		pc = pc+1;
		if(pcOverride == 0) begin
			pc = pc + pcVal;
		end
	end
end


//setup instruction memory
instructionMemory im(pc,reset,instruction);
	 
endmodule
