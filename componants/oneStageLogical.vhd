library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity oneStageLogical  is
	Port ( 
		A : in  STD_LOGIC;
		B : in  STD_LOGIC;
		s0 : in  STD_LOGIC;
		s1 : in  STD_LOGIC;
		G : out  STD_LOGIC);
end oneStageLogical;

architecture Behavioral of oneStageLogical is
		component mux4x1 is
			port (
				s0 : in  STD_LOGIC;
				s1 : in  STD_LOGIC;
	           	in1 : in  STD_LOGIC;
	           	in2 : in  STD_LOGIC;
	           	in3 : in  STD_LOGIC;
	           	in4 : in  STD_LOGIC;
	           	z : out  STD_LOGIC);
		end component mux4x1;

signal muxin1,muxin2,muxin3,muxin4 : std_logic;

begin
        muxin1 <= A AND B;
        muxin2 <= A OR B;
        muxin3 <= A XOR B;
        muxin4 <= NOT A;
        
		mux: mux4x1 port map(
			s0 => s1,
			s1 => s0,
	   		in1 => muxin1,
	    	in2 => muxin2,
			in3 => muxin3,
			in4 =>  muxin4,
			z => G
		);

end Behavioral;