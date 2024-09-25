--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;

package myprojectpackage is

component aluComp is
		Port ( data1 : in  STD_LOGIC_VECTOR (31 downto 0);
           data2 : in  STD_LOGIC_VECTOR (31 downto 0);
           aluop : in  STD_LOGIC_VECTOR (3 downto 0);
           dataout : out  STD_LOGIC_VECTOR (31 downto 0);
           zflag : out  STD_LOGIC);
			  
end component;

component decoderComp is
		port(
			a : in STD_LOGIC_VECTOR(4 downto 0);
			b : out STD_LOGIC_VECTOR(31 downto 0);
			e : in STD_LOGIC
			);

end component;

component muxComp is
		 port(
    in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15,in16,in17,in18,in19,in20,in21,in22,in23,in24,in25,in26,in27,in28,in29,in30,in31,in32 : in STD_LOGIC_VECTOR(31 downto 0);
         S1: in STD_LOGIC_VECTOR(4 downto 0);
         Z: out STD_LOGIC_VECTOR(31 downto 0)
       );
end component;

component RegisterFileComp is
    Port ( read_sel1 : in  STD_LOGIC_VECTOR (4 downto 0);
           read_sel2 : in  STD_LOGIC_VECTOR (4 downto 0);
           write_sel : in  STD_LOGIC_VECTOR (4 downto 0);
           write_ena : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           write_data : in  STD_LOGIC_VECTOR (31 downto 0);
           data1 : out  STD_LOGIC_VECTOR (31 downto 0);
           data2 : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component floprComp is
    Port ( D : in  STD_LOGIC_VECTOR (31 downto 0);
           L : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component pcComp is
    Port ( clk : in  STD_LOGIC;
           loadAddress : in  STD_LOGIC_VECTOR(31 downto 0);
           currentAddress : out  STD_LOGIC_VECTOR(31 downto 0));
end component;

component dmem is 
port(clk, we: in STD_LOGIC;
a, wd: in STD_LOGIC_VECTOR (31 downto 0);
rd: out STD_LOGIC_VECTOR (31 downto 0));
end component;

component imem is 
port(a: in STD_LOGIC_VECTOR(5 downto 0);
rd: out STD_LOGIC_VECTOR(31 downto 0));
end component;


component maindec is
    Port ( instr : in  STD_LOGIC_VECTOR (5 downto 0);
			  RegDst : out  STD_LOGIC;
           Jump : out  STD_LOGIC;
			  Branch : out  STD_LOGIC;
			  --MemRead : out  STD_LOGIC;
			  MemtoReg : out  STD_LOGIC;
			  ALUOp : out  STD_LOGIC_VECTOR (1 downto 0);
			  MemWrite : out  STD_LOGIC;
			  ALUSrc : out  STD_LOGIC;
			  RegWrite : out  STD_LOGIC);
end component;

component mux2Comp is
	generic(n: integer:= 32);
    Port ( in0 : in  STD_LOGIC_VECTOR (n-1 downto 0);
           in1 : in  STD_LOGIC_VECTOR (n-1 downto 0);
           s : in  STD_LOGIC;
           z : out  STD_LOGIC_VECTOR (n-1 downto 0));
end component;

component adderComp is
    Port ( x : in  STD_LOGIC_VECTOR(31 downto 0);
           y : in  STD_LOGIC_VECTOR(31 downto 0);
           z : out  STD_LOGIC_VECTOR(31 downto 0));
end component;

component shifterComp is
    Port (   
        	 in1 : IN STD_LOGIC_VECTOR( 31 downto 0); 
	        out1 :	OUT STD_LOGIC_VECTOR( 31 downto 0) ); 

end component;

component signextComp is
port( 
	a: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	Y: OUT STD_LOGIC_VECTOR(31 DOWNTO 0) );
end component;

component aludec is
port (
	F:IN STD_LOGIC_VECTOR(5 DOWNTO 0);
	ALUop : IN STD_LOGIC_Vector(1 downto 0);
	OPeration: OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
end component;

component controllerComp is
port(op, funct: in STD_LOGIC_VECTOR(5 downto 0);
	zero: in STD_LOGIC;
	--memread: out STD_LOGIC;
	memtoreg, memwrite: out STD_LOGIC;
	pcsrc, alusrc: out STD_LOGIC;
	regdst, regwrite: out STD_LOGIC;
	jump: out STD_LOGIC;
	alucontrol: out STD_LOGIC_VECTOR(3 downto 0));
end component;

component datapath is
port(clk, reset: in STD_LOGIC;
	readdata: in STD_LOGIC_VECTOR(31 downto 0);
	instr: in STD_LOGIC_VECTOR(31 downto 0);  
	memtoreg, jumpsrc, pcsrc,alusrc,regwrite, regdst: in STD_LOGIC;  
	aluoperation: in STD_LOGIC_VECTOR(3 downto 0);  
	zero: out STD_LOGIC;
	pc: out STD_LOGIC_VECTOR(31 downto 0);
	aluout, writedata: out STD_LOGIC_VECTOR(31 downto 0));
end component;

component Mips is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
			  instr, readdata : in STD_LOGIC_VECTOR(31 downto 0);
			  pc, aluout, data2 : out STD_LOGIC_VECTOR(31 downto 0);
			  memwrite: OUT STD_LOGIC);
end component;

end myprojectpackage;