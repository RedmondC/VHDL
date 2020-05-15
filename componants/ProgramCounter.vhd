library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ProgramCounter is
    Port ( 
		Input : in STD_LOGIC_VECTOR(15 downto 0);
		Load : in std_LOGIC;
		Increment : in std_LOGIC;
		Reset : in std_LOGIC;
		Pout : out STD_LOGIC_VECTOR(15 downto 0));
end ProgramCounter;

architecture Behavioral of ProgramCounter is
signal temp : STD_LOGIC_VECTOR(15 downto 0);
begin
	process(Reset, Load, Increment)
	variable PC : STD_LOGIC_VECTOR(15 downto 0);
	variable tempPC : integer;
	variable tempInc : STD_LOGIC_VECTOR(15 downto 0);
	
	begin
		if(Reset = '1') then PC := x"0000";
		elsif(Load = '1') then 
			PC := PC + Input;
		elsif(Increment = '1') then
			tempPC := conv_integer(PC);
			tempPC := tempPC + conv_integer(1);
			tempInc := conv_std_logic_vector(tempPC, 16); 
			PC := tempInc; 
		end if;
		Pout <= PC after 1ns;
	end process;	
	
end Behavioral;