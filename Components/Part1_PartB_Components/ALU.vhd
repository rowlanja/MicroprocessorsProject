library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity ALU is
Port (
    select_sig : in std_logic_vector(3 downto 0);
    dataA : in std_logic_vector(15 downto 0);
	dataB : in std_logic_vector(15 downto 0);
	dataG : out std_logic_vector(15 downto 0);
	Carry_out : out std_logic;
	m0_in0 : out std_logic_vector(15 downto 0);
	m0_in1 : out std_logic_vector(15 downto 0)

--    V : out std_logic;
--    C : out std_logic;
--    N : out std_logic;
--    Z : out std_logic;
--    OUTPUT : out std_logic_vector(15 downto 0)
    );
end ALU;

architecture Behavioral of ALU is
-- components
-- 4 bit Register for register file
COMPONENT AU
PORT(
	src_s0 :  in std_logic; 
    src_s1 : in std_logic;
    A_data : in std_logic_vector(15 downto 0);
    B_data : in std_logic_vector(15 downto 0);
	Cin : in std_logic;
	Cout : out std_logic;
	G_data : out std_logic_vector(15 downto 0)
);
END COMPONENT;

COMPONENT LogicUnit 
PORT(
	s0 :  in std_logic; 
    s1 : in std_logic;
    A_data : in std_logic_vector(15 downto 0);
    B_data : in std_logic_vector(15 downto 0);
	G_data : out std_logic_vector(15 downto 0)
);
END COMPONENT;

COMPONENT mux2_16bit 
PORT(
	In0 : IN std_logic_vector(15 downto 0);
	In1 : IN std_logic_vector(15 downto 0);
	s : IN std_logic;
	Z : OUT std_logic_vector(15 downto 0)
);
END COMPONENT;
-- signals
signal ArithToMux, LogToMux, dataOUT, m0_i0, m0_i1 :std_logic_vector(15 downto 0);
signal Cout_to_Out : std_logic;
begin
    arith_circuit: AU PORT MAP(
		src_s0 => select_sig(1),
		src_s1 => select_sig(2),
		A_data => dataA,
		B_data => dataB,
		Cin => select_sig(0),
		Cout => Cout_to_out,
		G_data => ArithToMux
);
	LogicUn: LogicUnit PORT MAP(
		s0 => select_sig(2),
		s1 => select_sig(1),
		A_data => dataA,
		B_data => dataB,
		G_data => LogToMux
);
	Muxer: mux2_16bit PORT MAP(
		In0 => ArithToMux,
		In1 => LogToMux,
		s => select_sig(3),
		Z => dataG 
);  
    Carry_out <= Cout_to_out;
    m0_in0 <= ArithToMux;
    m0_in1 <= LogToMux;
end behavioral;