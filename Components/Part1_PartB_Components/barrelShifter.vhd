----------------------------------------------------------------------------------
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

entity barrelShifter is
port (
  s2 : in std_logic_vector(1 downto 0);
  b : in std_logic_vector(15 downto 0);
  g : out std_logic_vector(15 downto 0));
end barrelShifter;

architecture Behavioral of barrelShifter is

component barrelShifterSlice
port (
  prev,midl,nxt : in std_logic;
  sel : in std_logic_vector(1 downto 0);
  h : out std_logic);
end component;


begin

sh0: barrelShifterSlice PORT MAP(
    sel=>s2,
    prev=>b(15),
    midl=>b(0),
    nxt=>b(1),
    h=>g(0)
);
sh1: barrelShifterSlice PORT MAP(
    sel=>s2,
    prev=>b(0),
    midl=>b(1),
    nxt=>b(2),
    h=>g(1)
);
sh2: barrelShifterSlice PORT MAP(
    sel=>s2,
    prev=>b(1),
    midl=>b(2),
    nxt=>b(3),
    h=>g(2)
);
sh3: barrelShifterSlice PORT MAP(
    sel=>s2,
    prev=>b(2),
    midl=>b(3),
    nxt=>b(4),
    h=>g(3)
);
sh4: barrelShifterSlice PORT MAP(
    sel=>s2,
    prev=>b(3),
    midl=>b(4),
    nxt=>b(5),
    h=>g(4)
);
sh5: barrelShifterSlice PORT MAP(
    sel=>s2,
    prev=>b(4),
    midl=>b(5),
    nxt=>b(6),
    h=>g(5)
);
sh6: barrelShifterSlice PORT MAP(
    sel=>s2,
    prev=>b(5),
    midl=>b(6),
    nxt=>b(7),
    h=>g(6)
);
sh7: barrelShifterSlice PORT MAP(
    sel=>s2,
    prev=>b(6),
    midl=>b(7),
    nxt=>b(8),
    h=>g(7)
);
sh8: barrelShifterSlice PORT MAP(
    sel=>s2,
    prev=>b(7),
    midl=>b(8),
    nxt=>b(9),
    h=>g(8)
);
sh9: barrelShifterSlice PORT MAP(
    sel=>s2,
    prev=>b(8),
    midl=>b(9),
    nxt=>b(10),
    h=>g(9)
);
sh10: barrelShifterSlice PORT MAP(
    sel=>s2,
    prev=>b(9),
    midl=>b(10),
    nxt=>b(11),
    h=>g(10)
);
sh11: barrelShifterSlice PORT MAP(
    sel=>s2,
    prev=>b(10),
    midl=>b(11),
    nxt=>b(12),
    h=>g(11)
);
sh12: barrelShifterSlice PORT MAP(
    sel=>s2,
    prev=>b(11),
    midl=>b(12),
    nxt=>b(13),
    h=>g(12)
);
sh13: barrelShifterSlice PORT MAP(
    sel=>s2,
    prev=>b(12),
    midl=>b(13),
    nxt=>b(14),
    h=>g(13)
);
sh14: barrelShifterSlice PORT MAP(
    sel=>s2,
    prev=>b(13),
    midl=>b(14),
    nxt=>b(15),
    h=>g(14)
);
sh15: barrelShifterSlice PORT MAP(
    sel=>s2,
    prev=>b(14),
    midl=>b(15),
    nxt=>b(0),
    h=>g(15)
);

end Behavioral;