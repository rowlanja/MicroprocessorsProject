

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity MuxS is
    Port ( V : in STD_LOGIC;
           C : in STD_LOGIC;
           N : in STD_LOGIC;
           Z : in STD_LOGIC;
           Flag_out : out STD_LOGIC;
           MS : in STD_LOGIC_VECTOR (2 downto 0));
end MuxS;

architecture Behavioral of MuxS is

begin
    Flag_out <= '0' after 1ns when MS = "000" else
                '1' after 1ns when MS = "001" else
                C after 1ns when MS = "010" else
                V after 1ns when MS = "011" else
                Z after 1ns when MS = "100" else
                N after 1ns when MS = "101" else
                (not C) after 1ns when MS = "110" else
                (not Z) after 1ns when MS = "111" else
                '0' after 1ns;

end Behavioral;