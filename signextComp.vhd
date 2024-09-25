----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:59:05 05/03/2024 
-- Design Name: 
-- Module Name:    signextComp - Behavioral 
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

entity signextComp is
port( 
	a: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	Y: OUT STD_LOGIC_VECTOR(31 DOWNTO 0) );
end signextComp;

architecture Behavioral of signextComp is

begin

	Y <= X"ffff" & a WHEN a(15) = '1' ELSE
	   X"0000" & a;

end Behavioral;

