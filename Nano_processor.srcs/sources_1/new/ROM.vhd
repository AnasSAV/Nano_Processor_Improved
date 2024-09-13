----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/15/2024 07:33:14 AM
-- Design Name: 
-- Module Name: ROM - Behavioral
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
use ieee.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ROM is
    Port ( Memory_Select : in STD_LOGIC_VECTOR (2 downto 0);
           Instruction_Bus : out STD_LOGIC_VECTOR (12 downto 0));
end ROM;

architecture Behavioral of ROM is
type rom_type is array (0 to 7) of std_logic_vector(12 downto 0);
signal P_ROM : rom_type := (
    "0101110000111", -- MOVI R7, 7
    "0100100000010", -- MOVI R2, 2
    "1001110100000", -- MUL R7, R2
    "0100110000100", -- MOVI R3, 4
    "0010110000000", -- NEG R3
    "0001110110000", -- ADD R7, R3
    "1100100000000", -- SHIF R2
    "1011110100000"  -- JZR R0, 7
);
begin
    Instruction_Bus <= P_ROM(to_integer(unsigned(Memory_Select)));
end Behavioral;
