----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/24/2024 07:37:59 PM
-- Design Name: 
-- Module Name: COMPARATOR - Behavioral
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

entity COMPARATOR is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           A_greater_than_B : out STD_LOGIC;
           A_equal_B : out STD_LOGIC;
           A_less_than_B : out STD_LOGIC);
end COMPARATOR;

architecture Behavioral of COMPARATOR is

SIGNAL X3, X2, X1, X0 : STD_LOGIC;

begin

X3 <= (A(3) XNOR B(3));
X2 <= (A(2) XNOR B(2));
X1 <= (A(1) XNOR B(1));
X0 <= (A(0) XNOR B(0));

A_equal_B <= ( X3 AND X2 AND X1  AND X0 ); 

A_greater_than_B <= ( A(3) AND (NOT B(3))) OR ( X3 AND ( A(2) AND (NOT B(2))) ) OR ( X3 AND X2 AND ( A(1) AND (NOT B(1))) ) OR ( X3 AND X2 AND X1 AND ( A(0) AND (NOT B(0))) );

A_less_than_B <=  ( B(3) AND (NOT A(3))) OR ( X3 AND ( B(2) AND (NOT A(2))) ) OR ( X3 AND X2 AND ( B(1) AND (NOT A(1))) ) OR ( X3 AND X2 AND X1 AND ( B(0) AND (NOT A(0))) );

end Behavioral;
