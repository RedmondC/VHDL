library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2x1 is
    Port ( s0 : in  STD_LOGIC;
           in1 : in  STD_LOGIC;
           in2 : in  STD_LOGIC;
           z : out  STD_LOGIC);
end mux2x1;

architecture Behavioral of mux2x1 is

begin
        z <= in1 after 2ns when s0 = '0' else
			in2 after 2ns when s0 = '1' else
			'0' after 2ns;
	
end Behavioral;