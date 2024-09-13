----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/24/2024 04:19:01 PM
-- Design Name: 
-- Module Name: Add_Sub_or_Mul - Behavioral
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

entity Operation is
    Port ( MUX_Out : in STD_LOGIC_VECTOR (3 downto 0);
           Selector : in STD_LOGIC_VECTOR (2 downto 0);
           Add_Bus : out STD_LOGIC_VECTOR (3 downto 0);
           Shif_Bus : out STD_LOGIC_VECTOR (3 downto 0);
           COM_Bus : out STD_LOGIC_VECTOR (3 downto 0);
           DOT_Bus : out STD_LOGIC_VECTOR (3 downto 0);
           Mul_Bus : out STD_LOGIC_VECTOR (3 downto 0));
end Operation;

architecture Behavioral of Operation is
begin
    process (MUX_Out, Selector)
    begin
    case Selector is
            when "000" =>
                Add_Bus <= MUX_Out;
            when "100" =>
                Mul_Bus <= MUX_Out;
            when "111" =>
                Shif_Bus <= MUX_Out;
            when "110" =>
                DOT_Bus <= MUX_Out;
            when "101" =>
                COM_Bus <= MUX_Out;
            when others =>
                Add_Bus <= (others =>'0'); -- Default case             
        end case;
end process;
end Behavioral;

