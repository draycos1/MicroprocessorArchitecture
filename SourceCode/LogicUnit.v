`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2019 12:57:33 PM
// Design Name: 
// Module Name: LogicUnit
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


module LogicUnit(
    input [31:0] A,
    input [31:0] B,
    input [1:0] S,
    output [31:0] logicModuleOutput
    );
    
assign logicModuleOutput = (S==2'b00)?(A&B): //and
                           (S==2'b01)?(A|B): //or   
                           (S==2'b10)?(A^B): //xor   
                           (S==2'b11)?(~A): //not   
                            31'bx; //shouldnt be here, throw an x 
endmodule
