----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/16/2024 08:10:42 PM
-- Design Name: 
-- Module Name: Instruction_Decoder - Behavioral
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

entity Instruction_Decoder is
    Port ( Rom_Instruction : in STD_LOGIC_VECTOR (12 downto 0);
           Check_Jump : in STD_LOGIC_VECTOR (3 downto 0);
           Register_EN : out STD_LOGIC_VECTOR (2 downto 0);
           Load_Select : out STD_LOGIC_VECTOR (2 downto 0);
           Imme_Value : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_Select_A : out STD_LOGIC_VECTOR (2 downto 0);
           Reg_Select_B : out STD_LOGIC_VECTOR (2 downto 0);
           ADD_SUB_Select : out STD_LOGIC;
           Jump_Flag : out STD_LOGIC;
           R_L_Shift : out STD_LOGIC;
           Address_Jump : out STD_LOGIC_VECTOR (2 downto 0);
           Operation : out STD_LOGIC_VECTOR (2 downto 0));
end Instruction_Decoder;

architecture Behavioral of Instruction_Decoder is
component Decoder_3_to_8 is
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal ADD, NEG, MOVI, JZR,MUL,COM, DOT,SHIF:STD_LOGIC;

begin
Decoder_3_to_8_0 : Decoder_3_to_8
Port map ( I(0) => Rom_Instruction(10),
           I(1) => Rom_Instruction(11),
           I(2) => Rom_Instruction(12),  
           EN   => '1',
           Y(0) => ADD,
           Y(1) => NEG,
           Y(2) => MOVI,
           Y(3) => JZR,
           Y(4) => MUL,
           Y(5) => COM,
           Y(6) => DOT,
           Y(7) => SHIF );

Reg_Select_A   <= Rom_Instruction(9 downto 7);
Reg_Select_B   <= Rom_Instruction(6 downto 4);
Register_EN    <= Rom_Instruction(9 downto 7);
ADD_SUB_Select <= NEG;
Jump_Flag      <= JZR AND ( NOT(Check_Jump(0) OR Check_Jump(1) OR Check_Jump(2) OR Check_Jump(3)));
Address_Jump   <= Rom_Instruction(2 downto 0);
Load_Select    <= Rom_Instruction(12 downto 10);
Imme_Value     <= Rom_Instruction(3 downto 0);
Operation      <= Rom_Instruction(12 downto 10);
R_L_Shift      <= SHIF;
end Behavioral;

--signal instruction:STD_LOGIC_VECTOR (1 downto 0);  
--signal reg_A:STD_LOGIC_VECTOR (2 downto 0); 
--signal reg_B:STD_LOGIC_VECTOR (2 downto 0); 
--signal reg_to_store:STD_LOGIC_VECTOR (2 downto 0); 
--signal data:STD_LOGIC_VECTOR (3 downto 0);

--begin

--instruction<=Rom_Instruction(11 downto 10);  --first two bits
--reg_A<=ROM_Instruction(9 downto 7);  --next 3 bits indicating register
--reg_to_store<= ROM_Instruction(9 downto 7); --regisiter to be enabled for storing
--reg_B<=ROM_Instruction(6 downto 4);  --next 3 bits indicating register
--data<=ROM_Instruction(3 downto 0);  --last 4 bits

--process (instruction, reg_A, reg_B, reg_to_store, data)
--    begin
--    if instruction="00" then --ADD
--       -- as it is add operation both mux connected to RCA should be selected
--       Reg_Select_A <= reg_A;  
--       Reg_Select_B <= reg_B;
--       Register_EN <= reg_to_store;  --enabled to store output
--       ADD_SUB_Select <= '0'; -- as ADD instruction, value is set to 0
--       Jump_Flag <= '0';
--       Address_Jump <= "000";
--       Load_Select <= '0';
--       Imme_Value <= "0000"; -- no immediate value
       
--    elsif instruction="01" then --NEG
--        -- involve RCA
--        -- in order to find 2's compliment first mux is loaded with all zero and AddSub is set to 1
--       Reg_Select_A <= "000";
--       Reg_Select_B <= reg_A;
--       Register_EN <= reg_to_store;  -- enabled to store output
--       ADD_SUB_Select <= '1';
--       Jump_Flag <= '0';
--       Address_Jump <= "000";
--       Load_Select <= '0';
--       Imme_Value <= "0000"; -- no immediate value
       
--    elsif instruction="10" then --MOVI
--       -- does not involve RCA
--       Reg_Select_A <= "000";
--       Reg_Select_B <= "000";
--       Register_EN <= reg_to_store;  --enable to store immediate value
--       ADD_SUB_Select <= '0';
--       Jump_Flag <= '0';
--       Address_Jump <= "000";
--       Load_Select <= '1'; --immediate value present
--       Imme_Value<= data;  --immediate value present
       
--    elsif instruction="11" then  --JZR
--       Reg_Select_A <= reg_A;
--       Reg_Select_B <="000";
--       Register_EN <= reg_to_store;
--       ADD_SUB_Select <= '0';
--       Load_Select <= '0';
--       Imme_Value <= "0000"; -- no immediate value
--       if Check_Jump = "0000" then
--           Jump_Flag <= '1';
--           Address_Jump <= ROM_Instruction(2 downto 0);
--       else
--           Jump_Flag <= '0';
--           Address_Jump <= "000";
--       end if;
--    end if;
--end process;

--end Behavioral;
