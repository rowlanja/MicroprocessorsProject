LIBRARY ieee;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
ENTITY CAR_tb IS
END CAR_tb;
 
ARCHITECTURE behavior OF CAR_tb IS 
 COMPONENT car
    Port(	
	       opcode : in std_logic_vector(7 downto 0);
	       load : in std_logic; 
	       reset : in std_logic;
	       Clk : in std_logic;
	       address : inout std_logic_vector(7 downto 0)
            );
    END COMPONENT;
   --Inputs
   signal opcode : std_logic_vector(7 downto 0);
   signal load : std_logic := '0';
   signal Clk : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal address : std_logic_vector(7 downto 0);
BEGIN
    
	-- Instantiate the Unit Under Test (UUT)
   uut: CAR PORT MAP (
          opcode => opcode,
          load => load,
          Clk => Clk,
          reset => reset,
          address => address
    );

    Clk <= not Clk after 1ns;

  stim_proc: process
   begin		
	wait for 2ns;
	reset <= '1';
	wait for 2ns;
	reset <= '0';
		
	wait for 2ns;
	opcode <= x"10";
	
	wait for 2ns;
	opcode <= x"A2";
	load <= '1';
  wait for 2 ns;  
   
   End process;
END;