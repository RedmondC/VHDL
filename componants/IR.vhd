library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity IR is
    port (
			input : in std_logic_vector(15 downto 0);
			IL : in std_logic;

			Opcode : out std_logic_vector(7 downto 0);
			DR : out std_logic_vector(2 downto 0);
			SA : out std_logic_vector(2 downto 0);
			SB : out std_logic_vector(2 downto 0)
		);
end IR;

architecture Behavioral of IR is

begin

    Opcode(7) <= '0' after 1ns when IL ='1';
    Opcode(6 downto 0) <= input(15 downto 9) after 1ns when IL = '1'; 
    DR 	   <= input(8  downto 6) after 1ns when IL = '1';
	SA 	   <= input(5  downto 3) after 1ns when IL = '1';
	SB 	   <= input(2  downto 0) after 1ns when IL = '1';
	
end Behavioral;