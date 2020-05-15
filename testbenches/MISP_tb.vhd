library ieee;
use ieee.std_logic_1164.all;

entity tb_MISP is
end tb_MISP;

architecture tb of tb_MISP is

    component MISP
        port (Clk   : in std_logic;
              Reset : in std_logic);
    end component;

    signal Clk   : std_logic;
    signal Reset : std_logic;

    constant TbPeriod : time := 10 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : MISP
    port map (Clk   => Clk,
              Reset => Reset);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that Clk is really your main clock signal
    Clk <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        Reset <= '0';

        -- EDIT Add stimuli here
        wait for 100 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_MISP of tb_MISP is
    for tb
    end for;
end cfg_tb_MISP;