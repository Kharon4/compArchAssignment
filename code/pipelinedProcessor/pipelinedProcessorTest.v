`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Engineer: Abhishek Khurana
//
// Create Date:   01:40:11 04/15/2021
//
// Verilog Test Fixture created by ISE for module: pipelinedProcessor
////////////////////////////////////////////////////////////////////////////////

module pipelinedProcessorTest;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire [7:0] instr;
	wire [7:0] rVal;

	// Instantiate the Unit Under Test (UUT)
	pipelinedProcessor uut (
		.clk(clk), 
		.reset(reset), 
		.instr(instr), 
		.rVal(rVal)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		
		// Wait 100 ns for global reset to finish
		#10;
      reset = 1'b1;
		
		#160;
		// Add stimulus here
		$finish;
	end
	
	initial begin
		forever begin
    		#5 clk = ~clk;
		end
   end
      
endmodule

