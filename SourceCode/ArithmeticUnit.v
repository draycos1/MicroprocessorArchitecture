`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2019 12:49:25 PM
// Design Name: 
// Module Name: ArithmeticUnit
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


module ArithmeticUnit(
    input [31:0] A,
    input [31:0] B,
    input [1:0] S,
    input Cin,
    output V,
    output Cout,
    output [31:0] arOut
    );
  wire [31:0]tempB;  
  //ArithLogicSubMod logicModule(B[31:0],S[1:0],tempB[16:0]);  
  wire [31:0] tempA =A; //extra bit for carry detection (adding 0 should set 17th bit to 0)
  wire [32:0] tempOut=(tempB+tempA)+Cin;  
             //unknown value of B
//assign tempB[16]=0;
assign tempB[31:0] =   (S==2'b00)?(32'b0):    //set B=0
                       (S==2'b01)?(B[31:0]):  //keep B 
                       (S==2'b10)?(~B[31:0]): //invert
                       (S==2'b11)?(32'hFFFFFFFF)://all 1's
                       (32'bx); 
             
  
  assign Cout = tempOut[32]; //17th bit is only set if carry (unsigned)  
  assign V = (((A[31]==1&&B[31]==1)&&(S[1]==0))&&(tempOut[31]==0))? 1: //add two negatives, get a positive
             (((A[31]==0&&B[31]==0)&&(S[1]==0))&&(tempOut[31]==1))? 1: //add two positives, get a negative
             (((A[31]==0&&B[31]==0)&&(S[1]==1))&&(tempOut[31]==1))? 1: //sub two positives, get a negative
             (((A[31]==1&&B[31]==1)&&(S[1]==1))&&(tempOut[31]==0))? 1: //sub two negatives, get a positive
                                                                    0; //default case here
  assign arOut=tempOut[31:0]; //discard 32nd bit
endmodule
