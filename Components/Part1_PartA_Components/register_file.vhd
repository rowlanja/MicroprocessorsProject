library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity register_file is
Port (
    src_s0 :  in std_logic;
    src_s1 : in std_logic;
    src_s2 : in std_logic;
    src_s3 :  in std_logic;
    src_s4 : in std_logic;
    src_s5 : in std_logic;
    src_s6 : in std_logic;
    src_s7 : in std_logic;
    des_A0 : in std_logic;
    des_A1 : in std_logic;
    des_A2 : in std_logic;
    des_A3 : in std_logic;
    Clk : in std_logic;
    Reset: in STD_LOGIC;
    data_src : in std_logic;
    data : in std_logic_vector(15 downto 0);
    OUT1 : out std_logic_vector(15 downto 0);
    OUT2 : out std_logic_vector(15 downto 0);
	reg0 : out std_logic_vector(15 downto 0);
    reg1 : out std_logic_vector(15 downto 0);
    reg2 : out std_logic_vector(15 downto 0);
    reg3 : out std_logic_vector(15 downto 0);
    reg4 : out std_logic_vector(15 downto 0);
    reg5 : out std_logic_vector(15 downto 0);
    reg6 : out std_logic_vector(15 downto 0);
    reg7 : out std_logic_vector(15 downto 0);
    reg8 : out std_logic_vector(15 downto 0);
    reg9 : out std_logic_vector(15 downto 0);
    reg10 : out std_logic_vector(15 downto 0);
    reg11 : out std_logic_vector(15 downto 0);
    reg12 : out std_logic_vector(15 downto 0);
    reg13 : out std_logic_vector(15 downto 0);
    reg14 : out std_logic_vector(15 downto 0);
    reg15 : out std_logic_vector(15 downto 0)
    );
end register_file;

architecture Behavioral of register_file is
-- components
-- 4 bit Register for register file
COMPONENT regi4
PORT(
	D : IN std_logic_vector(15 downto 0);
	load : IN std_logic;
	Clk : IN std_logic;      
	Q : OUT std_logic_vector(15 downto 0)
);
END COMPONENT;

COMPONENT decoder_4to9 
PORT( A0 : in std_logic;
        A1 : in std_logic;
        A2 : in std_logic;
        A3 : in STD_LOGIC;
        Q0 : out std_logic;
        Q1 : out std_logic;
        Q2 : out std_logic;
        Q3 : out std_logic;
        Q4 : out std_logic;
        Q5 : out std_logic;
        Q6 : out std_logic;
        Q7 : out std_logic;
        Q8 : out std_logic;
        Q9: out std_logic;
        Q10: out std_logic;
        Q11 : out std_logic;
        Q12 : out std_logic;
        Q13 : out std_logic;
        Q14 : out std_logic;
        Q15 : out std_logic);
END COMPONENT;
-- 2 to 1 line multiplexer
COMPONENT mux2_16bit
PORT(
	In0 : IN std_logic_vector(15 downto 0);
	In1 : IN std_logic_vector(15 downto 0);
	s : IN std_logic;
	Z : OUT std_logic_vector(15 downto 0)
);
END COMPONENT;

COMPONENT mux8_16bit
PORT(
	In0 : IN std_logic_vector(15 downto 0);
    In1 : IN std_logic_vector(15 downto 0);
    In2 : IN std_logic_vector(15 downto 0);
    In3 : IN std_logic_vector(15 downto 0);
	In4 : IN std_logic_vector(15 downto 0);
    In5 : IN std_logic_vector(15 downto 0);
    In6 : IN std_logic_vector(15 downto 0);
    In7 : IN std_logic_vector(15 downto 0);
    S0 : IN std_logic;
    S1 : IN std_logic;
	S2 : IN std_logic;
    Z : OUT std_logic_vector(15 downto 0)
);
END COMPONENT;
-- signals
 signal Z1, Z2, reg0_q,reg1_q,reg2_q,reg3_q,reg4_q,reg5_q,reg6_q,reg7_q, src_reg, data_src_mux_out : std_logic_vector(15 downto 0);
 signal  reg0_load,reg1_load,reg2_load,reg3_load,reg4_load,reg5_load,reg6_load,reg7_load, reg8_load,reg9_load,reg10_load,reg11_load,reg12_load,reg13_load,reg14_load,reg15_load: std_logic;

