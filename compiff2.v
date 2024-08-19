`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/20/2024 10:28:36 AM
// Design Name: 
// Module Name: compiff2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module compiff2(ce,clk,yc1,imgc1,yc2,imgc2,xd1,imgd1,xd2,imgd2);
input ce,clk;
input signed [7:0] yc1,imgc1,yc2,imgc2;
output reg signed [7:0] xd1,imgd1,xd2,imgd2;

always @(posedge clk)
begin
xd1 = (yc1 + yc2)/2;
imgd1 = (imgc1 + imgc2)/2;
xd2 = (yc1 - yc2)/2;
imgd2 = (imgc1 - imgc2)/2;
end
endmodule
