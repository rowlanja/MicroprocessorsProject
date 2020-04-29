library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity LogicUnit is
Port (  
	s0 :  in std_logic; -- s0 s1 s2 for mux 1
    s1 : in std_logic;
    A_data : in std_logic_vector(15 downto 0);
    B_data : in std_logic_vector(15 downto 0);
	G_data : out std_logic_vector(15 downto 0)
	);
end LogicUnit;

architecture Behavioral of LogicUnit is 
COMPONENT LogicUnitSlice 
PORT(
	sel0, sel1, A, B:in std_logic;
	G:out std_logic
);
END COMPONENT;

begin 
slice1: LogicUnitSlice PORT MAP(
    sel0 => S0,
    sel1 => S1,
	A => A_data(15),
   	B => B_data(15),
	G => G_data(15)
);
slice2: LogicUnitSlice PORT MAP(
    sel0 => S0,
    sel1 => S1,
	A => A_data(14),
   	B => B_data(14),
	G => G_data(14)
);
slice3: LogicUnitSlice PORT MAP(
	sel0 => S0,
    sel1 => S1,
	A => A_data(13),
   	B => B_data(13),
	G => G_data(13)
);               
slice4: LogicUnitSlice PORT MAP(
	sel0 => S0,
    sel1 => S1,
	A => A_data(12),
   	B => B_data(12),
	G => G_data(12)

);              
slice5: LogicUnitSlice PORT MAP(
    sel0 => S0,
    sel1 => S1,
	A => A_data(11),
   	B => B_data(11),
	G => G_data(11)
);         
         
 slice6: LogicUnitSlice PORT MAP(
    sel0 => S0,
    sel1 => S1,
	A => A_data(10),
   	B => B_data(10),
	G => G_data(10)
 );               
slice7: LogicUnitSlice PORT MAP(
    sel0 => S0,
    sel1 => S1,
	A => A_data(9),
   	B => B_data(9),
	G => G_data(9)

   ); 
slice8: LogicUnitSlice PORT MAP(
    sel0 => S0,
    sel1 => S1,
	A => A_data(8),
   	B => B_data(8),
	G => G_data(8)

     );      
slice9: LogicUnitSlice PORT MAP(
	sel0 => S0,
    sel1 => S1,
	A => A_data(7),
   	B => B_data(7),
	G => G_data(7)

);
slice10: LogicUnitSlice PORT MAP(
    sel0 => S0,
    sel1 => S1,
	A => A_data(6),
   	B => B_data(6),
	G => G_data(6)
);
slice11: LogicUnitSlice PORT MAP(
    sel0 => S0,
    sel1 => S1,
	A => A_data(5),
   	B => B_data(5),
	G => G_data(5)
);               
slice12: LogicUnitSlice PORT MAP(
    sel0 => S0,
    sel1 => S1,
	A => A_data(4),
   	B => B_data(4),
	G => G_data(4)
);              
slice13: LogicUnitSlice PORT MAP(
    sel0 => S0,
    sel1 => S1,
	A => A_data(3),
   	B => B_data(3),
	G => G_data(3)
);               
 slice14: LogicUnitSlice PORT MAP(
    sel0 => S0,
    sel1 => S1,
	A => A_data(2),
   	B => B_data(2),
	G => G_data(2)
 );               
slice15: LogicUnitSlice PORT MAP(
    sel0 => S0,
    sel1 => S1,
	A => A_data(1),
   	B => B_data(1),
	G => G_data(1)
   ); 
slice16: LogicUnitSlice PORT MAP(
    sel0 => S0,
    sel1 => S1,
	A => A_data(0),
   	B => B_data(0),
	G => G_data(0)
    );

    
end behavioral;