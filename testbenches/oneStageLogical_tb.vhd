library ieee;
use ieee.std_logic_1164.all;

entity tb_oneStageLogical is
end tb_oneStageLogical;

architecture tb of tb_oneStageLogical is

    component oneStageLogical
        port (A  : in std_logic;
              B  : in std_logic;
              s0 : in std_logic;
              s1 : in std_logic;
              G  : out std_logic);
    end component;

    signal A  : std_logic;
    signal B  : std_logic;
    signal s0 : std_logic;
    signal s1 : std_logic;
    signal G  : std_logic;

begin

    dut : oneStageLogical
    port map (A  => A,
              B  => B,
              s0 => s0,
              s1 => s1,
              G  => G);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        A <= '0';
        B <= '0';
        s0 <= '0';
        s1 <= '0';

        wait for 10ns;

        A <= '1';
        B <= '0';
        s0 <= '0';
        s1 <= '1';

        wait for 10 ns;

        A <= '1';
        B <= '1';
        s0 <= '0';
        s1 <= '0';

        wait for 10 ns;

        A <= '1';
        B <= '1';
        s0 <= '1';
        s1 <= '1';

        -- EDIT Add stimuli here

        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_oneStageLogical of tb_oneStageLogical is
    for tb
    end for;
end cfg_tb_oneStageLogical;