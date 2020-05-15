library ieee;
use ieee.std_logic_1164.all;

entity tb_ALU is
end tb_ALU;

architecture tb of tb_ALU is

    component ALU
        port (A       : in std_logic_vector (15 downto 0);
              B       : in std_logic_vector (15 downto 0);
              GSelect : in std_logic_vector (3 downto 0);
              V       : out std_logic;
              C       : out std_logic;
              G       : out std_logic_vector (15 downto 0));
    end component;

    signal A       : std_logic_vector (15 downto 0);
    signal B       : std_logic_vector (15 downto 0);
    signal GSelect : std_logic_vector (3 downto 0);
    signal V       : std_logic;
    signal C       : std_logic;
    signal G       : std_logic_vector (15 downto 0);

begin

    dut : ALU
    port map (A       => A,
              B       => B,
              GSelect => GSelect,
              V       => V,
              C       => C,
              G       => G);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        A <= "0000111100001111";
        B <= "0100110011101111";
        GSelect <= "0000";

        wait for 10ns;

        A <= "0000111100001111";
        B <= "0100110011101111";
        GSelect <= "0001";

        wait for 10ns;
        
        A <= "0000111100001111";
        B <= "0100110011101111";
        GSelect <= "0010";

        wait for 10ns;
        

        A <= "0000111100001111";
        B <= "0100110011101111";
        GSelect <= "0011";

        wait for 10ns;

        A <= "0000111100001111";
        B <= "0100110011101111";
        GSelect <= "0100";
        wait for 10ns;
        A <= "0000111100001111";
        B <= "0100110011101111";
        GSelect <= "0101";
        wait for 10ns;

        A <= "0000111100001111";
        B <= "0100110011101111";
        GSelect <= "0110";
        wait for 10ns;

        A <= "0000111100001111";
        B <= "0100110011101111";
        GSelect <= "0111";
        wait for 10ns;

        A <= "0000111100001111";
        B <= "0100110011101111";
        GSelect <= "1000";
        wait for 10ns;

        A <= "0000111100001111";
        B <= "0100110011101111";
        GSelect <= "1010";
        wait for 10ns;

        A <= "0000111100001111";
        B <= "0100110011101111";
        GSelect <= "1100";
        wait for 10ns;

        A <= "0000111100001111";
        B <= "0100110011101111";
        GSelect <= "1110";
        wait for 10ns;
        

        -- EDIT Add stimuli here

        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_ALU of tb_ALU is
    for tb
    end for;
end cfg_tb_ALU;