----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/17/2024 09:37:34 AM
-- Design Name: 
-- Module Name: Nano_Processor - Behavioral
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

entity Nano_Processor is
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
end Nano_Processor;

architecture Behavioral of Nano_Processor is

------------------------ Program ROM ------------------------
COMPONENT ROM
PORT( Memory_Select   : in STD_LOGIC_VECTOR (2 downto 0);
      Instruction_Bus : out STD_LOGIC_VECTOR (12 downto 0));
end COMPONENT;

-------------------- Instruction Decoder --------------------
COMPONENT Instruction_Decoder
PORT( Rom_Instruction : in STD_LOGIC_VECTOR (12 downto 0);
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
end COMPONENT;

---------------------- Program Counter ----------------------
COMPONENT P_Counter_3bit
PORT( Mux_out : in STD_LOGIC_VECTOR (2 downto 0);
      Clk     : in STD_LOGIC;
      Res     : in STD_LOGIC;
      Q       : out STD_LOGIC_VECTOR (2 downto 0));
end COMPONENT;

------------------------ 3-bit Adder ------------------------
COMPONENT ADDER_3
PORT( I : in STD_LOGIC_VECTOR (2 downto 0);
      Y : out STD_LOGIC_VECTOR (2 downto 0));
end COMPONENT;

----------------------- Register Bank -----------------------
COMPONENT Reg_bank
    
     Port ( I : in STD_LOGIC_VECTOR (3 downto 0); -- this bus will be connected to the three flip flops of the register
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
end COMPONENT;

-------------------- 4-bit Add/Sub Unit --------------------
COMPONENT COMPLI_ADD_SUB
PORT( A : in STD_LOGIC_VECTOR (3 downto 0);
      B : in STD_LOGIC_VECTOR (3 downto 0);
      ADD_SUB_Change : in STD_LOGIC;
      Overflow       : out STD_LOGIC;
      Zero : out STD_LOGIC;
      S    : out STD_LOGIC_VECTOR (3 downto 0));
end COMPONENT;

---------------------- 8-way 4-bit Mux ----------------------
COMPONENT MUX_8_1_4bit
PORT( Reg_00 : in STD_LOGIC_VECTOR (3 downto 0);
      Reg_01 : in STD_LOGIC_VECTOR (3 downto 0);
      Reg_02 : in STD_LOGIC_VECTOR (3 downto 0);
      Reg_03 : in STD_LOGIC_VECTOR (3 downto 0);
      Reg_04 : in STD_LOGIC_VECTOR (3 downto 0);
      Reg_05 : in STD_LOGIC_VECTOR (3 downto 0);
      Reg_06 : in STD_LOGIC_VECTOR (3 downto 0);
      Reg_07 : in STD_LOGIC_VECTOR (3 downto 0);
      Reg_sel : in STD_LOGIC_VECTOR (2 downto 0);
      Selected_reg : out STD_LOGIC_VECTOR (3 downto 0));
end COMPONENT;

---------------------- 2-way 3-bit Mux ----------------------
COMPONENT MUX_2_1_3bit
PORT( jump : in STD_LOGIC;
      address : in STD_LOGIC_VECTOR (2 downto 0);
      counter : in STD_LOGIC_VECTOR (2 downto 0);
      instr_no : out STD_LOGIC_VECTOR (2 downto 0));
end COMPONENT;

---------------------- 5-way 4-bit Mux ----------------------
COMPONENT MUX_5_1_4bit
PORT( load_select : in STD_LOGIC_VECTOR (2 downto 0);
      Imm_value : in STD_LOGIC_VECTOR (3 downto 0);
      bit_add_sub : in STD_LOGIC_VECTOR (3 downto 0);
      instru : out STD_LOGIC_VECTOR (3 downto 0);
      Mul_out : in STD_LOGIC_VECTOR (3 downto 0);
      Shif_out : in STD_LOGIC_VECTOR (3 downto 0);
      DOT_out : in STD_LOGIC_VECTOR (3 downto 0));
end COMPONENT;

------------------------ Slow Clock -------------------------
COMPONENT Slow_Clk
PORT( Clk_in : in STD_LOGIC;
      Clk_out : out STD_LOGIC);
end COMPONENT;

----------------------- Seven Segment -----------------------
COMPONENT LUT_16_7
PORT( address : in STD_LOGIC_VECTOR (3 downto 0);
      data    : out STD_LOGIC_VECTOR (6 downto 0));
end COMPONENT;

--------------------- 4-bit Multiplier  ---------------------
COMPONENT Multiplier_4
PORT( A : in STD_LOGIC_VECTOR (3 downto 0);
      B : in STD_LOGIC_VECTOR (3 downto 0);
      Y : out STD_LOGIC_VECTOR (3 downto 0);
      Overflow : out std_logic );
end COMPONENT;

-------- Choosing addition_Subtraction or Multiplier --------
COMPONENT Operation
PORT( MUX_Out : in STD_LOGIC_VECTOR (3 downto 0);
      Selector : in STD_LOGIC_VECTOR (2 downto 0);
      Add_Bus : out STD_LOGIC_VECTOR (3 downto 0);
      Shif_Bus : out STD_LOGIC_VECTOR (3 downto 0);
      COM_Bus : out STD_LOGIC_VECTOR (3 downto 0);
      DOT_Bus : out STD_LOGIC_VECTOR (3 downto 0);
      Mul_Bus : out STD_LOGIC_VECTOR (3 downto 0));
end COMPONENT;

---------------------- AND Operation  -----------------------
COMPONENT A_N_D
PORT( A : in STD_LOGIC_VECTOR (3 downto 0);
      B : in STD_LOGIC_VECTOR (3 downto 0);
      C : out STD_LOGIC_VECTOR (3 downto 0));
end COMPONENT;

---------------------- Bit Comparator  -----------------------
COMPONENT COMPARATOR
PORT( A : in STD_LOGIC_VECTOR (3 downto 0);
      B : in STD_LOGIC_VECTOR (3 downto 0);
      A_greater_than_B : out STD_LOGIC;
      A_equal_B : out STD_LOGIC;
      A_less_than_B : out STD_LOGIC);
end COMPONENT;

------------------------- Bit Shifter -------------------------
COMPONENT bit_shifter
PORT( I : in STD_LOGIC_VECTOR (3 downto 0);
      S : out STD_LOGIC_VECTOR (3 downto 0);
      C: in STD_LOGIC);
end COMPONENT;

-------------------------- SIGNALS --------------------------
SIGNAL Slw_Clk,OvrFlw_add,OvrFlw_mul : STD_LOGIC;                      -- Slow Clock Output
SIGNAL P_Counter_Out                  : STD_LOGIC_VECTOR (2 downto 0);  -- Program_Counter_Output
SIGNAL ADDER_3_Out,Load_Sel                : STD_LOGIC_VECTOR (2 downto 0);  -- Send_to_2_way_3_bit_MUX
SIGNAL MUX_2_1_3bit_Out,Operation_select   : STD_LOGIC_VECTOR (2 downto 0);  -- Send_to_PROGRAM_COUNTER
SIGNAL I                              : STD_LOGIC_VECTOR (12 downto 0); -- Send_to_PROGRAM_to_Instruction_Decoder

SIGNAL Reg_Sel_MuxA,Decoder_Val,Reg_Sel_MuxB,Address_JMP : STD_LOGIC_VECTOR (2 downto 0);
SIGNAL Im_Value                                          : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL Add_or_Sub,Jmp_Flag,R_L_Shift                     : STD_LOGIC;
SIGNAL add_sub_or_MUL_0                                  : STD_LOGIC;
SIGNAL D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,M_A,M_B, M_0,R_0,R_1,R_2,R_3,R_4,R_5 : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL ADD_A, Shif_A, COM_A, DOT_A, MUL_A, ADD_B, Shif_B, COM_B, DOT_B, MUL_B  : STD_LOGIC_VECTOR (3 downto 0);

-------------------------- Mapping --------------------------
begin
Slow_Clock : Slow_Clk
PORT MAP ( Clk_in => Clk_in,
           Clk_out => Slw_Clk );

Program_Counter : P_Counter_3bit
PORT MAP ( Mux_out => MUX_2_1_3bit_Out,
           Clk     => Slw_Clk,
           Res     => Reset,
           Q       => P_Counter_Out);

Add_Sub_4bit : COMPLI_ADD_SUB
PORT MAP ( A => ADD_B,
           B => ADD_A,
           ADD_SUB_Change => Add_or_Sub,
           Overflow       => OvrFlw_add,
           Zero => Zero,
           S    => R_0);
           
Adder_3bit : ADDER_3
PORT MAP ( I => P_Counter_Out,
           Y => ADDER_3_Out);

MuX_2_way_3bit : MUX_2_1_3bit
PORT MAP ( jump     => Jmp_Flag,
           address  => Address_JMP,
           counter  => ADDER_3_Out,
           instr_no => MUX_2_1_3bit_Out);

Program_ROM : ROM
PORT MAP ( Memory_Select   => P_Counter_Out,
           Instruction_Bus => I);

Instructions_Decoder : Instruction_Decoder
PORT MAP ( Rom_Instruction => I,
           Check_Jump      => M_A,
           Register_EN     => Decoder_Val,
           Load_Select     => Load_Sel,
           Imme_Value      => Im_Value,
           Reg_Select_A    => Reg_Sel_MuxA,
           Reg_Select_B    => Reg_Sel_MuxB,
           ADD_SUB_Select  => Add_or_Sub,
           Jump_Flag       => Jmp_Flag,
           R_L_Shift       => R_L_Shift,
           Address_Jump    => Address_JMP,
           Operation       => Operation_select );

RegisterBank_0 : Reg_bank
    port map(
   I => M_0,
   Clk => Slw_Clk, 
   Reg_en => Decoder_Val,  -- enable pins of the decoder (this will select the respective register)
   -- following are the input lines for the registers
   Reset_bank => Reset, -- mapped to the reset button of the whole processor
   -- outputs from all the registers
   R_0 => D_0,
   R_1 => D_1,
   R_2 => D_2,
   R_3 => D_3,
   R_4 => D_4,
   R_5 => D_5,
   R_6 => D_6,
   R_7 => D_7
);

MuX_8_way_4bit_A : MUX_8_1_4bit
PORT MAP ( Reg_00 => D_0,
           Reg_01 => D_1,
           Reg_02 => D_2,
           Reg_03 => D_3,
           Reg_04 => D_4,
           Reg_05 => D_5,
           Reg_06 => D_6,
           Reg_07 => D_7,
           Reg_sel => Reg_Sel_MuxA,
           Selected_reg => M_A);

MuX_8_way_4bit_B : MUX_8_1_4bit
PORT MAP ( Reg_00 => D_0,
           Reg_01 => D_1,
           Reg_02 => D_2,
           Reg_03 => D_3,
           Reg_04 => D_4,
           Reg_05 => D_5,
           Reg_06 => D_6,
           Reg_07 => D_7,
           Reg_sel => Reg_Sel_MuxB,
           Selected_reg => M_B);
           
Operation_A : Operation
PORT MAP ( MUX_Out  => M_A,
           Selector => Operation_select,
           Add_Bus  => ADD_A,
           Shif_Bus  => Shif_A,
           COM_Bus  => COM_A,
           DOT_Bus  => DOT_A,
           Mul_Bus  => MUL_A);

Operation_B : Operation
PORT MAP ( MUX_Out  => M_B,
           Selector => Operation_select,
           Add_Bus  => ADD_B,
           Shif_Bus => Shif_B,
           COM_Bus  => COM_B,
           DOT_Bus  => DOT_B,
           Mul_Bus  => MUL_B);
           
Multiplier : Multiplier_4
PORT MAP ( A => MUL_B,
           B => MUL_A,
           Y => R_1,
           Overflow => OvrFlw_mul );

MuX_5_way_4bit : MUX_5_1_4bit
PORT MAP ( load_select => Load_Sel,
           Imm_value   => Im_Value,
           bit_add_sub => R_0,
           instru      => M_0,
           Mul_out     => R_1,
           Shif_out    => R_2,
           DOT_out     => R_3);
           
A_N_D_0 : A_N_D
PORT MAP ( A => DOT_B,
           B => DOT_A,
           C => R_3 );
                      
COMPARATOR_0 : COMPARATOR
PORT MAP ( A => COM_B,
           B => COM_A,
           A_greater_than_B => A_greater_than_B,
           A_equal_B        => A_equal_B,
           A_less_than_B    => A_less_than_B);

Bit_Shifter_0 : bit_Shifter
PORT MAP ( I => Shif_A,
           S => R_2,
           C => R_L_Shift  );                                                                  

Seven_Segment : LUT_16_7
PORT MAP ( address => D_7,
           data    => Seven_Seg_Out);
RLED  <= D_7;
Anode <= "1110";
Overflow_add <= OvrFlw_add;
Overflow_mul <= OvrFlw_mul;
end Behavioral;
