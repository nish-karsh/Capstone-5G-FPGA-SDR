`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/20/2024 03:31:11 PM
// Design Name: 
// Module Name: compifft4
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


module compifft4(ce,clk,ye1,imge1,ye2,imge2,ye3,imge3,ye4,imge4,xf1,imgf1,xf2,imgf2,xf3,imgf3,xf4,imgf4);
input ce,clk;
input signed [7:0] ye1,imge1,ye2,imge2,ye3,imge3,ye4,imge4;
output reg signed [7:0] xf1,imgf1,xf2,imgf2,xf3,imgf3,xf4,imgf4;

wire signed [7:0] za1,imgz1,za2,imgz2,za3,imgz3,za4,imgz4;

compiff2 a0(ce,clk,ye1,imge1,ye3,imge3,za1,imgz1,za2,imgz2);
compiff2 a1(ce,clk,ye2,imge2,ye4,imge4,za3,imgz3,za4,imgz4);

always @(posedge clk)
begin
xf1 = (za1 + za3)/2;
imgf1 = (imgz1 + imgz3)/2;

xf2 = (za2 - imgz4)/2;
imgf2 = (imgz2 + za4)/2;

xf3 = (za1 - za3)/2;
imgf3 = (imgz1 - imgz3)/2;

xf4 = (za2 + imgz4)/2;
imgf4 = (imgz2 - za4)/2;
end
endmodule

