library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity AU is
Port (  
	src_s0 :  in std_logic; -- s0 s1 s2 for mux 1
    src_s1 : in std_logic;
    A_data : in std_logic_vector(15 downto 0);
    B_data : in std_logic_vector(15 downto 0);
	Cin : in std_logic;
	Cout : out std_logic;
	G_data : out std_logic_vector(15 downto 0)
	);
end AU;

architecture Behavioral of AU is 
-- components
COMPONENT ALogic
PORT (
	Cin : IN std_logic;
	g : Out std_logic_vector(15 downto 0);
   	x : IN std_logic_vector(15 downto 0);
	y : IN std_logic_vector(15 downto 0);
	Cout : OUT std_logic
);
END COMPONENT;

COMPONENT BLogic
PORT (
	S0 : IN std_logic;
    S1 : IN std_logic;
	B : IN std_logic_vector(15 downto 0);
    Y : Out std_logic_vector(15 downto 0)

);
END COMPONENT;
--SIGNALS
	signal Xin, Yin, Gout : std_logic_vector(15 downto 0);
	signal C_o : std_logic;

begin 
--port maps ;-)
aunit : ALogic PORT MAP (
	Cin => Cin,
	g => Gout(15 downto 0),
   	x =>  A_data(15 downto 0),
	y => Yin(15 downto 0),
	Cout => C_o
);

bunit : BLogic PORT MAP (
    S0 => src_s0,
    S1 => src_s1,
	B => B_data(15 downto 0),
    Y => Yin(15 downto 0)
);
	G_data <= Gout;
	Cout <= C_o;
end behavioral;