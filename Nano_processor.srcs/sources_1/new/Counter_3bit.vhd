----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.04.2024 14:43:39
-- Design Name: 
-- Module Name: Counter_3bit - Behavioral
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

entity P_Counter_3bit is
    Port ( Mux_out : in STD_LOGIC_VECTOR (2 downto 0) := "000";
           Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0));
end P_Counter_3bit;

architecture Behavioral of P_Counter_3bit is

component D_FF
port(D : in STD_LOGIC;
     Res : in STD_LOGIC;
     Clk : in STD_LOGIC;
     Q : out STD_LOGIC;
     Qbar : out STD_LOGIC);
end component;

begin
D_FF0: D_FF
port map(D=>Mux_out(0),
         Q=>Q(0),
         Res=>Res,
         Clk=>Clk);

D_FF1: D_FF
port map(D=>Mux_out(1),
         Q=>Q(1),
         Res=>Res,
         Clk=>Clk);
    
D_FF2: D_FF
port map(D=>Mux_out(2),
         Q=>Q(2),
         Res=>Res,
         Clk=>Clk);

end Behavioral;
