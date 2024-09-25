----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:48:45 05/02/2024 
-- Design Name: 
-- Module Name:    shifterComp - Behavioral 
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

entity shifterComp is
    Port (   
        	 in1 : IN STD_LOGIC_VECTOR( 31 downto 0);�
	        out1 :	OUT STD_LOGIC_VECTOR( 31 downto 0) ); 

end shifterComp;

architecture Behavioral of shifterComp is

begin

	out1 <= in1(29 downto 0) & "00";

end Behavioral;
