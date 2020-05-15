library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ZeroFill is
	Port ( 
		Input : in STD_LOGIC_VECTOR(3 downto 0);
		Z : out STD_LOGIC_VECTOR(15 downto 0));
end ZeroFill;

architecture Behavioral of ZeroFill is
begin
    Z(3 downto 0) <= Input;
    Z(15 downto 4) <= "000000000000";

end Behavioral;