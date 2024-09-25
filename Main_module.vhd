----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:41:53 05/06/2024 
-- Design Name: 
-- Module Name:    Main_module - Behavioral 
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

entity Main_module is
Port ( clk : in  STD_LOGIC;
		  reset : in  STD_LOGIC;
		  writedata, dataadr : out STD_LOGIC_VECTOR(31 downto 0);
		  memwrite: OUT STD_LOGIC);
end Main_module;

architecture Behavioral of Main_module is
Signal memwrite1 : STD_LOGIC;
Signal pc , instruction , readdata, dataadr1, writedata1 : STD_LOGIC_VECTOR(31 downto 0);
begin
	memwrite <= memwrite1;
	dataadr <= dataadr1;
	writedata <= writedata1;
	instm : imem port map (pc(7 downto 2), instruction);
	datam : dmem port map (clk, memwrite1, dataadr1, writedata1, readdata);
	mip: Mips port map(clk, reset, instruction, readdata, pc ,dataadr1, writedata1, memwrite1);
end Behavioral;

