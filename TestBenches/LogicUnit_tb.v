`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2019 02:37:09 PM
// Design Name: 
// Module Name: LogicUnit_tb
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


module LogicUnit_tb();
    reg [31:0] A;
    reg [31:0] B;
    reg [1:0] S;

    wire [31:0] logicModuleOutput;
    
LogicUnit UUT(.A(A),.B(B),.S(S),.logicModuleOutput(logicModuleOutput));    

initial begin
#10
A=32'hFFFF;
B=32'h0F0F;
S=2'b00;
#10
A=32'hFFFF;
B=32'h0F0F;
S=2'b01;
#10
A=32'hFFFF;
B=32'h0F0F;
S=2'b10;
#10
A=32'hFFFF;
B=32'hFFFF;
S=2'b11;
end

endmodule
