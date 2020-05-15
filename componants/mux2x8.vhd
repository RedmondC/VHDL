library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2x8 is
    Port ( s0 : in  STD_LOGIC;
           in1 : in  STD_LOGIC_vector(7 downto 0);
           in2 : in  STD_LOGIC_vector(7 downto 0);
            z : out  STD_LOGIC_vector(7 downto 0));
end mux2x8;

architecture Behavioral of mux2x8 is

begin
        z <= in1 after 1ns when s0 = '0'else
			in2 after 1ns when s0 = '1' else
			"00000000" after 1ns;
	
end Behavioral;