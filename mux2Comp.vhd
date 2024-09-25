----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    04:50:10 04/27/2024 
-- Design Name: 
-- Module Name:    mux2Comp - Behavioral 
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

entity mux2Comp is
	generic(n: integer:= 32);
    Port ( in0 : in  STD_LOGIC_VECTOR (n-1 downto 0);
           in1 : in  STD_LOGIC_VECTOR (n-1 downto 0);
           s : in  STD_LOGIC;
           z : out  STD_LOGIC_VECTOR (n-1 downto 0));
end mux2Comp;

architecture Behavioral of mux2Comp is

begin

	z <= in0 when s='0'
	else in1;

end Behavioral;

