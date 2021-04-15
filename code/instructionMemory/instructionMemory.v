`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Abhishek Khurana
// 
// Create Date:    15:30:24 04/14/2021 
// Module Name:    instructionMemory 
//////////////////////////////////////////////////////////////////////////////////
module instructionMemory(
    input [7:0] pc,
    input reset,
    output [7:0] instruction
    );

reg [7:0] mem [255:0];// 8 bit address can address 256 words

//setup output
assign instruction = mem[pc];

//integer i=0;
reg [7:0]i;
//handle reset
always@(reset) begin
	if(reset == 0) begin
		//clear mem set it to 10XXXXXX ie nop
		i=0;
		repeat(256)begin
			mem[i] = 8'b10000000;//nop
			i = i+1;
		end
		//set values
		
		/*
			"2018A3PS0621H" = "2018A3PS0ABCH"
			
			A=6;
			B=2;
			C=1;
			x=6%8 = 6;
			y=(2+2)%8 = 4
			z=(1+3)%8 = 4

			hence the code is :
			li r6, 3
			addi r6, 2
			addi r4, 3
			j L1
			li r4, 4
			L1 : addi r4, -3
		*/
		//program
		mem[0] = 8'b00110011;//li r6, 3
		mem[1] = 8'b01110010;//addi r6, 2
		mem[2] = 8'b01100011;//addi r4, 3
		mem[3] = 8'b11000001;//j L1
		mem[4] = 8'b00100100;//li r4, 4
		mem[5] = 8'b01100101;//addi r4, -3
		
		//show output
		mem[6] = 8'b01000000;
		mem[7] = 8'b01001000;
		mem[8] = 8'b01010000;
		mem[9] = 8'b01011000;
		mem[10] = 8'b01100000;
		mem[11] = 8'b01101000;
		mem[12] = 8'b01110000;
		mem[13] = 8'b01111000;
		
	end
end

endmodule
