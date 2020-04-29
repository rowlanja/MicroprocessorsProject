library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;


entity BLogicSlice is
Port (S0, S1, B0:in std_logic;
	Y0:out std_logic
	);
end BLogicSlice;
architecture Behavioural of BLogicSlice is

signal M,N,O: std_logic;

constant gate_delay: Time := 5ns;

begin
    M <= (S0 AND B0);-- after gate_delay;
	N <= NOT B0 ;--after gate_delay;
	O <= (N AND S1);-- after gate_delay;
	Y0 <= (O OR M) ;--after gate_delay;
end Behavioural;



--Y0 <= ((B0)and (S0)) or ((not (B0)) and (S1)) after 1ns;