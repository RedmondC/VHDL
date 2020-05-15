library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fullAdder is
	Port ( 
		A : in STD_LOGIC;
		B : in STD_LOGIC;
		CarryIn : in STD_LOGIC;
		Sum : out STD_LOGIC;
		CarryOut : out STD_LOGIC);
end fullAdder;

architecture Behavioral of fullAdder is
	
	component halfAdder 
		Port ( A : in  STD_LOGIC;
		   B : in  STD_LOGIC;
           Sum : out  STD_LOGIC;
		   CarryOut : out std_logic
		   ); 
	end component;

	constant timeDelay : time := 1ns;
signal hf1_sum , hf2_sum , hf1_carry , hf2_carry : std_logic;
begin
        hf1: halfAdder port map(
			A => A,
			B => B,
			Sum => hf1_sum,
			CarryOut => hf1_carry
		);
		
		hf2: halfAdder port map(
			A => hf1_sum,
			B => CarryIn,
			Sum => hf2_sum,
			CarryOut => hf2_carry
		);
	
	
		Sum <= hf2_sum;
		CarryOut <= hf1_carry or hf2_carry;
end Behavioral;