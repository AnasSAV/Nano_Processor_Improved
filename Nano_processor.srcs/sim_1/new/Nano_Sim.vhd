----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/22/2024 03:40:31 PM
-- Design Name: 
-- Module Name: Nano_Sim - Behavioral
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

entity Nano_Sim is
--  Port ( );
end Nano_Sim;
architecture Behavioral of Nano_Sim is
component Nano_Processor is
    Port ( Reset : in STD_LOGIC;
           Clk_in : in STD_LOGIC;
           Zero : out STD_LOGIC;
           Overflow_add : out STD_LOGIC;
           Overflow_mul : out STD_LOGIC;
           RLED : out STD_LOGIC_VECTOR (3 downto 0);
           Seven_Seg_Out : out STD_LOGIC_VECTOR (6 downto 0);
           Anode : out STD_LOGIC_VECTOR (3 downto 0);
           A_greater_than_B : out STD_LOGIC;
           A_equal_B : out STD_LOGIC;
           A_less_than_B : out STD_LOGIC );
end component;

signal Reset , Zero , Overflow_add,Overflow_mul,A_greater_than_B,A_equal_B,A_less_than_B  : STD_LOGIC;
signal RLED :STD_LOGIC_VECTOR (3 downto 0);
signal Seven_Seg_Out :  STD_LOGIC_VECTOR (6 downto 0);
signal Anode : STD_LOGIC_VECTOR (3 downto 0);
signal Clk_in:std_logic:='1';
begin

uut : Nano_Processor port map (
                Reset => Reset,
                Clk_in => Clk_in,
                Zero => Zero,
                Overflow_add => Overflow_add,
                Overflow_mul => Overflow_mul,
                RLED => RLED,
                Seven_Seg_Out => Seven_Seg_Out,
                Anode => Anode,
                A_greater_than_B => A_greater_than_B,
                A_equal_B => A_equal_B,
                A_less_than_B => A_less_than_B
      );
      process 
      begin
--      wait for 5ns;
      Clk_in <= NOT Clk_in;
      wait for 3ns;
      end process;
      
      process 
      begin
      Reset <='1';
      wait for 200ns;
      
      Reset <='0';
      wait;
      end process;
      


end Behavioral;
