----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/24/2024 02:05:01 AM
-- Design Name: 
-- Module Name: Instruction_Decoder_Sim - Behavioral
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

entity Instruction_Decoder_Sim is
--  Port ( );
end Instruction_Decoder_Sim;

architecture Behavioral of Instruction_Decoder_Sim is

component Instruction_Decoder is
    Port ( Rom_Instruction : in STD_LOGIC_VECTOR (11 downto 0);
           Check_Jump : in STD_LOGIC_VECTOR (3 downto 0);
           Register_EN : out STD_LOGIC_VECTOR (2 downto 0);
           Load_Select : out STD_LOGIC;
           Imme_Value : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_Select_A : out STD_LOGIC_VECTOR (2 downto 0);
           Reg_Select_B : out STD_LOGIC_VECTOR (2 downto 0);
           ADD_SUB_Select : out STD_LOGIC;
           Jump_Flag : out STD_LOGIC;
           Address_Jump : out STD_LOGIC_VECTOR (2 downto 0));
end component;


signal Rom_Instruction : STD_LOGIC_VECTOR (11 downto 0);
signal Check_Jump, Imme_Value : STD_LOGIC_VECTOR (3 downto 0);
signal Reg_Select_A, Reg_Select_B, Register_EN, Address_Jump : STD_LOGIC_VECTOR (2 downto 0);
signal ADD_SUB_Select, Jump_Flag,Load_Select : STD_LOGIC;

begin
UUT: Instruction_Decoder 
    PORT MAP(  Rom_Instruction => Rom_Instruction,
               Check_Jump => Check_Jump,
               Reg_Select_A => Reg_Select_A,
               Reg_Select_B =>Reg_Select_B,
               Register_EN => Register_EN,
               ADD_SUB_Select => ADD_SUB_Select,
               Jump_Flag => Jump_Flag,
               Address_Jump => Address_Jump,
               Load_Select => Load_Select,
               Imme_Value => Imme_Value
    );

process
begin
    --220233 : 0011 0101 1100 0100 1001
    
    
   
    Check_Jump<="0011";
    Rom_Instruction<="101110000001"; 
    wait for 100ns; 
    
    Check_Jump<="0101";
    Rom_Instruction<="100100000010"; 
    wait for 100ns; 

    Check_Jump<="0100";
    Rom_Instruction<="001110100000"; 
    wait for 100ns;
    
    Check_Jump<="1001";
    Rom_Instruction<="100110000011"; 
    wait for 100ns; 
    
    Check_Jump<="0000";
    Rom_Instruction<="100010000101"; 
    wait for 100ns;
    
    Check_Jump<="0001";
    Rom_Instruction<="101010000001"; 
    
      
wait;
end process;


end Behavioral;
