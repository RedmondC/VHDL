library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU is
    Port ( A : in  STD_LOGIC_VECTOR (15 downto 0);
           B : in  STD_LOGIC_VECTOR (15 downto 0);
           GSelect : in STD_LOGIC_VECTOR(3 downto 0);
           V : out STD_LOGIC;
           C : out STD_LOGIC;
           G : out  STD_LOGIC_VECTOR (15 downto 0));
end ALU;

architecture Behavioral of ALU is

	component ALUSlice is
	 	port (
			A : in STD_LOGIC;
			B : in STD_LOGIC;
			C : in STD_LOGIC;
			s0 : in  STD_LOGIC;
			s1 : in  STD_LOGIC;
			s2 : in STD_LOGIC;
			Cout : out STD_LOGIC;
			Gout : out STD_LOGIC
		);
	end component ALUSlice;
	
signal CO0,CO1,CO2,CO3,CO4,CO5,CO6,CO7,CO8,CO9,CO10,CO11,CO12,CO13,CO14,CO15,
       Z0,Z1,Z2,Z3,Z4,Z5,Z6,Z7,Z8,Z9,Z10,Z11,Z12,Z13,Z14,Z15: STD_LOGIC;
	
begin

	SL0 : ALUSlice port map (
		A => A(0),
		B => B(0),
		C => GSelect(0),
		s0 => GSelect(1),
		s1 => GSelect(2),
		s2 => GSelect(3),
		Cout => CO0,
		Gout => Z0
	);
	SL1 : ALUSlice port map (
		A => A(1),
		B => B(1),
		C => CO0,
		s0 => GSelect(1),
		s1 => GSelect(2),
		s2 => GSelect(3),
		Cout => CO1,
		Gout => Z1
	);
	SL2 : ALUSlice port map (
		A => A(2),
		B => B(2),
		C => CO1,
		s0 => GSelect(1),
		s1 => GSelect(2),
		s2 => GSelect(3),
		Cout => CO2,
		Gout => Z2
	);
	SL3 : ALUSlice port map (
		A => A(3),
		B => B(3),
		C => CO2,
		s0 => GSelect(1),
		s1 => GSelect(2),
		s2 => GSelect(3),
		Cout => CO3,
		Gout => Z3
	);
	SL4 : ALUSlice port map (
		A => A(4),
		B => B(4),
		C => CO3,
		s0 => GSelect(1),
		s1 => GSelect(2),
		s2 => GSelect(3),
		Cout => CO4,
		Gout => Z4
	);
	SL5 : ALUSlice port map (
		A => A(5),
		B => B(5),
		C => CO4,
		s0 => GSelect(1),
		s1 => GSelect(2),
		s2 => GSelect(3),
		Cout => CO5,
		Gout => Z5
	);
	SL6 : ALUSlice port map (
		A => A(6),
		B => B(6),
		C => CO5,
		s0 => GSelect(1),
		s1 => GSelect(2),
		s2 => GSelect(3),
		Cout => CO6,
		Gout => Z6
	);
	SL7 : ALUSlice port map (
		A => A(7),
		B => B(7),
		C => CO6,
		s0 => GSelect(1),
		s1 => GSelect(2),
		s2 => GSelect(3),
		Cout => CO7,
		Gout => Z7
	);
	SL8 : ALUSlice port map (
		A => A(8),
		B => B(8),
		C => CO7,
		s0 => GSelect(1),
		s1 => GSelect(2),
		s2 => GSelect(3),
		Cout => CO8,
		Gout => Z8
	);
	SL9 : ALUSlice port map (
		A => A(9),
		B => B(9),
		C => CO8,
		s0 => GSelect(1),
		s1 => GSelect(2),
		s2 => GSelect(3),
		Cout => CO9,
		Gout => Z9
	);
	SL10: ALUSlice port map (
		A => A(10),
		B => B(10),
		C => CO9,
		s0 => GSelect(1),
		s1 => GSelect(2),
		s2 => GSelect(3),
		Cout => CO10,
		Gout => Z10
	);
	SL11 : ALUSlice port map (
		A => A(11),
		B => B(11),
		C => CO10,
		s0 => GSelect(1),
		s1 => GSelect(2),
		s2 => GSelect(3),
		Cout => CO11,
		Gout => Z11
	);
	SL12 : ALUSlice port map (
		A => A(12),
		B => B(12),
		C => CO11,
		s0 => GSelect(1),
		s1 => GSelect(2),
		s2 => GSelect(3),
		Cout => CO12,
		Gout => Z12
	);
	SL13 : ALUSlice port map (
		A => A(13),
		B => B(13),
		C => CO12,
		s0 => GSelect(1),
		s1 => GSelect(2),
		s2 => GSelect(3),
		Cout => CO13,
		Gout => Z13
	);
	SL14 : ALUSlice port map (
		A => A(14),
		B => B(14),
		C => CO13,
		s0 => GSelect(1),
		s1 => GSelect(2),
		s2 => GSelect(3),
		Cout => CO14,
		Gout => Z14
	);
	SL15 : ALUSlice port map (
		A => A(15),
		B => B(15),
		C => CO14,
		s0 => GSelect(1),
		s1 => GSelect(2),
		s2 => GSelect(3),
		Cout => CO15,
		Gout => Z15
	);

	C <= CO15;
	
	G(0) <= Z0;
	G(1) <= Z1;
	G(2) <= Z2;
	G(3) <= Z3;
	G(4) <= Z4;
	G(5) <= Z5;
	G(6) <= Z6;
	G(7) <= Z7;
	G(8) <= Z8;
	G(9) <= Z9;
	G(10) <= Z10;
	G(11) <= Z11;
	G(12) <= Z12;
	G(13) <= Z13;
	G(14) <= Z14;
	G(15) <= Z15;
	
	V <= CO14 XOR CO15;

end Behavioral;