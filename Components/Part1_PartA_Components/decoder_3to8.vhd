library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity decoder_4to9 is
    Port ( A0 : in std_logic;
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
end decoder_4to9;

architecture Behavioral of decoder_4to9 is
   
begin
	Q0<= ((not A0) and (not A1) and (not A2) and (not a3)) after 5ns;
	Q1<= ((not A0) and (not A1) and (not a2)and A3) after 5ns;
	Q2<= ((not A0) and (not A1) and A2 and (not a3))after 5ns;
	Q3<= ((not A0) and (not A1) and A2 and a3) after 5ns;
	Q4<= ((not A0) and A1 and (not A2) and (not a3)) after 5ns;
	Q5<= ((not A0) and A1 and (not  A2) and a3) after 5ns;
	Q6<= ((not A0) and A1 and A2 and (not a3)) after 5ns;
	Q7<= ((not A0) and A1 and A2 and a3) after 5ns;
    Q8<= (A0 and (not A1) and (not A2) and (not a3)) after 5ns;
	Q9<= (A0 and (not A1) and (not A2) and a3) after 5ns;
	Q10<= (A0 and (not A1) and A2 and (not a3))after 5ns;
	Q11<= (A0 and (not A1) and A2 and a3) after 5ns;
	Q12<= (A0 and A1 and (not A2) and (not a3)) after 5ns;
	Q13<= (A0 and  A1 and (not A2) and a3) after 5ns;
	Q14<= (A0 and A1 and A2 and (not a3)) after 5ns;
	Q15<= (A0 and A1 and A2 and a3) after 5ns;
end Behavioral;
