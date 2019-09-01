`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2019 09:11:05 AM
// Design Name: 
// Module Name: DOF
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


module DOF(
    input [15:0] PCM1,
    input [31:0] IR,
    input [31:0] ADATA,
    input [31:0] BDATA,
    output  [4:0] AA,
    output  [4:0] BA,
    output        RW,
    output  [4:0] DA,
    output  [1:0] MD,
    output  [1:0] BS,
    output        PS,
    output        MW,
    output  [4:0] FS,
    output [4:0] SH,
    output [31:0] ABUS,
    output [31:0] BBUS,
    output [15:0]PCM2
    );
    wire MB;
    wire MA;
    wire CS;
    wire [31:0] constant;
    assign SH=IR[4:0];
    InstructionDecoder decoder(.IR(IR),.DA(DA),.MD(MD),.BS(BS),.PS(PS),
    .MW(MW),.FS(FS),.MB(MB),.MA(MA),.AA(AA),.BA(BA),.CS(CS),.RW(RW));
    ConstantUnit constantunit(.IM(IR[14:0]),.CS(CS),.CUO(constant));
    assign ABUS=(MA==0)?(ADATA):
                (MA==1)?({16'b0,PCM1}): //zero fill since using a 16 bit program counter
                32'b0;
    assign BBUS=(MB==0)?(BDATA):
                (MB==1)?(constant): //zero fill since using a 16 bit program counter
                32'b0;      
    assign PCM2=PCM1;                  
endmodule
