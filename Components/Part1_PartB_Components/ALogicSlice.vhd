library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALogicSlice is
Port (in1, in2, c_in:in std_logic;
	sum, c_out:out std_logic
	);
end ALogicSlice;
architecture Behavioural of ALogicSlice is

signal s1,s2,s3: std_logic;


begin
	s1 <= (in1 XOR in2);-- after gate_delay;
    sum <= (s1 XOR c_in);-- after gate_delay;
	s2 <= (c_in AND s1);-- after gate_delay;
	s3 <= (in1 AND in2);-- after gate_delay;
	c_out <= (s2 OR s3);-- after gate_delay;
end Behavioural;
