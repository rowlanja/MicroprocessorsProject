library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity regi4 is
port ( D : in std_logic_vector(15 downto 0);
	load : in std_logic;
	Clk : in std_logic;
	Q : out std_logic_vector(15 downto 0)
	);
end regi4;
architecture Behavioral of regi4 is
begin
process(Clk)
begin
	if (rising_edge(Clk)) then
		if load='1' then
			Q<=D after 5ns;
		else Q<= "0000000000000000" after 5ns;
		end if;
	end if;
end process;
end Behavioral;