`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2019 03:07:27 PM
// Design Name: 
// Module Name: Top_tb
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


module Top_tb(

    );
    reg clock;
    reg reset;
    Top UUT(.clock(clock),.reset(reset));
    initial begin
    clock=0;
    reset=0;
    
    
    end
    
    
    
    always begin
    #5
    clock =~clock;
    
    end
endmodule
