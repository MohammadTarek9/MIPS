----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    04:12:35 04/27/2024 
-- Design Name: 
-- Module Name:    maindec - Behavioral 
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

entity maindec is
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
end maindec;

architecture Behavioral of maindec is
signal controls : STD_LOGIC_VECTOR(8 downto 0);
begin
process(instr)
begin
case instr is
when "000000"=> controls <="110000010"; --R-type
when "100011"=> controls <="101001000"; --LW
when "101011"=> controls <="001010000"; --SW
when "000100"=> controls <="000100001"; --BEQ
when "001000"=> controls <="101000000"; --ADDI
when "000010"=> controls <="000000100"; --J
when others => controls <="---------"; --ILLEGAL op
end case;

end process;

(regwrite, regdst, alusrc, branch, memwrite, memtoreg, jump, aluop(1), aluop(0)) <= controls;

end Behavioral;

