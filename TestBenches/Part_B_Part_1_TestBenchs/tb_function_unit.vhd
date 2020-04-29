library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_function_unit is
--  Port ( );
end tb_function_unit;

architecture Behavioral of tb_function_unit is

COMPONENT function_unit
Port (
A: in std_logic_vector(15 downto 0);
B: in std_logic_vector(15 downto 0);
FS: in std_logic_vector(4 downto 0);

V: out std_logic;
C: out std_logic;
Z: out std_logic; --return 1 if 0
N: out std_logic; --return MSB
F: out std_logic_vector(15 downto 0)
);
END COMPONENT;

   --Inputs
   
   signal A: std_logic_vector(15 downto 0) := (others => '0');
   signal B: std_logic_vector(15 downto 0) := (others => '0');
   signal FS: std_logic_vector(4 downto 0);
    
 	--Outputs
    signal V : std_logic;
    signal C : std_logic;
    signal Z : std_logic;
    signal N : std_logic;
    signal F : std_logic_vector(15 downto 0);
    

begin

uut: function_unit PORT MAP(
A=>A,
B => B,
FS => FS,
V => V,
C => C,
Z => Z,
N => N,
F => F
);

stim_proc: process
begin

wait for 50 ns;
A<= x"B00B";
B<= x"BEEF";

wait for 50 ns;
FS<="00000";

wait for 50 ns;
FS<="00001";

wait for 50 ns;
FS<="00010";

wait for 50 ns;
FS<="00011";

wait for 50 ns;
FS<="00100";

wait for 50 ns;
FS<="00101";

wait for 50 ns;
FS<="00110";

wait for 50 ns;
FS<="00111";

wait for 50 ns;
FS<="01000";

wait for 50 ns;
FS<="01010";

wait for 50 ns;
FS<="01100";

wait for 50 ns;
FS<="01110";

wait for 50 ns;
FS<="10000";

wait for 50 ns;
FS<="10100";

wait for 50 ns;
FS<="11000";


end process;
end Behavioral;
