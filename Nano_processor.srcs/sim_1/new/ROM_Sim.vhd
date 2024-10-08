----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/18/2024 10:11:25 PM
-- Design Name: 
-- Module Name: ROM_Sim - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ROM_Sim is
--  Port ( );
end ROM_Sim;

architecture Behavioral of ROM_Sim is
component ROM
port ( Memory_Select : in STD_LOGIC_VECTOR (2 downto 0);
       Instruction_Bus : out STD_LOGIC_VECTOR (11 downto 0));
end component;

signal Memory_Select : STD_LOGIC_VECTOR (2 downto 0);
signal Instruction_Bus : STD_LOGIC_VECTOR (11 downto 0);

begin

UUT: ROM
port map( Memory_Select => Memory_Select,
          Instruction_Bus => Instruction_Bus);

process
begin

-- Test Member Index Number : 220233M
-- In Binary : 110 101 110 001 001 001
Memory_Select <= "000";
wait for 100ns;
Memory_Select <= "001";
wait for 100ns;
Memory_Select <= "010";
wait for 100ns;
Memory_Select <= "011";
wait for 100ns;
Memory_Select <= "100";
wait for 100ns;
Memory_Select <= "101";
wait for 100ns;
Memory_Select <= "110";
wait for 100ns;
Memory_Select <= "111";


 
 wait;
 
end process;
 
end Behavioral;
