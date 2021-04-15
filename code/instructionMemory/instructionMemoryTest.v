`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Engineer: Abhishek Khurana
//
// Create Date:   15:40:45 04/14/2021
//
// Verilog Test Fixture created by ISE for module: instructionMemory
////////////////////////////////////////////////////////////////////////////////

module instructionMemoryTest;

	// Inputs
	reg [7:0] pc;
	reg reset;

	// Outputs
	wire [7:0] instruction;

	// Instantiate the Unit Under Test (UUT)
	instructionMemory uut (
		.pc(pc), 
		.reset(reset), 
		.instruction(instruction)
	);
	integer i = 0;
	initial begin
		// Initialize Inputs
		pc = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
      reset = 1;
		// Add stimulus here
		for(i = 0 ; i < 20; i = i+1)begin
			#5;
			pc = pc+1;
		end
		#5;
		$finish;
	end
      
endmodule

