`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Engineer: Abhishek Khurana
//
// Create Date:   18:13:54 04/14/2021
//
// Verilog Test Fixture created by ISE for module: ALU
////////////////////////////////////////////////////////////////////////////////

module ALUTest;

	// Inputs
	reg [7:0] a;
	reg [7:0] b;
	reg [1:0] ctrl;

	// Outputs
	wire [7:0] result;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.a(a), 
		.b(b), 
		.ctrl(ctrl), 
		.result(result)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		ctrl = 0;

		#5;
      a=8'b00000000;
		b=8'b00100100;
		#5;
		ctrl = 2'b01;
		a=8'b00000100;
		#5;
		ctrl = 2'b11;
		a=8'b00000000;
		#5;
		$finish;
	end
      
endmodule

