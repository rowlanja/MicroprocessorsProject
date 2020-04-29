library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MuxC is
	Port(	in0, in1 : in STD_LOGIC_VECTOR(7 downto 0);
			sel : in STD_LOGIC;
			output : out STD_LOGIC_VECTOR(7 downto 0)
			);
end MuxC;

architecture Behavioral of MuxC is

begin
	output <= 	in0 after 1ns when sel='0' else
				in1 after 1ns when sel='1' else
				x"00" after 20ns;

end Behavioral;