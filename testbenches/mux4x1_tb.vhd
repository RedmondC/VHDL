library ieee;
use ieee.std_logic_1164.all;

entity tb_mux4x1 is
end tb_mux4x1;

architecture tb of tb_mux4x1 is

    component mux4x1
        port (s0  : in std_logic;
              s1  : in std_logic;
              in1 : in std_logic;
              in2 : in std_logic;
              in3 : in std_logic;
              in4 : in std_logic;
              z   : out std_logic);
    end component;

    signal s0  : std_logic;
    signal s1  : std_logic;
    signal in1 : std_logic;
    signal in2 : std_logic;
    signal in3 : std_logic;
    signal in4 : std_logic;
    signal z   : std_logic;

begin

    dut : mux4x1
    port map (s0  => s0,
              s1  => s1,
              in1 => in1,
              in2 => in2,
              in3 => in3,
              in4 => in4,
              z   => z);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        s0 <= '0';
        s1 <= '1';
        in1 <= '0';
        in2 <= '1';
        in3 <= '1';
        in4 <= '0';

        wait for 5ns;

        s0 <= '1';
        s1 <= '1';
        in1 <= '0';
        in2 <= '1';
        in3 <= '1';
        in4 <= '0';

        wait for 5ns;

        s0 <= '1';
        s1 <= '1';
        in1 <= '0';
        in2 <= '0';
        in3 <= '0';
        in4 <= '1';

        -- EDIT Add stimuli here

        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_mux4x1 of tb_mux4x1 is
    for tb
    end for;
end cfg_tb_mux4x1;