library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Datapath  is
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
end Datapath;

architecture Behavioral of Datapath is
	
	component mux2x16 is
		Port ( s0 : in  STD_LOGIC;
           in1 : in  STD_LOGIC_VECTOR(15 DOWNTO 0);
           in2 : in  STD_LOGIC_VECTOR(15 DOWNTO 0);
           z : out  STD_LOGIC_VECTOR(15 DOWNTO 0));
	end component mux2x16;
	
	component ZeroFill is
	   Port ( 
		Input : in STD_LOGIC_VECTOR(3 downto 0);
		Z : out STD_LOGIC_VECTOR(15 downto 0));
	end component ZeroFill;

	component FU is
		Port ( 
		dataA : in STD_LOGIC_VECTOR (15 downto 0);
		dataB : in STD_LOGIC_VECTOR (15 downto 0);
		Gin : in STD_LOGIC_VECTOR(4 downto 0);
		V : out STD_LOGIC;
		C : out STD_LOGIC;
		N : out STD_LOGIC;
		Z : out STD_LOGIC;
		F : out STD_LOGIC_VECTOR(15 downto 0));
	end component FU;
	
	component register_file is
        Port ( 
        load_enable : in std_LOGIC;
        src_A : in std_logic_vector(3 downto 0);
        src_B : in std_logic_vector(3 downto 0);
        des : in std_logic_vector(3 downto 0);
        DData : in std_logic_vector(15 downto 0);
        Clk : in std_logic;
        Aout : out std_logic_vector(15 downto 0);
        Bout : out std_logic_vector(15 downto 0));
    end component register_file;
    
signal BusD,FUV,FUC,FUN,FUZ :STD_LOGIC;
signal RFA,RFB,FUBin,FUF,DData,constantFilled :STD_LOGIC_VECTOR(15 downto 0);   
begin 	

    regF : register_file Port Map( 
		load_enable => loadEnable,
		DData => DData,
		src_A => ASelect,
		src_B => BSelect,
		des => DestinationSelect,
		Clk => Clk,
		Aout => RFA,
		Bout => RFB
		);
	
	ZeroF : ZeroFill Port Map (
		Input => constantIn,
		Z => constantFilled
		);
        
    FUBmux : mux2x16 port map (
        s0 => MBSelect,
        in1 => RFB,
        in2 => constantFilled,
        z => FUBin
        );  
        
    func : FU port map( 
		dataA => RFA,
		dataB => FUBin,
		Gin => FunctionSelect,
		V => FUV,
		C => FUC,
		N => FUN,
		Z => FUZ,
		F => FUF
		);   
	
	DBusmux : mux2x16 port map (
        s0 => MDSelect,
        in1 => FUF,
        in2 => DataIn,
        z => DData
        ); 
    
    MuxM : mux2x16 port map(
        s0 => MMSelect,
        in1 => RFA,
        in2 => PCIN,
        z => AddressOut
        );
               
        
    DataOut <= FUBin;
	VCNZ(0) <= FUV;
	VCNZ(1) <= FUC;
	VCNZ(2) <= FUN;
	VCNZ(3) <= FUZ;
	    
end Behavioral;	