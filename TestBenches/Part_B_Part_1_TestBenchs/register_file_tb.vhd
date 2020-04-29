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
    PORT (         
       src_s0 :  in std_logic;
    src_s1 : in std_logic;
    src_s2 : in std_logic;
    src_s3 :  in std_logic;
    src_s4 : in std_logic;
    src_s5 : in std_logic;
    des_A0 : in std_logic;
    des_A1 : in std_logic;
    des_A2 : in std_logic;
    
    Clk : in std_logic;
    data_src : in std_logic;
    data : in std_logic_vector(15 downto 0);
    OUT1 : out std_logic_vector(15 downto 0);
    OUT2 : out std_logic_vector(15 downto 0);
	reg0 : out std_logic_vector(15 downto 0);
    reg1 : out std_logic_vector(15 downto 0);
    reg2 : out std_logic_vector(15 downto 0);
    reg3 : out std_logic_vector(15 downto 0);
    reg4 : out std_logic_vector(15 downto 0);
    reg5 : out std_logic_vector(15 downto 0);
    reg6 : out std_logic_vector(15 downto 0);
    reg7 : out std_logic_vector(15 downto 0)
        );
END COMPONENT;

COMPONENT regi4
          PORT(
          D : IN std_logic_vector(15 downto 0);
          load : IN std_logic;
          Clk : IN std_logic;
          Q : OUT std_logic_vector(15 downto 0)
          );
 END COMPONENT;
      
     COMPONENT mux2_16bit
         PORT(
         In0 : IN std_logic_vector(15 downto 0);
         In1 : IN std_logic_vector(15 downto 0);
         s : IN std_logic;
         Z : OUT std_logic_vector(15 downto 0)
         );
     END COMPONENT;
         
 
     COMPONENT decoder_3to8
     PORT(
          A0 : IN  std_logic;
          A1 : IN  std_logic;
          A2 : IN  std_logic;
          Q0 : OUT std_logic;
         Q1 : OUT std_logic;
         Q2 : OUT std_logic;
         Q3 : OUT std_logic;
         Q4 : OUT std_logic;
         Q5 : OUT std_logic;
         Q6 : OUT std_logic;
         Q7 : OUT std_logic);
     END COMPONENT;
             
             
     COMPONENT multiplexer
     PORT(
          s0 : IN  std_logic;
          s1 : IN  std_logic;
          s2 : IN  std_logic;
          in1 : IN  std_logic_vector(15 downto 0);
          in2 : IN  std_logic_vector(15 downto 0);
          in3 : IN  std_logic_vector(15 downto 0);
          in4 : IN  std_logic_vector(15 downto 0);
          in5 : IN  std_logic_vector(15 downto 0);
          in6 : IN  std_logic_vector(15 downto 0);
          in7 : IN  std_logic_vector(15 downto 0);
          in8 : IN  std_logic_vector(15 downto 0);
          z : OUT  std_logic_vector(15 downto 0)
         );
     END COMPONENT;
    
-- components
-- 4 bit Register for register file
    

   --Inputs
   signal src_s0 : std_logic;
   signal src_s1 : std_logic;
   signal src_s2 : std_logic;
   signal src_s3 : std_logic;
   signal src_s4 : std_logic;
   signal src_s5 : std_logic;
   signal data_src : std_logic;
   signal Clk : std_logic :='1';
   signal data : std_logic_vector(15 downto 0);
   signal OUT1 : std_logic_vector(15 downto 0);
   signal OUT2 : std_logic_vector(15 downto 0);

   signal des_A0 : std_logic;
   signal des_A1 : std_logic;
   signal des_A2 : std_logic;
   

 	--Outputs
     signal reg0 : std_logic_vector(15 downto 0);
     signal reg1 : std_logic_vector(15 downto 0);
     signal reg2 : std_logic_vector(15 downto 0);
     signal reg3 : std_logic_vector(15 downto 0);
     signal reg4 : std_logic_vector(15 downto 0);
     signal reg5 : std_logic_vector(15 downto 0);
     signal reg6 : std_logic_vector(15 downto 0);
     signal reg7 : std_logic_vector(15 downto 0);

   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name
 
	-- Declare a clock period constant.
	Constant ClockPeriod : TIME := 10 ns;
	-- Clock Generation method 1:

