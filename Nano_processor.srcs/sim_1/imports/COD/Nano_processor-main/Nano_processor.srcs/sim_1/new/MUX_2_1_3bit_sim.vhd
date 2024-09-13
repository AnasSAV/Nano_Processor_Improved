----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/09/2024 04:52:57 AM
-- Design Name: 
-- Module Name: MUX_2_1_3bit_sim - Behavioral
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

entity MUX_2_1_3bit_sim is
--  Port ( );
end MUX_2_1_3bit_sim;

architecture Behavioral of MUX_2_1_3bit_sim is
    -- Component declaration
    component MUX_2_1_3bit is
        Port (
            jump : in STD_LOGIC;
            address : in STD_LOGIC_VECTOR (2 downto 0);
            counter : in STD_LOGIC_VECTOR (2 downto 0);
            instr_no : out STD_LOGIC_VECTOR (2 downto 0)
        );
    end component;

    -- Signals declaration
    signal jump_sig : STD_LOGIC;
    signal address_sig : STD_LOGIC_VECTOR (2 downto 0);
    signal counter : STD_LOGIC_VECTOR (2 downto 0);
    signal instr_no_sig : STD_LOGIC_VECTOR (2 downto 0);

begin
    -- Instantiate the MUX_2_1_3bit module
    uut: MUX_2_1_3bit port map (
        jump => jump_sig,
        address => address_sig,
        counter => counter,
        instr_no => instr_no_sig
    );

    -- Stimulus process
    stimulus_proc: process
    begin
        --220233 : 110 101 110 001 001 001
        --220030 : 110 101 101 101 111 110
        
        -- Test case 1: jump = '0', address = "001" , counter = "110"
        jump_sig <= '0';
        address_sig <= "001";
        counter <= "110";
        wait for 100 ns;

        -- Test case 2: jump = '0', address = "001" , counter = "111"
        jump_sig <= '0';
        address_sig <= "001";
        counter <= "111";
        wait for 100 ns;
        
        jump_sig <= '0';
        address_sig <= "001";
        counter <= "101";
        wait for 100 ns;
                
        jump_sig <= '1';
        address_sig <= "110";
        counter <= "101";
        wait for 100 ns;
        
        jump_sig <= '1';
        address_sig <= "101";
        counter <= "010";
        wait for 100 ns;
        
        jump_sig <= '1';
        address_sig <= "111";
        counter <= "010";
        wait for 100 ns;
        -- Additional test cases can be added here

        wait;
    end process stimulus_proc;

end Behavioral;
