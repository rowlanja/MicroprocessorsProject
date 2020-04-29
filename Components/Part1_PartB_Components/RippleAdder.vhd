library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity RippleAdderSlice is
PORT(
    A0 : IN std_logic;
    B0 : IN std_logic;
	S1 : IN std_logic;
	S2 : In std_logic;
	Carry_in : In std_logic;
    Z : OUT std_logic
	);
end RippleAdderSlice;

architecture Behavioral of RippleAdderSlice is
begin
    process (A0, B0, S1, S2,)
    begin
           if s0 = '0' and s1 = '0' and s2 = '0' then
                Z <= In0 after 5ns;
           elsif s0 = '0' and s1 = '0' and s2 = '1' then
                Z <= In1 after 5ns;
           elsif s0 = '0' and s1 = '1' and s2 = '0' then
                Z <= In2 after 5ns;
           elsif s0 = '0' and s1 = '1' and s2 = '1' then
                Z <= In3 after 5ns;
           elsif s0 = '1' and s1 = '0' and s2 = '0' then
                Z <= In4 after 5ns;
           elsif s0 = '1' and s1 = '0' and s2 = '1' then
                Z <= In5 after 5ns;
           elsif s0 = '1' and s1 = '1' and s2 = '0' then
                Z <= In6 after 5ns;
           elsif s0 = '1' and s1 = '1' and s2 = '1' then
             Z <= In7 after 5ns;
             else z <=  "0000000000000000" after 5 ns; 
	       end if;
	end process;
--   process ( s,in1,in2,in3,in4,in5,in6,in7,in8)
--		begin
--		case  s is
--			when "000" => z <= in0;
--			when "001" => z <= in1;
--			when "010" => z <= in2;
--			when "011" => z <= in3;
--			when "100" => z <= in4;
--            when "101" => z <= in5;
--            when "110" => z <= in6;
--            when "111" => z <= in7;
--			when others => z <= in0;
--		end case;
--	end process;
end Behavioral;
