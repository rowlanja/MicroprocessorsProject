--------------------------------------------------------------------------------
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
 
ENTITY BarrelShifter_tb IS
END BarrelShifter_tb;
 
ARCHITECTURE behavior OF BarrelShifter_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 

COMPONENT BarrelShifter is
PORT(
    S0 : IN std_logic;
    S1 : IN std_logic;
	S2 : IN std_logic;
	S3 : IN std_logic;
    d : IN std_logic_vector(15 downto 0);
    y : OUT std_logic_vector(15 downto 0)
	);
END COMPONENT;

BEGIN

BS1 : BarrelShifter PORT MAP (
	S0 => S0,
    S1 => S1,
	S2 => S2,
	S3 => S3,
    d => d,
    y => y
);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant Clk_period : time := 10 ns;

   stim_proc: process
   begin		
      in0 <= "1010101010101010";
	  in1 <= "1100110011001100";
      wait for 10 ns;	
      s <= "0";
      wait for 10 ns;	
		s <= "1";
     
 --     wait;
   end process;

END;
