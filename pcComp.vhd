----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:50:36 05/01/2024 
-- Design Name: 
-- Module Name:    pcComp - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pcComp is
    Port ( clk : in  STD_LOGIC;
           loadAddress : in  STD_LOGIC_VECTOR(31 downto 0);
           currentAddress : out  STD_LOGIC_VECTOR(31 downto 0));
end pcComp;

architecture Behavioral of pcComp is

begin
process(clk)
begin
if(clk'event and clk='1') then
currentAddress<=loadAddress;
end if;
end process;
end Behavioral;

