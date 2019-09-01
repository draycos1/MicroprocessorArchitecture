`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2019 03:05:01 PM
// Design Name: 
// Module Name: DataMemory_tb
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


module DataMemory_tb(

    );    
    reg reset;
    reg WR;
    reg [31:0] ADDRESS;
    reg [31:0] BIN;
    wire [31:0] DATAOUT;
    DataMemory UUT(.reset(reset),.WR(WR),
    .ADDRESS(ADDRESS),.BIN(BIN),.DATAOUT(DATAOUT));
    integer i;
    initial begin
    reset=0;
    WR=0;
    ADDRESS=0;
    BIN=0;
    #300; //wait for reset
    for(i=0; i<6; i = i+1)begin
         ADDRESS=i[7:0];
         BIN=i[7:0];
         #5;
        end
    #10 reset=1;
    #10 reset=0;
    for(i=0; i<6; i = i+1)begin
         ADDRESS=i[7:0];
         BIN=i[7:0];
         #5;
        end
    #10 WR=1;
   
    for(i=0; i<256; i = i+1)begin
        #10 ADDRESS=i[7:0];
        BIN=32'hFFFFFFFF;
        end
     
    reset=0;    
    end
   
endmodule
