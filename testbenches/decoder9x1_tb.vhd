library ieee;
use ieee.std_logic_1164.all;

entity tb_decoder9x1 is
end tb_decoder9x1;

architecture tb of tb_decoder9x1 is

    component decoder9x1
        port (s0   : in std_logic;
              s1   : in std_logic;
              s2   : in std_logic;
              s3   : in std_logic;
              out1 : out std_logic;
              out2 : out std_logic;
              out3 : out std_logic;
              out4 : out std_logic;
              out5 : out std_logic;
              out6 : out std_logic;
              out7 : out std_logic;
              out8 : out std_logic;
              out9 : out std_logic);
    end component;

    signal s0   : std_logic;
    signal s1   : std_logic;
    signal s2   : std_logic;
    signal s3   : std_logic;
    signal out1 : std_logic;
    signal out2 : std_logic;
    signal out3 : std_logic;
    signal out4 : std_logic;
    signal out5 : std_logic;
    signal out6 : std_logic;
    signal out7 : std_logic;
    signal out8 : std_logic;
    signal out9 : std_logic;

begin

    dut : decoder9x1
    port map (s0   => s0,
              s1   => s1,
              s2   => s2,
              s3   => s3,
              out1 => out1,
              out2 => out2,
              out3 => out3,
              out4 => out4,
              out5 => out5,
              out6 => out6,
              out7 => out7,
              out8 => out8,
              out9 => out9);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        s0 <= '0';
        s1 <= '1';
        s2 <= '0';
        s3 <= '0';

        wait for 10ns;

        s0 <= '0';
        s1 <= '1';
        s2 <= '1';
        s3 <= '0';

        wait for 10ns;

        s0 <= '0';
        s1 <= '0';
        s2 <= '0';
        s3 <= '1';

        -- EDIT Add stimuli here

        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_decoder9x1 of tb_decoder9x1 is
    for tb
    end for;
end cfg_tb_decoder9x1;