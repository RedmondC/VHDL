-- Testbench automatically generated online
-- at http://vhdl.lapinoo.net
-- Generation date : 4.4.2020 10:46:10 GMT

library ieee;
use ieee.std_logic_1164.all;

entity tb_register_file is
end tb_register_file;

architecture tb of tb_register_file is

    component register_file
        port (load_enable : in std_logic;
              DData       : in std_logic_vector (15 downto 0);
              src_A       : in std_logic_vector (3 downto 0);
              src_B       : in std_logic_vector (3 downto 0);
              des         : in std_logic_vector (3 downto 0);
              Clk         : in std_logic;
              Aout        : out std_logic_vector (15 downto 0);
              Bout        : out std_logic_vector (15 downto 0));
    end component;

    signal load_enable : std_logic;
    signal DData       : std_logic_vector (15 downto 0);
    signal src_A       : std_logic_vector (3 downto 0);
    signal src_B       : std_logic_vector (3 downto 0);
    signal des         : std_logic_vector (3 downto 0);
    signal Clk         : std_logic;
    signal Aout        : std_logic_vector (15 downto 0);
    signal Bout        : std_logic_vector (15 downto 0);

    constant TbPeriod : time := 5 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : register_file
    port map (load_enable => load_enable,
              DData       => DData,
              src_A       => src_A,
              src_B       => src_B,
              des         => des,
              Clk         => Clk,
              Aout        => Aout,
              Bout        => Bout);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that Clk is really your main clock signal
    Clk <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        load_enable <= '1';
        DData <= "0000000011111111";
        src_A <= "0000";
        src_B <= "0000";
        des <= "0000";

        -- EDIT Add stimuli here
        wait for TbPeriod;

        load_enable <= '1';
        DData <= "1100011011111111";
        src_A <= "0000";
        src_B <= "0000";
        des <= "0001";

        -- EDIT Add stimuli here
        wait for TbPeriod;

        load_enable <= '1';
        DData <= "0000000000000000";
        src_A <= "0001";
        src_B <= "0000";
        des <= "0010";
        
        wait for TbPeriod;

        load_enable <= '1';
        DData <= "1100111011111111";
        src_A <= "0001";
        src_B <= "0010";
        des <= "0011";
        
        wait for TbPeriod;

        load_enable <= '1';
        DData <= "1100010000111111";
        src_A <= "0000";
        src_B <= "0011";
        des <= "0100";
        
        wait for TbPeriod;

        load_enable <= '1';
        DData <= "1100011011111000";
        src_A <= "0100";
        src_B <= "0010";
        des <= "0101";
        
        wait for TbPeriod;

        load_enable <= '1';
        DData <= "1100011011111111";
        src_A <= "0000";
        src_B <= "0000";
        des <= "1000";
        
        wait for TbPeriod;

        load_enable <= '1';
        DData <= "1100011011111111";
        src_A <= "0000";
        src_B <= "0000";
        des <= "1000";

        -- EDIT Add stimuli here
        wait for TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_register_file of tb_register_file is
    for tb
    end for;
end cfg_tb_register_file;