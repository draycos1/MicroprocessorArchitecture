`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2019 11:02:32 AM
// Design Name: 
// Module Name: InstructionDecoder
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


module InstructionDecoder(
    input [31:0] IR,
    output        RW,
    output  [4:0] DA,
    output  [1:0] MD,
    output  [1:0] BS,
    output        PS,
    output        MW,
    output  [4:0] FS,
    output        MB,
    output        MA,
    output  [4:0] AA,
    output  [4:0] BA,
    output        CS
    );
//set a parameter for opcode, set all the status bits here depending on adressing   
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
wire [21:0] lookup [24:0];
assign lookup[0]=	{NOP	 ,1'b0	,2'b00	,2'b00	,1'b0	,1'b0	,5'b00000	,1'b0	,1'b0	,1'b0	};
assign lookup[1]=	{ADD	 ,1'b1	,2'b00	,2'b00	,1'b0	,1'b0	,5'b00010	,1'b0	,1'b0	,1'b0	};
assign lookup[2]=	{SUB	 ,1'b1	,2'b00	,2'b00	,1'b0	,1'b0	,5'b00101	,1'b0	,1'b0	,1'b0	};
assign lookup[3]=	{SLT	 ,1'b1	,2'b10	,2'b00	,1'b0	,1'b0	,5'b00101	,1'b0	,1'b0	,1'b0	};
assign lookup[4]=	{AND	 ,1'b1	,2'b00	,2'b00	,1'b0	,1'b0	,5'b01000	,1'b0	,1'b0	,1'b0	};
assign lookup[5]=	{OR	     ,1'b1	,2'b00	,2'b00	,1'b0	,1'b0	,5'b01010	,1'b0	,1'b0	,1'b0	};
assign lookup[6]=	{XOR	 ,1'b1	,2'b00	,2'b00	,1'b0	,1'b0	,5'b01100	,1'b0	,1'b0	,1'b0	};
assign lookup[7]=	{ST	     ,1'b0	,2'b00	,2'b00	,1'b0	,1'b1	,5'b00000	,1'b0	,1'b0	,1'b0	};
assign lookup[8]=	{LD	     ,1'b1	,2'b01	,2'b00	,1'b0	,1'b0	,5'b00000	,1'b0	,1'b0	,1'b0	};
assign lookup[9]=	{ADI	 ,1'b1	,2'b00	,2'b00	,1'b0	,1'b0	,5'b00010	,1'b1	,1'b0	,1'b1	};
assign lookup[10]=	{SBI	 ,1'b1	,2'b00	,2'b00	,1'b0	,1'b0	,5'b00101	,1'b1	,1'b0	,1'b1	};
assign lookup[11]=	{NOT	 ,1'b1	,2'b00	,2'b00	,1'b0	,1'b0	,5'b01110	,1'b0	,1'b0	,1'b0	};
assign lookup[12]=	{ANI	 ,1'b1	,2'b00	,2'b00	,1'b0	,1'b0	,5'b01000	,1'b1	,1'b0	,1'b0	};
assign lookup[13]=	{ORI	 ,1'b1	,2'b00	,2'b00	,1'b0	,1'b0	,5'b01010	,1'b1	,1'b0	,1'b0	};
assign lookup[14]=	{XRI	 ,1'b1	,2'b00	,2'b00	,1'b0	,1'b0	,5'b01100	,1'b1	,1'b0	,1'b0	};
assign lookup[15]=	{AIU	 ,1'b1	,2'b00	,2'b00	,1'b0	,1'b0	,5'b00010	,1'b1	,1'b0	,1'b0	};
assign lookup[16]=	{SIU	 ,1'b1	,2'b00	,2'b00	,1'b0	,1'b0	,5'b00101	,1'b1	,1'b0	,1'b0	};
assign lookup[17]=	{MOV	 ,1'b1	,2'b00	,2'b00	,1'b0	,1'b0	,5'b00000	,1'b0	,1'b0	,1'b0	};
assign lookup[18]=	{LSL	 ,1'b1	,2'b00	,2'b00	,1'b0	,1'b0	,5'b10000	,1'b0	,1'b0	,1'b0	};
assign lookup[19]=	{LSR	 ,1'b1	,2'b00	,2'b00	,1'b0	,1'b0	,5'b10001	,1'b0	,1'b0	,1'b0	};
assign lookup[20]=	{JMR	 ,1'b0	,2'b00	,2'b10	,1'b0	,1'b0	,5'b00000	,1'b0	,1'b0	,1'b0	};
assign lookup[21]=	{BZ	     ,1'b0	,2'b00	,2'b01	,1'b0	,1'b0	,5'b00000	,1'b1	,1'b0	,1'b1	};
assign lookup[22]=	{BNZ	 ,1'b0	,2'b00	,2'b01	,1'b1	,1'b0	,5'b00000	,1'b1	,1'b0	,1'b1	};
assign lookup[23]=	{JMP	 ,1'b0	,2'b00	,2'b11	,1'b0	,1'b0	,5'b00000	,1'b1	,1'b0	,1'b1	};
assign lookup[24]=	{JML	 ,1'b1	,2'b00	,2'b11	,1'b0	,1'b0	,5'b00111	,1'b1	,1'b1	,1'b1	};
assign {RW,MD,BS,PS,MW,FS,MB,MA,CS}=(lookup[0][21:15]==IR[31:25])?(lookup[0][14:0]): //if opcode matches IR opcode, assign bits
                                    (lookup[1][21:15]==IR[31:25])?(lookup[1][14:0]):
                                    (lookup[2][21:15]==IR[31:25])?(lookup[2][14:0]):
                                    (lookup[3][21:15]==IR[31:25])?(lookup[3][14:0]):
                                    (lookup[4][21:15]==IR[31:25])?(lookup[4][14:0]):
                                    (lookup[5][21:15]==IR[31:25])?(lookup[5][14:0]):
                                    (lookup[6][21:15]==IR[31:25])?(lookup[6][14:0]):
                                    (lookup[7][21:15]==IR[31:25])?(lookup[7][14:0]):
                                    (lookup[8][21:15]==IR[31:25])?(lookup[8][14:0]):
                                    (lookup[9][21:15]==IR[31:25])?(lookup[9][14:0]):
                                    (lookup[10][21:15]==IR[31:25])?(lookup[10][14:0]):
                                    (lookup[11][21:15]==IR[31:25])?(lookup[11][14:0]):
                                    (lookup[12][21:15]==IR[31:25])?(lookup[12][14:0]):
                                    (lookup[13][21:15]==IR[31:25])?(lookup[13][14:0]):
                                    (lookup[14][21:15]==IR[31:25])?(lookup[14][14:0]):
                                    (lookup[15][21:15]==IR[31:25])?(lookup[15][14:0]):
                                    (lookup[16][21:15]==IR[31:25])?(lookup[16][14:0]):
                                    (lookup[17][21:15]==IR[31:25])?(lookup[17][14:0]):
                                    (lookup[18][21:15]==IR[31:25])?(lookup[18][14:0]):
                                    (lookup[19][21:15]==IR[31:25])?(lookup[19][14:0]):
                                    (lookup[20][21:15]==IR[31:25])?(lookup[20][14:0]):
                                    (lookup[21][21:15]==IR[31:25])?(lookup[21][14:0]):
                                    (lookup[22][21:15]==IR[31:25])?(lookup[22][14:0]):
                                    (lookup[23][21:15]==IR[31:25])?(lookup[23][14:0]):
                                    (lookup[24][21:15]==IR[31:25])?(lookup[24][14:0]):
                                     14'b0;
assign DA=IR[24:20];
assign AA=IR[19:15];
assign BA=IR[14:10];
endmodule
