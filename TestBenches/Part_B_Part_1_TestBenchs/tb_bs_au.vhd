library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_bs_au is
end tb_bs_au;

architecture Behavioral of tb_bs_au is
COMPONENT bit_slice_au
Port ( 
A: in std_logic;
Cin: in std_logic;
S0: in std_logic;
S1: in std_logic;
B: in std_logic;

Gi: out std_logic;
Cout: out std_logic
);
END COMPONENT;


--Inputs
signal A: std_logic;
signal Cin: std_logic;
signal S0: std_logic;
signal S1: std_logic;
signal B: std_logic;

--Outputs

signal Gi, Cout: std_logic;


begin



uut: bit_slice_au PORT MAP(
S0 => S0,
S1 => S1,
A => A,
B => B,
Cin => Cin,
Gi => Gi,
Cout => Cout
);

stim_proc: process
begin

wait for 5ns;
A <= '0';
Cin <= '0';
S0 <= '0';
S1 <= '0';
B <= '0';

wait for 5ns;
A <= '0';
Cin <= '0';
S0 <= '0';
S1 <= '0';
B <= '1';

wait for 5ns;
A <= '0';
Cin <= '0';
S0 <= '0';
S1 <= '1';
B <= '0';

wait for 5ns;
A <= '0';
Cin <= '0';
S0 <= '0';
S1 <= '1';
B <= '1';

wait for 5ns;
A <= '0';
Cin <= '0';
S0 <= '1';
S1 <= '0';
B <= '0';

wait for 5ns;
A <= '0';
Cin <= '0';
S0 <= '1';
S1 <= '0';
B <= '1';

wait for 5ns;
A <= '0';
Cin <= '0';
S0 <= '1';
S1 <= '1';
B <= '0';

wait for 5ns;
A <= '0';
Cin <= '0';
S0 <= '1';
S1 <= '1';
B <= '1';

wait for 5ns;
A <= '0';
Cin <= '1';
S0 <= '0';
S1 <= '0';
B <= '0';

wait for 5ns;
A <= '0';
Cin <= '1';
S0 <= '0';
S1 <= '0';
B <= '1';

wait for 5ns;
A <= '0';
Cin <= '1';
S0 <= '0';
S1 <= '1';
B <= '0';

wait for 5ns;
A <= '0';
Cin <= '1';
S0 <= '0';
S1 <= '1';
B <= '1';

wait for 5ns;
A <= '0';
Cin <= '1';
S0 <= '1';
S1 <= '0';
B <= '0';

wait for 5ns;
A <= '0';
Cin <= '1';
S0 <= '1';
S1 <= '0';
B <= '1';

wait for 5ns;
A <= '0';
Cin <= '1';
S0 <= '1';
S1 <= '1';
B <= '0';

wait for 5ns;
A <= '0';
Cin <= '1';
S0 <= '1';
S1 <= '1';
B <= '1';

wait for 5ns;
A <= '1';
Cin <= '0';
S0 <= '0';
S1 <= '0';
B <= '0';

wait for 5ns;
A <= '1';
Cin <= '0';
S0 <= '0';
S1 <= '0';
B <= '1';

wait for 5ns;
A <= '1';
Cin <= '0';
S0 <= '0';
S1 <= '1';
B <= '0';

wait for 5ns;
A <= '1';
Cin <= '0';
S0 <= '0';
S1 <= '1';
B <= '1';

wait for 5ns;
A <= '1';
Cin <= '0';
S0 <= '1';
S1 <= '0';
B <= '0';

wait for 5ns;
A <= '1';
Cin <= '0';
S0 <= '1';
S1 <= '0';
B <= '1';

wait for 5ns;
A <= '1';
Cin <= '0';
S0 <= '1';
S1 <= '1';
B <= '0';

wait for 5ns;
A <= '1';
Cin <= '0';
S0 <= '1';
S1 <= '1';
B <= '1';

wait for 5ns;
A <= '1';
Cin <= '1';
S0 <= '0';
S1 <= '0';
B <= '0';

wait for 5ns;
A <= '1';
Cin <= '1';
S0 <= '0';
S1 <= '0';
B <= '1';

wait for 5ns;
A <= '1';
Cin <= '1';
S0 <= '0';
S1 <= '1';
B <= '0';

wait for 5ns;
A <= '1';
Cin <= '1';
S0 <= '0';
S1 <= '1';
B <= '1';

wait for 5ns;
A <= '1';
Cin <= '1';
S0 <= '1';
S1 <= '0';
B <= '0';

wait for 5ns;
A <= '1';
Cin <= '1';
S0 <= '1';
S1 <= '0';
B <= '1';

wait for 5ns;
A <= '1';
Cin <= '1';
S0 <= '1';
S1 <= '1';
B <= '0';

wait for 5ns;
A <= '1';
Cin <= '1';
S0 <= '1';
S1 <= '1';
B <= '1';



end process;

end Behavioral;
