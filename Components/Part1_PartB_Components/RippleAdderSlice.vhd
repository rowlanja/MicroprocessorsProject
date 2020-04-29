library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity BLogicSlice is
PORT(
    S0 : IN std_logic;
    S1 : IN std_logic;
	B0 : IN std_logic;
   	Y0 : Out std_logic
 );
end BlogicSlice;

architecture Behavioral of BLogicSlice is
signal And1OR, And2OR, NotAnd, 
begin
    process (s0,s1)
    begin
        NotAnd = (not B0) after 5 ns;
		And1OR = (B0 and S0) after 5 ns;
		And2OR = (NotAnd and S1) after 5 ns;
		Y0 = (And1OR and And2OR) after 5 ns;
	end process;
end Behavioral;
