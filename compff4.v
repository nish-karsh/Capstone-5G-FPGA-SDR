`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/19/2024 10:55:15 AM
// Design Name: 
// Module Name: compff4
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


module compff4(ce,clk,xa1,imga1,xa2,imga2,xa3,imga3,xa4,imga4,yb1,imgb1,yb2,imgb2,yb3,imgb3,yb4,imgb4);
input ce,clk;
input signed[15:0] xa1,imga1,xa2,imga2,xa3,imga3,xa4,imga4;
output reg signed [15:0]yb1,imgb1,yb2,imgb2,yb3,imgb3,yb4,imgb4;

wire signed [15:0] yc1,imgc1,yc2,imgc2,yc3,imgc3,yc4,imgc4;
compff2 a0(ce,clk,xa1,imga1,xa3,imga3,yc1,imgc1,yc2,imgc2);
compff2 a1(ce,clk,xa2,imga2,xa4,imga4,yc3,imgc3,yc4,imgc4);

always @(posedge clk)
begin 
yb1 = yc1 + yc3;
imgb1 = imgc1 + imgc3;

yb2 = yc2 + imgc4;
imgb2 =  imgc2 - yc4 ;

yb3 = yc1 - yc3;
imgb3 = imgc1 - imgc3;

yb4 = yc2 - imgc4;
imgb4 = imgc2 +  yc4 ;
end

endmodule
