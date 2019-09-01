`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2019 04:43:23 PM
// Design Name: 
// Module Name: EX_tb
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


module EX_tb(

    );
    reg [31:0] ABUS;
    reg [31:0] BBUS;
    reg [15:0] PCN2;
    reg  reset;
    reg        MW;
    reg  [4:0] FS;
    reg  [4:0] SH;
    wire [15:0] RAA;
    wire [15:0] BrA;
    wire V;
    wire C;
    wire N;
    wire Z;
    wire NXORV;
    wire LCO; //left shift out
    wire RCO; //right shift out
    wire [31:0] F;
    wire [31:0] data;
    EX UUT(.ABUS(ABUS),.BBUS(BBUS),.PCN2(PCN2),.reset(reset)
    ,.MW(MW),.FS(FS),.SH(SH),.RAA(RAA),.BrA(BrA),.V(V),.C(C),.N(N),.Z(Z),
    .NXORV(NXORV),.LCO(LCO),.RCO(RCO),.F(F),.data(data));
    initial begin //do add, add write, verify status bits, so something that sets v,n,c,and,z as well as data out
      ABUS=32'b0;
      BBUS=32'b0;
      PCN2=16'b0;
      reset=0;
      MW=0;
      FS=0;
      SH=0;
    #10
      ABUS=32'h7FF00FFF; //subtract with overflow
      BBUS=32'h7FFFFFFF;
      PCN2=16'b1;
      reset=0;
   
      MW=0;
      FS=5'b00100;
      SH=0;
      #10
      ABUS=32'h7FF00FFF; //lazy manual write check
      BBUS=32'h7FFFFFFF;
      PCN2=16'b1;
      reset=0;
 
      MW=1;
      FS=5'b00100;
      SH=0;
      #10
      ABUS=32'h7FF00FFF; //lazy manual reset check
      BBUS=32'h00000FFF;
      PCN2=16'b1;
      reset=1;
      MW=0;
      FS=5'b00100;
      SH=0;
    end
endmodule
