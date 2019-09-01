`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2019 04:45:18 PM
// Design Name: 
// Module Name: FunctionUnit
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


module FunctionUnit(
    input [31:0] ABus,
    input [31:0] BBus,
    input [4:0] SH,
    input [4:0] FS,
    output V,
    output Z,
    output C,
    output N,
    output [31:0] F,
    output LCO,
    output RCO
    );
    wire [31:0] mathResult;
    wire [31:0] logicResult;
    wire [31:0] shiftResult;

    ArithmeticUnit arithmeticU(
    .A(ABus),.B(BBus),.V(V),.arOut(mathResult),.Cin(FS[0]),.S(FS[2:1]),.Cout(C));
    LogicUnit logicU(.A(ABus),.B(BBus),.logicModuleOutput(logicResult),.S(FS[2:1]));
    Shifter shift(.SH(SH),.S(FS[0]),.A(ABus),.AOut(shiftResult),.LCO(LCO),.RCO(RCO));
    
    assign F = (FS[4:3]==2'b00)?(mathResult):
               (FS[4:3]==2'b01)?(logicResult):
               (FS[4]==1'b1)?(shiftResult):
               32'bx;
    assign Z = (F==31'b0)?1:
                0;
    assign N = (F[31]==1)?1:
                0;                       
endmodule
