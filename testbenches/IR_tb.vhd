library ieee;
use ieee.std_logic_1164.all;

entity tb_IR is
end tb_IR;

architecture tb of tb_IR is

    component IR
        port (input  : in std_logic_vector (15 downto 0);
              IL     : in std_logic;
              Opcode : out std_logic_vector (7 downto 0);
              DR     : out std_logic_vector (2 downto 0);
              SA     : out std_logic_vector (2 downto 0);
              SB     : out std_logic_vector (2 downto 0));
    end component;

    signal input  : std_logic_vector (15 downto 0);
    signal IL     : std_logic;
    signal Opcode : std_logic_vector (7 downto 0);
    signal DR     : std_logic_vector (2 downto 0);
    signal SA     : std_logic_vector (2 downto 0);
    signal SB     : std_logic_vector (2 downto 0);

begin

    dut : IR
    port map (input  => input,
              IL     => IL,
              Opcode => Opcode,
              DR     => DR,
              SA     => SA,
              SB     => SB);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        input <= "0010001100101110";
        IL <= '0';

        wait for 10ns;

        input <= "0010001100101110";
        IL <= '1';

        wait for 10ns;

        input <= "0011111100101110";
        IL <= '1';

        wait for 10ns;

        input <= "0000111100001111";
        IL <= '0';

        wait for 10ns;

        -- EDIT Add stimuli here

        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_IR of tb_IR is
    for tb
    end for;
end cfg_tb_IR;