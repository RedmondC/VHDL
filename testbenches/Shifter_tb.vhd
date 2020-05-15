library ieee;
use ieee.std_logic_1164.all;

entity tb_Shifter is
end tb_Shifter;

architecture tb of tb_Shifter is

    component Shifter
        port (InputReg  : in std_logic_vector (15 downto 0);
              Dir       : in std_logic_vector (1 downto 0);
              IL        : in std_logic;
              IR        : in std_logic;
              OutputReg : out std_logic_vector (15 downto 0));
    end component;

    signal InputReg  : std_logic_vector (15 downto 0);
    signal Dir       : std_logic_vector (1 downto 0);
    signal IL        : std_logic;
    signal IR        : std_logic;
    signal OutputReg : std_logic_vector (15 downto 0);

begin

    dut : Shifter
    port map (InputReg  => InputReg,
              Dir       => Dir,
              IL        => IL,
              IR        => IR,
              OutputReg => OutputReg);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        InputReg <= "1111001010001101";
        Dir <= (others => '0');
        IL <= '0';
        IR <= '0';

        wait for 10ns;

        InputReg <= "1111001010001101";
        Dir <= (others => '1');
        IL <= '0';
        IR <= '0';

        wait for 10ns;

        InputReg <= "1111001010001101";
        Dir <= "01";
        IL <= '0';
        IR <= '0';

        wait for 10ns;

        InputReg <= "1111001010001101";
        Dir <= "10";
        IL <= '0';
        IR <= '0';

        -- EDIT Add stimuli here

        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_Shifter of tb_Shifter is
    for tb
    end for;
end cfg_tb_Shifter;