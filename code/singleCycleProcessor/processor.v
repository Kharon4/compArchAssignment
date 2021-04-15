`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Abhishek Khurana
//
// Create Date:    14:55:05 04/14/2021
// Module Name:    processor
//////////////////////////////////////////////////////////////////////////////////
module processor(
		input clk,
		input reset,//active low
		output [7:0]instr,
		output [7:0]rVal
    );

wire [7:0]pcVal;//pc relative address
wire pcOverride;//active low // set to 0 to add pcVal to pc
wire writeEnable;//active low //enables write to registerFile
wire [7:0]instruction;//current instruction
wire [7:0]regReadVal;//value of the register read from the registerFile
wire [7:0]ALUResult;//output of alu

//to help visuvalize output and ensure proper functioning + (debugging)
assign instr = instruction;
assign rVal = ALUResult;

//setup instruction fetch module
instructionFetch m0(clk,reset,pcVal,pcOverride,instruction);
//setup registerFile module
registerFile m1(instruction[5:3],instruction[5:3],ALUResult,writeEnable,clk,reset,regReadVal);
//setup ALU
ALU m2(regReadVal,instruction,instruction[7:6],ALUResult);
//setup Control Unit
CU m3(instruction,writeEnable,pcVal,pcOverride);
endmodule
