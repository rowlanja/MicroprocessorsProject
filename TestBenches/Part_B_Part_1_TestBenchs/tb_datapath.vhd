library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_datapath is
--  Port ( );
end tb_datapath;

architecture Behavioral of tb_datapath is

COMPONENT datapath_1B
Port (
AS0: in std_logic;
AS1: in std_logic;
AS2: in std_logic;

BS0: in std_logic;
BS1: in std_logic;
BS2: in std_logic;

des_A0: in std_logic;
des_A1: in std_logic;
des_A2: in std_logic;

MB_Select: in std_logic;
MD_Select: in std_logic;

Clk: in std_logic;

LE: in std_logic;
FS: in std_logic_vector(4 downto 0);
Data_in: in std_logic_vector(15 downto 0);

Constant_In: in std_logic_vector(15 downto 0);

A_out : out std_logic_vector(15 downto 0);
B_out : out std_logic_vector(15 downto 0);

V: out std_logic;
C: out std_logic;
Z: out std_logic;
N: out std_logic
);
END COMPONENT;

   --Inputs
   
signal AS0: std_logic := '0';
signal AS1: std_logic := '0';
signal AS2: std_logic := '0';

signal BS0: std_logic := '0';
signal BS1: std_logic := '0';
signal BS2: std_logic := '0';

signal des_A0: std_logic := '0';
signal des_A1: std_logic := '0';
signal des_A2: std_logic := '0';

signal MB_Select: std_logic := '0'; --will be under change
signal MD_Select: std_logic := '1'; --will be under change

signal Clk: std_logic;

signal LE: std_logic := '1';
signal FS: std_logic_vector(4 downto 0) := (others => '0'); -- will be under change
signal Data_in: std_logic_vector(15 downto 0) := x"DADA";

signal Constant_In: std_logic_vector(15 downto 0) := x"1234";

    --Outputs

signal A_out : std_logic_vector(15 downto 0);
signal B_out : std_logic_vector(15 downto 0);

signal V: std_logic;
signal C: std_logic;
signal Z: std_logic;
signal N: std_logic;

    signal rego0 : std_logic_vector(15 downto 0);
     signal rego1 : std_logic_vector(15 downto 0);
     signal rego2 : std_logic_vector(15 downto 0);
     signal rego3 : std_logic_vector(15 downto 0);
     signal rego4 : std_logic_vector(15 downto 0);
     signal rego5 : std_logic_vector(15 downto 0);
     signal rego6 : std_logic_vector(15 downto 0);
     signal rego7 : std_logic_vector(15 downto 0);


begin

uut: datapath_1B PORT MAP(
AS0=>AS0,
AS1=>AS1,
AS2=>AS2,

BS0=>BS0,
BS1=>BS1,
BS2=>BS2,

des_A0 => des_A0,
des_A1 => des_A1,
des_A2 => des_A2,

MB_Select => MB_Select,
MD_Select => MD_Select,

Clk=>Clk,

LE=>LE,
FS=>FS,
Data_in=>Data_in,

Constant_In=>Constant_In,
A_out=>A_out,
B_out=>B_out,

V=>V,
C=>C,
Z=>Z,
N=>N
);

clk_process :process
   begin
		Clk <= '0';
		wait for 5ns;
		Clk <= '1';
		wait for 5ns;
   end process;

stim_proc: process
begin

--test arithmetic unit with MB/MD Select
wait for 50 ns;
MB_Select <= '0';
MD_Select <='0';
FS <= "00001";

wait for 50 ns;
MB_Select <= '0';
MD_Select <= '0';
FS <= "00010";

wait for 50 ns;
MB_Select <= '0';
MD_Select <='0';
FS <= "00011";


wait for 50 ns;
MB_Select <= '0';
MD_Select <='1';
FS <= "00001";

wait for 50 ns;
MB_Select <= '0';
MD_Select <= '1';
FS <= "00010";

wait for 50 ns;
MB_Select <= '0';
MD_Select <='1';
FS <= "00011";


wait for 50 ns;
MB_Select <= '1';
MD_Select <='0';
FS <= "00001";

wait for 50 ns;
MB_Select <= '1';
MD_Select <= '0';
FS <= "00010";

wait for 50 ns;
MB_Select <= '1';
MD_Select <='0';
FS <= "00011";

--test logic unit

wait for 50 ns;
MB_Select <= '0';
MD_Select <='0';
FS <= "01000";

wait for 50 ns;
MB_Select <= '0';
MD_Select <= '0';
FS <= "01010";

wait for 50 ns;
MB_Select <= '0';
MD_Select <='0';
FS <= "01110";


wait for 50 ns;
MB_Select <= '0';
MD_Select <='1';
FS <= "01000";

wait for 50 ns;
MB_Select <= '0';
MD_Select <= '1';
FS <= "01010";

wait for 50 ns;
MB_Select <= '0';
MD_Select <='1';
FS <= "01110";


wait for 50 ns;
MB_Select <= '1';
MD_Select <='0';
FS <= "01000";

wait for 50 ns;
MB_Select <= '1';
MD_Select <= '0';
FS <= "01010";

wait for 50 ns;
MB_Select <= '1';
MD_Select <='0';
FS <= "01110";

--test shifter

wait for 50 ns;
MB_Select <= '0';
MD_Select <='0';
FS <= "10000";

wait for 50 ns;
MB_Select <= '0';
MD_Select <= '0';
FS <= "10100";

wait for 50 ns;
MB_Select <= '0';
MD_Select <='0';
FS <= "11000";


wait for 50 ns;
MB_Select <= '0';
MD_Select <='1';
FS <= "10000";

wait for 50 ns;
MB_Select <= '0';
MD_Select <= '1';
FS <= "10100";

wait for 50 ns;
MB_Select <= '0';
MD_Select <='1';
FS <= "11000";


wait for 50 ns;
MB_Select <= '1';
MD_Select <='0';
FS <= "10000";

wait for 50 ns;
MB_Select <= '1';
MD_Select <= '0';
FS <= "10100";

wait for 50 ns;
MB_Select <= '1';
MD_Select <='0';
FS <= "11000";



end process;
end Behavioral;
