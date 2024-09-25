----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:08:59 05/06/2024 
-- Design Name: 
-- Module Name:    controllerComp - Behavioral 
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

entity controllerComp is
port(op, funct: in STD_LOGIC_VECTOR(5 downto 0);
		zero: in STD_LOGIC;
		--memread: out STD_LOGIC;
		memtoreg, memwrite: out STD_LOGIC;
		pcsrc, alusrc: out STD_LOGIC;
		regdst, regwrite: out STD_LOGIC;
		jump: out STD_LOGIC;
		alucontrol: out STD_LOGIC_VECTOR(3 downto 0));
end controllerComp;

architecture Behavioral of controllerComp is
signal branch: STD_LOGIC;
signal aluop: STD_LOGIC_VECTOR(1 downto 0);
begin
control1: maindec port map(op,regdst,jump,branch, memtoreg,aluop,memwrite,alusrc,regwrite);
alucontrol1: aludec port map(funct,aluop,alucontrol);
pcsrc<=branch and zero;
end Behavioral;

