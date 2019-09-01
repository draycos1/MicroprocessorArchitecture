`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2019 01:19:53 PM
// Design Name: 
// Module Name: ArithmeticUnit_tb
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


module ArithmeticUnit_tb(

    );
        //inputs
    reg [31:0] A;
    reg [31:0] B;
    reg [1:0] S;
    reg Cin;
    //outputs
    wire V;
    wire Cout;
    wire [31:0] arOut;
    
    ArithmeticUnit UUT( //create unit under test
    .A(A),
    .B(B),
    .S(S),
    .Cin(Cin),
    .V(V),
    .Cout(Cout),
    .arOut(arOut)
    );
    //test bench should show transfer, transfer + 1, add, add +1, invert of B, decrement, and S=11 transfer 
    //should also test carry and overflow conditions
    initial begin
    #10
    S=2'b00; //tests  A transfer
    A=32'd1;
    B=32'd1;
    Cin=0;
    #10
    S=2'b00; //tests  increment A
    A=32'd1;
    B=32'd1;
    Cin=1;
    #10
    S=2'b01; //a+b generic test
    A=32'd4;
    B=32'd1;
    Cin=0;
    #10
    S=2'b10; //a+bbar 
    A=32'd1;
    B=32'd1;
    Cin=0;
    #10
    S=2'b11; //tests decrement
    A=32'd1;
    B=32'd1;
    Cin=0;
    #10
    S=2'b11; //tests A-1
    A=32'd1;
    B=32'd2;
    Cin=1;
    #10    
    S=2'b01; 
    A=32'h7FFFFFFF; //should overflow (add two pos)
    B=32'h00000001;
    Cin=0;
    #10
    A=32'h80000002;  //overflow (add two negs)
    B=32'h8000000F; 
    Cin=0;
    #10;
    S=2'b10; //sub overflow
    A=32'hEFFFFFFF; //negative - negative should throw overflow
    B=32'h7FFFFFFF; //b gets inverted, should be pos going in
    Cin=1; //set cin 1 to subtract
    #10;
    S=2'b10; //sub overflow
    A=32'h0000000F; //pos-pos should throw overflow
    B=32'h8000000F; //should be neg going in to get inverted to pos
    Cin=1;
    end
endmodule
