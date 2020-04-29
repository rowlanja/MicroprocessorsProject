library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CAR is
    Port (
        opcode : in std_logic_vector(7 downto 0);
        load : in std_logic;
        Clk : in std_logic;
        reset : in std_logic;
        address : inout std_logic_vector(7 downto 0)
    );
end CAR;


architecture Behavioral of CAR is
begin
process(Clk)
begin
    if reset = '1' then address <= X"C0";
    else
        if(rising_edge(Clk)) then
            if load = '1' then address <= opcode;
            else address <= address + 1;
            end if;
        end if;
    end if;
end process;

end Behavioral;