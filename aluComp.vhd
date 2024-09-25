----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:11:23 04/08/2024 
-- Design Name: 
-- Module Name:    aluComp - Behavioral 
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
use IEEE.STD_LOGIC_Unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity aluComp is
    Port ( data1 : in  STD_LOGIC_VECTOR (31 downto 0);
           data2 : in  STD_LOGIC_VECTOR (31 downto 0);
           aluop : in  STD_LOGIC_VECTOR (3 downto 0);
           dataout : out  STD_LOGIC_VECTOR (31 downto 0);
           zflag : out  STD_LOGIC);
end aluComp;

architecture Behavioral of aluComp is

signal s: STD_LOGIC_VECTOR(31 downto 0);
signal data12: STD_LOGIC_VECTOR(31 downto 0);
signal data22: STD_LOGIC_VECTOR(31 downto 0);
signal slt: STD_LOGIC_VECTOR(31 downto 0);
signal dataout2:STD_LOGIC_VECTOR(31 downto 0);

begin

data22 <= data2 when aluop(2) = '0' else NOT data2;
data12 <= data1 when aluop(3) = '0' else NOT data1;
s <= data1 + data22 + aluop(2);

slt <= "0000000000000000000000000000000" & s(31);

dataout2 <= (data12 AND data22) when aluop(1 downto 0) = "00" 
	else (data1 OR data22) when aluop(1 downto 0) = "01"
	else s when aluop(1 downto 0)= "10"
	else slt when aluop(1 downto 0)="11";

dataout <= dataout2;
zflag <= '1' when dataout2 = x"00000000" else '0';

end Behavioral;