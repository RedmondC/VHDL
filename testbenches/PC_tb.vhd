library ieee;
use ieee.std_logic_1164.all;

entity tb_ProgramCounter is
end tb_ProgramCounter;

architecture tb of tb_ProgramCounter is

    component ProgramCounter
        port (Input     : in std_logic_vector (15 downto 0);
              Load      : in std_logic;
              Increment : in std_logic;
              Reset     : in std_logic;
              Pout      : out std_logic_vector (15 downto 0));
    end component;

    signal Input     : std_logic_vector (15 downto 0);
    signal Load      : std_logic;
    signal Increment : std_logic;
    signal Reset     : std_logic;
    signal Pout      : std_logic_vector (15 downto 0);

begin

    dut : ProgramCounter
    port map (Input     => Input,
              Load      => Load,
              Increment => Increment,
              Reset     => Reset,
              Pout      => Pout);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        Reset <= '0';
        Input <= "1100110011001100";
        Load <= '0';
        Increment <= '1';
        wait for 10ns;
        Input <= "1100110011001100";
        Load <= '1';
        Increment <= '0';
        wait for 10ns;
        Input <= "1100110011001100";
        Load <= '0';
        Increment <= '0';
        wait for 10ns;
        -- Reset generation
        -- EDIT: Check that Reset is really your reset signal
        Reset <= '1';
        wait for 10 ns;

        -- EDIT Add stimuli here

        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_ProgramCounter of tb_ProgramCounter is
    for tb
    end for;
end cfg_tb_ProgramCounter;