library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity Instruction_Reg is 
Port ( 
--INPUT
    input : in std_logic_vector(15 downto 0);
    IL : in std_logic;
    Clk: in STD_LOGIC;
    Reset: in STD_LOGIC;
--OUTPUT
    opcode : OUT std_logic_vector(7 downto 0);
    DR, SA, SB : OUT std_logic_vector(2 downto 0)
    );
    --(others => "0000000000000000");
end Instruction_Reg;
architecture Behavioral of Instruction_Reg is
    signal state : STD_LOGIC_VECTOR (15 downto 0);
begin
    Opcode(6 downto 0) <= state(15 downto 9) after 1ns;
    DR <= state(8 downto 6) after 1ns;
    SA <= state(5 downto 3) after 1ns;
    SB <= state(2 downto 0) after 1ns;
    Opcode(7) <= '0'; 
    process(Clk, Reset)
    begin
        if(Reset = '1') then
            state <= x"0000";
        elsif(Clk ='1' and IL = '1') then 
            state <= Input;
        end if;
    end process;
 
end Behavioral;