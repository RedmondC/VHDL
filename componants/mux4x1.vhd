library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux4x1 is
    Port ( s0 : in  STD_LOGIC;
    	   s1 : in STD_LOGIC;
           in1 : in  STD_LOGIC;
           in2 : in  STD_LOGIC;
           in3 : in  STD_LOGIC;
           in4 : in  STD_LOGIC;
           z : out  STD_LOGIC);
end mux4x1;

architecture Behavioral of mux4x1 is

begin
        z <= in1 after 1ns when s0 = '0' and s1 = '0' else
			in2 after 1ns when s0 = '0' and s1 = '1' else
			in3 after 1ns when s0 = '1' and s1 = '0' else
			in4 after 1ns when s0 = '1' and s1 = '1' else
			'0' after 1ns;
	
end Behavioral;