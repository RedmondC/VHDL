library ieee;
use ieee.std_logic_1164.all;

entity tb_reg is
end tb_reg;

architecture tb of tb_reg is

    component reg
        port (D    : in std_logic_vector (15 downto 0);
              load : in std_logic;
              Clk  : in std_logic;
              Q    : out std_logic_vector (15 downto 0));
    end component;

    signal D    : std_logic_vector (15 downto 0);
    signal load : std_logic;
    signal Clk  : std_logic;
    signal Q    : std_logic_vector (15 downto 0);

    constant TbPeriod : time := 10 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : reg
    port map (D    => D,
              load => load,
              Clk  => Clk,
              Q    => Q);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that Clk is really your main clock signal
    Clk <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        D <= "0011000100001100";
        load <= '1';

        -- EDIT Add stimuli here
        wait for TbPeriod;

        D <= "0011000101111100";
        load <= '0';

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_reg of tb_reg is
    for tb
    end for;
end cfg_tb_reg;