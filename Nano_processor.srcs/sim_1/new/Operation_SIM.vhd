----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/26/2024 04:32:20 AM
-- Design Name: 
-- Module Name: Operation_SIM - Behavioral
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

entity Operation_SIM is
--  Port ( );
end Operation_SIM;

architecture Behavioral of Operation_SIM is

COMPONENT Operation is
    Port ( MUX_Out : in STD_LOGIC_VECTOR (3 downto 0);
           Selector : in STD_LOGIC_VECTOR (2 downto 0);
           Add_Bus : out STD_LOGIC_VECTOR (3 downto 0);
           Shif_Bus : out STD_LOGIC_VECTOR (3 downto 0);
           COM_Bus : out STD_LOGIC_VECTOR (3 downto 0);
           DOT_Bus : out STD_LOGIC_VECTOR (3 downto 0);
           Mul_Bus : out STD_LOGIC_VECTOR (3 downto 0));
end COMPONENT;

SIGNAL MUX_Out, Add_Bus ,Shif_Bus ,COM_Bus ,DOT_Bus ,Mul_Bus : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL  Selector :  STD_LOGIC_VECTOR (2 downto 0);
begin

    UUT : Operation port map(
            MUX_Out  => MUX_Out ,
            Selector => Selector,
            Add_Bus => Add_Bus,
            Shif_Bus => Shif_Bus,
            COM_Bus => COM_Bus,
            DOT_Bus => DOT_Bus,
            Mul_Bus => Mul_Bus
         );
    -- Stimulus process
    stimulus_proc: process
    begin
     
    MUX_Out <= "0011";
    Selector <= "000";
    wait for 100 ns;

    Selector <= "001";
    wait for 100 ns;
    
    MUX_Out <= "0101";
    Selector <= "010";
    wait for 100 ns;
    
    Selector <= "011";
    wait for 100 ns;
     
    MUX_Out <= "1100";
    Selector <= "100";
    wait for 100 ns;
    
     
    MUX_Out <= "1100";
    Selector <= "101";
    wait for 100 ns;
            
     
    MUX_Out <= "0100";
    Selector <= "110";
    wait for 100 ns;
    
     
    MUX_Out <= "1001";
    Selector <= "111";
    wait for 100 ns;
    -- Additional test cases can be added here

    wait;
end process stimulus_proc;          

end Behavioral;
