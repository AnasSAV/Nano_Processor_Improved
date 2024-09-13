library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Counter_3bit_sim is
--  Port ( );
end Counter_3bit_sim;

architecture Behavioral of Counter_3bit_sim is

component P_Counter_3bit
port ( Mux_out : in STD_LOGIC_VECTOR (2 downto 0) := "000";
       Clk : in STD_LOGIC;
       Res : in STD_LOGIC;
       Q : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal Clk : std_logic:='0'; 
signal Res : std_logic; 
signal Mux_out : std_logic_vector(2 downto 0) := "000";
signal Q : std_logic_vector(2 downto 0);   

begin

UUT:P_Counter_3bit
port map(
Clk=>Clk, 
Res=>Res, 
Q=>Q, 
Mux_out=>Mux_out
);

process begin  
Clk<=not(Clk);
wait for ns;
end process;

process begin  
Res<='1'; 
Mux_out<="000"; 

wait for 100ns; 
Mux_out<="001";

wait for 100ns; 
Mux_out<="010";

wait for 100ns; 
Mux_out<="011";

wait for 100ns; 
Mux_out<="101";

wait for 100ns; 
Mux_out<="110";

wait for 100ns; 
Mux_out<="111";

wait for 100ns;
Res<='0'; 
Mux_out<="000"; 

wait for 100ns; 
Mux_out<="001";

wait for 100ns; 
Mux_out<="010";

wait for 100ns; 
Mux_out<="011";

wait for 100ns; 
Mux_out<="101";

wait for 100ns; 
Mux_out<="110";

wait for 100ns; 
Mux_out<="111";
 
wait; 
end process; 
end Behavioral;