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
 
ENTITY reg4_tb IS
END reg4_tb;
 
ARCHITECTURE behavior OF reg4_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT reg4
    PORT(
		D : IN  std_logic_vector;
		load : IN std_logic;
		Clk : IN std_logic;
		Q : OUT  std_logic_vector(15 downto 0)
    );
    END COMPONENT;
    

   --Inputs
   signal load :  std_logic := '0';
   signal Clk :  std_logic :=  '0';
   signal D : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal Q : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: reg4 PORT MAP (
         load => load,
         clk => clk,
         D => D,
         Q => Q
        );

   stim_proc: process
   begin	
   	D <= "1000011110000111";
	
    load <= '0';
	clk <= '0';
	wait for 10 ns;	
    load <= '0';
	clk <= '1';
    wait for 10 ns;	
	load <= '1';
	clk <= '0';
    wait for 10 ns;	
	load <= '1';
	clk <=	'1';
    wait for 10 ns;	

     
 --     wait;
   end process;

END;
