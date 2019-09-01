`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2019 01:29:08 PM
// Design Name: 
// Module Name: DataMemory
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


module DataMemory(
    input reset,
    input WR, //this is muxW
    input [31:0] BIN,
    input [31:0] ADDRESS,
    output [31:0] DATAOUT
    );
    reg [31:0] data [255:0];
    assign DATAOUT= data[ADDRESS[7:0]];
    integer counter;
    initial begin
    for(counter=0; counter<256; counter=counter+1)begin
    data[counter]=counter; //for debugging
    end 
    end
    always @(*) begin //if WR or reset change
        if(reset)begin //need to hold reset for at least 32 cycles
             for(counter=0; counter<256; counter=counter+1)begin
                data[counter]<=counter; //wipe memory on reset
             end
        end     
        else if(WR)begin
            data[ADDRESS[7:0]]<=BIN; //write data in to selected adress
        end 
    end
    
    

endmodule
