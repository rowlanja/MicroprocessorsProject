library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ProgrammeCounter is
	Port(	
	input : in std_logic_vector(15 downto 0);
	PL, PI, reset, clk : in std_logic;
    output : out std_logic_vector(15 downto 0)
 );
end ProgrammeCounter;

architecture Behavioral of ProgrammeCounter is
begin
	process(reset, PL, PI, clk)
	variable current : std_logic_vector(15 downto 0);
	variable temp : integer;
	variable tempAdded : std_logic_vector(15 downto 0);
	
	begin
		if(reset = '1') then current := x"0000";
        elsif(clk = '1' and PI = '1' and PL = '0') then
			temp := conv_integer(current); 
			temp := temp + conv_integer(1);
			tempAdded := conv_std_logic_vector(temp, 16);
			current := tempAdded;
		elsif(clk = '1' and pi = '0' and PL = '1') then output <= current + input;
				current := "0000000000000000";

		end if;
	end process;

end Behavioral;