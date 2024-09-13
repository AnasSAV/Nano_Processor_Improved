library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Reg_bank is
 Port (  I : in STD_LOGIC_VECTOR (3 downto 0); -- this bus will be connected to the three flip flops of the register
         Clk : in STD_LOGIC; -- this is the common clock for the registers
         Reg_en : in STD_LOGIC_VECTOR (2 downto 0); -- enable pins of the decoder (this will select the respective register)
         Reset_bank : in STD_LOGIC;
         
         R_0 : out STD_LOGIC_VECTOR (3 downto 0);
         R_1 : out STD_LOGIC_VECTOR (3 downto 0);
         R_2 : out STD_LOGIC_VECTOR (3 downto 0);
         R_3 : out STD_LOGIC_VECTOR (3 downto 0);
         R_4 : out STD_LOGIC_VECTOR (3 downto 0);
         R_5 : out STD_LOGIC_VECTOR (3 downto 0);
         R_6 : out STD_LOGIC_VECTOR (3 downto 0);
         R_7 : out STD_LOGIC_VECTOR (3 downto 0));
         
end Reg_bank;

architecture Behavioral of Reg_bank is

-- define the component register
component Reg
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           En : in STD_LOGIC;
           reset : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

--define the component decoder

component Decoder_3_to_8
 Port(I : in STD_LOGIC_VECTOR (2 downto 0);
     EN : in STD_LOGIC;
     Y : out STD_LOGIC_VECTOR (7 downto 0)
 );
end component;

-- define internal signals

-- we need to hardwire the register RO0 to be 0000
SIGNAL Reg0 : std_logic_VECTOR (3 downto 0):= "0000";
SIGNAL S : std_logic_VECTOR (7 downto 0);
SIGNAL en : std_logic := '1';

Begin

-- define the decoder and do the port mapping

Decoder_3_to_8_0 : Decoder_3_to_8
 PORT MAP(
 I => Reg_en,
 EN => en,
 Y => S 
);

-- we need to define 8 registers and map them accordingly

Reg_0 : Reg
 port map (
 EN => '0',
 D => Reg0,
 reset => Reset_bank,
 Q => R_0,
 Clk => Clk

);

Reg_1 : Reg
 port map (
 EN => S(1),
 D => I,
 reset => Reset_bank,
 Q => R_1,
 Clk => Clk

);
Reg_2 : Reg
 port map (
 EN => S(2),
 D => I,
 reset => Reset_bank,
 Q => R_2,
 Clk => Clk

);
Reg_3 : Reg
 port map (
 EN => S(3),
 D => I,
 reset => Reset_bank,
 Q => R_3,
 Clk => Clk

);
Reg_4 : Reg
 port map (
 EN => S(4),
 D => I,
 reset => Reset_bank,
 Q => R_4,
 Clk => Clk

);
Reg_5 : Reg
 port map (
 EN => S(5),
 D => I,
 reset => Reset_bank,
 Q => R_5,
 Clk => Clk

);
Reg_6 : Reg
 port map (
 EN => S(6),
 D => I,
 reset => Reset_bank,
 Q => R_6,
 Clk => Clk

);

Reg_7 : Reg
 port map (
 EN => S(7),
 D => I,
 reset => Reset_bank,
 Q => R_7,
 Clk => Clk

);

end Behavioral;