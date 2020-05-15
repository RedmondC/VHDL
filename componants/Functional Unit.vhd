library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FU  is
	Port ( 
		dataA : in STD_LOGIC_VECTOR (15 downto 0);
		dataB : in STD_LOGIC_VECTOR (15 downto 0);
		Gin : in STD_LOGIC_VECTOR(4 downto 0);
		V : out STD_LOGIC;
		C : out STD_LOGIC;
		N : out STD_LOGIC;
		Z : out STD_LOGIC;
		F : out STD_LOGIC_VECTOR(15 downto 0));
end FU;

architecture Behavioral of FU is

	component ALU is
		Port ( A : in  STD_LOGIC_VECTOR (15 downto 0);
           B : in  STD_LOGIC_VECTOR (15 downto 0);
           GSelect : in STD_LOGIC_VECTOR(3 downto 0);
           V : out STD_LOGIC;
           C : out STD_LOGIC;
           G : out  STD_LOGIC_VECTOR (15 downto 0));
	end component ALU;

	component Shifter is
		Port ( 
		Dir : in STD_LOGIC_VECTOR(1 downto 0);
		InputReg : in STD_LOGIC_VECTOR(15 downto 0);
		OutputReg : out STD_LOGIC_VECTOR(15 downto 0) := "0000000000000000";
		IL : in STD_LOGIC;
		IR : STD_LOGIC);
	end component Shifter;

	component ZeroDetect is
		Port ( 
		InputReg : in STD_LOGIC_VECTOR(15 downto 0);
		Z : out STD_LOGIC);
	end component ZeroDetect;

	component mux2x16 is
		Port ( s0 : in  STD_LOGIC;
           in1 : in  STD_LOGIC_VECTOR (15 downto 0);
           in2 : in  STD_LOGIC_VECTOR (15 downto 0);
           z : out  STD_LOGIC_VECTOR (15 downto 0));
	end component mux2x16;

signal Cout , Vout, Zout , MFSelect: STD_LOGIC;
signal ALUG, shiftOut,muxZout : STD_LOGIC_VECTOR(15 downto 0 );

begin	
    MFSelect <= Gin(4);
    
	aluInst: ALU PORT MAP(
		A => dataA,
		B => dataB,
		GSelect => Gin(3 downto 0),
		V => Vout,
		C => Cout,
		G => ALUG
		);
		
	zd: ZeroDetect port map(
		InputReg => ALUG,
		Z => Zout
		);


	shift : Shifter PORT MAP(
		Dir => Gin(3 downto 2),
		InputReg => dataB,
		OutputReg => shiftOut,
		IL => '0',
		IR => '0'
		);

	mux: mux2x16 PORT MAP(
		s0 => MFSelect,
		in1 => ALUG,
		in2 => shiftOut,
		z => muxZout
		);

	V <=  Vout;
	C <=  Cout;
	N <=  ALUG(15);
	Z <=  Zout;
	F <=  muxZout;

end Behavioral;