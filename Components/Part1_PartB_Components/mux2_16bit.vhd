library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity mux2_16bit is
port ( In0 : in std_logic_vector(15 downto 0);
	In1 : in std_logic_vector(15 downto 0);
	s : in std_logic;
	Z : out std_logic_vector(15 downto 0));
end mux2_16bit;
architecture Behavioral of mux2_16bit is
begin
 process (s,In0,In1)
		begin
		case s is
			when '0' => Z <= In0 ;
			when '1' => Z <= In1 ;
			when others => z <= "0000000000000000" ;
		end case;
	end process;
end Behavioral;