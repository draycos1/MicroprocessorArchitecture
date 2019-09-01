`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2019 12:22:42 PM
// Design Name: 
// Module Name: RegisterFiles_TB
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


module RegisterFiles_TB(

    );
    reg clock;
    reg reset;
    reg WR;
    reg [4:0] ASEL;
    reg [4:0] BSEL;
    reg [4:0] DSEL;
    reg [31:0] DIN;
    wire [31:0] AOUT;
    wire [31:0] BOUT;
    RegisterFiles UUT(.clock(clock),.reset(reset),.WR(WR),.ASEL(ASEL),.BSEL(BSEL),
    .DSEL(DSEL),.DIN(DIN),.AOUT(AOUT),.BOUT(BOUT));
    integer i;
    initial begin
    clock=0;
    reset=0;
    WR=0;
    ASEL=0;
    BSEL=0;
    DSEL=0;
    DIN=0;
    #300; //wait for reset
    for(i=1; i<32; i = i+1)begin
        #2 ASEL=i[4:0];
        #2 BSEL=i[4:0];
        end
    #10 reset=1;
    #10 reset=0;
    for(i=1; i<32; i = i+1)begin
        #2 ASEL=i[4:0];
        #2 BSEL=i[4:0];    
        end
    #10 WR=1;
    ASEL=5;
    BSEL=9;
    for(i=1; i<32; i = i+1)begin
        #10 DSEL=i[4:0];
        DIN=i[31:0];
        end
     for(i=1; i<32; i = i+1)begin
        #2 ASEL=i[4:0];
        #2 BSEL=i[4:0];
        end
    end
    always begin
    #5 clock=~clock;
    end
endmodule
