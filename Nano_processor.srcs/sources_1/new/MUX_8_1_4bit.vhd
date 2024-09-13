----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/09/2024 05:41:41 AM
-- Design Name: 
-- Module Name: MUX_8_1_4bit - Behavioral
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

entity MUX_8_1_4bit is
    Port ( Reg_00 : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_01 : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_02 : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_03 : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_04 : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_05 : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_06 : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_07 : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_sel : in STD_LOGIC_VECTOR (2 downto 0);
           Selected_reg : out STD_LOGIC_VECTOR (3 downto 0));
end MUX_8_1_4bit;

architecture Behavioral of MUX_8_1_4bit is
begin
    process (Reg_sel, Reg_00, Reg_01, Reg_02, Reg_03, Reg_04, Reg_05, Reg_06, Reg_07)
    begin
    case Reg_sel is
        when "000" =>
            Selected_reg <= Reg_00;
        when "001" =>
            Selected_reg <= Reg_01;
        when "010" =>
            Selected_reg <= Reg_02;
        when "011" =>
            Selected_reg <= Reg_03;
        when "100" =>
            Selected_reg <= Reg_04;
        when "101" =>
            Selected_reg <= Reg_05;
        when "110" =>
            Selected_reg <= Reg_06;
        when "111" =>
            Selected_reg <= Reg_07;
        when others =>
            Selected_reg <= (others =>'0'); -- Default case
    end case;
end process;
end Behavioral;
