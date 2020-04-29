library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity LogicUnitSlice is
Port (sel0, sel1, A, B:in std_logic;
	G:out std_logic
	);
end LogicUnitSlice;
architecture Behavioral of LogicUnitSlice is

begin
 process (sel0, sel1)
	Begin
		if sel0 = '0' and sel1 = '0' then G <= (A and B);
		elsif sel0 = '0' and sel1 = '1' then  G <= (A or B);
		elsif sel0 = '1' and sel1 = '0' then  G <= (A XOR B);
		else G <= NOT A;
		end if;
	end process;
end Behavioral;
