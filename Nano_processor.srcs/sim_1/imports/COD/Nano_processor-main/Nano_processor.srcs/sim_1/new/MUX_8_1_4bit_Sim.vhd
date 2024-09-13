----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/22/2024 05:16:14 AM
-- Design Name: 
-- Module Name: MUX_8_1_4bit_Sim - Behavioral
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

entity MUX_8_1_4bit_Sim is
--  Port ( );
end MUX_8_1_4bit_Sim;

architecture Behavioral of MUX_8_1_4bit_Sim is
    -- Component declaration
    component MUX_8_1_4bit is
    Port ( 
           Reg_00 : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_01 : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_02 : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_03 : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_04 : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_05 : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_06 : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_07 : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_sel : in STD_LOGIC_VECTOR (2 downto 0);
           Selected_reg : out STD_LOGIC_VECTOR (3 downto 0)
          );
    end component;
    
    -- Signals declaration
    signal Reg_00 :  STD_LOGIC_VECTOR (3 downto 0);
    signal Reg_01 :  STD_LOGIC_VECTOR (3 downto 0);
    signal Reg_02 :  STD_LOGIC_VECTOR (3 downto 0);
    signal Reg_03 :  STD_LOGIC_VECTOR (3 downto 0);
    signal Reg_04 :  STD_LOGIC_VECTOR (3 downto 0);
    signal Reg_05 :  STD_LOGIC_VECTOR (3 downto 0);
    signal Reg_06 :  STD_LOGIC_VECTOR (3 downto 0);
    signal Reg_07 :  STD_LOGIC_VECTOR (3 downto 0);
    signal Reg_sel :  STD_LOGIC_VECTOR (2 downto 0);
    signal Selected_reg :  STD_LOGIC_VECTOR (3 downto 0);      
    
begin
     -- Instantiate the MUX_8_1_4bit module
    UUT : MUX_8_1_4bit port map(
            Reg_00 => Reg_00,
            Reg_01 => Reg_01,
            Reg_02 => Reg_02,
            Reg_03 => Reg_03,
            Reg_04 => Reg_04,
            Reg_05 => Reg_05,
            Reg_06 => Reg_06,
            Reg_07 => Reg_07,
            Reg_sel => Reg_sel,
            Selected_reg => Selected_reg
         );
    -- Stimulus process
    stimulus_proc: process
    begin
        --220233 : 0011 0101 1100 0100 1001
        --220030 : 0011 0101 1011 0111 1110
        
        Reg_00 <= "0011"; 
        Reg_01 <= "0101";
        Reg_02 <= "1100";
        Reg_03 <= "0100";
        Reg_04 <= "1001";
        Reg_05 <= "1011";
        Reg_06 <= "0111";
        Reg_07 <= "1110";
        
        Reg_sel <= "000";
        wait for 100 ns;
        
        Reg_sel <= "001";
        wait for 100 ns;
        
        Reg_sel <= "010";
        wait for 100 ns;
        
        Reg_sel <= "011";
        wait for 100 ns;
        
        Reg_sel <= "100";
        wait for 100 ns;
        
        Reg_sel <= "101";
        wait for 100 ns;     
        
         Reg_sel <= "110";
         wait for 100 ns;
         
         Reg_sel <= "111";
         wait for 100 ns;   
         
         -- Additional test cases can be added here
               
          wait;
    end process stimulus_proc;                  
        
end Behavioral;
