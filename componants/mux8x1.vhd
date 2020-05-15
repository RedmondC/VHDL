library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux8x1 is
    Port ( s0 : in  STD_LOGIC;
    	   s1 : in  STD_LOGIC;
    	   s2 : in  STD_LOGIC;
           in1 : in  STD_LOGIC;
           in2 : in  STD_LOGIC;
           in3 : in  STD_LOGIC;
           in4 : in  STD_LOGIC;
           in5 : in  STD_LOGIC;
           in6 : in  STD_LOGIC;
           in7 : in  STD_LOGIC;
           in8 : in  STD_LOGIC;
           z : out  STD_LOGIC);
end mux8x1;

architecture Behavioral of mux8x1 is

begin
        z <= in1 after 1ns when s0 = '0' and s1 = '0' and s2 = '0' else
			 in2 after 1ns when s0 = '0' and s1 = '0' and s2 = '1' else
			 in3 after 1ns when s0 = '0' and s1 = '1' and s2 = '0' else
			 in4 after 1ns when s0 = '0' and s1 = '1' and s2 = '1' else
			 in5 after 1ns when s0 = '1' and s1 = '0' and s2 = '0' else
			 in6 after 1ns when s0 = '1' and s1 = '0' and s2 = '1' else
			 in7 after 1ns when s0 = '1' and s1 = '1' and s2 = '0' else
			 in8 after 1ns when s0 = '1' and s1 = '1' and s2 = '1' else
			 '0' after 1ns;
	
end Behavioral;