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
 
ENTITY mux8_16_tb IS
END mux8_16_tb;
 
ARCHITECTURE behavior OF mux8_16_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux8_16bit
    PORT(
        In0 : IN std_logic_vector(15 downto 0);
		In1 : IN std_logic_vector(15downto 0);
		In2 : IN std_logic_vector(15 downto 0);
		In3 : IN std_logic_vector(15 downto 0);
		In4 : IN std_logic_vector(15 downto 0);
		In5 : IN std_logic_vector(15 downto 0);
		In6 : IN std_logic_vector(15 downto 0);
		In7 : IN std_logic_vector(15 downto 0);
		S0 : IN std_logic;
		S1 : IN std_logic;
		S2 : IN std_logic;
		Z : OUT std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal s0 :  std_logic := '0';
   signal s1 :  std_logic := '0';
   signal s2 :  std_logic := '0';
   signal In0 : std_logic_vector(15 downto 0) := (others => '0');
   signal In1 : std_logic_vector(15 downto 0) := (others => '0');
   signal In2 : std_logic_vector(15 downto 0) := (others => '0');
   signal In3 : std_logic_vector(15 downto 0) := (others => '0');
   signal In4 : std_logic_vector(15 downto 0) := (others => '0');
   signal In5 : std_logic_vector(15 downto 0) := (others => '0');
   signal In6 : std_logic_vector(15 downto 0) := (others => '0');
   signal In7 : std_logic_vector(15 downto 0) := (others => '0');
 	--Outputs
   signal z : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux8_16bit PORT MAP (
          s0 => s0,
          s1 => s1,
          s2 => s2,
          In0 => in0,
          In1 => in1,
		  In2 => in2,
          In3 => in3,
		  In4 => in4,
          In5 => in5,
		  In6 => in6,
          In7 => in7,
          z => z
        );

   stim_proc: process
   begin		
      in0 <= "1010101010101010";
	  in1 <= "0000011101010011";
	  in2 <= "0000011110000111";
	  in3 <= "1111000011110000";
	  in4 <= "0000000011111111";
	  in5 <= "1100110011001100";
	  in6 <= "1000000000000001";
	  in7 <= "1001100011110001";
      wait for 10 ns;	
      s0 <= '0';
	  s1 <= '0';
      s2 <= '0';
      wait for 10 ns;	
      s0 <= '0';
	  s1 <= '0';
      s2 <= '1';
	  wait for 10 ns;	
      s0 <= '0';
	  s1 <= '1';
      s2 <= '0';
	 wait for 10 ns;	
      s0 <= '0';
	  s1 <= '1';
      s2 <= '1';
	 wait for 10 ns;	
      s0 <= '1';
	  s1 <= '0';
      s2 <= '0';      
	  wait for 10 ns;	
      s0 <= '1';
	  s1 <= '0';
      s2 <= '1';     
	  wait for 10 ns;	
      s0 <= '1';
	  s1 <= '1';
      s2 <= '0';
	  wait for 10 ns;	
      s0 <= '1';
	  s1 <= '1';
      s2 <= '1';
 --     wait;
   end process;

END;
