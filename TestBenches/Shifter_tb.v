`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2019 03:17:47 PM
// Design Name: 
// Module Name: Shifter_tb
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


module Shifter_tb(

    );
    reg [4:0] SH;
    reg [1:0]S;  //1 for right, 0 for left
    reg [31:0] A;
    wire [31:0] AOut;
    wire LCO;
    wire RCO;
    Shifter UUT(.SH(SH),.S(S),.A(A),.AOut(AOut),.LCO(LCO),.RCO(RCO));
    initial begin
    SH=0;
    S=0;
    A=0;
    #10
    SH=5'd31;
    A=32'hffffffff;
    #10
    S=0;
    #10;
    S=1;
    SH=5'd31;
    A=32'hffffffff;
    #10
    S=0;
    #10;
    S=0;
    SH=5'd0;
    A=32'h0fffffff;
    #10;
    S=1;
    SH=5'd7;
    A=32'hfffffff0;
    #10;
    S=1;
    SH=5'd1;
    A=32'hfffffff0;
    end
endmodule
