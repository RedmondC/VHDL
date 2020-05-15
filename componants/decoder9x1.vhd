library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder9x1 is
    Port ( s0 : in  STD_LOGIC;
			s1 : in  STD_LOGIC;
			s2 : in  STD_LOGIC;
			s3 : in STD_LOGIC;
           out1 : out  STD_LOGIC;
           out2 : out  STD_LOGIC;
           out3 : out  STD_LOGIC;
           out4 : out  STD_LOGIC;
		   out5 : out  STD_LOGIC;
           out6 : out  STD_LOGIC;
           out7 : out  STD_LOGIC;
           out8 : out  STD_LOGIC;
           out9 : out STD_LOGIC);
end decoder9x1;

architecture Behavioral of decoder9x1 is

begin

	out1<= ((not s3) and (not s2) and (not s1) 	and (not s0)) after 1 ns;
	out2<= ((not s3) and (not s2) and (not s1)   	 and s0) 	  after 1 ns;
	out3<= ((not s3) and (not s2) 	   and s1 	and (not s0)) after 1 ns;
	out4<= ((not s3) and (not s2) 	   and s1 		 and s0) 	  after 1 ns;
	out5<= ((not s3) 	  and s2  and (not s1) 	and (not s0)) after 1 ns;
	out6<= ((not s3) 	  and s2  and (not s1) 		 and s0) 	  after 1 ns;
	out7<= ((not s3) 	  and s2  	   and s1 	and (not s0)) after 1 ns;
	out8<= ((not s3) 	  and s2  	   and s1 		 and s0) 	  after 1 ns;
	out9<= ( 	 s3  and (not s2) and (not s1)	and (not s0)) after 1 ns;
end Behavioral;