----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/24/2024 09:10:37 PM
-- Design Name: 
-- Module Name: bit_shift_sim - Behavioral
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

entity bit_shift_sim is
--  Port ( );
end bit_shift_sim;

architecture Behavioral of bit_shift_sim is

COMPONENT bit_shifter 

 Port ( I : in STD_LOGIC_VECTOR (3 downto 0);
           S : out STD_LOGIC_VECTOR (3 downto 0);
           C: in STD_LOGIC);
END COMPONENT;

signal input_data : std_logic_vector(3 downto 0);
signal control_signal : std_logic;
signal output_data : std_logic_vector(3 downto 0);
begin

 UUT : bit_shifter PORT MAP(
     I => input_data, 
     S => output_data, 
     C => control_signal);
     
     process
      begin
            
             input_data <= "1010";  
             control_signal <= '1'; 
             wait for 100 ns;
             
            
             input_data <= "1010";  
             control_signal <= '0'; 
             wait for 100 ns;
     
             
             input_data <= "1011";  
             control_signal <= '1';
             wait for 100 ns;
             
             
             input_data <= "1101";  
             control_signal <= '1';
             wait for 100 ns;
                          
             input_data <= "1110"; 
             control_signal <= '0';
             wait for 100 ns;
           
             wait;
         end process;
 
end Behavioral;
