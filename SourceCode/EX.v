`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2019 03:25:31 PM
// Design Name: 
// Module Name: EX
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


module EX(
    input [31:0] ABUS,
    input [31:0] BBUS,
    input [15:0] PCN2,
    input  reset,
    input        MW,
    input  [4:0] FS,
    input  [4:0] SH,
    output [15:0] RAA,
    output [15:0] BrA,
    output V,
    output C,
    output N,
    output Z,
    output NXORV,
    output LCO, //left shift out
    output RCO, //right shift out
    output [31:0] F,
    output [31:0] data
    );
    assign NXORV = N^V;
    assign BrA = BBUS[15:0]+PCN2;
    assign RAA = ABUS[15:0];
    FunctionUnit funct(.ABus(ABUS),.BBus(BBUS),.FS(FS),.SH(SH),
    .V(V),.C(C),.N(N),.Z(Z),.LCO(LCO),.RCO(RCO),.F(F));
    DataMemory datmem(.ADDRESS(ABUS),.BIN(BBUS),.DATAOUT(data),.WR(MW),.reset(reset));
    
endmodule
