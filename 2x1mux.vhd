library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux8x1 is
    Port ( s0 : in  STD_LOGIC;
           in1 : in  STD_LOGIC_VECTOR (15 downto 0);
           in2 : in  STD_LOGIC_VECTOR (15 downto 0);
           z : out  STD_LOGIC_VECTOR (15 downto 0));
end mux8x1;

architecture Behavioral of mux8x1 is

begin
        z <= in1 after 5ns when s0 = '0'else
			in2 after 5ns when s0 = '1' else
			"0000000000000000" after 5ns;
	
end Behavioral;