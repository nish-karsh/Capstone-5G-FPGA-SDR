`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/19/2024 10:37:11 AM
// Design Name: 
// Module Name: compff2
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


module compff2(ce,clk,x1,img1,x2,img2,y1,img3,y2,img4);
input ce,clk;
input signed [15:0] x1,img1,x2,img2;
output reg signed [15:0] y1,img3,y2,img4;
always @(posedge clk)
begin
y1 = x1+x2;
img3 = img1+ img2 ;
y2 = x1-x2;
img4 = img1 - img2;
end
endmodule
