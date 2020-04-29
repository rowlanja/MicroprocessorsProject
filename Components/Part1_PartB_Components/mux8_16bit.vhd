library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux8_16bit is
PORT(
    S0 : IN std_logic;
    S1 : IN std_logic;
	S2 : IN std_logic;
    In0 : IN std_logic_vector(15 downto 0);
    In1 : IN std_logic_vector(15 downto 0);
    In2 : IN std_logic_vector(15 downto 0);
    In3 : IN std_logic_vector(15 downto 0);
	In4 : IN std_logic_vector(15 downto 0);
    In5 : IN std_logic_vector(15 downto 0);
    In6 : IN std_logic_vector(15 downto 0);
    In7 : IN std_logic_vector(15 downto 0);
    Z : OUT std_logic_vector(15 downto 0));
end mux8_16bit;

architecture Behavioral of mux8_16bit is
begin
    process (s0,s1,s2)
    begin
           if s0 = '0' and s1 = '0' and s2 = '0' then
                Z <= In0 ;
           elsif s0 = '0' and s1 = '0' and s2 = '1' then
                Z <= In1 ;
           elsif s0 = '0' and s1 = '1' and s2 = '0' then
                Z <= In2 ;
           elsif s0 = '0' and s1 = '1' and s2 = '1' then
                Z <= In3 ;
           elsif s0 = '1' and s1 = '0' and s2 = '0' then
                Z <= In4 ;
           elsif s0 = '1' and s1 = '0' and s2 = '1' then
                Z <= In5;
           elsif s0 = '1' and s1 = '1' and s2 = '0' then
                Z <= In6;
           elsif s0 = '1' and s1 = '1' and s2 = '1' then
             Z <= In7;
             else z <=  "0000000000000000"; 
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
