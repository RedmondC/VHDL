library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Shifter is
  Port ( 
    InputReg : in std_logic_vector(15 downto 0);
    Dir : in std_logic_vector(1 downto 0);
    IL, IR : in std_logic;
    OutputReg : out std_logic_vector(15 downto 0)
  );
end Shifter;

architecture Behavioral of Shifter is
    
    component mux3x1 is
      Port ( 
        in0, in1, in2 : in std_logic;
        s : in std_logic_vector(1 downto 0);
        z : out std_logic
      );
    end component;
signal revDir : std_logic_vector(1 downto 0);
begin 
    
    multiplexer31_00: mux3x1 Port map (
		in0 => InputReg(0),
		in1 => InputReg(1),
		in2 => IL,
		s => Dir,
		z => OutputReg(0)
    );
    
    multiplexer31_01: mux3x1 Port map (
		in0 => InputReg(1),
		in1 => InputReg(2),
		in2 => InputReg(0),
        s => Dir,
		z => OutputReg(1)
    );
    
    multiplexer31_02: mux3x1 Port map (
		in0 => InputReg(2),
		in1 => InputReg(3),
		in2 => InputReg(1),
		s => Dir,
		z => OutputReg(2)
    );
    
    multiplexer31_03: mux3x1 Port map (
		in0 => InputReg(3),
		in1 => InputReg(4),
		in2 => InputReg(2),
		s => Dir,
		z => OutputReg(3)
    );
    
    multiplexer31_04: mux3x1 Port map (
		in0 => InputReg(4),
		in1 => InputReg(5),
		in2 => InputReg(3),
		s => Dir,
		z => OutputReg(4)
    );
    
    multiplexer31_05: mux3x1 Port map (
		in0 => InputReg(5),
		in1 => InputReg(6),
		in2 => InputReg(4),
		s => Dir,
		z => OutputReg(5)
    );
    
    multiplexer31_06: mux3x1 Port map (
		in0 =>InputReg(6),
		in1 =>InputReg(7),
		in2 =>InputReg(5),
		s => Dir,
		z => OutputReg(6)
    );
    
    multiplexer31_07: mux3x1 Port map (
		in0 => InputReg(7),
		in1 => InputReg(8),
		in2 => InputReg(6),
		s => Dir,
		z => OutputReg(7)
    );
    
    multiplexer31_08: mux3x1 Port map (
		in0 => InputReg(8),
		in1 => InputReg(9),
		in2 => InputReg(7),
		s => Dir,
		z => OutputReg(8)
    );
    
    multiplexer31_09: mux3x1 Port map (
		in0 => InputReg(9),
		in1 => InputReg(10),
		in2 => InputReg(8),
		s => Dir,
		z => OutputReg(9)
    );
    
    multiplexer31_10: mux3x1 Port map (
		in0 => InputReg(10),
		in1 => InputReg(11),
		in2 => InputReg(9),
		s => Dir,
		z => OutputReg(10)
    );
    
    multiplexer31_11: mux3x1 Port map (
		in0 => InputReg(11),
		in1 => InputReg(12),
		in2 => InputReg(10),
		s => Dir,
		z => OutputReg(11)
    );
    
    multiplexer31_12: mux3x1 Port map (
		in0 => InputReg(12),
		in1 => InputReg(13),
		in2 => InputReg(11),
		s => Dir,
		z => OutputReg(12)
    );
    
    multiplexer31_13: mux3x1 Port map (
		in0 => InputReg(13),
		in1 => InputReg(14),
		in2 => InputReg(12),
		s => Dir,
		z => OutputReg(13)
    );
    
    multiplexer31_14: mux3x1 Port map (
		in0 => InputReg(14),
		in1 => InputReg(15),
		in2 => InputReg(13),
		s => Dir,
		z => OutputReg(14)
    );
    
    multiplexer31_15: mux3x1 Port map (
		in0 => InputReg(15),
		in1 => IR,
		in2 => InputReg(14),
		s => Dir,
		z => OutputReg(15)
    );

end Behavioral;