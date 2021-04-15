`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////// 
// Engineer: Abhishek Khurana
//
// Create Date:   20:59:54 04/14/2021
// 
// Verilog Test Fixture created by ISE for module: processor
////////////////////////////////////////////////////////////////////////////////

module processorTest;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire [7:0]instr;
	wire [7:0]rVal;

	// Instantiate the Unit Under Test (UUT)
	processor uut (
		.clk(clk), 
		.reset(reset), 
		.instr(instr),
		.rVal(rVal)
	);
	
	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		
		// Wait 10 ns for global reset to finish
		#10;
      reset = 1'b1;
		#150;
		
		$finish;
	end
	
	initial begin
		forever begin
    		#5 clk = ~clk;//clock with time period of 10ns
		end
   end
endmodule

