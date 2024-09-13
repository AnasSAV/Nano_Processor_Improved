----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/09/2024 05:31:00 AM
-- Design Name: 
-- Module Name: MUX_2_1_4bit - Behavioral
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

entity MUX_5_1_4bit is
    Port ( load_select : in STD_LOGIC_VECTOR (2 downto 0);
           Imm_value : in STD_LOGIC_VECTOR (3 downto 0);
           bit_add_sub : in STD_LOGIC_VECTOR (3 downto 0);
           instru : out STD_LOGIC_VECTOR (3 downto 0);
           Mul_out : in STD_LOGIC_VECTOR (3 downto 0);
           Shif_out : in STD_LOGIC_VECTOR (3 downto 0);
           DOT_out : in STD_LOGIC_VECTOR (3 downto 0));
end MUX_5_1_4bit;

architecture Behavioral of MUX_5_1_4bit is
begin
    process(load_select, Imm_value, bit_add_sub, Mul_out,Shif_out,DOT_out)
    begin
    case load_select is
            when "000" =>
                instru <= bit_add_sub;
            when "010" =>
                instru <= Imm_value;
            when "001" =>
                instru <= Imm_value;
            when "100" =>
                instru <= Mul_out;
            when "111" =>
                instru <= Shif_out;
            when "110" =>
                instru <= DOT_out;
            when others =>
                instru <= (others =>'0'); -- Default case
        end case;
end process;
end Behavioral;
