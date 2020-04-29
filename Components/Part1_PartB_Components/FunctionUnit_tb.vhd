LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY FunctionUnit_tb IS
END FunctionUnit_tb;
 
ARCHITECTURE behavior OF FunctionUnit_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
COMPONENT FunctionUnit
    PORT (        
		V : OUT std_logic;
		C : OUT std_logic;
		N : OUT std_logic;
		Z : OUT std_logic;
		TEMP : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		FS : In std_logic_vector(4 downto 0);
		A : IN std_logic_vector(15 downto 0);
		B : IN std_logic_vector(15 downto 0);
		F : OUT std_logic_vector(15 downto 0)
    );
END COMPONENT;
-- components
-- 4 bit Register for register file
    

   --Inputs
   signal V : std_logic;
   signal C : std_logic;
   signal N : std_logic;
   signal Z : std_logic;
   signal FS : std_logic_vector(4 downto 0);

   

 	--Outputs
     signal A : std_logic_vector(15 downto 0);
     signal B : std_logic_vector(15 downto 0);
     signal F : std_logic_vector(15 downto 0);
     signal TEMP : std_logic_vector(15 downto 0);

   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
	-- Declare a clock period constant.
	-- Clock Generation method 1:

BEGIN

	-- Instantiate the Unit Under Test (UUT)
   uut: FunctionUnit PORT MAP (
        V	=>	V,
		C	=>	C,
		Z	=>	Z,
		N	=>	N,
		FS	=>	FS,
		A	=>	A,
		B	=>	B,
		F	=>	F
    );

  
  stim_proc: process
   begin	
    FS <= "00000";
    A <= "0000000011001100";
	B <= "1100000011011001";
	temp <= "0000000000000000";
    f <= "0000000000000000";
  wait for 10 ns;	
    FS  <= "00000";
  wait for 10 ns;	
    FS  <= "00001";
  wait for 10 ns;	
    FS  <= "00010";
 wait for 10 ns;	
   FS  <= "00011";
 wait for 10 ns;    
  FS  <= "00000";
 wait for 10 ns;    
    FS  <= "00000";
 wait for 10 ns;    
   FS  <= "00000";
 wait for 10 ns;  
   FS  <= "00000";
 wait for 10 ns; 
   FS  <= "00000";
 wait for 10 ns; 
   FS  <= "00000";    
 end process;
 
 
END;