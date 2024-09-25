----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:05:31 05/03/2024 
-- Design Name: 
-- Module Name:    aludec - Behavioral 
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

entity aludec is
port (
	F:IN STD_LOGIC_VECTOR(5 DOWNTO 0);
	ALUop : IN STD_LOGIC_Vector(1 downto 0);
	Operation: OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
end aludec;

architecture Behavioral of aludec is
begin
process(ALUop, F)
begin
case aluop is
when "00" => Operation <= "0010";
when "01" => Operation <= "0110"; 
when others =>
case F is 
when "100000" => Operation  <= "0010"; 
when "100010" =>  Operation <= "0110"; 
when "100100" =>  Operation <= "0000"; 
when "100101" =>  Operation <= "0001"; 
when "101010" => Operation  <= "0111";
when "100111" => Operation  <= "1100";
when others => Operation <= "----";
end case;
end case;
end process;
end Behavioral;
