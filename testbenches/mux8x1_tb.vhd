
library ieee;
use ieee.std_logic_1164.all;

entity tb_mux8x1 is
end tb_mux8x1;

architecture tb of tb_mux8x1 is

    component mux8x1
        port (s0  : in std_logic;
              s1  : in std_logic;
              s2  : in std_logic;
              in1 : in std_logic;
              in2 : in std_logic;
              in3 : in std_logic;
              in4 : in std_logic;
              in5 : in std_logic;
              in6 : in std_logic;
              in7 : in std_logic;
              in8 : in std_logic;
              z   : out std_logic);
    end component;

    signal s0  : std_logic;
    signal s1  : std_logic;
    signal s2  : std_logic;
    signal in1 : std_logic;
    signal in2 : std_logic;
    signal in3 : std_logic;
    signal in4 : std_logic;
    signal in5 : std_logic;
    signal in6 : std_logic;
    signal in7 : std_logic;
    signal in8 : std_logic;
    signal z   : std_logic;

begin

    dut : mux8x1
    port map (s0  => s0,
              s1  => s1,
              s2  => s2,
              in1 => in1,
              in2 => in2,
              in3 => in3,
              in4 => in4,
              in5 => in5,
              in6 => in6,
              in7 => in7,
              in8 => in8,
              z   => z);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        s0 <= '0';
        s1 <= '0';
        s2 <= '0';
        in1 <= '1';
        in2 <= '0';
        in3 <= '0';
        in4 <= '0';
        in5 <= '0';
        in6 <= '0';
        in7 <= '0';
        in8 <= '0';

        wait for 10ns;

        s0 <= '1';
        s1 <= '1';
        s2 <= '1';
        in1 <= '0';
        in2 <= '1';
        in3 <= '0';
        in4 <= '1';
        in5 <= '1';
        in6 <= '0';
        in7 <= '0';
        in8 <= '1';

        wait for 10ns;

        s0 <= '1';
        s1 <= '0';
        s2 <= '0';
        in1 <= '0';
        in2 <= '1';
        in3 <= '0';
        in4 <= '0';
        in5 <= '0';
        in6 <= '0';
        in7 <= '0';
        in8 <= '0';

        -- EDIT Add stimuli here

        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_mux8x1 of tb_mux8x1 is
    for tb
    end for;
end cfg_tb_mux8x1;