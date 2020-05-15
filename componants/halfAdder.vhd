library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity halfAdder is
    Port ( A : in  STD_LOGIC;
		   B : in  STD_LOGIC;
           Sum : out  STD_LOGIC;
		   CarryOut : out std_logic);
end halfAdder;

architecture Behavioral of halfAdder is

begin
        Sum <= A xor B;
		CarryOut <= A and B;
	
end Behavioral;