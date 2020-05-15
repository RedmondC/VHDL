
library ieee;
use ieee.std_logic_1164.all;

entity tb_FU is
end tb_FU;

architecture tb of tb_FU is

    component FU
        port (dataA : in std_logic_vector (15 downto 0);
              dataB : in std_logic_vector (15 downto 0);
              Gin   : in std_logic_vector (4 downto 0);
              V     : out std_logic;
              C     : out std_logic;
              N     : out std_logic;
              Z     : out std_logic;
              F     : out std_logic_vector (15 downto 0));
    end component;

    signal dataA : std_logic_vector (15 downto 0);
    signal dataB : std_logic_vector (15 downto 0);
    signal Gin   : std_logic_vector (4 downto 0);
    signal V     : std_logic;
    signal C     : std_logic;
    signal N     : std_logic;
    signal Z     : std_logic;
    signal F     : std_logic_vector (15 downto 0);

begin

    dut : FU
    port map (dataA => dataA,
              dataB => dataB,
              Gin   => Gin,
              V     => V,
              C     => C,
              N     => N,
              Z     => Z,
              F     => F);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        dataA <= "0000000000000111";
        dataB <= "0000000000000010";
        Gin <= "00000";

        wait for 25ns;

        dataA <= "0000000000000111";
        dataB <= "0000000000000010";
        Gin <= "00001";

        wait for 25ns;

        dataA <= "0000000000000111";
        dataB <= "0000000000000010";
        Gin <= "00010";

        wait for 25ns;

        dataA <= "0000000000000111";
        dataB <= "0000000000000010";
        Gin <= "00011";

        wait for 25ns;

        dataA <= "0000000000000111";
        dataB <= "0000000000000010";
        Gin <= "00100";

        wait for 25ns;

        dataA <= "0000000000000111";
        dataB <= "0000000000000010";
        Gin <= "00101";

        wait for 25ns;

        dataA <= "0000000000000111";
        dataB <= "0000000000000010";
        Gin <= "00110";

        wait for 25ns;

        dataA <= "0000000000000111";
        dataB <= "0000000000000010";
        Gin <= "00111";

        wait for 25ns;
        
        dataA <= "0000000000000111";
        dataB <= "0000000000000010";
        Gin <= "01000";

        wait for 25ns;

        dataA <= "0000000000000111";
        dataB <= "0000000000000010";
        Gin <= "01010";

        wait for 25ns;

        dataA <= "0000000000000111";
        dataB <= "0000000000000010";
        Gin <= "01100";

        wait for 25ns;

        dataA <= "0000000000000111";
        dataB <= "0000000000000010";
        Gin <= "01110";

        wait for 25ns;
        
        dataA <= "0000000000000111";
        dataB <= "0000000000000010";
        Gin <= "10000";

        wait for 25ns;

        dataA <= "0000000000000111";
        dataB <= "0000000000000010";
        Gin <= "10100";

        wait for 25ns;

        dataA <= "0000000000000111";
        dataB <= "0000000000000010";
        Gin <= "11000";

        wait for 25ns;
        -- EDIT Add stimuli here

        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_FU of tb_FU is
    for tb
    end for;
end cfg_tb_FU;