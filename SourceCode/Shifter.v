`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2019 12:57:33 PM
// Design Name: 
// Module Name: Shifter
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


module Shifter(
    input [4:0] SH,
    input S,  //1 for right, 0 for left
    input [31:0] A,
    output [31:0] AOut,
    output LCO, //left carry out
    output RCO  //right carry out
    );
    wire [33:0] tempA;
    assign tempA={1'b0,A,1'b0}; //sets a ) bit on either side of tempA
    wire [33:0] lshift=tempA<<SH;
    wire [33:0] rshift=tempA>>SH;
    assign AOut = (S==1'b1)?(rshift[32:1]): //shift left or right SH number of times
                  (S==1'b0)?(lshift[32:1]): //grab only the actual bits of a, not the carry
                  32'bx;  
    assign LCO = lshift[33];
    assign RCO = rshift[0];              
endmodule