begin
-- port maps ;-)
-- register 0
    reg00: regi4 PORT MAP(
    D => data_src_mux_out,
    load => reg0_load,
    Clk => Clk,
    Q => reg0_q 
);
reg01: regi4 PORT MAP(
    D => data_src_mux_out,
    load => reg1_load,
    Clk => Clk,
    Q => reg1_q 
);
reg02: regi4 PORT MAP(
    D => data_src_mux_out,
    load => reg2_load,
    Clk => Clk,
    Q => reg2_q 
);               
reg03: regi4 PORT MAP(
    D => data_src_mux_out,
    load => reg3_load,
    Clk => Clk,
    Q => reg3_q 
);              
reg04: regi4 PORT MAP(
    D => data_src_mux_out,
    load => reg4_load,
    Clk => Clk,
    Q => reg4_q 
);               
 reg05: regi4 PORT MAP(
     D => data_src_mux_out,
     load => reg5_load,
     Clk => Clk,
     Q => reg5_q 
 );               
reg06: regi4 PORT MAP(
   D => data_src_mux_out,
   load => reg6_load,
   Clk => Clk,
   Q => reg6_q 
   ); 
reg07: regi4 PORT MAP(
     D => data_src_mux_out,
     load => reg7_load,
     Clk => Clk,
     Q => reg7_q 
     );      
des_decoder_4to9: decoder_4to9 PORT MAP(
     A2 => des_A2,
     A1 => des_A1,
     A0 => des_A0,
     A3 => des_A3,
     Q0 => reg0_load,
     Q1 => reg1_load,
     Q2 => reg2_load,
     Q3 => reg3_load,
     Q4 => reg4_load,
     Q5 => reg5_load,
     Q6 => reg6_load,
     Q7 => reg7_load,
     Q8 => reg8_load,
     Q9 => reg9_load,
     Q10 => reg10_load,
     Q11 => reg11_load,
     Q12 => reg12_load,
     Q13 => reg13_load,
     Q14 => reg14_load,
     Q15 => reg15_load
     );
Inst_mux8_16bit: mux8_16bit PORT MAP(
     In0 => reg0_q,
     In1 => reg1_q,
     In2 => reg2_q,
     In3 => reg3_q,
     In4 => reg4_q,
     In5 => reg5_q,
     In6 => reg6_q,
     In7 => reg7_q,
     S0 => src_s0,
     S1 => src_s1,
     S2 => src_s2,
     Z => Z1
     );
 Inst2_mux8_16bit: mux8_16bit PORT MAP(
      In0 => reg0_q,
      In1 => reg1_q,
      In2 => reg2_q,
      In3 => reg3_q,
      In4 => reg4_q,
      In5 => reg5_q,
      In6 => reg6_q,
      In7 => reg7_q,   
      S0 => src_s3,
      S1 => src_s4,
      S2 => src_s5,
      Z => Z2        
);
        
n_mux2_16bit: mux2_16bit PORT MAP(
     In0 => data,
     In1 => src_reg,
     s => data_src,
     Z => data_src_mux_out
);
   OUT1 <= Z1;
   OUT2 <= Z2;            
   reg0 <= reg0_q;
   reg1 <= reg1_q;
   reg2 <= reg2_q;
   reg3 <= reg3_q;
   reg4 <= reg4_q;
   reg5 <= reg5_q;
   reg6 <= reg6_q;
   reg7 <= reg7_q;                      
                             
end behavioral;