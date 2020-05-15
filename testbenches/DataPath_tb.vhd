library ieee;
use ieee.std_logic_1164.all;

entity tb_Datapath is
end tb_Datapath;

architecture tb of tb_Datapath is

    component Datapath
        port (ASelect           : in std_logic_vector (3 downto 0);
              BSelect           : in std_logic_vector (3 downto 0);
              DestinationSelect : in std_logic_vector (3 downto 0);
              DataIn            : in std_logic_vector (15 downto 0);
              PCIN              : in std_logic_vector (15 downto 0);
              loadEnable        : in std_logic;
              FunctionSelect    : in std_logic_vector (4 downto 0);
              MDSelect          : in std_logic;
              MBSelect          : in std_logic;
              MMSelect          : in std_logic;
              Clk               : in std_logic;
              constantIn        : in std_logic_vector (3 downto 0);
              DataOut           : out std_logic_vector (15 downto 0);
              AddressOut        : out std_logic_vector (15 downto 0);
              VCNZ              : out std_logic_vector (3 downto 0));
    end component;

    signal ASelect           : std_logic_vector (3 downto 0);
    signal BSelect           : std_logic_vector (3 downto 0);
    signal DestinationSelect : std_logic_vector (3 downto 0);
    signal DataIn            : std_logic_vector (15 downto 0);
    signal PCIN              : std_logic_vector (15 downto 0);
    signal loadEnable        : std_logic;
    signal FunctionSelect    : std_logic_vector (4 downto 0);
    signal MDSelect          : std_logic;
    signal MBSelect          : std_logic;
    signal MMSelect          : std_logic;
    signal Clk               : std_logic;
    signal constantIn        : std_logic_vector (3 downto 0);
    signal DataOut           : std_logic_vector (15 downto 0);
    signal AddressOut        : std_logic_vector (15 downto 0);
    signal VCNZ              : std_logic_vector (3 downto 0);

    constant TbPeriod : time := 1000 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : Datapath
    port map (ASelect           => ASelect,
              BSelect           => BSelect,
              DestinationSelect => DestinationSelect,
              DataIn            => DataIn,
              PCIN              => PCIN,
              loadEnable        => loadEnable,
              FunctionSelect    => FunctionSelect,
              MDSelect          => MDSelect,
              MBSelect          => MBSelect,
              MMSelect          => MMSelect,
              Clk               => Clk,
              constantIn        => constantIn,
              DataOut           => DataOut,
              AddressOut        => AddressOut,
              VCNZ              => VCNZ);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that Clk is really your main clock signal
    Clk <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        ASelect <= "0001";
        BSelect <= "0001";
        DestinationSelect <= "0010";
        DataIn <= "0011001100110011";
        PCIN <= "0000000011111111";
        loadEnable <= '1';
        FunctionSelect <= "00000";
        MDSelect <= '0';
        MBSelect <= '1';
        MMSelect <= '0';
        constantIn <= "1000";

        -- EDIT Add stimuli here
        wait for 10ns;

        ASelect <= "0001";
        BSelect <= "0001";
        DestinationSelect <= "0010";
        DataIn <= "0011001100110011";
        PCIN <= "0000000011111111";
        loadEnable <= '1';
        FunctionSelect <= "00101";
        MDSelect <= '0';
        MBSelect <= '1';
        MMSelect <= '1';
        constantIn <= "1000";
        
        wait for 10ns;

        ASelect <= "0001";
        BSelect <= "0001";
        DestinationSelect <= "0110";
        DataIn <= "0011111100110011";
        PCIN   <= "0000000011111111";
        loadEnable <= '1';
        FunctionSelect <= "00101";
        MDSelect <= '0';
        MBSelect <= '1';
        MMSelect <= '1';
        constantIn <= "1000";

        -- EDIT Add stimuli here
        wait for 10ns;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_Datapath of tb_Datapath is
    for tb
    end for;
end cfg_tb_Datapath;