library ieee;
use ieee.std_logic_1164.all;

entity tb_MemoryM is
end tb_MemoryM;

architecture tb of tb_MemoryM is

    component MemoryM
        port (InputIndex : in std_logic_vector (15 downto 0);
              dataIn     : in std_logic_vector (15 downto 0);
              MW         : in std_logic;
              dataOut    : out std_logic_vector (15 downto 0));
    end component;

    signal InputIndex : std_logic_vector (15 downto 0);
    signal dataIn     : std_logic_vector (15 downto 0);
    signal MW         : std_logic;
    signal dataOut    : std_logic_vector (15 downto 0);

begin

    dut : MemoryM
    port map (InputIndex => InputIndex,
              dataIn     => dataIn,
              MW         => MW,
              dataOut    => dataOut);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        InputIndex <= "0000000000000100";
        dataIn     <= "0001110111011010";
        MW         <= '0';

        wait for 10ns;

        InputIndex <= "0000000000000100";
        dataIn     <= "0001110111011010";
        MW         <= '1';

        wait for 10ns;
        
        InputIndex <= "0000000000010100";
        dataIn     <= "0001000001011010";
        MW         <= '0';

        wait for 10ns;

        InputIndex <= "0000000000010100";
        dataIn     <= "0001000001011010";
        MW         <= '1';

        wait for 10ns;
        
        InputIndex <= "1111110111111010";
        dataIn     <= "0001000001011010";
        MW         <= '0';

        wait for 10ns;

        InputIndex <= "1111110111111010";
        dataIn     <= "0001000001011010";
        MW         <= '1';
        wait for 10ns;
        -- EDIT Add stimuli here

        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_MemoryM of tb_MemoryM is
    for tb
    end for;
end cfg_tb_MemoryM;