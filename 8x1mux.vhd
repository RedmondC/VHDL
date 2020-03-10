library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux8x1 is
    Port ( s0 : in  STD_LOGIC;
			s1 : in  STD_LOGIC;
			s2 : in  STD_LOGIC;
           in1 : in  STD_LOGIC_VECTOR (15 downto 0);
           in2 : in  STD_LOGIC_VECTOR (15 downto 0);
           in3 : in  STD_LOGIC_VECTOR (15 downto 0);
           in4 : in  STD_LOGIC_VECTOR (15 downto 0);
		   in5 : in  STD_LOGIC_VECTOR (15 downto 0);
           in6 : in  STD_LOGIC_VECTOR (15 downto 0);
           in7 : in  STD_LOGIC_VECTOR (15 downto 0);
           in8 : in  STD_LOGIC_VECTOR (15 downto 0);
           z : out  STD_LOGIC_VECTOR (15 downto 0));
end mux8x1;

architecture Behavioral of mux8x1 is

begin
        z <= in1 after 5ns when s0 = '0' and s1 = '0' and s2 ='0' else
			in2 after 5ns when s0 = '0' and s1 = '0' and s2 ='1' else
			in3 after 5ns when s0 = '0' and s1 = '1' and s2 ='0' else
			in4 after 5ns when s0 = '0' and s1 = '1' and s2 ='1' else
			in5 after 5ns when s0 = '1' and s1 = '0' and s2 ='0' else
			in6 after 5ns when s0 = '1' and s1 = '0' and s2 ='1' else
			in7 after 5ns when s0 = '1' and s1 = '1' and s2 ='0' else
			in8 after 5ns when s0 = '1' and s1 = '1' and s2 ='1' else
			"0000000000000000" after 5ns;
	
end Behavioral;