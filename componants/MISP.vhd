library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MISP  is
	Port ( 
		Clk : in std_logic;
		Reset : in std_logic
		);
end MISP;

architecture Behavioral of MISP is
	
	component MicroProgrammedControl is
		Port ( 
			DataIn : in STD_LOGIC_VECTOR(15 downto 0);
			VCNZ : in std_logic_vector(3 downto 0);
			Reset : in STD_LOGIC;
			DA : out std_logic_vector(3 downto 0);
			AA : out std_logic_vector(3 downto 0);
			BA : out std_logic_vector(3 downto 0);
			PCout : out std_logic_vector(15 downto 0);
			MB_FS_MD_RW_MM_MW : out std_logic_vector(9 downto 0);
			constantOut : OUT std_logic_vector(2 downto 0)); 
	end component MicroProgrammedControl;

	component DataPath is
		Port ( 
			ASelect : in STD_LOGIC_VECTOR(3 DOWNTO 0);
			BSelect : in STD_LOGIC_VECTOR(3 DOWNTO 0);
			DestinationSelect : in  STD_LOGIC_VECTOR(3 DOWNTO 0);
			
			DataIn : in STD_LOGIC_VECTOR(15 downto 0);
			PCIN : in STD_LOGIC_VECTOR(15 downto 0);
			
			loadEnable : in STD_LOGIC;
			FunctionSelect : in STD_LOGIC_VECTOR(4 downto 0);
			MDSelect : in STD_LOGIC;
			MBSelect : in STD_LOGIC;
			MMSelect : in STD_LOGIC;
			Clk : in STD_LOGIC;
			constantIn : in STD_LOGIC_VECTOR(3 downto 0);
			
			DataOut : out STD_LOGIC_VECTOR(15 downto 0);
			AddressOut : out STD_LOGIC_VECTOR(15 downto 0);
			VCNZ : out STD_LOGIC_VECTOR(3 downto 0));
	end component DataPath;

	component MemoryM is
		port (
			InputIndex : in std_logic_vector(15 downto 0);
			dataIn : in std_logic_vector(15 downto 0);
			MW : in std_logic;
			dataOut : out std_logic_vector(15 downto 0)
		);
	end component MemoryM;

signal CConstant : std_logic_vector(2 downto 0);
signal CDA, CAA, CBA, DPVCNZ : std_logic_vector(3 downto 0);
signal CSelectors : std_logic_vector(9 downto 0);
signal CPCout, DPdata, DPaddress, Mdata: std_logic_vector(15 downto 0);

begin

	Control : MicroProgrammedControl port map(
		DataIn => Mdata,
		VCNZ => DPVCNZ,
		DA => CDA,
		AA => CAA,
		BA => CBA,
		Reset => Reset,
		PCout => CPCout,
		MB_FS_MD_RW_MM_MW => CSelectors,
		constantOut => CConstant 
		);

	Memory : MemoryM port map(
		InputIndex => DPaddress,
		dataIn => DPdata,
		MW => CSelectors(0),
		dataOut => Mdata
		);

	Path : DataPath port map(
		ASelect => CAA,
		BSelect => CBA,
		DestinationSelect => CDA,
		DataIn => Mdata,
		PCIN => CPCout,
		loadEnable => CSelectors(2),
		FunctionSelect => CSelectors(8 downto 4),
		MDSelect => CSelectors(3),
		MBSelect => CSelectors(9),
		MMSelect => CSelectors(1),
		CLK => Clk,
		constantIn(3) => '0',
		constantIn(2 downto 0) => CConstant,
		DataOut => DPdata,
		AddressOut => DPaddress,
		VCNZ => DPVCNZ
		);

end Behavioral;	