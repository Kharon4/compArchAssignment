`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Abhishek Khurana
// 
// Create Date:    00:36:25 04/15/2021 
// Module Name:    pipelinedProcessor 
//////////////////////////////////////////////////////////////////////////////////
module pipelinedProcessor(
    input clk,
    input reset,//active low
    output [7:0] instr,
    output [7:0] rVal
    );

//wb stage
wire weWB;//write enable wb stage
wire [7:0] wvWB;//write value wb stage
wire [7:0]insWB;//instruction wb stage

//instruction fetch and CU stage
wire [7:0]pcVal;//value to add to pc
wire pcOverride;//active low //enable toadd pcVal to pc
wire writeEnable;//active low //enable to write to registerFile
wire [7:0]instruction;//instruction loaded

//implement instructionFetch module
instructionFetch m0(clk,reset,pcVal,pcOverride,instruction);
//implement control unit
CU m3(instruction,writeEnable,pcVal,pcOverride);

//IF/ID reg 
wire [7:0]insIFID;//instruction IF/ID stage
wire weIFID;//write enable IF/ID stage
//setup flip flops for IF/ID stage
flipFlop1Byte insReg_IFID(instruction,clk,reset,insIFID);
flipFlop1Bit weReg_IFID(writeEnable,clk,reset,weIFID);

//regfile stage
wire [7:0]regReadVal;//value of reg read from registerFile
//setup registerFile
registerFile m1(insIFID[5:3],insWB[5:3],wvWB,weWB,clk,reset,regReadVal);

//forwarded value from regFile stage to EX stage
wire [7:0]fwdRegReadVal;//can be the value read or the one forwaded

//ID/EX reg
wire [7:0]insIDEX;//instruction ID/EX stage
wire [7:0]regVIDEX;//register value ID/EX stage
wire weIDEX;//write enable ID/EX stage

//setup flipflops for ID/EX stage
flipFlop1Byte insReg_IDEX(insIFID,clk,reset,insIDEX);
flipFlop1Byte regVReg_IDEX(fwdRegReadVal,clk,reset,regVIDEX);
flipFlop1Bit weReg_IDEX(weIFID,clk,reset,weIDEX);

//execution stage
wire [7:0]ALUResult;//will contain alu result
wire [7:0]fwdVal;//value of register either direct or forwarded
ALU m2(fwdVal,insIDEX,insIDEX[7:6],ALUResult);//setup ALU

//EX/WB reg  -- Setup flipflops
flipFlop1Byte insReg_EXWB(insIDEX,clk,reset,insWB);
flipFlop1Byte wvReg_EXWB(ALUResult,clk,reset,wvWB);
flipFlop1Bit weReg_EXWB(weIDEX,clk,reset,weWB);

//forwarding unit
forwardingUnit fu(weWB, insWB, wvWB, insIDEX, regVIDEX, insIFID, regReadVal, fwdVal, fwdRegReadVal);

//for output monitoring
assign instr = instruction;
assign rVal = ALUResult;

endmodule
