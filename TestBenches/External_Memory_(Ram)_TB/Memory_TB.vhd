LIBRARY ieee;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Memory_tb IS
END Memory_tb;
 
ARCHITECTURE behavior OF Memory_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
COMPONENT Memory
    PORT (      
        address : in std_logic_vector(15 downto 0);
        write_data : in std_logic_vector(15 downto 0);
        MemWrite, MemRead : in std_logic;
        read_data : out std_logic_vector(15 downto 0);
        Clk: in std_logic
        );
END COMPONENT;

-- components
-- 4 bit Register for register file
    

   --Inputs
   
   signal address : std_logic_vector(15 downto 0);
   signal write_data : std_logic_vector(15 downto 0);
   signal MemWrite : std_logic;
   signal MemRead : std_logic;  
      signal clk : std_logic := '0';   
 
 	--Outputs
   signal read_data : std_logic_vector(15 downto 0);

   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name
 
	-- Declare a clock period constant.
	-- Clock Generation method 1:

BEGIN
    
	-- Instantiate the Unit Under Test (UUT)
   uut: Memory PORT MAP (
          address => address,
          MemRead => MemRead,
          MemWrite => MemWrite,
          read_data => read_data,
          write_data => write_data,
          clk => clk
    );
    clk <= (not clk) after 5ns;
  stim_proc: process
   begin	
    address <= "0000000000000000";
    write_data <= "0000000000000000";
    MemWrite <= '1';
  wait for 10 ns;
    address <= "0000000000000001";
    write_data <= "0000000000000001";
  wait for 10 ns;	
    address <= "0000000000000010";
    write_data <= "0000000000000010";
  wait for 10 ns;	
    address <= "0000000000000011";
    write_data <= "0000000000000011";
  wait for 10 ns;	
    MemRead <= '1';
    MemWrite <= '0';
    address <= "0000000000000000";
  wait for 10 ns;	
    address <= "0000000000000001";
  wait for 10 ns;    
    address <= "0000000000000010";
  wait for 10 ns;    
    address <= "0000000000000011";
  wait for 10 ns;    
   
   End process;
    
  
END;