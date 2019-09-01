`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2019 11:27:24 AM
// Design Name: 
// Module Name: Top
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


module Top(
input reset,
input clock
    );
    
reg [15:0] PC;
wire [15:0] PCIFOUT;

reg [15:0] PCN1;
wire [15:0] PCN1OUT;

reg [31:0] IR;
wire [31:0]IFDOFIROUT;

reg [15:0] PCN2;
wire [15:0] PCN2DOFOUT;



wire [4:0] DA; //original outputs from instruction decoder
wire  RW;
wire [1:0] MD;

reg  [4:0] DA1; //first stage of registers
reg   RW1;
reg  [1:0] MD1;


reg  [4:0] DA2; //second stage of registers
reg   RW2;
reg  [1:0] MD2;


wire [31:0] MDOut; //muxd output


wire [31:0] ABusRegOut; //these come from register file, and need to be passed
wire [31:0] BBusRegOut; //through dof

wire [31:0] ABUSDOF; //output values from dof, get synced in main block
wire [31:0] BBUSDOF;
wire  [1:0] BSDOF;
wire        PSDOF;
wire        MWDOF;
wire  [4:0] FSDOF;
wire  [4:0] SHDOF;
wire  [4:0] AA;  
wire  [4:0] BA;

reg [31:0] ABUS;
reg [31:0] BBUS;
reg  [1:0] BS;
reg        PS;
reg        MW;
reg  [4:0] FS;
reg  [4:0] SH;


wire NXORVEX;
wire [31:0] FEX;
wire [31:0] dataMemOutEX;
wire [15:0] BrA;
wire [15:0] RAA;

reg NXORV;
reg [31:0] F;
reg [31:0] dataMemOut;

wire Z;
wire V;
wire N;
wire C;
wire LCO;
wire RCO;

reg Zreg;
reg Vreg;
reg Nreg;
reg Creg;
reg LCOreg;
reg RCOreg;

IF fetch(.PC(PCIFOUT),.PC1(PCN1OUT),.BS(BS),.PS(PS),.Z(Z),.RAA(RAA),.BrA(BrA));

IFDOF find(.PC(PC),.PC1(PCN1OUT),.IR(IFDOFIROUT));

RegisterFiles registers(.reset(reset),.clock(clock),.WR(RW2),.ASEL(AA),
.BSEL(BA),.DSEL(DA2),.DIN(MDOut),.AOUT(ABusRegOut),.BOUT(BBusRegOut) );

DOF decode(.PCM1(PCN1),.IR(IR),.PCM2(PCN2DOFOUT),.ADATA(ABusRegOut),
.BDATA(BBusRegOut),.AA(AA),.BA(BA),.RW(RW),.DA(DA),.MD(MD),
.BS(BSDOF),.PS(PSDOF),.MW(MWDOF),.FS(FSDOF),.SH(SHDOF),.ABUS(ABUSDOF),.BBUS(BBUSDOF)); //need to wire decode registers

EX execute(.Z(Z),.N(N),.C(C),.V(V),.NXORV(NXORVEX),.LCO(LCO),.RCO(RCO),
.data(dataMemOutEX),.F(FEX),.RAA(RAA),.BrA(BrA),.MW(MW),.FS(FS),
.SH(SH),.ABUS(ABUS),.BBUS(BBUS),.PCN2(PCN2));

//mux D goes here
assign MDOut=(MD2==2'd0)?(F):
             (MD2==2'd1)?(dataMemOut):
             (MD2==2'd2)?({31'b0,NXORV}):
             (MD2==2'd3)?({26'b0,Nreg,Creg,Vreg,Zreg,LCOreg,RCOreg}): //magic status instruction goes here
             32'bx; 
initial begin
PC=0;
/////if
PCN1=0;
IR=0;
/////dof
PCN2=0;
DA1=0;
RW1=0;
MD1=0;
BS=0;
PS=0;
MW=0;
FS=0;
SH=0;
//muxa/muxb
BBUS=0;
ABUS=0;
///EX//////////////////////////
RW2=RW1;
DA2=DA1;
MD2=MD1;
//output from function unit
NXORV=0;
F=0;
dataMemOut=0;
Vreg=0;
Nreg=0;
Zreg=0;
Creg=0;
end

always @(posedge clock)begin
//if(reset)begin

//set everything 0 here

//end
PC<=PCIFOUT; //force registers to behave according to clock
///////IF/////////////////////////////
PCN1<=PCN1OUT;
IR<=IFDOFIROUT;
//////IF/DOF//////////////////////////
PCN2<=PCN2DOFOUT;
//control word registers from instruction decoder
DA1<=DA;
RW1<=RW;
MD1<=MD;
BS<=BSDOF;
PS<=PSDOF;
MW<=MWDOF;
FS<=FSDOF;
SH<=SHDOF;
//BUS STUFF
ABUS<=ABUSDOF;
BBUS<=BBUSDOF;
//////EX
NXORV<=NXORVEX;
F<=FEX;
dataMemOut<=dataMemOutEX;
////end sync registers
//magic instruction stuff
Vreg<=V;
Zreg<=Z;
Nreg<=N;
Creg<=C;
LCOreg<=LCO;
RCOreg<=RCO;
DA2<=DA1;
RW2<=RW1;
MD2<=MD1;
end
endmodule
