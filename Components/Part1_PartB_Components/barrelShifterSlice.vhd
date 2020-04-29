library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity barrelShifterSlice is
port ( prev,midl,nxt : in std_logic;
        sel : in std_logic_vector(1 downto 0);
        h : out std_logic);
end barrelShifterSlice;

architecture Behavioral of barrelShifterSlice is

begin
    h <= midl  when sel ="00" else
    nxt  when sel = "01" else
    prev;
end Behavioral;
