----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/14/2024 02:26:15 PM
-- Design Name: 
-- Module Name: COMPLI_ADD_SUB_Sim - Behavioral
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

entity COMPLI_ADD_SUB_Sim is
--  Port ( );
end COMPLI_ADD_SUB_Sim;

architecture Behavioral of COMPLI_ADD_SUB_Sim is

    -- Component declaration for the unit under test (UUT)
    component COMPLI_ADD_SUB is
        Port (
            A : in STD_LOGIC_VECTOR (3 downto 0);
            B : in STD_LOGIC_VECTOR (3 downto 0);
            ADD_SUB_Change : in STD_LOGIC;
            Overflow : out STD_LOGIC;
            Zero : out STD_LOGIC;
            S : out STD_LOGIC_VECTOR (3 downto 0)
        );
    end component;

    -- Signals for stimulus generation
    signal A : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
    signal B : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
    signal ADD_SUB_Change : STD_LOGIC := '0';

    -- Signals for response capture
    signal C_out : STD_LOGIC;
    signal Overflow : STD_LOGIC;
    signal Zero : STD_LOGIC;
    signal S : STD_LOGIC_VECTOR (3 downto 0);

begin

    -- Instantiate the unit under test (UUT)
    UUT: COMPLI_ADD_SUB port map (
        A => A,
        B => B,
        ADD_SUB_Change => ADD_SUB_Change,
        Overflow => Overflow,
        Zero => Zero,
        S => S
    );

    stimulus: process
    begin
        A <= "1010";
        B <= "0110";
        ADD_SUB_Change <= '0';
        wait for 100 ns;

        A <= "1110";
        B <= "0010";
        ADD_SUB_Change <= '0';
        wait for 100 ns;
        
        A <= "1011";
        B <= "0011";
        ADD_SUB_Change <= '0';
        wait for 100 ns;
                
        A <= "1111";
        B <= "1111";
        ADD_SUB_Change <= '0';
        wait for 100 ns;
        
        A <= "0000";
        B <= "0000";
        ADD_SUB_Change <= '0';
        wait for 100 ns;
        
        A <= "1010";
        B <= "0110";
        ADD_SUB_Change <= '1';
        wait for 100 ns;
                
        A <= "1110";
        B <= "1000";
        ADD_SUB_Change <= '1';
        wait for 100 ns;
        
        A <= "1101";
        B <= "0011";
        ADD_SUB_Change <= '1';
        wait for 100 ns;
                
        wait;
    end process;

    -- Add any necessary assertions or checks here

end Behavioral;
