LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY register_file_tb IS
END register_file_tb;
 
ARCHITECTURE behavior OF register_file_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
COMPONENT register_file
    PORT ( src_s0 : in std_logic;
        src_s1 : in std_logic;
        src_s2 : in std_logic;
        des_A0 : in std_logic;
        des_A1 : in std_logic;
        des_A2 : in std_logic;
        Clk : in std_logic;
        data_src : in std_logic;
        data : in std_logic_vector(15 downto 0);
        regout0 : out std_logic_vector(15 downto 0);
        regout1 : out std_logic_vector(15 downto 0);
        regout2 : out std_logic_vector(15 downto 0);
        regout3 : out std_logic_vector(15 downto 0);
        regout4 : out std_logic_vector(15 downto 0);
        regout5 : out std_logic_vector(15 downto 0);
        regout6 : out std_logic_vector(15 downto 0);
        regout7 : out std_logic_vector(15 downto 0)
        );
END COMPONENT;

-- components
-- 4 bit Register for register file
    

   --Inputs
   signal src0 :  std_logic := '0';
   signal src_s1 :  std_logic := '0';
   signal src_s2 :  std_logic := '0';
   signal des_A0 :  std_logic := '0';
   signal des_A1 :  std_logic := '0';
   signal des_A2 :  std_logic := '0';

   signal clk :  std_logic := '0';
   signal data_src :  std_logic := '0';
   signal data : std_logic_vector(15 downto 0) := (others => '0');
   
  
 	--Outputs
   signal reg0 : std_logic_vector(15 downto 0) := (others => '0');
   signal reg1 : std_logic_vector(15 downto 0) := (others => '0');
   signal reg2 : std_logic_vector(15 downto 0) := (others => '0');
   signal reg3 : std_logic_vector(15 downto 0) := (others => '0');
   signal reg_4 : std_logic_vector(15 downto 0) := (others => '0');
   signal reg5 : std_logic_vector(15 downto 0) := (others => '0');
   signal reg6 : std_logic_vector(15 downto 0) := (others => '0');
   signal reg7 : std_logic_vector(15 downto 0) := (others => '0');

   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
	-- Declare a clock period constant.
	Constant ClockPeriod : TIME := 10 ns;
	-- Clock Generation method 1:

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: register_file PORT MAP (
    src0 => src0,
	src1 => src_s1,
    src2 => src_s2,
	des0 => des_A0,
	des1  => des_A1,
	des2  => des_A2,
	Clock  => clk,
	data_source  => data_src,
	data_in => data,
	regout0  => reg0,
	regout1 => reg1, 
	regout2 => reg2,
	regout3  => reg3,
	regout4  => reg_4,
	regout5  => reg5,
	regout6 => reg6,
	regout7  => reg7
    );

clock: process
   begin		
		wait for (ClockPeriod / 2);
		Clk <= '1';
		wait for (ClockPeriod / 2);
		Clk <= '0';
   end process;
   
   

END;