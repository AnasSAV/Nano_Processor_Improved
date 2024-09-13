----------------------------------------------------------------------------------
-- Company: UOM CSE
-- Engineer: 220030M
-- 
-- Create Date: 02/27/2024 03:39:03 PM
-- Design Name: 
-- Module Name: Multiplier_4 - Behavioral
-- Project Name: Lab 05
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

entity Multiplier_4 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0);
           Overflow : out std_logic ); -- Changed output size to 5 bits
end Multiplier_4;

architecture Behavioral of Multiplier_4 is
    COMPONENT FA is
        Port (
            A : in std_logic;
            B : in std_logic;
            C_in : in std_logic;
            S : out std_logic;
            C_out : out std_logic
        );
    end COMPONENT;

    SIGNAL b0a0, b0a1, b0a2, b0a3, b1a0, b1a1, b1a2, b1a3, b2a0, b2a1, b2a2, b3a0, b3a1 :std_logic;
    SIGNAL s_0_1, s_0_2 , s_0_3, s_0_4 , s_1_0,s_1_1, s_1_2, s_1_3,s_1_4, c_0_0 , c_0_1, c_0_2 , c_0_3, c_1_0, c_1_1, c_1_2,c_1_3,c_1_4:std_logic;

begin
    FA_0_0 : FA port map(
        A=>b0a1,
        B=>b1a0,
        C_in=>'0',
        S=>s_0_1,
        C_out=>c_0_0
    );

    FA_0_1: FA port map(
        A=>b2a0,
        B=>b1a1,
        C_in=>'0',
        S=>s_1_0,
        C_out=>c_1_0
    );

    FA_1_0: FA port map(
        A=>s_1_0,
        B=>b0a2,
        C_in=>c_0_0,
        S=>s_0_2,
        C_out=>c_0_1
    );

    FA_0_2: FA port map(
        A=>b3a0,
        B=>b2a1,
        C_in=>'0',
        S=>s_1_1,
        C_out=>c_1_1
    );

    FA_1_1: FA port map(
        A=>s_1_1,
        B=>b1a2,
        C_in=>c_1_0,
        S=>s_1_2,
        C_out=>c_1_2
    );

    FA_2_0: FA port map(
        A=>s_1_2,
        B=>b0a3,
        C_in=>c_0_1,
        S=>s_0_3,
        C_out=>c_0_2
    );

    FA_1_2: FA port map(
        A=>b2a2,
        B=>b3a1,
        C_in=>c_1_1,
        S=>s_1_3,
        C_out=>c_1_3
    );

    FA_2_1: FA port map(
        A=>s_1_3,
        B=>b1a3,
        C_in=>c_1_2,
        S=>s_1_4,
        C_out=>c_1_4
    );

    FA_3_0: FA port map(
        A=>s_1_4,
        B=>c_0_2,
        C_in=>'0',
        S=>s_0_4,
        C_out=>c_0_3
    );



    b0a0<= B(0) AND A(0);
    b0a1<= B(0) AND A(1);
    b0a2<= B(0) AND A(2);
    b0a3<= B(0) AND A(3);
    b1a0<= B(1) AND A(0);
    b1a1<= B(1) AND A(1);
    b1a2<= B(1) AND A(2);
    b1a3<= B(1) AND A(3);
    b2a0<= B(2) AND A(0);
    b2a1<= B(2) AND A(1);
    b2a2<= B(2) AND A(2);
    b3a0<= B(3) AND A(0);
    b3a1<= B(3) AND A(1);


    Y(0)<=b0a0;
    Y(1)<=s_0_1;
    Y(2)<=s_0_2;
    Y(3)<=s_0_3;
    Overflow <=s_0_4; -- Changed to output only 5 bits
end Behavioral;
