----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/09/2024 12:19:47 AM
-- Design Name: 
-- Module Name: ADDER_3_SIM - Behavioral
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

entity ADDER_3_SIM is
--  Port ( );
end ADDER_3_SIM;

architecture Behavioral of ADDER_3_SIM is

component ADDER_3
            port(
            I : in STD_LOGIC_VECTOR (2 downto 0);
            Y : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal I , Y : STD_LOGIC_VECTOR (2 downto 0);

begin

UUT: ADDER_3 port map(
             I=>I,
             Y=>Y);

process
begin

I<= "000";

wait for 100ns;
I<= "001";

wait for 100ns;
I<= "010";

wait for 100ns;
I<= "011";

wait for 100ns;
I<= "100";

wait for 100ns;
I<= "101";

wait for 100ns;
I<= "110";

wait for 100ns;
I<= "111";

wait;
end process;
end Behavioral;
