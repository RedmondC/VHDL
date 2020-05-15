library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity oneStageArithmetic  is
	Port ( 
				A : in STD_LOGIC;
				B : in STD_LOGIC;
				s0 : in  STD_LOGIC;
				s1 : in  STD_LOGIC;
				Cin : in STD_LOGIC ;
				Cout : out STD_LOGIC ;
				Z : out STD_LOGIC);
end oneStageArithmetic;

architecture Behavioral of oneStageArithmetic is
		component fullAdder is
			Port ( A : in  STD_LOGIC;
		   B : in  STD_LOGIC;
		   CarryIn : in STD_LOGIC;
           Sum : out  STD_LOGIC;
		   CarryOut : out std_logic
		   );
		end component fullAdder;

signal FAB : std_logic;

begin
        FAB  <= (b and s0) or ((not B) and s1);
        
		FA : fullAdder port map(
		   A => A,
		   B => FAB,
		   CarryIn => Cin,
           Sum => Z, 
		   CarryOut => Cout 
		   );

end Behavioral;