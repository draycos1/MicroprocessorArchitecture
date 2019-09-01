`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/01/2019 04:19:25 PM
// Design Name: 
// Module Name: InstructionDecoder_tb
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


module InstructionDecoder_tb(

    );
parameter NOP = 7'b0000000; //no op
parameter ADD = 7'b0000010;
parameter SUB = 7'b0000101;
parameter SLT = 7'b1100101;//set if less than
parameter AND = 7'b0001000;
parameter OR  = 7'b0001010;
parameter XOR = 7'b0001100;
parameter ST  = 7'b0000001; //store
parameter LD  = 7'b0100001;
parameter ADI = 7'b0100010;
parameter SBI = 7'b0100101;
parameter NOT = 7'b0101110;
parameter ANI = 7'b0101000;
parameter ORI = 7'b0101010;
parameter XRI = 7'b0101100;
parameter AIU = 7'b1100010;
parameter SIU = 7'b1000101;
parameter MOV = 7'b1000000;
parameter LSL = 7'b0110010;
parameter LSR = 7'b0110001;
parameter JMR = 7'b1100001;
parameter BZ  = 7'b0100000;
parameter BNZ = 7'b1100000;
parameter JMP = 7'b1000100;
parameter JML = 7'b0000111;
    reg   [31:0]IR;
    wire        RW;
    wire  [4:0] DA;
    wire  [1:0] MD;
    wire  [1:0] BS;
    wire        PS;
    wire        MW;
    wire  [4:0] FS;
    wire        MB;
    wire        MA;
    wire  [4:0] AA;
    wire  [4:0] BA;
    wire        CS;
    InstructionDecoder UUT(.IR(IR),.RW(RW),.DA(DA),.MD(MD),.BS(BS),.PS(PS),
    .MW(MW),.FS(FS),.MB(MB),.MA(MA),.AA(AA),.BA(BA),.CS(CS));
    initial begin
    #10
    IR={NOP,25'b0};
    #10
    IR={ADD,5'd5,5'd3,5'd2,10'b0};
    #10
    IR={OR,5'd5,5'd3,5'd2,10'b0};
    end
endmodule
