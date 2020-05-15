library ieee;
use ieee.std_logic_1164.all;

entity tb_MicroProgrammedControl is
end tb_MicroProgrammedControl;

architecture tb of tb_MicroProgrammedControl is

    component MicroProgrammedControl
        port (DataIn            : in std_logic_vector (15 downto 0);
              VCNZ              : in std_logic_vector (3 downto 0);
              Reset             : in std_logic;
              DA                : out std_logic_vector (3 downto 0);
              AA                : out std_logic_vector (3 downto 0);
              BA                : out std_logic_vector (3 downto 0);
              PCout             : out std_logic_vector (15 downto 0);
              MB_FS_MD_RW_MM_MW : out std_logic_vector (9 downto 0);
              constantOut       : out std_logic_vector (2 downto 0));
    end component;

    signal DataIn            : std_logic_vector (15 downto 0);
    signal VCNZ              : std_logic_vector (3 downto 0);
    signal Reset             : std_logic;
    signal DA                : std_logic_vector (3 downto 0);
    signal AA                : std_logic_vector (3 downto 0);
    signal BA                : std_logic_vector (3 downto 0);
    signal PCout             : std_logic_vector (15 downto 0);
    signal MB_FS_MD_RW_MM_MW : std_logic_vector (9 downto 0);
    signal constantOut       : std_logic_vector (2 downto 0);

begin

    dut : MicroProgrammedControl
    port map (DataIn            => DataIn,
              VCNZ              => VCNZ,
              Reset             => Reset,
              DA                => DA,
              AA                => AA,
              BA                => BA,
              PCout             => PCout,
              MB_FS_MD_RW_MM_MW => MB_FS_MD_RW_MM_MW,
              constantOut       => constantOut);

    stimuli : process
    begin
        DataIn <= x"0000";
        VCNZ <= "0000";
        Reset <= '1';
        wait for 10ns;
        -- EDIT Adapt initialization as needed
        DataIn <= x"0241";
        VCNZ <= "0000";
        Reset <= '0';
        
        wait for 10ns;
        
        DataIn <= x"11BE";
        VCNZ <= "0000";
        Reset <= '0';
        
        wait for 10ns;
        
        DataIn <= x"11BE";
        VCNZ <= "0111";
        Reset <= '0';
        
        wait for 10ns;
        
        DataIn <= x"1650";
        VCNZ <= "0000";
        Reset <= '0';

        -- EDIT Add stimuli here

        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_MicroProgrammedControl of tb_MicroProgrammedControl is
    for tb
    end for;
end cfg_tb_MicroProgrammedControl;