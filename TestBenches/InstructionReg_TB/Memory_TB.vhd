LIBRARY ieee;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Instruction_Reg_tb IS
END Instruction_Reg_tb;
 
ARCHITECTURE behavior OF Instruction_Reg_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
COMPONENT Instruction_Reg
    PORT (         
    --INPUT
    input : in std_logic_vector(15 downto 0);
    IL : in std_logic;
    clk : in std_logic;
    reset : in std_logic;

--OUTPUT
    opcode : OUT std_logic_vector(7 downto 0);
    DR, SA, SB : OUT std_logic_vector(2 downto 0)
);
END COMPONENT;
   --Inputs
   signal input : std_logic_vector(15 downto 0);
   signal il : std_logic;
   signal clk : std_logic := '0' ;
   signal reset : std_logic;

  --Outputs
   signal opcode : std_logic_vector(7 downto 0);   
   signal DR, SA, SB : std_logic_vector(2 downto 0);

BEGIN
    
	-- Instantiate the Unit Under Test (UUT)
   uut: Instruction_Reg PORT MAP (
          input => input,
          il => il,
          opcode => opcode,
          dr => dr,
          sa => sa,
          sb => sb,
          clk => clk,
          reset => reset
    );

  clk <= (not clk) after 5ns;
  stim_proc: process
   begin
	wait for 10ns;
	input <= "1111111000001010";
	wait for 10ns;
	IL <= '1';
	wait for 10ns;
	IL <= '0';
	wait for 10ns;
	input <= "0000000110110000";
	wait for 10ns;
	IL <= '1';
	wait for 10ns;
    reset <= '1';
    wait for 10ns;
    reset <= '0';
    wait for 10ns; 
   
   End process;
END;