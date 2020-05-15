library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux3x1 is
    Port ( s : in  STD_LOGIC_VECTOR(1 downto 0);
           in0 : in  STD_LOGIC;
           in1 : in  STD_LOGIC;
           in2 : in  STD_LOGIC;
           z : out  STD_LOGIC);
end mux3x1;

architecture Behavioral of mux3x1 is

begin
        z <= in0 when s(1) = '0' and s(0) = '0' else
			in1 when s(1) = '0' and s(0) = '1' else
			in2 when s(1) = '1' and s(0) = '0' else
			'0';
	
end Behavioral;