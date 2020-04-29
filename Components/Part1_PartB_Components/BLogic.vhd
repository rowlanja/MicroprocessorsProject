library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity BLogic is
PORT(
    S0 : IN std_logic;
    S1 : IN std_logic;
	B : IN std_logic_vector(15 downto 0);
    Y : Out std_logic_vector(15 downto 0)
);
end BLogic;

architecture Behavioral of BLogic is
-- components
-- 4 bit Register for register file
COMPONENT BLogicSlice
PORT(
	 S0 : IN std_logic;
    S1 : IN std_logic;
	B0 : IN std_logic;
   	Y0 : Out std_logic
);
END COMPONENT;

-- signals
begin
-- port maps ;-)
-- register 0
slice1: BLogicSlice PORT MAP(
    S0 => S0,
    S1 => S1,
	B0 => B(15),
   	Y0 => Y(15)
);
slice2: BLogicSlice PORT MAP(
    S0 => S0,
    S1 => S1,
	B0 => B(14),
   	Y0 => Y(14)
);
slice3: BLogicSlice PORT MAP(
    S0 => S0,
    S1 => S1,
	B0 => B(13),
   	Y0 => Y(13)
);               
slice4: BLogicSlice PORT MAP(
    S0 => S0,
    S1 => S1,
	B0 => B(12),
   	Y0 => Y(12)
);              
slice5: BLogicSlice PORT MAP(
    S0 => S0,
    S1 => S1,
	B0 => B(11),
   	Y0 => Y(11)
);               
 slice6: BLogicSlice PORT MAP(
    S0 => S0,
    S1 => S1,
	B0 => B(10),
   	Y0 => Y(10)
 );               
slice7: BLogicSlice PORT MAP(
    S0 => S0,
    S1 => S1,
	B0 => B(9),
   	Y0 => Y(9)
   ); 
slice8: BLogicSlice PORT MAP(
    S0 => S0,
    S1 => S1,
	B0 => B(8),
   	Y0 => Y(8)
     );      
slice9: BLogicSlice PORT MAP(
    S0 => S0,
    S1 => S1,
	B0 => B(7),
   	Y0 => Y(7)
);
slice10: BLogicSlice PORT MAP(
    S0 => S0,
    S1 => S1,
	B0 => B(6),
   	Y0 => Y(6)
);
slice11: BLogicSlice PORT MAP(
    S0 => S0,
    S1 => S1,
	B0 => B(5),
   	Y0 => Y(5)
);               
slice12: BLogicSlice PORT MAP(
    S0 => S0,
    S1 => S1,
	B0 => B(4),
   	Y0 => Y(4)
);              
slice13: BLogicSlice PORT MAP(
    S0 => S0,
    S1 => S1,
	B0 => B(3),
   	Y0 => Y(3)
);               
slice14: BLogicSlice PORT MAP(
    S0 => S0,
    S1 => S1,
	B0 => B(2),
   	Y0 => Y(2)
 );               
slice15: BLogicSlice PORT MAP(
    S0 => S0,
    S1 => S1,
	B0 => B(1),
   	Y0 => Y(1)
   ); 
slice16: BLogicSlice PORT MAP(
    S0 => S0,
    S1 => S1,
	B0 => B(0),
   	Y0 => Y(0)
);      

end behavioral;