`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2019 08:50:01 AM
// Design Name: 
// Module Name: ConstantUnit
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


module ConstantUnit(
    input [14:0] IM,
    input CS,
    output [31:0] CUO
    );
assign CUO = (CS==1)?({{17{IM[14]}} , IM}): //sign extension (add 17 of the sign bit of )
             (CS==0)?({17'b0,IM}):      //zero fill
             32'b0;    
endmodule
