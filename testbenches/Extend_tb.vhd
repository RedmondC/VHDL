library ieee;
use ieee.std_logic_1164.all;

entity tb_Extend is
end tb_Extend;

architecture tb of tb_Extend is

    component Extend
        port (inDR   : in std_logic_vector (2 downto 0);
              inSB   : in std_logic_vector (2 downto 0);
              output : out std_logic_vector (15 downto 0));
    end component;

    signal inDR   : std_logic_vector (2 downto 0);
    signal inSB   : std_logic_vector (2 downto 0);
    signal output : std_logic_vector (15 downto 0);

begin

    dut : Extend
    port map (inDR   => inDR,
              inSB   => inSB,
              output => output);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        inDR <= "001";
        inSB <= "100";

        wait for 10ns;

        inDR <= "111";
        inSB <= "000";

        wait for 10ns;

        inDR <= "000";
        inSB <= "111";

        -- EDIT Add stimuli here

        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_Extend of tb_Extend is
    for tb
    end for;
end cfg_tb_Extend;