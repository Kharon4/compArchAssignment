`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:03:46 04/14/2021
// Design Name:   instructionFetch
// Module Name:   D:/abhishek/bits/2021-2022/comparch/lab/verilog/singleCycleProcessor/instructionFetchTest.v
// Project Name:  singleCycleProcessor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: instructionFetch
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module instructionFetchTest;

	// Inputs
	reg clk;
	reg reset;
	reg [7:0] pcVal;
	reg pcOverride;

	// Outputs
	wire [7:0] instruction;

	// Instantiate the Unit Under Test (UUT)
	instructionFetch uut (
		.clk(clk), 
		.reset(reset), 
		.pcVal(pcVal), 
		.pcOverride(pcOverride), 
		.instruction(instruction)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		pcVal = 1;
		pcOverride = 0;

		// Wait 5 ns for global reset to finish
		#5;
      reset = 1'b1;
		pcOverride = 1'b1;
		
		// Add stimulus here
		#5;
		clk=1'b1;
		
		#5;
		clk=1'b0;
		#5;
		clk=1'b1;
		
		#5;
		clk=1'b0;
		#5;
		clk=1'b1;
		
		pcOverride = 1'b0;
		
		#5;
		clk=1'b0;
		pcOverride=1'b1;
		#5;
		clk=1'b1;
		
		#5;
		clk=1'b0;
		#5;
		clk=1'b1;
		
		#5;
		$finish;
	end
      
endmodule

