`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2019 11:55:50 AM
// Design Name: 
// Module Name: RegisterFiles
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

//based on code provided in examples for the course
module RegisterFiles(
    input clock,
    input reset,
    input WR,
    input [4:0] ASEL,
    input [4:0] BSEL,
    input [4:0] DSEL,
    input [31:0] DIN,
    output [31:0] AOUT,
    output [31:0] BOUT
    );
    reg [31:0] data [31:0];
    assign AOUT= data[ASEL];
    assign BOUT= data[BSEL];
    integer counter;
    initial begin
    data[0]=0;
    for(counter=1; counter<32; counter=counter+1)begin
    data[counter]=counter; //for debugging
    end 
    end
    always @(*) begin //if WR or reset change
        if(reset)begin //need to hold reset for at least 32 cycles
             for(counter=1; counter<32; counter=counter+1)begin
                data[counter]<=0; //wipe memory on reset
             end
        end     
        else if(WR)begin
            data[DSEL]<=DIN; //write data in to selected adress
        end 
    end
    
    
endmodule
