`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/01/2019 01:30:03 PM
// Design Name: 
// Module Name: IF_tb
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


module IF_tb(

    );
    reg [1:0] BS;
    reg PS;
    reg Z;
    reg [15:0] BrA;
    reg [15:0] RAA;
    reg [15:0] PC1; //PC plus 1 as per diagram
    wire [15:0] PC; //this is a connectiong wire to pc
    IF UUT(.BS(BS),.PS(PS),.Z(Z),.BrA(BrA),.RAA(RAA),.PC1(PC1),.PC(PC));
    initial begin
    #10
    BS=2'b00;
    PS=0;
    Z=0;
    BrA=15'h0000;
    RAA=15'h0000;
    PC1=15'h0000;
    #10
    BS=2'b11; //should pull branch adress
    PS=0;
    Z=0;
    BrA=15'h0FF0;
    RAA=15'h0000;
    PC1=15'h0001;
    #10
    BS=2'b00; //should pull return adress
    PS=0;
    Z=0;
    BrA=15'h0FF0;
    RAA=15'hF00F;
    PC1=15'h0002;
      #10
    BS=2'b01; //should be branch not zero
    PS=1;
    Z=0;
    BrA=15'h0FF0;
    RAA=15'hF00F;
    PC1=15'h0004;
    #10
    BS=2'b01; //should be branch not zero
    PS=1;
    Z=1;
    BrA=15'h0FF0;
    RAA=15'hF00F;
    PC1=15'h0004;
    #10
    BS=2'b01; //should be branch  zero
    PS=0;
    Z=1;
    BrA=15'h0FF0;
    RAA=15'hF00F;
    PC1=15'h0004;
    end
endmodule
