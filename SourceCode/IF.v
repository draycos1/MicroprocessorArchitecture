`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/01/2019 01:15:01 PM
// Design Name: 
// Module Name: IF
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// Instruction Fetch Phase of figure 10-15
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module IF(
    input [1:0] BS,
    input PS,
    input Z,
    input [15:0] BrA,
    input [15:0] RAA,
    input [15:0] PC1,
    output reg [15:0] PC //this is a connectiong wire to pc register
    );
    wire [1:0] sel={BS[1],(((PS^Z)|(BS[1]))&BS[0])};
    //assign PC=(sel==2'b00)?(PC1):
    //          (sel==2'd1||2'd3)?(BrA):
    //          (sel==2'd2)?(RAA):
    //         16'b0;
              always@(*)begin
              case(sel)
              2'b0:begin  
                   PC<=PC1; 
                   end 
              2'b1:begin
                   PC<=BrA;
                   end
              2'd2:begin
                   PC<=RAA;
                   end
              2'd3:begin
                   PC<=BrA;
                   end  
              default:begin 
              PC<=16'b0;
              end
              endcase
              end
endmodule
