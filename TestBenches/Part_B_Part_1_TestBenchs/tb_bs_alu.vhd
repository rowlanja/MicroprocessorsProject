library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_bs_alu is
end tb_bs_alu;

architecture Behavioral of tb_bs_alu is
COMPONENT bit_slice_alu
Port (
 Cin: in std_logic;
 A: in std_logic;
 B: in std_logic;
 S0: in std_logic;
 S1: in std_logic;
 S2: in std_logic;
 
 Cout: out std_logic;
 Gi: out std_logic 
);
END COMPONENT;


--Inputs
signal A: std_logic;
signal B: std_logic;
signal Cin: std_logic;
signal S0: std_logic := '0';
signal S1: std_logic := '1';
signal S2: std_logic := '1';

--Outputs

signal Gi, Cout: std_logic;


begin


uut: bit_slice_alu PORT MAP(
S0 => S0,
S1 => S1,
S2 => S2,
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
B <= '0';
Cin <= '0';

wait for 5ns;
A <= '0';
B <= '0';
Cin <= '1';

wait for 5ns;
A <= '0';
B <= '1';
Cin <= '0';

wait for 5ns;
A <= '0';
B <= '1';
Cin <= '1';

wait for 5ns;
A <= '1';
B <= '0';
Cin <= '0';

wait for 5ns;
A <= '1';
B <= '0';
Cin <= '1';

wait for 5ns;
A <= '1';
B <= '1';
Cin <= '0';

wait for 5ns;
A <= '1';
B <= '1';
Cin <= '1';


end process;
end Behavioral;
