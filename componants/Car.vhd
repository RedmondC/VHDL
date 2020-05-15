library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Car is
    Port ( 
		Input : in STD_LOGIC_VECTOR(7 downto 0);
		SelectIn : in std_LOGIC;
		Reset : in std_LOGIC;
		Z : out STD_LOGIC_VECTOR(7 downto 0));
end Car;

architecture Behavioral of Car is

begin
	process(Input, Reset, SelectIn) 
	variable TempCar : STD_LOGIC_VECTOR(7 downto 0);
	variable intCar : integer;
	begin
			if (Reset = '1') then TempCar := "00010000";
			elsif (SelectIn = '1') then TempCar := Input;
			elsif (SelectIn = '0') then 
				intCar := conv_integer(TempCar);
				intCar := intCar + conv_integer(1);
				TempCar := conv_std_logic_vector(intCar, 8);
			end if;		
			Z <= TempCar after 10ns;
	end process;		
end Behavioral;