library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity Datapath is
Port (  
  
	BA : in std_logic_vector(2 downto 0);
	AA : in std_logic_vector(2 downto 0);


	DA : in std_logic_vector(2 downto 0);
    MB : in std_logic;
    MD : in std_logic;
	FS : in std_logic_vector(4 downto 0);
	RW : in std_logic;
	
	cons_in : in std_logic_vector(15 downto 0);
	Data_in : in std_logic_vector(15 downto 0);
    Clk : in std_logic;

	rego0 : out std_logic_vector(15 downto 0);
    rego1 : out std_logic_vector(15 downto 0);
    rego2 : out std_logic_vector(15 downto 0);
    rego3 : out std_logic_vector(15 downto 0);
    rego4 : out std_logic_vector(15 downto 0);
    rego5 : out std_logic_vector(15 downto 0);
    rego6 : out std_logic_vector(15 downto 0);
    rego7 : out std_logic_vector(15 downto 0);
    busA : out std_logic_vector(15 downto 0);
	busB : out std_logic_vector(15 downto 0);
	reg_file_out : out std_logic_vector(15 downto 0);
    V : out std_logic;
	C : out std_logic;
	N : out std_logic;
	Z : out std_logic	
	);
end Datapath;

architecture Behavioral of Datapath is 
-- components
COMPONENT FunctionUnit
PORT (
   V : OUT std_logic;
   C : OUT std_logic;
   N : OUT std_logic;
   Z : OUT std_logic;
   TEMP : out std_logic_vector(15 downto 0);
   FS : In std_logic_vector(4 downto 0);
   A : IN std_logic_vector(15 downto 0);
   B : IN std_logic_vector(15 downto 0);
   F : OUT std_logic_vector(15 downto 0)
);
END COMPONENT;

COMPONENT register_file
PORT (
    src_s0 :  in std_logic;
    src_s1 : in std_logic;
    src_s2 : in std_logic;
    src_s3 :  in std_logic;
    src_s4 : in std_logic;
    src_s5 : in std_logic;
    des_A0 : in std_logic;
    des_A1 : in std_logic;
    des_A2 : in std_logic;
    
    Clk : in std_logic;
    data_src : in std_logic;
    data : in std_logic_vector(15 downto 0);

    reg0 : out std_logic_vector(15 downto 0);
    reg1 : out std_logic_vector(15 downto 0);
    reg2 : out std_logic_vector(15 downto 0);
    reg3 : out std_logic_vector(15 downto 0);
    reg4 : out std_logic_vector(15 downto 0);
    reg5 : out std_logic_vector(15 downto 0);
    reg6 : out std_logic_vector(15 downto 0);
    reg7 : out std_logic_vector(15 downto 0);
    OUT1 : out std_logic_vector(15 downto 0);
    OUT2 : out std_logic_vector(15 downto 0)
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
--SIGNALS
 signal b_A, b_B, busD,reg0_q,reg1_q,reg2_q,reg3_q,reg4_q,reg5_q,reg6_q,reg7_q, b_data_b_mux, A_data_FU, MUXB_FU, FU_MUXD, MUXD_RF: std_logic_vector(15 downto 0);
    
       -- Declare a clock period constant.
       Constant ClockPeriod : TIME := 10 ns;
       -- Clock Generation method 1:
begin 

--port maps ;-)
	
rf : register_file PORT MAP(
       src_s0 => AA(2),
       src_s1 => AA(1),
       src_s2 => AA(0),
       src_s3 => BA(2),
       src_s4 => BA(1),
       src_s5 => BA(0),
       des_A0 => DA(2),
       des_A1 => DA(1),
       des_A2 => DA(0),
       Clk => Clk,
       data_src => RW,
       data => busD, 
       OUT1 => b_A,
       OUT2 => b_B,
       reg0 => reg0_q,
       reg1 => reg1_q,
       reg2 => reg2_q,
       reg3 => reg3_q,
       reg4 => reg4_q,
       reg5 => reg5_q,
       reg6 => reg6_q,
       reg7 => reg7_q
); 

  fu : FunctionUnit PORT MAP (
        V	=>	V,
        C	=>	C,
        Z	=>	Z,
        N	=>	N,
        FS	=>	FS,
        A	=>	b_A,
        B	=>	MUXB_FU,
        F	=>	FU_MUXD
);


Mux_B : mux2_16bit PORT MAP(
        In0 => b_B,
        In1 => cons_in,
        s => MB,
        Z => MUXB_FU
);

MuxD : mux2_16bit PORT MAP(
        In0 => FU_MUXD, 
        In1 => Data_in,
        s =>MD,
        Z => busD
);
    rego0 <= reg0_q;
    rego1 <= reg1_q;
    rego2 <= reg2_q;
    rego3 <= reg3_q;
    rego4 <= reg4_q;
    rego5 <= reg5_q;
    rego6 <= reg6_q;
    rego7 <= reg7_q;
    busA <= b_A;
    busB <= b_B;
    reg_file_out <= FU_MUXD;
     --reg_file_out <= busD;

END;