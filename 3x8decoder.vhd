library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder is
    Port ( s0 : in  STD_LOGIC;
			s1 : in  STD_LOGIC;
			s2 : in  STD_LOGIC;
           out1 : out  STD_LOGIC;
           out2 : out  STD_LOGIC;
           out3 : out  STD_LOGIC;
           out4 : out  STD_LOGIC;
		   out5 : out  STD_LOGIC;
           out6 : out  STD_LOGIC;
           out7 : out  STD_LOGIC;
           out8 : out  STD_LOGIC);
end decoder;

architecture Behavioral of decoder is

begin

	out1<= ((not s2) and (not s1) and (not s0)) after 5 ns;
	out2<= ((not s2) and (not s1)  and s0) after 5 ns;
	out3<= ((not s2) and s1 and (not s0)) after 5 ns;
	out4<= ((not s2) and s1 and s0) after 5 ns;
	out5<= (s2 and (not s1) and (not s0)) after 5 ns;
	out6<= (s2 and (not s1) and s0) after 5 ns;
	out7<= (s2 and s1 and (not s0)) after 5 ns;
	out8<= (s2 and s1 and s0) after 5 ns;
	
end Behavioral;