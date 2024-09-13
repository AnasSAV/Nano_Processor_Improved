----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/02/2024 08:57:36 PM
-- Design Name: 
-- Module Name: ADDER_3 - Behavioral
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

entity ADDER_3 is
    port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           Y : out STD_LOGIC_VECTOR (2 downto 0));
end ADDER_3;

architecture Behavioral of ADDER_3 is

 component FA 
 port ( 
 A: in std_logic; 
 B: in std_logic; 
 C_in: in std_logic; 
 S: out std_logic; 
 C_out: out std_logic); 
 end component; 
 
 signal  FA0_C, FA1_C, FA2_C : std_logic;

begin

FA_0 : FA 
port map ( 
A => I(0), 
B => '1', 
C_in => '0', -- Set to ground 
S => Y(0), 
C_out => FA0_C); 

FA_1 : FA 
port map ( 
A => I(1), 
B => '0', 
C_in => FA0_C, 
S => Y(1), 
C_out => FA1_C);

 FA_2 : FA 
 port map ( 
 A => I(2), 
 B => '0', 
 C_in => FA1_C, 
 S => Y(2), 
 C_out => FA2_C); 

end Behavioral;
