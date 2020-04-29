
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY Datapath_tb IS
END Datapath_tb;
 
ARCHITECTURE behavior OF Datapath_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
COMPONENT Datapath
    PORT(

	    BA : in std_logic_vector(2 downto 0);
        AA : in std_logic_vector(2 downto 0);
        DA : in std_logic_vector(2 downto 0);
        MB : in std_logic;
        MD : in std_logic;
        FS : in std_logic_vector(4 downto 0);
        RW : in std_logic;
        
        cons_in : in std_logic_vector(15 downto 0);
        Data_in : in std_logic_vector(15 downto 0);
        busA : out std_logic_vector(15 downto 0);
        busB : out std_logic_vector(15 downto 0);
        
        V : out std_logic;
        C : out std_logic;
        N : out std_logic;
        Z : out std_logic;
        Clk : in std_logic;

        rego0 : out std_logic_vector(15 downto 0);
        rego1 : out std_logic_vector(15 downto 0);
        rego2 : out std_logic_vector(15 downto 0);
        rego3 : out std_logic_vector(15 downto 0);
        rego4 : out std_logic_vector(15 downto 0);
        rego5 : out std_logic_vector(15 downto 0);
        rego6 : out std_logic_vector(15 downto 0);
        rego7 : out std_logic_vector(15 downto 0);
        reg_file_out : out std_logic_vector(15 downto 0) 
    );
END COMPONENT;
    
                                            
                                               --Inputs

       signal MB :  std_logic := '0';
       signal MD :  std_logic := '0';
       signal RW :  std_logic := '0';
       signal Clk : std_logic :='1';
       
       signal cons_in : std_logic_vector(15 downto 0) := (others => '0');
       signal Data_in : std_logic_vector(15 downto 0) := (others => '0');
       signal AA : std_logic_vector(2 downto 0) := (others => '0');
       signal BA : std_logic_vector(2 downto 0) := (others => '0');
       signal DA : std_logic_vector(2 downto 0) := (others => '0');
       signal FS : std_logic_vector(4 downto 0) := (others => '0');
                                           --Outputs
 	 signal N :  std_logic := '0';
     signal C :  std_logic := '0';
     signal V :  std_logic := '0';
     signal Z :  std_logic := '0';
     signal busA : std_logic_vector(15 downto 0);
     signal busB : std_logic_vector(15 downto 0);
                     

     signal rego0 : std_logic_vector(15 downto 0);
     signal rego1 : std_logic_vector(15 downto 0);
     signal rego2 : std_logic_vector(15 downto 0);
     signal rego3 : std_logic_vector(15 downto 0);
     signal rego4 : std_logic_vector(15 downto 0);
     signal rego5 : std_logic_vector(15 downto 0);
     signal rego6 : std_logic_vector(15 downto 0);
     signal rego7 : std_logic_vector(15 downto 0);
     signal reg_file_out : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant Clk_period : time := 10 ns;
 
BEGIN
    Clk <= not Clk after 1ns;

                            -- Instantiate the Unit Under Test (UUT)
   uut: Datapath PORT MAP (
          BA => BA,
          AA => AA,
          DA => DA,
          MB => MB,
          MD => MD,
          FS => FS,
          RW => RW,
          
          cons_in => cons_in,
          Data_in => Data_in,
          busA => busA,
          busB => busB,
          Clk => Clk,
          V => V,
          C => C,
          N => N,
          Z => Z,
          
          rego0 => rego0,
          rego1 => rego1,
          rego2 => rego2,
          rego3 => rego3,
          rego4 => rego4,
          rego5 => rego5,
          rego6 => rego6,
          rego7 => rego7,
          reg_file_out => reg_file_out
        );

   stim_proc: process
   
   begin
   
   cons_in <= "0000000000000000";
   Data_in <= "0000000000000000"; 
   MB <= '0';
   MD <= '1';
   FS <= "00000";
   
   DA <= "000";
   BA <= "000";
   AA <= "000";
wait for 2 ns;	
   Data_in <= "0000000000000001"; 

  da <=  "001"; 
  BA <= "001";
  AA <=  "001";  
wait for 2 ns;	
   Data_in <= "0000000000000010"; 

   da <=  "010";
   BA <= "010";
   AA <= "010";                                                                    
                                                                                           
wait for 2 ns;
   Data_in <= "0000000000000011"; 

    da <=  "011"; 
    BA <= "011";  
    AA <= "011";                                                                                           
wait for 2 ns;	              
   Data_in <= "0000000000000100"; 
            
    da <=  "100";
    BA <= "100";  
    AA <= "100";
wait for 2 ns;	
   Data_in <= "0000000000000101"; 

    da <=  "101";
    BA <= "101";  
    AA <= "101";     
wait for 2 ns;	
   Data_in <= "0000000000000110"; 

    da <=  "110";
    BA <= "110";  
    AA <= "110"; 
wait for 2 ns;	
   Data_in <= "0000000000000111"; 

    da <=  "111";
    BA <= "111";  
    AA <= "111";  
 wait for 4 ns;	
  da <= "000";
  md <= '0';
  fs <= "00001";
 -- da <= "111";
 wait for 2 ns;	
  fs <= "00010";
 -- da <= "111";
 wait for 2 ns;	
  fs <= "00011";
 -- da <= "111";
 wait for 2 ns;	
  fs <= "00100";
--  da <= "111";
 wait for 2 ns;	
  fs <= "00101";
 -- da <= "111";
 wait for 2 ns;	
  fs <= "00110";
--  da <= "111";
 wait for 2 ns;	
  fs <= "00111";
--  da <= "111";
 wait for 2 ns;	
  fs <= "01000";
--  da <= "111";
 wait for 2 ns;	
  fs <= "01010";
--  da <= "111";
 wait for 2 ns;	
  fs <= "01100";
--  da <= "111";
 wait for 2 ns;	
  fs <= "01110";
--  da <= "111";
 wait for 2 ns;
 fs <= "10100";
--  da <= "111";
wait for 2 ns;
 fs <= "11000";
 -- da <= "111";
  wait for 2 ns;

   end process;

END;
