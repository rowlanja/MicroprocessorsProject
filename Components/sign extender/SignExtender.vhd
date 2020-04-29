

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sign_extend is
    Port ( DR : in STD_LOGIC_VECTOR (2 downto 0);
           SB : in STD_LOGIC_VECTOR( 2 downto 0);
           Z : out STD_LOGIC_VECTOR ( 15 downto 0));
end sign_extend;

architecture Behavioral of sign_extend is
    
begin
    Z(2 downto 0) <= SB after 1ns;
    Z(5 downto 3) <= DR after 1ns;
    Z(15 downto 6) <= "0000000000" after 1ns when DR(2) = '0' else
                      "1111111111" after 1ns when DR(2) = '1' else
                      "0000000000" after 1ns; 

end Behavioral;