
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_ALU is
--  Port ( );
end tb_ALU;

architecture Behavioral of tb_ALU is
COMPONENT ALU
Port (
A: in std_logic_vector(15 downto 0);
B: in std_logic_vector(15 downto 0);
GS: in std_logic_vector(3 downto 0);

G: out std_logic_vector(15 downto 0);

C: out std_logic;
V: out std_logic
);
    END COMPONENT;
    
     --Inputs
   
   signal A : std_logic_vector(15 downto 0);
   signal B : std_logic_vector(15 downto 0);
   signal GS: std_logic_vector(3 downto 0) := (others => '0');
    
 	--Outputs
   signal G : std_logic_vector(15 downto 0);
   signal C : std_logic;
   signal V : std_logic;

begin

uut: ALU PORT MAP(
A => A,
B => B,
GS => GS,

G => G,

C => C,
V => V
);

stim_proc: process
begin
wait for 50ns;
A <= x"1234";
B <= x"4321";

wait for 50ns;
GS <= x"0";

wait for 50ns;
GS <= x"1";

wait for 50ns;
GS <= x"2";

wait for 50ns;
GS <= x"3";

wait for 50ns;
GS <= x"4";

wait for 50ns;
GS <= x"5";

wait for 50ns;
GS <= x"6";

wait for 50ns;
GS <= x"7";

wait for 50ns;
GS <= x"8";

wait for 50ns;
GS <= x"A";

wait for 50ns;
GS <= x"C";

wait for 50ns;
GS <= x"E";


end process;
end Behavioral;
