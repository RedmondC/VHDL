library ieee;
use ieee.std_logic_1164.all;

entity tb_halfAdder is
end tb_halfAdder;

architecture tb of tb_halfAdder is

    component halfAdder
        port (A        : in std_logic;
              B        : in std_logic;
              Sum      : out std_logic;
              CarryOut : out std_logic);
    end component;

    signal A        : std_logic;
    signal B        : std_logic;
    signal Sum      : std_logic;
    signal CarryOut : std_logic;

begin

    dut : halfAdder
    port map (A        => A,
              B        => B,
              Sum      => Sum,
              CarryOut => CarryOut);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        A <= '0';
        B <= '0';

        wait for 10ns;
        
        A <= '0';
        B <= '1';
        
        wait for 10ns;
        
        A <= '1';
        B <= '0';
        
        wait for 10ns;
        
        A <= '1';
        B <= '1';
        -- EDIT Add stimuli here

        wait;
    end process;

end tb;
