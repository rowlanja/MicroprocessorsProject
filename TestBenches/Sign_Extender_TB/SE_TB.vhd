
library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity sign_extend_bench is
end;

architecture behav of sign_extend_bench is

  component sign_extend
      Port ( DR : in STD_LOGIC_VECTOR (2 downto 0);
             SB : in STD_LOGIC_VECTOR( 2 downto 0);
             Z : out STD_LOGIC_VECTOR ( 15 downto 0));
  end component;

  signal DR: STD_LOGIC_VECTOR (2 downto 0);
  signal SB: STD_LOGIC_VECTOR( 2 downto 0);
  signal Z: STD_LOGIC_VECTOR ( 15 downto 0);

  signal TIME_CYCLE: time := 200ns;  
begin

  uut: sign_extend port map ( DR => DR,
                              SB => SB,
                              Z  => Z );

  stim: process
  begin
    DR <= "011";
    SB <= "010";
    wait for TIME_CYCLE;
    DR <= "100";
    SB <= "101";
    wait for TIME_CYCLE;
    DR <= "001";
    wait for TIME_CYCLE;
    SB <= "011";
    wait;
  end process;


end behav;
