`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/09/2024 02:58:31 PM
// Design Name: 
// Module Name: compff8
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


module compff8(ce,clk,xg1,imgg1,xg2,imgg2,xg3,imgg3,xg4,imgg4,xg5,imgg5,xg6,imgg6,xg7,imgg7,xg8,imgg8,yh1,imgh1,yh2,imgh2,yh3,imgh3,yh4,imgh4,yh5,imgh5,yh6,imgh6,yh7,imgh7,yh8,imgh8);
input ce,clk;
input signed[15:0] xg1,imgg1,xg2,imgg2,xg3,imgg3,xg4,imgg4,xg5,imgg5,xg6,imgg6,xg7,imgg7,xg8,imgg8;
output reg signed[15:0] yh1,imgh1,yh2,imgh2,yh3,imgh3,yh4,imgh4,yh5,imgh5,yh6,imgh6,yh7,imgh7,yh8,imgh8;

wire signed [15:0] ya[7:0],imga[7:0];

compff4 b1(ce,clk,xg1,imgg1,xg3,imgg3,xg5,imgg5,xg7,imgg7,ya[0],imga[0],ya[1],imga[1],ya[2],imga[2],ya[3],imga[3]);
compff4 b2(ce,clk,xg2,imgg2,xg4,imgg4,xg6,imgg6,xg8,imgg8,ya[4],imga[4],ya[5],imga[5],ya[6],imga[6],ya[7],imga[7]);

always @(posedge clk)                
begin
yh1 = ya[0] + ya[4]  ;
imgh1 = imga[0] + imga[4] ;

yh2 = ya[1]+ ((ya[5] + imga[5])*(0.707)) ;
imgh2 = imga[1]+ ((imga[5] - ya[5])*(0.707)) ;

yh3 = ya[2] + imga[6];
imgh3 = imga[2] - ya[6];

yh4 = ya[3] + ((imga[7] - ya[7])*(0.707));
imgh4 = imga[3] -((ya[7] + imga[7])*(0.707));

yh5 = ya[0] - ya[4];
imgh5 = imga[0] + imga[4];

yh6 = ya[1] - ((ya[5] + imga[5])*(0.707));
imgh6 = imga[1] + (( ya[5] - imga[5])*(0.707));

yh7 = ya[2] - imga[6];
imgh7 = imga[2] + ya[6];

yh8 = ya[3] + ((ya[7] - imga[7])*(0.707));
imgh8 = imga[3] +((ya[7] + imga[7])*(0.707));
end

endmodule
