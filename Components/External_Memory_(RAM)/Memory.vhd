library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
entity memory is
Port ( address : in std_logic_vector(15 downto 0);
        write_data : in std_logic_vector(15 downto 0);
        MemWrite, MemRead : in std_logic;
        read_data : out std_logic_vector(15 downto 0);
        Clk: in std_logic);
end memory;

architecture Behavioral of memory is
type mem_array is array(0 to 511) of std_logic_vector(15 downto 0);
-- define type, for memory arrays
begin
mem_process: process (address, write_data, Clk)
-- initialize data memory, X denotes hexadecimal number
variable data_mem : mem_array := (
X"0B6D", X"016D", X"0A92",X"0690",
X"0990", X"016D", X"0268",X"0A01",
X"04C0", others=>X"0000");
variable addr:integer;
begin -- the following type conversion function is in std_logic_arith
    addr:=conv_integer(unsigned(address(8 downto 0)));
        if MemWrite ='1' then
        data_mem(addr):= write_data;
        elsif MemRead='1' then
        read_data <= data_mem(addr) after 1 ns;
        end if;
    end process;
end Behavioral;