-- Testbench automatically generated online
-- at http://vhdl.lapinoo.net
-- Generation date : 5.4.2020 12:11:08 GMT

library ieee;
use ieee.std_logic_1164.all;

entity tb_mux9x16 is
end tb_mux9x16;

architecture tb of tb_mux9x16 is

    component mux9x16
        port (s0  : in std_logic;
              s1  : in std_logic;
              s2  : in std_logic;
              s3  : in std_logic;
              in1 : in std_logic_vector (15 downto 0);
              in2 : in std_logic_vector (15 downto 0);
              in3 : in std_logic_vector (15 downto 0);
              in4 : in std_logic_vector (15 downto 0);
              in5 : in std_logic_vector (15 downto 0);
              in6 : in std_logic_vector (15 downto 0);
              in7 : in std_logic_vector (15 downto 0);
              in8 : in std_logic_vector (15 downto 0);
              in9 : in std_logic_vector (15 downto 0);
              z   : out std_logic_vector (15 downto 0));
    end component;

    signal s0  : std_logic;
    signal s1  : std_logic;
    signal s2  : std_logic;
    signal s3  : std_logic;
    signal in1 : std_logic_vector (15 downto 0);
    signal in2 : std_logic_vector (15 downto 0);
    signal in3 : std_logic_vector (15 downto 0);
    signal in4 : std_logic_vector (15 downto 0);
    signal in5 : std_logic_vector (15 downto 0);
    signal in6 : std_logic_vector (15 downto 0);
    signal in7 : std_logic_vector (15 downto 0);
    signal in8 : std_logic_vector (15 downto 0);
    signal in9 : std_logic_vector (15 downto 0);
    signal z   : std_logic_vector (15 downto 0);

begin

    dut : mux9x16
    port map (s0  => s0,
              s1  => s1,
              s2  => s2,
              s3  => s3,
              in1 => in1,
              in2 => in2,
              in3 => in3,
              in4 => in4,
              in5 => in5,
              in6 => in6,
              in7 => in7,
              in8 => in8,
              in9 => in9,
              z   => z);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        s0 <= '0';
        s1 <= '0';
        s2 <= '0';
        s3 <= '0';
        in1 <= "0011001010100111";
        in2 <= (others => '0');
        in3 <= (others => '0');
        in4 <= (others => '0');
        in5 <= (others => '0');
        in6 <= (others => '0');
        in7 <= "0000000011111111";
        in8 <= "0011000010100011";
        in9 <= "1011111010100111";
        
        wait for 10 ns;
        
        s0 <= '0';
        s1 <= '1';
        s2 <= '1';
        s3 <= '0';
        in1 <= "0011001010100111";
        in2 <= (others => '0');
        in3 <= (others => '0');
        in4 <= (others => '0');
        in5 <= (others => '0');
        in6 <= (others => '0');
        in7 <= "0000000011111111";
        in8 <= "0011000010100011";
        in9 <= "1011111010100111";
        
        wait for 10 ns;
        
        s0 <= '1';
        s1 <= '1';
        s2 <= '1';
        s3 <= '0';
        in1 <= "0011001010100111";
        in2 <= (others => '0');
        in3 <= (others => '0');
        in4 <= (others => '0');
        in5 <= (others => '0');
        in6 <= (others => '0');
        in7 <= "0000000011111111";
        in8 <= "0011000010100011";
        in9 <= "1011111010100111";
        
        wait for 10 ns;
        
        s0 <= '0';
        s1 <= '0';
        s2 <= '0';
        s3 <= '1';
        in1 <= "0011001010100111";
        in2 <= (others => '0');
        in3 <= (others => '0');
        in4 <= (others => '0');
        in5 <= (others => '0');
        in6 <= (others => '0');
        in7 <= "0000000011111111";
        in8 <= "0011000010100011";
        in9 <= "1011111010100111";
        
        wait for 10 ns;
        

        -- EDIT Add stimuli here

        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_mux9x16 of tb_mux9x16 is
    for tb
    end for;
end cfg_tb_mux9x16;