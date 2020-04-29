
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_bs_lu is
--  Port ( );
end tb_bs_lu;

architecture Behavioral of tb_bs_lu is
COMPONENT bit_slice_lu
Port ( 
S0 : in std_logic;
S1 : in std_logic;
A : in std_logic;
B : in std_logic;

G: out std_logic
);
END COMPONENT;


--Inputs
signal A: std_logic;
signal B: std_logic;

signal S0: std_logic;
signal S1: std_logic;

--Outputs

signal G: std_logic;


begin



uut: bit_slice_lu PORT MAP(
A => A,
B => B,
S0 => S0,
S1 => S1,
G => G
);

stim_proc: process
begin

wait for 5ns;
A <= '0';
B<= '0';
S0<='0';
S1<='0';

wait for 5ns;
A <= '0';
B<= '0';
S0<='0';
S1<='1';

wait for 5ns;
A <= '0';
B<= '0';
S0<='1';
S1<='0';

wait for 5ns;
A <= '0';
B<= '0';
S0<='1';
S1<='1';

wait for 5ns;
A <= '0';
B<= '1';
S0<='0';
S1<='0';

wait for 5ns;
A <= '0';
B<= '1';
S0<='0';
S1<='1';

wait for 5ns;
A <= '0';
B<= '1';
S0<='1';
S1<='0';

wait for 5ns;
A <= '0';
B<= '1';
S0<='1';
S1<='1';

wait for 5ns;
A <= '1';
B<= '0';
S0<='0';
S1<='0';

wait for 5ns;
A <= '1';
B<= '0';
S0<='0';
S1<='1';

wait for 5ns;
A <= '1';
B<= '0';
S0<='1';
S1<='0';

wait for 5ns;
A <= '1';
B<= '0';
S0<='1';
S1<='1';

wait for 5ns;
A <= '1';
B<= '1';
S0<='0';
S1<='0';

wait for 5ns;
A <= '1';
B<= '1';
S0<='0';
S1<='1';

wait for 5ns;
A <= '1';
B<= '1';
S0<='1';
S1<='0';

wait for 5ns;
A <= '1';
B<= '1';
S0<='1';
S1<='1';

end process;

end Behavioral;
