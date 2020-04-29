LIBRARY ieee;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

ENTITY ROM_TB IS
END ROM_TB;
 
ARCHITECTURE behavior OF ROM_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
COMPONENT ROM
    PORT ( 
--INPUTS
    input : in std_logic_vector(7 downto 0);
--OUTUTS
    NA : OUT STD_LOGIC_VECTOR(7 downto 0);
    MS : OUT STD_LOGIC_VECTOR(2 downto 0);
    MC : OUT STD_LOGIC;
    IL : OUT STD_LOGIC;
    PI : OUT STD_LOGIC;
    PL : OUT STD_LOGIC;
    TD : OUT STD_LOGIC; 
    TA : OUT STD_LOGIC;
    TB : OUT STD_LOGIC;
    MB : OUT STD_LOGIC;
    FS : OUT STD_LOGIC_VECTOR(4 downto 0);
    MD : OUT STD_LOGIC;
    RW : OUT STD_LOGIC;
    MM : OUT STD_LOGIC;
    MW : OUT STD_LOGIC
    );
END COMPONENT;

--Inputs
   signal input : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal MW : std_logic;
   signal MM : std_logic;
   signal RW : std_logic;
   signal MD : std_logic;
   signal MB : std_logic;
   signal TB : std_logic;
   signal TA : std_logic;
   signal TD : std_logic;
   signal PL : std_logic;
   signal PI : std_logic;
   signal IL : std_logic;
   signal MC : std_logic;
   signal FS : std_logic_vector(4 downto 0);
   signal MS : std_logic_vector(2 downto 0);
   signal NA : std_logic_vector(7 downto 0);
 
BEGIN
    
	-- Instantiate the Unit Under Test (UUT)
   uut: ROM PORT MAP (
--INPUTS
    input => input,
--OUTUTS
    NA => NA,
    MS => MS, 
    MC => MC,
    IL => IL,
    PI => PI,
    PL => PL,
    TD => TD,
    TA => TA,
    TB => TB,
    MB => MB,
    FS => FS,
    MD => MD,
    RW => RW,
    MM => MM,
    MW => MW
    );

  
  -- Stimulus process
   stim_proc: process
   begin		
    wait for 10ns;
	input <= x"00";
	wait for 10ns;
	input <= x"08";
	wait for 10ns;
	input <= x"0E";	
    wait for 10ns;
   
   
   end process;
END;