library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity halfadder is
    Port ( A : in  STD_LOGIC;
		   B : in  STD_LOGIC;
           Sum : out  STD_LOGIC_VECTOR (15 downto 0);
		   CarryOut : out std_logic_vector(15 downto 0));
end halfadder;

architecture Behavioral of halfadder is

	constant timeDelay : time := 1ns;
begin
        Sum <= A = '1' xor B = '1' after timeDelay
		
		CarryOut <= A and B after timeDelay 
	
end Behavioral;