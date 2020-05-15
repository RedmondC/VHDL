library ieee;
use ieee.std_logic_1164.all;

entity tb_ZeroDetect is
end tb_ZeroDetect;

architecture tb of tb_ZeroDetect is

    component ZeroDetect
        port (InputReg : in std_logic_vector (15 downto 0);
              Z        : out std_logic);
    end component;

    signal InputReg : std_logic_vector (15 downto 0);
    signal Z        : std_logic;

begin

    dut : ZeroDetect
    port map (InputReg => InputReg,
              Z        => Z);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        InputReg <= (others => '0');

        wait for 10ns;

        InputReg <= "1010101011011101";

        wait for 10 ns;

        InputReg <= (others => '0');

        -- EDIT Add stimuli here

        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_ZeroDetect of tb_ZeroDetect is
    for tb
    end for;
end cfg_tb_ZeroDetect;