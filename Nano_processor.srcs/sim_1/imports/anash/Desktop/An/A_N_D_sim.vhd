----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.04.2024 17:16:38
-- Design Name: 
-- Module Name: A_N_D_sim - Behavioral
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

entity A_N_D_sim is
--  Port ( );
end A_N_D_sim;

architecture Behavioral of A_N_D_sim is
component A_N_D is
port(
A : in STD_LOGIC_VECTOR (3 downto 0);
B : in STD_LOGIC_VECTOR (3 downto 0);
C : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal A,B : std_logic_vector(3 downto 0);
signal C : std_logic_vector(3 downto 0);
 
begin

UUT : A_N_D 
port map (
 A => A,
 B => B,
 C => C
 );
 
process begin
 
 A <= "0000";
 B <= "0001";
 
 wait for 100ns;
 B <= "1101";
 
 wait for 100ns;
 A <= "1101";
 B <= "0001";
 
 wait for 100ns;
 A <= "0110";
 B <= "0101";
 
 wait for 100ns;
 A <= "1110";
 B <= "0111";
 
 wait for 100ns;
 A <= "0110";
 B <= "1101";
 
end process;
end Behavioral;
