----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/24/2024 07:59:24 PM
-- Design Name: 
-- Module Name: COMPARATOR_SIM - Behavioral
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

entity COMPARATOR_SIM is
--  Port ( );
end COMPARATOR_SIM;

architecture Behavioral of COMPARATOR_SIM is

component COMPARATOR is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           A_greater_than_B : out STD_LOGIC;
           A_equal_B : out STD_LOGIC;
           A_less_than_B : out STD_LOGIC);
end component;

signal A, B : STD_LOGIC_VECTOR (3 downto 0);
signal A_greater_than_B :  STD_LOGIC;
signal A_equal_B :  STD_LOGIC;
signal A_less_than_B :  STD_LOGIC;

begin

UUT : COMPARATOR  port map (
                    A => A,
                    B => B,
                    A_greater_than_B => A_greater_than_B,
                    A_equal_B => A_equal_B ,
                    A_less_than_B => A_less_than_B
                );
                
stimulus_proc: process
begin
               --220233 : 0011 0101 1100 0100 1001
               --220030 : 0011 0101 1011 0111 1110
                        
              
               A <= "0011";
               B <= "0011";
               wait for 100 ns;
               
               A <= "0011";
               B <= "0101";
               wait for 100 ns;              
                      
                A <= "0101";
                B <= "0101";
                wait for 100 ns;

                A <= "1100";
                B <= "0101";
                wait for 100 ns;

                 A <= "1100";
                 B <= "1011";
                 wait for 100 ns;

                 A <= "0100";
                 B <= "0111";
                 wait for 100 ns;

                  A <= "1001";
                  B <= "1110";
                  wait for 100 ns;
                  -- Additional test cases can be added here
                      
        wait;
        end process stimulus_proc;     


end Behavioral;
