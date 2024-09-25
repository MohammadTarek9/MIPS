--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:56:43 05/06/2024
-- Design Name:   
-- Module Name:   D:/College/2_Sophomore/Spring/CSE112 Computer Organization/Major/Final/maintest.vhd
-- Project Name:  Final
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Main_module
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
use IEEE.STD_LOGIC_1164.all; 
use IEEE.STD_LOGIC_SIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;
use ieee.numeric_std.all; 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY maintest IS
END maintest;
 
ARCHITECTURE behavior OF maintest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Main_module
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         writedata : OUT  std_logic_vector(31 downto 0);
         dataadr : OUT  std_logic_vector(31 downto 0);
         memwrite : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic;
   signal reset : std_logic;

 	--Outputs
   signal writedata : std_logic_vector(31 downto 0);
   signal dataadr : std_logic_vector(31 downto 0);
   signal memwrite : std_logic;

BEGIN
-- instantiate device to be tested
dut: Main_module port map(clk, reset, writedata, dataadr, memwrite);

-- Generate clock with 10 ns period
process begin
clk <= '1';
wait for 5 ns;
clk <= '0';
wait for 5 ns;
end process;

-- Generate reset for first two clock cycles
process begin
reset <= '1';
wait for 22 ns;
reset <= '0';
wait;
end process;

-- check that 7 gets written to address 84 at end of program
process(clk) begin
if (clk'event and clk = '0' and memwrite = '1') then
if (CONV_INTEGER(dataadr) = 84 and CONV_INTEGER(writedata) = 7) then
report "NO ERRORS: Simulation succeeded" severity failure;
elsif (CONV_INTEGER(dataadr) = 84) then
report "Simulation failed" severity failure;
end if;
end if;

end process;
end;
