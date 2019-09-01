`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/01/2019 02:21:14 PM
// Design Name: 
// Module Name: IFDOF_tb
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


module IFDOF_tb(

    );
    reg  [15:0] PC;
 
    wire [15:0] PC1;
    wire [31:0] IR;
    IFDOF UUT(.PC(PC),.PC1(PC1),.IR(IR));   
    initial begin
    
    PC=0;
    #10
    PC=1;
    #10
    PC=2;
    end
    
    
    
    
endmodule
