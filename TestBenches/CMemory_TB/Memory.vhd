library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ROM is Port( 
    INPUT : in std_logic_vector(7 downto 0);
    MW : out std_logic; 
    MM : out std_logic; 
    RW : out std_logic; 
    MD : out std_logic; 
    FS : out std_logic_vector(4 downto 0); 
    MB : out std_logic; 
    TB : out std_logic; 
    TA : out std_logic; 
    TD : out std_logic; 
    PL : out std_logic; 
    PI : out std_logic; 
    IL : out std_logic; 
    MC : out std_logic; 
    MS : out std_logic_vector(2 downto 0); 
    NA : out std_logic_vector(7 downto 0)); 
end ROM;

architecture Behavioral of ROM is 
type mem_array is array(0 to 255) of std_logic_vector(27 downto 0);

begin

    memory_m: process(INPUT) 
    variable ControlMemory256x28 : mem_array:=( 
    --Module 0
	x"C020224", --0 ADI 
	x"C02000C", --1 LDR 
	x"C020001", --2 STR
	x"C020014", --3 INC 
	x"C0200E4", --4 NOT 
	x"C020024", --5 ADD 
	x"C0E0000", --6 Branch if ZERO
	x"C022000", --7 Branch unconditionally
	X"DDDDDDD", --8
    X"0000000", --9
    X"1111111", --A
    X"0000000", --B
    X"2222222", --C
    X"0000000", --D
    X"3333333", --E
    X"0000000", --F
    

    others => x"0000000"
);
    
variable addr : integer; 
variable control_out : std_logic_vector(27 downto 0);
    
begin
	addr := conv_integer(INPUT);
	control_out := ControlMemory256x28(addr);
	MW <= control_out(0);
	MM <= control_out(1);
	RW <= control_out(2);
	MD <= control_out(3);
	FS <= control_out(8 downto 4);
	MB <= control_out(9);
	
	TB <= control_out(10);
	TA <= control_out(11);
	TD <= control_out(12);
	PL <= control_out(13);
	PI <= control_out(14);
	IL <= control_out(15);
	MC <= control_out(16);
	MS <= control_out(19 downto 17);
	NA <= control_out(27 downto 20);
end process;

end Behavioral;