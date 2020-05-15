
library ieee;
use ieee.std_logic_1164.all;

entity tb_controlMemory is
end tb_controlMemory;

architecture tb of tb_controlMemory is

    component controlMemory
        port (Input       : in std_logic_vector (7 downto 0);
              controlWord : out std_logic_vector (27 downto 0));
    end component;

    signal Input       : std_logic_vector (7 downto 0);
    signal controlWord : std_logic_vector (27 downto 0);

begin

    dut : controlMemory
    port map (Input       => Input,
              controlWord => controlWord);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        Input <= "00000000";

        wait for 10ns;

        Input <= "00001001";

        wait for 10ns;

        Input <= "00001010";
        -- EDIT Add stimuli here

        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_controlMemory of tb_controlMemory is
    for tb
    end for;
end cfg_tb_controlMemory;