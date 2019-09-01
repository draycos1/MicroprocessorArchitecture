`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2019 05:21:55 PM
// Design Name: 
// Module Name: FunctionUnit_tb
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


module FunctionUnit_tb(

    );
    
    reg [31:0] ABus;
    reg [31:0] BBus;
    reg [4:0] SH;
    reg [4:0] FS;
    wire V;
    wire Z;
    wire C;
    wire N;
    wire [31:0] F;
    wire LCO;
    wire RCO;
    
    FunctionUnit UUT(
    .ABus(ABus),.BBus(BBus),.SH(SH),.FS(FS),.V(V),.C(C),
    .Z(Z),.N(N),.F(F),.LCO(LCO),.RCO(RCO));
    initial begin
    //Test arithmetic transfer, add w/ overflow, subtract
    //Test 1 or two logic ops and transfer
    //Test shift, and shift w/ RCO/LCO
    ABus=0;
    BBus=0;
    SH=0;
    FS=0;   
    #30
    ABus=32'hFFFFFFFF; //and
    BBus=32'h0FFFFFF0;
    SH=0;
    FS=5'b01000; 
    #30
    ABus=32'hFFFFFFFF; //!A
    BBus=0;
    SH=0;
    FS=5'b01110; 
    #30
    ABus=32'hFFFFFFFF;
    BBus=32'h7FFFFFFF;
    SH=0;
    FS=5'b00101;  
    #30
    ABus=32'hFFFFFFFF;
    BBus=32'h7FFFFFFF;
    SH=0;
    FS=5'b00000;  //Transfer A
    #30
    ABus=32'h7FFFFFFA;
    BBus=32'h00000001;
    SH=0;
    FS=5'b00010; //ADD
    #30
    ABus=32'h7FF00FFF;
    BBus=32'h7FFFFFFF;
    SH=0;
    FS=5'b00100; //SUB w/ overflow
    #30
    ABus=32'hFFFFFFFF;
    BBus=32'h0FFFFFFF;
    SH=0;
    FS=5'b10000;   //transfer B
    #30
    ABus=32'hFFFFFFFF;
    BBus=32'h0FFFFFFF;
    SH=5'd2;
    FS=5'b11000;  //left shift
    end
    endmodule
