----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:02:20 05/06/2024 
-- Design Name: 
-- Module Name:    datapath - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.myprojectpackage.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity datapath is 
port(clk, reset: in STD_LOGIC;
		readdata: in STD_LOGIC_VECTOR(31 downto 0);
		instr: in STD_LOGIC_VECTOR(31 downto 0);  
		memtoreg, jumpsrc, pcsrc,alusrc,regwrite, regdst: in STD_LOGIC;  
		aluoperation: in STD_LOGIC_VECTOR(3 downto 0);  
		zero: out STD_LOGIC;
		pc: out STD_LOGIC_VECTOR(31 downto 0);
		aluout, writedata: out STD_LOGIC_VECTOR(31 downto 0));
end datapath;

architecture Behavioral of datapath is
signal writereg: STD_LOGIC_VECTOR(4 downto 0);
signal pcjump, pcnext, pcnextbr, pcplus4,  pcbranch: STD_LOGIC_VECTOR(31 downto 0);
signal extout, sl2out: STD_LOGIC_VECTOR(31 downto 0);
signal srca, ALUin, data1: STD_LOGIC_VECTOR(31 downto 0);

signal pcsignal, aluoutsignal: STD_LOGIC_VECTOR(31 downto 0);
signal data2 : std_logic_vector(31 downto 0); 
begin

pc <= pcsignal;
aluout <= aluoutsignal;
writedata <= data2;
pcjump <= pcplus4(31 downto 28) & instr(25 downto 0) & "00";

pcreg: floprComp port map(pcnext, '1', clk, reset, pcsignal);
pcadd1: adderComp port map(pcsignal, X"00000004", pcplus4);
shifter: shifterComp port map(extout, sl2out);
pcadd2: adderComp port map(pcplus4, sl2out, pcbranch);
pcbrmux: mux2Comp generic map(n => 32) port map(pcplus4, pcbranch,  pcsrc, pcnextbr);
pcmux: mux2Comp generic map(n => 32) port map(pcnextbr, pcjump, jumpsrc,  pcnext);

writemux: mux2Comp generic map(n => 5) port map(instr(20 downto 16),instr(15 downto 11),regdst,writereg);
dmux: mux2Comp generic map(n => 32) port map(aluoutsignal, readdata, memtoreg,srca);
regfile: RegisterFileComp port map(instr(25 downto 21),instr(20 downto 16),writereg,regwrite,clk,srca,data1,data2);
alu: aluComp port map(data1,ALUin,aluoperation,aluoutsignal,zero);
signextender: signextComp port map(instr(15 downto 0),extout);
alumux: mux2Comp generic map(n => 32) port map(data2,extout,alusrc,ALUin);
end Behavioral;

