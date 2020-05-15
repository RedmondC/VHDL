
library ieee;
use ieee.std_logic_1164.all;

entity tb_fullAdder is
end tb_fullAdder;

architecture tb of tb_fullAdder is

    component fullAdder
        port (A        : in std_logic;
              B        : in std_logic;
              CarryIn  : in std_logic;
              Sum      : out std_logic;
              CarryOut : out std_logic);
    end component;

    signal A        : std_logic;
    signal B        : std_logic;
    signal CarryIn  : std_logic;
    signal Sum      : std_logic;
    signal CarryOut : std_logic;

begin

    dut : fullAdder
    port map (A        => A,
              B        => B,
              CarryIn  => CarryIn,
              Sum      => Sum,
              CarryOut => CarryOut);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        A <= '0';
        B <= '0';
        CarryIn <= '0';

        wait for 10ns;

        A <= '1';
        B <= '0';
        CarryIn <= '0';

        wait for 10ns;

        A <= '0';
        B <= '1';
        CarryIn <= '0';

        wait for 10ns;

        A <= '1';
        B <= '1';
        CarryIn <= '0';

        wait for 10ns;

        A <= '1';
        B <= '0';
        CarryIn <= '1';

        wait for 10ns;

        A <= '1';
        B <= '1';
        CarryIn <= '1';

        wait for 10ns;
        -- EDIT Add stimuli here

        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_fullAdder of tb_fullAdder is
    for tb
    end for;
end cfg_tb_fullAdder;