----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/15/2024 08:42:37 AM
-- Design Name: 
-- Module Name: Register_Bank_Sim - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Register_Bank_Sim is
--  Port ( );
end Register_Bank_Sim;

architecture Behavioral of Register_Bank_Sim is
    
    -- Component instantiation
    component Reg_bank is
     Port (  I : in STD_LOGIC_VECTOR (3 downto 0); -- this bus will be connected to the three flip flops of the register
     
             Clk : in STD_LOGIC; -- this is the common clock for the registers
             Reg_en : in STD_LOGIC_VECTOR (2 downto 0); -- enable pins of the decoder (this will select the respective register)
             -- following are the input lines for the registers
             Reset_bank : in STD_LOGIC;
             R_0 : out STD_LOGIC_VECTOR (3 downto 0);
             R_1 : out STD_LOGIC_VECTOR (3 downto 0);
             R_2 : out STD_LOGIC_VECTOR (3 downto 0);
             R_3 : out STD_LOGIC_VECTOR (3 downto 0);
             R_4 : out STD_LOGIC_VECTOR (3 downto 0);
             R_5 : out STD_LOGIC_VECTOR (3 downto 0);
             R_6 : out STD_LOGIC_VECTOR (3 downto 0);
             R_7 : out STD_LOGIC_VECTOR (3 downto 0));
             
    end component;

    -- Signals
        signal I : std_logic_vector(3 downto 0);
        signal Clk : std_logic := '0';  -- Clock signal
        signal Reg_en : std_logic_vector(2 downto 0);-- Memory Selector
        signal Reset_bank : std_logic; -- Reset signal
        signal  R_0 , R_1 , R_2 , R_3 , R_4 , R_5 , R_6 , R_7  : std_logic_vector(3 downto 0);
       

begin

    -- Component instantiation
    UUT: Reg_bank port map (
                 I  => I,
                 Clk => Clk,
                 Reg_en => Reg_en, 
                 Reset_bank => Reset_bank,
                 R_0 => R_0,
                 R_1 => R_1,
                 R_2 => R_2,
                 R_3 => R_3,
                 R_4 => R_4,
                 R_5 => R_5,
                 R_6 => R_6,
                 R_7 => R_7              
              );
    -- Clock process
    process begin
        Wait for 20ns;
        Clk<=NOT(Clk);
    end process;

    -- Stimulus process
    process begin
        -- Reset activated
        Reset_bank <= '1';
        wait for 40 ns;
        Reset_bank <= '0';

        -- Provide input values for each register
        -- Select different registers
        I <= "0101";
        Reg_en <= "000"; -- Select R0
        wait for 40 ns;
        Reg_en <= "001"; -- Select R1
        wait for 40 ns;
        Reg_en <= "010"; -- Select R2
        wait for 40 ns;
        Reg_en <= "011"; -- Select R3
        wait for 40 ns;
        Reg_en <= "100"; -- Select R4
        wait for 40 ns;
        Reg_en <= "101"; -- Select R5
        wait for 40 ns;
        Reg_en <= "110"; -- Select R6
        wait for 40 ns;
        Reg_en <= "111"; -- Select R7
        wait;

    end process;

end Behavioral;
