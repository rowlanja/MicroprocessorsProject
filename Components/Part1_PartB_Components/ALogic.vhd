library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Alogic is
PORT(
	Cin : std_logic;
	g : Out std_logic_vector(15 downto 0);
   	x : IN std_logic_vector(15 downto 0);
	y : IN std_logic_vector(15 downto 0);
	Cout : OUT std_logic
 );
end ALogic;

architecture Behavioral of ALogic is
-- components
-- 4 bit Register for register file
COMPONENT ALogicSlice
PORT(
	in1 : IN std_logic;
    in2 : IN std_logic;
	c_in : IN std_logic;
   	sum : Out std_logic;
	c_out : Out std_logic
);
END COMPONENT;

-- signals
signal c1, c2, c3, c4, c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15, c16: std_logic;
begin
-- port maps ;-)
-- register 0
slice1: ALogicSlice PORT MAP(
    in1 => x(0),
    in2 => y(0),
	c_in => Cin,
   	sum => g(0),
	c_out => c1
);
slice2: ALogicSlice PORT MAP(
    in1 => x(1),
    in2 => y(1),
	c_in => c1,
   	sum => g(1),
	c_out => c2
);
slice3: ALogicSlice PORT MAP(
    in1 => x(2),
    in2 => y(2),
	c_in => c2,
   	sum => g(2),
   	c_out => c3
);               
slice4: ALogicSlice PORT MAP(
   in1 => x(3),
    in2 => y(3),
	c_in => c3,
   	sum => g(3),
   	c_out => c4
);              
slice5: ALogicSlice PORT MAP(
    in1 => x(4),
    in2 => y(4),
	c_in => c4,
   	sum => g(4),
    c_out => c5
);               
 slice6: ALogicSlice PORT MAP(
    in1 => x(5),
    in2 => y(5),
	c_in => c5,
   	sum => g(5),
    c_out => c6
 );               
slice7: ALogicSlice PORT MAP(
    in1 => x(6),
    in2 => y(6),
	c_in => c6,
   	sum => g(6),
   	c_out => c7
   ); 
slice8: ALogicSlice PORT MAP(
    in1 => x(7),
    in2 => y(7),
	c_in => c7,
   	sum => g(7),
   	c_out => c8
   );      
slice9: ALogicSlice PORT MAP(
     in1 => x(8),
    in2 => y(8),
	c_in => c8,
   	sum => g(8),
   	c_out => c9
);
slice10: ALogicSlice PORT MAP(
   in1 => x(9),
    in2 => y(9),
	c_in => c9,
   	sum => g(9),
   	c_out => c10
);
slice11: ALogicSlice PORT MAP(
    in1 => x(10),
    in2 => y(10),
	c_in => c10,
   	sum => g(10),
   	c_out => c11

);               
slice12: ALogicSlice PORT MAP(
    in1 => x(11),
    in2 => y(11),
	c_in => c11,
   	sum => g(11),
   	c_out => c12

);              
slice13: ALogicSlice PORT MAP(
     in1 => x(12),
    in2 => y(12),
	c_in => c12,
   	sum => g(12),
   	c_out => c13

);               
 slce14: ALogicSlice PORT MAP(
    in1 => x(13),
    in2 => y(13),
	c_in => c13,
   	sum => g(13),
   	c_out => c14
 );               
slice15: ALogicSlice PORT MAP(
     in1 => x(14),
    in2 => y(14),
	c_in => c14,
   	sum => g(14),
  	c_out => c15

   ); 
slice16: ALogicSlice PORT MAP(
     in1 => x(15),
    in2 => y(15),
	c_in => c15,
   	sum => g(15),
   	c_out => c16
);      
    Cout <= c16;
    
end Behavioral;