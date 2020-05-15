
library ieee;
use ieee.std_logic_1164.all;

entity tb_mux3x1 is
end tb_mux3x1;

architecture tb of tb_mux3x1 is

    component mux3x1
        port (s   : in std_logic_vector (1 downto 0);
              in0 : in std_logic;
              in1 : in std_logic;
              in2 : in std_logic;
              z   : out std_logic);
    end component;

    signal s   : std_logic_vector (1 downto 0);
    signal in0 : std_logic;
    signal in1 : std_logic;
    signal in2 : std_logic;
    signal z   : std_logic;

begin

    dut : mux3x1
    port map (s   => s,
              in0 => in0,
              in1 => in1,
              in2 => in2,
              z   => z);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        s <= (others => '0');
        in0 <= '1';
        in1 <= '0';
        in2 <= '0';
        
        wait for 10ns;
        
        s <= "01";
        in0 <= '0';
        in1 <= '1';
        in2 <= '0';
        
        wait for 10ns;
        
        s <= "10";
        in0 <= '0';
        in1 <= '1';
        in2 <= '1';

        -- EDIT Add stimuli here

        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_mux3x1 of tb_mux3x1 is
    for tb
    end for;
end cfg_tb_mux3x1;