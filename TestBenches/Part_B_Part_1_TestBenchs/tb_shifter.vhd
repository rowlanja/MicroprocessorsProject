library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_shifter is
--  Port ( );
end tb_shifter;

architecture Behavioral of tb_shifter is

COMPONENT shifter
Port (
B: in std_logic_vector(15 downto 0);
HS: in std_logic_vector(1 downto 0);
IL: in std_logic;
IR: in std_logic;

H: out std_logic_vector(15 downto 0) 
);
END COMPONENT;

   --Inputs
   
   signal B : std_logic_vector(15 downto 0) := (others => '0');
   signal HS : std_logic_vector(1 downto 0) := (others => '0');
   signal IL: std_logic := '0';
   signal IR: std_logic := '0';
    
 	--Outputs
   signal H : std_logic_vector(15 downto 0);


begin

uut: shifter PORT MAP(
B => B,
HS => HS,
IL => IL,
IR => IR,
H => H
);

stim_proc: process
begin
B <= x"FFFF";
wait for 50ns;
HS <= "00";

wait for 50ns;
HS <= "01";

wait for 50ns;
HS <= "10";


end process;
end Behavioral;
