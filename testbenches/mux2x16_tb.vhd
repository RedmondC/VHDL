
library ieee;
use ieee.std_logic_1164.all;

entity tb_mux2x16 is
end tb_mux2x16;

architecture tb of tb_mux2x16 is

    component mux2x16
        port (s0  : in std_logic;
              in1 : in std_logic_vector (15 downto 0);
              in2 : in std_logic_vector (15 downto 0);
              z   : out std_logic_vector (15 downto 0));
    end component;

    signal s0  : std_logic;
    signal in1 : std_logic_vector (15 downto 0);
    signal in2 : std_logic_vector (15 downto 0);
    signal z   : std_logic_vector (15 downto 0);

begin

    dut : mux2x16
    port map (s0  => s0,
              in1 => in1,
              in2 => in2,
              z   => z);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        s0 <= '0';
        in1 <= "0000110011001111";
        in2 <= "0110110011001001";

        wait for 10ns;

        s0 <= '1';
        in1 <= "0000110011001111";
        in2 <= "0110110011001001";

        wait for 10ns;

        s0 <= '0';
        in1 <= (others => '0');
        in2 <= "1111111111111111";

        -- EDIT Add stimuli here

        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_mux2x16 of tb_mux2x16 is
    for tb
    end for;
end cfg_tb_mux2x16;