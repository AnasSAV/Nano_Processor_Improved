----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/02/2024 03:00:55 PM
-- Design Name: 
-- Module Name: MUX_2_1_3bit - Behavioral
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

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_2_1_3bit is
 Port ( jump : in STD_LOGIC;
        address : in STD_LOGIC_VECTOR (2 downto 0);
        counter : in STD_LOGIC_VECTOR (2 downto 0);
        instr_no : out STD_LOGIC_VECTOR (2 downto 0));
end MUX_2_1_3bit;

architecture Behavioral of MUX_2_1_3bit is

begin
    process(jump, address, counter)
    begin
        if (jump = '1') then
            instr_no <= address;
        else
            instr_no <= counter;
        end if;
    end process;
end Behavioral;
