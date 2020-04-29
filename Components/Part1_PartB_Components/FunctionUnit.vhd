library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity FunctionUnit is
PORT(
    V : OUT std_logic;
    C : OUT std_logic;
	N : OUT std_logic;
	Z : OUT std_logic;
    TEMP : out std_logic_vector(15 downto 0);
   --testBarrel : out std_logic_vector(15 downto 0);
   -- testALU : out std_logic_vector(15 downto 0);
	FS : In std_logic_vector(4 downto 0);
    A : IN std_logic_vector(15 downto 0);
    B : IN std_logic_vector(15 downto 0);
    F : OUT std_logic_vector(15 downto 0)
   );
end FunctionUnit;

architecture Behavioral of FunctionUnit is
-- components
COMPONENT ALU 
PORT(
    select_sig : in std_logic_vector(3 downto 0);
    dataA : in std_logic_vector(15 downto 0);
	dataB : in std_logic_vector(15 downto 0);
	dataG : out std_logic_vector(15 downto 0);
	carry_out : out std_logic;
	m0_in0 : out std_logic_vector(15 downto 0);
	m0_in1 : out std_logic_vector(15 downto 0)
);
END COMPONENT;


COMPONENT barrelShifter
PORT(
  s2 : in std_logic_vector(1 downto 0);
  b : in std_logic_vector(15 downto 0);
  g : out std_logic_vector(15 downto 0)
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

signal busA, busB, alu_mux, shifter_mux, MUX_OUT  : std_logic_vector(15 downto 0);
signal mux_0in0, mux_0in1, mux_1in0, mux_1in1 : std_logic_vector(15 downto 0);
signal carry_Alu_Fu : std_logic; 
--
-- signal  : std_logic; 
type Switches is range 0 to 15;
shared variable highest2 : integer :=15;
shared variable highest: integer := 15;
shared variable highest3: integer := 15;
 
begin
-- port maps ;-)

  Muxer: mux2_16bit PORT MAP(
        In0 => alu_mux,
        In1 => shifter_mux,
        s => FS(4),
        Z => MUX_OUT
);  
  alu_unit : ALU PORT MAP(
        select_sig => FS(3 downto 0),
        dataA  => a,  
        dataB => b,--D
        dataG => alu_mux,--Y
        carry_out => carry_alu_fu,
        m0_in0 => mux_0in0,
        m0_in1 => mux_0in1
  );
  B_shifter : barrelShifter PORT MAP(
        s2 => FS(3 downto 2),
        b  => b,  
        g => shifter_mux
  );
       Z <= '1' when mux_0in0 ="0000000000000000" else  '0';
       n <= '1' when mux_0in0(15) = '1' else '0';
       c <= carry_alu_fu;
       f <= MUX_OUT;
    --   TEMP <= alu_mux;

       
PROCESS(a, b)
    VARIABLE i:
    integer range 0 to 15;   
    begin
      i:=0;
      L1: loop
      exit L1 when I=15;
          if a(i) = '1' then
          highest := i;
          end if;
              I := I + 1;
        end loop;
    end process;
  
PROCESS(b)
   VARIABLE j:
   integer range 0 to 15;
       begin
         j:=0;
         L2: loop
         exit L2 when j=15;
             if b(j) = '1' then
             highest2 := j;
             end if;
                 j := j + 1;
           end loop;
           end process;
           
PROCESS(mux_0in0)
           VARIABLE k:
              integer range 0 to 15;
                  begin
                    k:=0;
                    L3: loop
                    exit L3 when k=15;
                        if mux_0in0(k) = '1' then
                        highest3 := k;
                        end if;
                            k := k + 1;
                      end loop;
       end process;
    v<='1' when ((a(highest)=b(highest2)) and (not(mux_0in0(highest3) = a(highest))) and not(a(highest)) ='0' and not(b(highest2)) ='0' and not(mux_0in0(highest3)) ='0') else
    '1' when (fs="00110" and ((not(a(highest)=b(highest2))) and (not(mux_0in0(highest3) = a(highest))) and not(a(highest)) ='0' and not(b(highest2)) ='0' and not(mux_0in0(highest3)) ='0'))
    else '0';

END behavioral;