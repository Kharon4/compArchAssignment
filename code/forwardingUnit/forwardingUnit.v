`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Abhishek Khurana
// 
// Create Date:    03:41:25 04/15/2021 
// Module Name:    forwardingUnit 
//////////////////////////////////////////////////////////////////////////////////
module forwardingUnit(
    input weWB,
    input [7:0]insWB,
    input [7:0]wvWB,
	 input [7:0]insIDEX,
	 input [7:0]regVIDEX,
    input [7:0]insIFID,
    input [7:0]regReadVal,
	 output reg [7:0]fwdVal,
	 output reg [7:0]fwdRegReadVal
    );

//forwarding unit
initial begin
	fwdVal = regVIDEX;
end
always @(weWB,insWB,wvWB,insIDEX,regVIDEX)begin
	fwdVal = regVIDEX;
	if(weWB == 0)begin
		if(insIDEX[7:6] == 2'b01)begin
			if(insIDEX[5:3]==insWB[5:3])begin
				fwdVal = wvWB;
			end
		end
	end
end

initial begin
	fwdRegReadVal = regReadVal;
end
always @(weWB,insWB,wvWB,insIFID,regReadVal)begin
	fwdRegReadVal = regReadVal;
	if(weWB == 0)begin
		if(insIFID[7:6] == 2'b01)begin
			if(insIFID[5:3]==insWB[5:3])begin
				fwdRegReadVal = wvWB;
			end
		end
	end
end

endmodule
