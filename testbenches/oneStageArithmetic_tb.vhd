-- Testbench automatically generated online
-- at http://vhdl.lapinoo.net
-- Generation date : 5.4.2020 11:48:56 GMT

library ieee;
use ieee.std_logic_1164.all;

entity tb_oneStageArithmetic is
end tb_oneStageArithmetic;

architecture tb of tb_oneStageArithmetic is

    component oneStageArithmetic
        port (A    : in std_logic;
              B    : in std_logic;
              s0   : in std_logic;
              s1   : in std_logic;
              Cin  : in std_logic;
              Cout : out std_logic;
              Z    : out std_logic);
    end component;

    signal A    : std_logic;
    signal B    : std_logic;
    signal s0   : std_logic;
    signal s1   : std_logic;
    signal Cin  : std_logic;
    signal Cout : std_logic;
    signal Z    : std_logic;

begin

    dut : oneStageArithmetic
    port map (A    => A,
              B    => B,
              s0   => s0,
              s1   => s1,
              Cin  => Cin,
              Cout => Cout,
              Z    => Z);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        A <= '0';
        B <= '0';
        s0 <= '0';
        s1 <= '0';
        Cin <= '1';
        
        wait for 10ns;
        
        A <= '0';
        B <= '1';
        s0 <= '1';
        s1 <= '0';
        Cin <= '1';
        
        wait for 10ns;
        
        A <= '1';
        B <= '1';
        s0 <= '1';
        s1 <= '1';
        Cin <= '0';
        
        wait for 10ns;
        

        -- EDIT Add stimuli here

        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_oneStageArithmetic of tb_oneStageArithmetic is
    for tb
    end for;
end cfg_tb_oneStageArithmetic;