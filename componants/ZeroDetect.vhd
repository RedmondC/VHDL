library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ZeroDetect is
	Port ( 
		InputReg : in STD_LOGIC_VECTOR(15 downto 0);
		Z : out STD_LOGIC);
end ZeroDetect;

architecture Behavioral of ZeroDetect is
begin
		process(InputReg)
		begin
	        if InputReg = "0000000000000000" then 
	        	Z <= '1';
			else 
				Z <= '0';
	        end if;
        end process;
end Behavioral;