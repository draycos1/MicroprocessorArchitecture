`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2019 09:04:37 AM
// Design Name: 
// Module Name: ConstantUnit_tb
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


module ConstantUnit_tb(

    );
    reg [14:0] IM;
    reg CS;
    wire [31:0] CUO;
    ConstantUnit UUT(.IM(IM),.CS(CS),.CUO(CUO));
    initial begin
    IM=15'b0;
    CS=0;
    #10
    IM=15'b100000000011000;
    CS=1;
    #10
    IM=15'b000011000011000;
    CS=1;
    #10
    IM=15'b100011000011000;
    CS=0;
    end
endmodule
