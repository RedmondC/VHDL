library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Extend is
    port (	inDR : in std_logic_vector(2 downto 0);
			inSB : in std_logic_vector(2 downto 0);

			output : out std_logic_vector(15 downto 0));
end Extend;

architecture Behavioral of Extend is
signal temp : std_logic_vector(15 downto 0);
begin
	temp(2 downto 0) <= inSB;
	temp(5 downto 3) <= inDR;

	temp(15 downto 6) <= "0000000000" when temp(5) = '0' else  "1111111111";
	output <= temp;
end Behavioral;