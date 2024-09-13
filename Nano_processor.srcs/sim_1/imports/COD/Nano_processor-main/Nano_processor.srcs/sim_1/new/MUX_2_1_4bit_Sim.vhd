----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/22/2024 04:17:22 AM
-- Design Name: 
-- Module Name: MUX_2_1_4bit_Sim - Behavioral
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

entity MUX_5_1_4bit_Sim is
--  Port ( );
end MUX_5_1_4bit_Sim;

architecture Behavioral of MUX_5_1_4bit_Sim is
    -- Component declaration
    component MUX_5_1_4bit is
        Port ( 
               load_select : in STD_LOGIC_VECTOR (2 downto 0);
               Imm_value : in STD_LOGIC_VECTOR (3 downto 0);
               bit_add_sub : in STD_LOGIC_VECTOR (3 downto 0);
               instru : out STD_LOGIC_VECTOR (3 downto 0);
               Mul_out : in STD_LOGIC_VECTOR (3 downto 0);
               Shif_out : in STD_LOGIC_VECTOR (3 downto 0);
               DOT_out : in STD_LOGIC_VECTOR (3 downto 0)
              );
    end component;
    
    -- Signals declaration
    signal load_select : STD_LOGIC_VECTOR (2 downto 0);
    signal Imm_value :  STD_LOGIC_VECTOR (3 downto 0);
    signal bit_add_sub :  STD_LOGIC_VECTOR (3 downto 0);
    signal instru :  STD_LOGIC_VECTOR (3 downto 0);
    signal Mul_out :  STD_LOGIC_VECTOR (3 downto 0);
    signal Shif_out :  STD_LOGIC_VECTOR (3 downto 0);
    signal DOT_out :  STD_LOGIC_VECTOR (3 downto 0);
    
begin
    -- Instantiate the MUX_2_1_4bit module
    UUT: MUX_5_1_4bit port map(
             load_select => load_select, 
             Imm_value => Imm_value,   
             bit_add_sub  => bit_add_sub ,              
             instru => instru,
             Mul_out => Mul_out,
             Shif_out => Shif_out,
             DOT_out => DOT_out
          );
    -- Stimulus process
          stimulus_proc: process
          begin
              --220233 : 0011 0101 1100 0100 1001
                      
                      Imm_value <= "0011"; 
                      bit_add_sub <= "0101";
                      Mul_out  <= "1100";
                      Shif_out <= "0100";
                      DOT_out <= "1001";
                      
                      
                      load_select <= "000";
                      wait for 100 ns;
                      
                      load_select <= "001";
                      wait for 100 ns;
                      
                      load_select <= "010";
                      wait for 100 ns;
                      
                      load_select <= "011";
                      wait for 100 ns;
                      
                      Imm_value <= "0000"; 
                      bit_add_sub <= "1001";
                      Mul_out  <= "0100";
                      Shif_out <= "1100";
                      DOT_out <= "0101";
                      
                      
                      load_select <= "100";
                      wait for 100 ns;
                      
                      load_select <= "101";
                      wait for 100 ns;     
                      
                       load_select <= "110";
                       wait for 100 ns;
                       
                       load_select <= "111";
                       wait for 100 ns;   
                       
                       -- Additional test cases can be added here
                             
                        wait;
                  end process stimulus_proc;                       
end Behavioral;
