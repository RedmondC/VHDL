library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reg is
	PORT(
		D: IN std_logic_vector(15 downto 0);
		load: IN std_logic;
		Clk: IN std_logic;
		Q: OUT std_logic_vector(15 downto 0));
END reg;

architecture Behavioral of reg is
constant gate_delay: Time:= 1ns;
begin
    process(Clk)
    begin
        if Clk = '1' then
            if load='1' then
               Q <= D after gate_delay;
            end if;
        end if;
    end process; 
end Behavioral;