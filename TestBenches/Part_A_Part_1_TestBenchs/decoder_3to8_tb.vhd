-------------------------------------------------------------------------------
-- Company: Trinity College
-- Engineer: Dr. Michael Manzke
--
-- Create Date:   11:50:59 02/23/2012
-- Design Name:   
-- Module Name:   C:/Xilinx/12.4/ISE_DS/ISE/ISEexamples/MichaelsMultiplexer/multiplexer_tb.vhd
-- Project Name:  MichaelsMultiplexer
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: multiplexer
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY decoder_3to8_tb IS
END decoder_3to8_tb;
 
ARCHITECTURE behavior OF decoder_3to8_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT decoder_3to8
    PORT(
         A0 : IN  std_logic;
         A1 : IN  std_logic;
         A2: IN  std_logic;
        Q0 : out std_logic;
		Q1 : out std_logic;
		Q2 : out std_logic;
		Q3 : out std_logic;
		Q4 : out std_logic;
		Q5 : out std_logic;
		Q6 : out std_logic;
		Q7 : out std_logic);
    END COMPONENT;
    

   --Inputs
   signal A0 :  std_logic := '0';
   signal A1 :  std_logic := '0';
   signal A2 :  std_logic := '0';
 	--Outputs
   signal Q0 :  std_logic := '0';
   signal Q1 :  std_logic := '0';
   signal Q2 :  std_logic := '0';
   signal Q3 :  std_logic := '0';
   signal Q4 :  std_logic := '0';
   signal Q5 :  std_logic := '0';
   signal Q6 :  std_logic := '0';
   signal Q7 :  std_logic := '0';

   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: decoder_3to8 PORT MAP (
         A0 => A0,
		 A1 => A1,
		 A2 => A2,
		 Q0 => Q0,
		 Q1 => Q1,
		 Q2 => Q2,
		 Q3 => Q3,
		 Q4 => Q4,
		 Q5 => Q5,
		 Q6 => Q6,
		 Q7 => Q7
        );

   stim_proc: process
   begin		
      A0 <= '0';
	  A1 <= '0';
      A2 <= '0';
      Q0 <= '1';
	  Q1 <= '1';
      Q2 <= '1';
	  Q3 <= '1';
	  Q4 <= '1';
      Q5 <= '1';
	  Q6 <= '1';
	  Q7 <= '1';
      
      wait for 10 ns;	
      A0 <= '0';
	  A1 <= '0';
      A2 <= '0';
      wait for 10 ns;	
      A0 <= '0';
	  A1 <= '0';
      A2 <= '1';
      wait for 10 ns;	
      A0 <= '0';
	  A1 <= '1';
      A2 <= '0';
      wait for 10 ns;	
      A0 <= '0';
	  A1 <= '1';
      A2 <= '1';
      wait for 10 ns;	
      A0 <= '1';
	  A1 <= '0';
      A2 <= '0';
      wait for 10 ns;	
      A0 <= '1';
	  A1 <= '0';
      A2 <= '1';
      wait for 10 ns;	
      A0 <= '1';
	  A1 <= '1';
      A2 <= '0';	  
      wait for 10 ns;	
      A0 <= '1';
	  A1 <= '1';
      A2 <= '1';
      wait for 10 ns;	
 --     wait;
   end process;

END;
