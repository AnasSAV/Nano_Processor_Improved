----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/14/2024 03:41:36 PM
-- Design Name: 
-- Module Name: Reg - Behavioral
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

entity Reg is
    Port ( Reg_in : in STD_LOGIC_VECTOR (3 downto 0);
           Enable : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Reg_out : out STD_LOGIC_VECTOR (3 downto 0));
end Reg;

architecture Behavioral of Reg is

component D_FF_EN
port( D : in STD_LOGIC;
      Res : in STD_LOGIC;
      Clk : in STD_LOGIC;
      Q : out STD_LOGIC;
      Qbar : out STD_LOGIC;
      En : in STD_LOGIC);
end component;

begin
D_FF_EN0 : D_FF_EN 
port map( D => Reg_in(0),
          En => Enable,
          Clk => Clk,
          Res => Reset,
          Q => Reg_out(0));
          
D_FF_EN1 : D_FF_EN 
port map( D => Reg_in(1),
          En => Enable,
          Clk => Clk,
          Res => Reset,
          Q => Reg_out(1));

D_FF_EN2 : D_FF_EN 
port map( D => Reg_in(2),
          En => Enable,
          Clk => Clk,
          Res => Reset,
          Q => Reg_out(2));
          
D_FF_EN3 : D_FF_EN 
port map( D => Reg_in(3),
          En => Enable,
          Clk => Clk,
          Res => Reset,
          Q => Reg_out(3));
          
end Behavioral;

