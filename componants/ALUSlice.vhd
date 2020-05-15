library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALUSlice  is
	Port ( 
		A : in STD_LOGIC;
		B : in STD_LOGIC;
		C : in STD_LOGIC;
		s0 : in  STD_LOGIC;
		s1 : in  STD_LOGIC;
		s2 : in STD_LOGIC;
		Gout : out STD_LOGIC;
		Cout : out STD_LOGIC);
end ALUSlice;

architecture Behavioral of ALUSlice is
		component mux2x1 is
			port (
				s0 : in  STD_LOGIC;
	           	in1 : in  STD_LOGIC;
	           	in2 : in  STD_LOGIC;
	           	z : out  STD_LOGIC);
		end component mux2x1;

		component oneStageArithmetic is
			Port ( 
				A : in STD_LOGIC;
				B : in STD_LOGIC;
				s0 : in  STD_LOGIC;
				s1 : in  STD_LOGIC;
				Cin : in STD_LOGIC;
				Cout : out STD_LOGIC;
				Z : out STD_LOGIC);
		end component oneStageArithmetic;

		component oneStageLogical is
			Port ( 
				A : in STD_LOGIC;
				B : in STD_LOGIC;
				s0 : in  STD_LOGIC;
				s1 : in  STD_LOGIC;
				G : out STD_LOGIC);
		end component oneStageLogical;
		
signal Z,G : STD_LOGIC;
begin
		mux: mux2x1 port map(
			s0 => s2,
	   		in1  => Z,
	    	in2  => G,
			z => Gout
		);

		OSA: oneStageArithmetic port map(
			A => A,
			B => B,
			s0 => s0,
			s1 => s1,
			Cin => C,
			Cout => Cout,
			Z => Z
		);

		OSL: oneStageLogical port map(
			A  => A,
			B  => B,
			s0 => s0,
			s1 => s1,
			G  => G
		);
		
end Behavioral;