--********************** AUTHOR - JAMES ROWLAND ******************************
--********************** STUDENT NUMBER - 18324013 ***************************
--**********************      CLASS CSU22022    ******************************
--**********************      DATE 20 - 4 - 2020 *****************************
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY processor_final_TestBench IS
END processor_final_TestBench;
 
ARCHITECTURE behavior OF processor_final_TestBench IS  
    COMPONENT processor
    PORT(
         Clk : IN  std_logic;
         reset : IN  std_logic;
        rego0 : out std_logic_vector(15 downto 0);
        rego1 : out std_logic_vector(15 downto 0);
        rego2 : out std_logic_vector(15 downto 0);
        rego3 : out std_logic_vector(15 downto 0);
        rego4 : out std_logic_vector(15 downto 0);
        rego5 : out std_logic_vector(15 downto 0);
        rego6 : out std_logic_vector(15 downto 0);
        rego7 : out std_logic_vector(15 downto 0);
        rego8: out std_logic_vector(15 downto 0);
        PC : out std_logic_vector(15 downto 0);
        dr, sa, sb : out std_logic_vector(3 downto 0);
        CAR : inout std_logic_vector(7 downto 0);
        BUS_D : out std_logic_vector(15 downto 0);
        IR : out std_logic_vector(15 downto 0)

        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal reset : std_logic := '0';
 signal rego0 : std_logic_vector(15 downto 0);
    signal rego1 : std_logic_vector(15 downto 0);
    signal rego2 : std_logic_vector(15 downto 0);
    signal rego3 : std_logic_vector(15 downto 0);
    signal rego4 : std_logic_vector(15 downto 0);
    signal rego5 : std_logic_vector(15 downto 0);
    signal rego6 : std_logic_vector(15 downto 0);
    signal rego7 : std_logic_vector(15 downto 0);
    signal rego8, PC, BUS_D, ir : std_logic_vector(15 downto 0);
    
    --signal dr, sa, sb : std_logic_vector(3 downto 0);
    signal CAR : std_logic_vector(7 downto 0);
   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: processor PORT MAP (
          Clk => Clk,
          reset => reset,
            rego0 => rego0,
           rego1 => rego1,
           rego2 => rego2,
           rego3 => rego3,
           rego4 => rego4,
           rego5 => rego5,
           rego6 => rego6,
           rego7 => rego7,
           rego8 => rego8,
           PC => PC,
--           dr => dr,
--           sb => sb,
--           sa => sa,
           CAR => CAR,
            BUS_D => BUS_D,
            Ir => Ir
        );

   -- Clock process definitions
clk <= (not clk )after 10ns;
   -- Stimulus process
   stim_proc: process
   begin		
      reset <= '1';
      wait for 10ns;
      reset <= '0';
	  wait for 500 ns;	
       reset <= '1';
      wait for 10ns;
      reset <= '0';
	  wait for 200 ns;	
  end process;

END;
