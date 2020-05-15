-- Testbench automatically generated online
-- at http://vhdl.lapinoo.net
-- Generation date : 4.4.2020 13:01:32 GMT

library ieee;
use ieee.std_logic_1164.all;

entity tb_ZeroFill is
end tb_ZeroFill;

architecture tb of tb_ZeroFill is

    component ZeroFill
        port (Input : in std_logic_vector (3 downto 0);
              Z     : out std_logic_vector (15 downto 0));
    end component;

    signal Input : std_logic_vector (3 downto 0);
    signal Z     : std_logic_vector (15 downto 0);

begin

    dut : ZeroFill
    port map (Input => Input,
              Z     => Z);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        Input <= "0011";
        wait for 10ns;
        Input <= "0101";
        -- EDIT Add stimuli here

        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_ZeroFill of tb_ZeroFill is
    for tb
    end for;
end cfg_tb_ZeroFill;