----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/14/2024 02:13:44 PM
-- Design Name: 
-- Module Name: COMPLI_ADD_SUB - Behavioral
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

entity COMPLI_ADD_SUB is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           ADD_SUB_Change : in STD_LOGIC;
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0));
end COMPLI_ADD_SUB;

architecture Behavioral of COMPLI_ADD_SUB is

component FA 
port ( A: in std_logic; 
       B: in std_logic; 
       C_in: in std_logic; 
       S: out std_logic; 
       C_out: out std_logic); 
end component; 

SIGNAL S_out : std_logic_vector(3 downto 0); 
SIGNAL FA0_C, FA1_C, FA2_C, FA3_C,B0,B1,B2,B3 : std_logic; 

begin 
B0 <= B(0) XOR ADD_SUB_Change; 
B1 <= B(1) XOR ADD_SUB_Change; 
B2 <= B(2) XOR ADD_SUB_Change; 
B3 <= B(3) XOR ADD_SUB_Change; 

FA_0 : FA port map ( 
    A => A(0), 
    B => B0, 
    C_in => ADD_SUB_Change, 
    S => S_out(0), 
    C_Out => FA0_C); 

FA_1 : FA port map ( 
    A => A(1), 
    B => B1, 
    C_in => FA0_C, 
    S => S_out(1), 
    C_Out => FA1_C); 

FA_2 : FA port map ( 
    A => A(2), 
    B => B2, 
    C_in => FA1_C, 
    S => S_out(2), 
    C_Out => FA2_C); 

FA_3 : FA port map ( 
    A => A(3), 
    B => B3, 
    C_in => FA2_C, 
    S => S_out(3), 
    C_Out => FA3_C); 

Overflow <= FA3_C; 

S <= S_out; 

Zero <= not (S_out(0) or S_out(1) or S_out(2) or S_out(3)); 

end Behavioral;