BEGIN
   Clk <= not Clk after 1ns;
    
	-- Instantiate the Unit Under Test (UUT)
   uut: register_file PORT MAP (
          src_s0 => src_s0,
          src_s1 => src_s1,
          src_s2 => src_s2,
          src_s3 => src_s3,
          src_s4 => src_s4,
          src_s5 => src_s5,
          data_src => data_src,
          Clk => Clk,
          data => data,
          des_A0 => des_A0,
          des_A1 => des_A1,
          des_A2 => des_A2,
          OUT1 => OUT1,
          OUT2 => OUT2,
          reg0 => reg0,
          reg1 => reg1,
          reg2 => reg2,
          reg3 => reg3,
          reg4 => reg4,
          reg5 => reg5,
          reg6 => reg6,
          reg7 => reg7
    );

  
  stim_proc: process
   begin	

    data_src <= '0'; --0 loads from data source
    data <= X"0000";
    des_A0 <= '0';
    des_A1 <= '0';
    des_A2 <= '0';
    src_s0 <= '0';
    src_s1 <= '0';
    src_s2 <= '0';
    src_s3 <= '0';
    src_s4 <= '0';
    src_s5 <= '0'; 
  wait for 2 ns;
      data <= X"0001";
	
   des_A0 <= '0';
   des_A1 <= '0';
   des_A2 <= '1';
   src_s0 <= '0';
   src_s1 <= '0';
   src_s2 <= '1';
   src_s3 <= '0';
   src_s4 <= '0';
   src_s5 <= '1';
  wait for 2 ns;	
    data <= X"0002";

   des_A0 <= '0';
   des_A1 <= '1';
   des_A2 <= '0';
   src_s0 <= '1';
   src_s1 <= '0';
   src_s2 <= '0';
   src_s3 <= '0';
   src_s4 <= '';
   src_s5 <= '0';
  wait for 2 ns;	
    data <= X"0003";


   des_A0 <= '0';
   des_A1 <= '1';
   des_A2 <= '1';
   src_s0 <= '0';
   src_s1 <= '1';
   src_s2 <= '1';
   src_s3 <= '0';
   src_s4 <= '1';
   src_s5 <= '1'; 

  wait for 2 ns;	
         data <= X"0004";

   des_A0 <= '1';
   des_A1 <= '0';
   des_A2 <= '0';
   src_s0 <= '1';
   src_s1 <= '0';
   src_s2 <= '0';
   src_s3 <= '1';
   src_s4 <= '0';
   src_s5 <= '0';
   wait for 2 ns;	
     data <= X"0005";


    des_A0 <= '1';
    des_A1 <= '0';
    des_A2 <= '1';
    src_s0 <= '1';
    src_s1 <= '0';
    src_s2 <= '1';
    src_s3 <= '1';
    src_s4 <= '0';
    src_s5 <= '1';
    wait for 2 ns;    
     data <= X"0006";

    des_A0 <= '1';
    des_A1 <= '1';
    des_A2 <= '0';
    src_s0 <= '1';
    src_s1 <= '1';
    src_s2 <= '0';
    src_s3 <= '1';
    src_s4 <= '1';
    src_s5 <= '0';
    wait for 2 ns;    
     data <= X"0007";

     des_A0 <= '1';
     des_A1 <= '1';
     des_A2 <= '1';
     src_s0 <= '1';
     src_s1 <= '1';
     src_s2 <= '1';
     src_s3 <= '1';
     src_s4 <= '1';
     src_s5 <= '1';
     wait for 2 ns;    
    
     src_s0 <= '0';
     src_s1 <= '0';
     src_s2 <= '0';
     src_s3 <= '0';
     src_s4 <= '0';
     src_s5 <= '0';     
     
     wait for 2 ns;  
     
     src_s0 <= '0';
     src_s1 <= '0';
     src_s2 <= '1';
     src_s3 <= '0';
     src_s4 <= '0';
     src_s5 <= '1';  
     
    wait for 10 ns; 
     

     src_s0 <= '0';
     src_s1 <= '1';
     src_s2 <= '0';
     src_s3 <= '0';
     src_s4 <= '1';
     src_s5 <= '0';  
    
    wait for 10 ns; 
    
      src_s0 <= '0';
     src_s1 <= '1';
     src_s2 <= '1';
     src_s3 <= '0';
     src_s4 <= '1';
     src_s5 <= '1';  
    
    wait for 10 ns; 
     src_s0 <= '1';
     src_s1 <= '0';
     src_s2 <= '0';
     src_s3 <= '1';
     src_s4 <= '0';
     src_s5 <= '0';  
    
    wait for 10 ns; 
    
      src_s0 <= '1';
     src_s1 <= '0';
     src_s2 <= '1';
     src_s3 <= '1';
     src_s4 <= '0';
     src_s5 <= '1';  
    
    wait for 10 ns; 
     src_s0 <= '1';
     src_s1 <= '1';
     src_s2 <= '0';
     src_s3 <= '1';
     src_s4 <= '1';
     src_s5 <= '0';  
     wait for 10 ns; 
     src_s0 <= '1';
     src_s1 <= '1';
     src_s2 <= '1';
     src_s3 <= '1';
     src_s4 <= '1';
     src_s5 <= '1';  
    wait for 10 ns;      
   End process;
    
  
END;