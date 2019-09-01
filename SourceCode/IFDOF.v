`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/01/2019 01:45:52 PM
// Design Name: 
// Module Name: IFDOF
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// this module contains instruction memory as well as the plus 1 to pc
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module IFDOF(
    input [15:0] PC,
    output [15:0] PC1,
    output reg [31:0] IR
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
reg [31:0] programMemory [255:0]; 


integer i; //get rid of this when not testing
initial begin
//program memory goes here, equivalent to msp430 flash
//initialize memory
for(i=0; i<256; i=i+1) begin
    programMemory[i]={NOP,5'd0,5'd0,5'd0,10'd0}; //do nothing unless told otherwise
end
//end test initilizaiton
programMemory[1]={NOP,5'd0,5'd0,5'd0,10'd0}; //avoids data hazard/control hazard
programMemory[2]={SUB,5'd4,5'd2,5'd7,10'd0}; //load an add instruction just to check
programMemory[3]={NOP,5'd0,5'd0,5'd0,10'd0}; //avoids data hazard/control hazard
programMemory[4]={SLT,5'd4,5'd5,5'd3,10'd0}; //load an add instruction just to check
programMemory[5]={NOP,5'd0,5'd0,5'd0,10'd0}; //avoids data hazard/control hazard
programMemory[6]={AND,5'd4,5'd2,5'd5,10'd0}; //load an add instruction just to check
programMemory[7]={NOP,5'd0,5'd0,5'd0,10'd0}; //avoids data hazard/control hazard
programMemory[8]={OR,5'd4,5'd2,5'd5,10'd0}; //load an add instruction just to check
programMemory[9]={NOP,5'd0,5'd0,5'd0,10'd0}; //avoids data hazard/control hazard
programMemory[10]={XOR,5'd4,5'd2,5'd5,10'd0}; //load an add instruction just to check
programMemory[11]={NOP,5'd0,5'd0,5'd0,10'd0}; //avoids data hazard/control hazard
programMemory[12]={ST,5'd4,5'd2,5'd5,10'd0}; //load an add instruction just to check
programMemory[13]={NOP,5'd0,5'd0,5'd0,10'd0}; //avoids data hazard/control hazard
programMemory[14]={LD,5'd4,5'd2,5'd5,10'd0}; //load an add instruction just to check
programMemory[15]={NOP,5'd0,5'd0,5'd0,10'd0}; //avoids data hazard/control hazard
programMemory[16]={ADI,5'd4,5'd2,15'd3}; //load an add instruction just to check
programMemory[17]={NOP,5'd0,5'd0,15'd0}; //avoids data hazard/control hazard
programMemory[18]={SBI,5'd4,5'd2,15'd3}; //load an add instruction just to check
//programMemory[19]={NOP,5'd0,5'd0,5'd0,10'd0}; //avoids data hazard/control hazard
//programMemory[20]={NOT,5'd4,5'd2,15'd0}; //load an add instruction just to check
//programMemory[21]={NOP,5'd0,5'd0,5'd0,10'd0}; //avoids data hazard/control hazard
//programMemory[22]={ANI,5'd4,5'd2,15'd3}; //load an add instruction just to check
//programMemory[23]={NOP,5'd0,5'd0,5'd0,10'd0}; //avoids data hazard/control hazard
//programMemory[24]={ORI,5'd4,5'd2,15'd3}; //load an add instruction just to check
//programMemory[25]={NOP,5'd0,5'd0,5'd0,10'd0}; //avoids data hazard/control hazard
//programMemory[26]={XRI,5'd4,5'd2,15'd3}; //load an add instruction just to check
//programMemory[27]={NOP,5'd0,5'd0,5'd0,10'd0}; //avoids data hazard/control hazard
//programMemory[28]={AIU,5'd4,5'd2,15'd15}; //load an add instruction just to check
//programMemory[29]={NOP,5'd0,5'd0,5'd0,10'd0}; //avoids data hazard/control hazard
//programMemory[30]={SIU,5'd4,5'd2,15'd15}; //load an add instruction just to check
//programMemory[31]={NOP,5'd0,5'd0,5'd0,10'd0}; //avoids data hazard/control hazard
//programMemory[32]={MOV,5'd4,5'd2,5'd5,10'd0}; //load an add instruction just to check
//programMemory[33]={NOP,5'd0,5'd0,5'd0,10'd0}; //avoids data hazard/control hazard
//programMemory[34]={LSL,5'd4,5'd2,15'd3}; //load an add instruction just to check
//programMemory[35]={NOP,5'd0,5'd0,5'd0,10'd0}; //avoids data hazard/control hazard
//programMemory[36]={LSR,5'd4,5'd2,15'd3}; //load an add instruction just to check
//programMemory[37]={NOP,5'd0,5'd0,5'd0,10'd0}; //avoids data hazard/control hazard
//programMemory[38]={JMR,5'd0,5'd2,15'd0}; //load an add instruction just to check
//programMemory[39]={NOP,5'd0,5'd0,5'd0,10'd0}; //avoids data hazard/control hazard
programMemory[40]={BZ,5'd0,5'd0,15'd3}; //load an add instruction just to check
programMemory[41]={NOP,5'd0,5'd0,5'd0,10'd0}; //avoids data hazard/control hazard
//programMemory[42]={BNZ,5'd5,5'd3,15'd5}; //load an add instruction just to check
//programMemory[43]={NOP,5'd0,5'd0,5'd0,10'd0}; //avoids data hazard/control hazard
programMemory[44]={JMP,5'd4,5'd2,15'd5}; //load an add instruction just to check
programMemory[45]={NOP,5'd0,5'd0,5'd0,10'd0}; //avoids data hazard/control hazard
programMemory[46]={JML,5'd4,5'd0,15'd5}; //load an add instruction just to check

IR=0;
end
always@(*)begin
    
    IR<=programMemory[PC];
    
end
assign PC1=PC+32'd1;

endmodule
