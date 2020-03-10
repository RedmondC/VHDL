library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fulladder is
	Port ( 
		A : in STD_LOGIC;
		B : in STD_LOGIC;
		CarryIn : in STD_LOGIC_VECTOR(15 downto 0);
		Sum : out STD_LOGIC_VECTOR(15 downto 0);
		CarryOut : out STD_LOGIC_VECTOR(15 downto 0));
end fulladder;

architecture Behavioral of fulladder is
	
	component halfadder 
		Port ( A : in  STD_LOGIC;
		   B : in  STD_LOGIC;
           Sum : out  STD_LOGIC_VECTOR (15 downto 0);
		   CarryOut : out std_logic_vector(15 downto 0)
		   ); 
	end component;

	constant timeDelay : time := 1ns;
begin
        hf1: halfadder port map(
			A => A;
			B => B;
			Sum => hf1_sum;
			CarryOut => hf1_carry;
		);
		
		hf2: halfadder port map(
			A => CarryIn;
			B => hf1_sum;
			Sum => hf2_sum;
			CarryOut => hf2_carry;
		);
	
	
		Sum <= hf2_sum;
		CarryOut <= hf1_carry or hf2_carry;
end Behavioral;