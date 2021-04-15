`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////// 
// Engineer: Abhishek Khurana
//
// Create Date:   17:35:22 04/14/2021
//
// Verilog Test Fixture created by ISE for module: registerFile
////////////////////////////////////////////////////////////////////////////////

module registerFileTest;

	// Inputs
	reg [2:0] readRegId;
	reg [2:0] writeRegId;
	reg [7:0] writeRegVal;
	reg writeEnable;
	reg clk;
	reg reset;

	// Outputs
	wire [7:0] readVal;

	// Instantiate the Unit Under Test (UUT)
	registerFile uut (
		.readRegId(readRegId), 
		.writeRegId(writeRegId), 
		.writeRegVal(writeRegVal), 
		.writeEnable(writeEnable), 
		.clk(clk), 
		.reset(reset), 
		.readVal(readVal)
	);

	initial begin
		// Initialize Inputs
		readRegId = 0;
		writeRegId = 0;
		writeRegVal = 0;
		writeEnable = 0;
		clk = 0;
		reset = 0;

		// Wait 5 ns for global reset to finish
		#5;
      writeEnable = 1'b1;
		reset = 1'b1;
		
		//show all
		repeat(16)begin
			#5;
			readRegId = readRegId + 1;
		end
		#5;
		
		
		writeRegVal = 8'b11111111;
		#5;
		clk = 1'b1;
		#5;
		clk = 1'b0;
		#5;
		writeRegId = 3'b011;
		writeEnable = 1'b0;
		clk = 1'b1;
		#5;
		clk = 1'b0;
		writeEnable = 1'b1;
		
		
		
		repeat(16)begin
			#5;
			readRegId = readRegId + 1;
		end
		#5;
		
		reset = 1'b0;
		#5;
		reset = 1'b1;
		
		
		repeat(16)begin
			#5;
			readRegId = readRegId + 1;
		end
		#5;
		
		$finish;
	end
      
endmodule

