`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2019 10:42:34 AM
// Design Name: 
// Module Name: DOF_tb
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


module DOF_tb(

    );
    reg [15:0] PCM1;
    reg [31:0] IR;
    reg [31:0] ADATA;
    reg [31:0] BDATA;
    wire  [4:0] AA;
    wire  [4:0] BA;
    wire        RW;
    wire  [4:0] DA;
    wire  [1:0] MD;
    wire  [1:0] BS;
    wire        PS;
    wire        MW;
    wire  [4:0] FS;
    wire [31:0] ABUS;
    wire [31:0] BBUS;
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
    DOF UUT(.PCM1(PCM1),.IR(IR),.ADATA(ADATA),.BDATA(BDATA),.AA(AA),.BA(BA),.RW(RW),.DA(DA),.MD(MD),
    .BS(BS),.PS(PS),.MW(MW),.FS(FS),.BBUS(BBUS),.ABUS(ABUS));
    initial begin 
    //need to test for muxing constant generation, pcm1, and a/bus out
    PCM1=15'b1;
    IR={NOP,25'b0};
    ADATA=32'd100;
    BDATA=32'd0;
    #10
    PCM1=15'd2;
    IR={ADD,5'd5,5'd3,5'd2,10'b0};
    #10
    PCM1=15'd3; //this should set mux b to 1
    IR={ADI,5'd5,5'd3,5'd2,10'b0};
    ADATA=32'd100;
    BDATA=32'd10;
    #10
    PCM1=15'd4; //this should set mux a to 1 and pass through pc
    IR={JML,5'd5,5'd3,5'd2,10'b0};
    ADATA=32'd100;
    BDATA=32'd10;
    end
endmodule
