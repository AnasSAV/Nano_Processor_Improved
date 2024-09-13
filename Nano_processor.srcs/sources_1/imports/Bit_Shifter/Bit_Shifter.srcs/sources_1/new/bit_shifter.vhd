----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/24/2024 07:53:46 PM
-- Design Name: 
-- Module Name: bit_shifter - Behavioral
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

entity bit_shifter is
    Port ( I : in STD_LOGIC_VECTOR (3 downto 0);
           S : out STD_LOGIC_VECTOR (3 downto 0);
           C: in STD_LOGIC);
end bit_shifter;

architecture Behavioral of bit_shifter is
signal I0,I1,I2,I3,X: std_logic;
begin
    I0<=I(0);
    I1<=I(1);
    I2<=I(2);
    I3<=I(3);
    X<=C;
    

    process(X,I)
    begin
        if X = '0' then
            S(0) <= I1;
            S(1) <= I2;
            S(2) <= I3;
            S(3) <= '0';
        else
            S(0)<='0';
            S(1)<=I0;
            S(2)<=I1;
            S(3)<=I2;
        end if;
    end process;
    

end Behavioral;
