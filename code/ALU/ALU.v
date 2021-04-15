`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Abhishek Khurana
// 
// Create Date:    17:48:40 04/14/2021 
// Module Name:    ALU 
//////////////////////////////////////////////////////////////////////////////////
module ALU(
    input [7:0] a,//reg val
    input [7:0] b,//direcly connect to instruction
    input [1:0] ctrl,
    output reg [7:0] result
    );

always @(a,b,ctrl) begin
	case(ctrl)
	2'b00: begin
		result = {{5{b[2]}}, b[2:0]};
		end
	2'b01: begin
		result = a + {{5{b[2]}}, b[2:0]};
		end
	default: begin
		result = 8'b00000000;
	end
	endcase
end
endmodule
