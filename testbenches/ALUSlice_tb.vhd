
library ieee;
use ieee.std_logic_1164.all;

entity tb_ALUSlice is
end tb_ALUSlice;

architecture tb of tb_ALUSlice is

    component ALUSlice
        port (A    : in std_logic;
              B    : in std_logic;
              C    : in std_logic;
              s0   : in std_logic;
              s1   : in std_logic;
              s2   : in std_logic;
              Gout : out std_logic;
              Cout : out std_logic);
    end component;

    signal A    : std_logic;
    signal B    : std_logic;
    signal C    : std_logic;
    signal s0   : std_logic;
    signal s1   : std_logic;
    signal s2   : std_logic;
    signal Gout : std_logic;
    signal Cout : std_logic;

begin

    dut : ALUSlice
    port map (A    => A,
              B    => B,
              C    => C,
              s0   => s0,
              s1   => s1,
              s2   => s2,
              Gout => Gout,
              Cout => Cout);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        A <= '1';
        B <= '1';
        C <= '1';
        s0 <= '0';
        s1 <= '0';
        s2 <= '0';

        wait for 10ns;

        A <= '1';
        B <= '1';
        C <= '1';
        s0 <= '1';
        s1 <= '0';
        s2 <= '0';

        wait for 10ns;

        A <= '1';
        B <= '1';
        C <= '1';
        s0 <= '0';
        s1 <= '1';
        s2 <= '0';

        wait for 10ns;

        A <= '1';
        B <= '1';
        C <= '1';
        s0 <= '1';
        s1 <= '1';
        s2 <= '0';

        wait for 10ns;

        A <= '1';
        B <= '1';
        C <= '1';
        s0 <= '0';
        s1 <= '0';
        s2 <= '1';

        -- EDIT Add stimuli here

        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_ALUSlice of tb_ALUSlice is
    for tb
    end for;
end cfg_tb_ALUSlice;