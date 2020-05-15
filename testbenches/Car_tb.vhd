-- Testbench automatically generated online
-- at http://vhdl.lapinoo.net
-- Generation date : 17.4.2020 14:29:57 GMT

library ieee;
use ieee.std_logic_1164.all;

entity tb_Car is
end tb_Car;

architecture tb of tb_Car is

    component Car
        port (Input  : in std_logic_vector (7 downto 0);
              SelectIn : in std_logic;
              Reset  : in std_logic;
              Z      : out std_logic_vector (7 downto 0));
    end component;

    signal Input  : std_logic_vector (7 downto 0);
    signal SelectIn : std_logic;
    signal Reset  : std_logic;
    signal Z      : std_logic_vector (7 downto 0);

begin

    dut : Car
    port map (Input  => Input,
              SelectIn => SelectIn,
              Reset  => Reset,
              Z      => Z);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed

        Input <= "01100110";
        SelectIn <= '0';
        Reset <= '0';

        wait for 10ns;

        Input <= "01100110";
        SelectIn <= '1';
        Reset <= '0';

        wait for 10ns;

        Input <= "01100110";
        SelectIn <= '1';
        Reset <= '1';

        wait for 10ns;

        Input <= "01100110";
        SelectIn <= '0';
        Reset <= '1';
        
        wait for 10ns;

        Input <= "01100110";
        SelectIn <= '0';
        Reset <= '0';
        
        wait for 10ns;

        Input <= "01100111";
        SelectIn <= '0';
        Reset <= '0';
        
        wait for 10ns;

        Input <= "01101000";
        SelectIn <= '0';
        Reset <= '0';

        -- EDIT Add stimuli here

        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_Car of tb_Car is
    for tb
    end for;
end cfg_tb_Car;