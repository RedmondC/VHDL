library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MicroProgrammedControl  is
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

end MicroProgrammedControl;

architecture Behavioral of MicroProgrammedControl is
	
	component mux8x1 is
		Port ( s0 : in  STD_LOGIC;
			s1 : in  STD_LOGIC;
			s2 : in  STD_LOGIC;
           in1 : in  STD_LOGIC;
           in2 : in  STD_LOGIC;
           in3 : in  STD_LOGIC;
           in4 : in  STD_LOGIC;
           in5 : in  STD_LOGIC;
           in6 : in  STD_LOGIC;
           in7 : in  STD_LOGIC;
           in8 : in  STD_LOGIC;
           z : out  STD_LOGIC);
	end component mux8x1;

	component mux2x8 is
		port (
			s0 : in std_logic;
			in1 : in std_logic_vector(7 downto 0);
			in2 : in std_logic_vector(7 downto 0);
			z : out std_logic_vector(7 downto 0)
		);
	end component mux2x8;
	
	component Car is
	   Port ( 
		Input : in STD_LOGIC_VECTOR(7 downto 0);
		SelectIn : in std_LOGIC;
		Reset : in std_logic;
		Z : out STD_LOGIC_VECTOR(7 downto 0));
	end component Car;
	
	component controlMemory is
		port (
			Input : in std_logic_vector(7 downto 0);

			controlWord : out std_logic_vector(27 downto 0)
		);
	end component controlMemory;

	component Extend is
		port (
			inDR : in std_logic_vector(2 downto 0);
			inSB : in std_logic_vector(2 downto 0);

			output : out std_logic_vector(15 downto 0)
		);
	end component Extend;

	component IR is
		port (
			input : in std_logic_vector(15 downto 0);
			IL : in std_logic;

			Opcode : out std_logic_vector(7 downto 0);
			DR : out std_logic_vector(2 downto 0);
			SA : out std_logic_vector(2 downto 0);
			SB : out std_logic_vector(2 downto 0)
		);
	end component IR;

	component ProgramCounter is
		Port ( 
		Input : in STD_LOGIC_VECTOR(15 downto 0);
		Load : in std_LOGIC;
		Increment : in std_LOGIC;
		Reset : in std_LOGIC;
		Pout : out STD_LOGIC_VECTOR(15 downto 0));
	end component ProgramCounter;
    
signal muxs_Z,not1,not3 :STD_LOGIC;
signal IRDR ,IRSA ,IRSB :STD_LOGIC_VECTOR(2 downto 0); 
signal muxc_Z,Car_out,IROpcode :std_logic_vector(7 downto 0);
signal extendOut :STD_LOGIC_VECTOR(15 downto 0);  
signal controlWord : std_logic_vector(27 downto 0);

begin 	
    
   not1 <= not VCNZ(1);
   not3 <= not VCNZ(3); 
    
   muxS : mux8x1 port map(
   		s0 => controlWord(19),
   		s1 => controlWord(18),
   		s2 => controlWord(17),
	
   		in1 => '0',
   		in2 => '1',
   		in3 => VCNZ(1),
   		in4 => VCNZ(0),
   		in5 => VCNZ(3),
   		in6 => VCNZ(2),
   		in7	=> not1,
    	in8 => not3,
	
    	z => muxs_Z
   );

   Instruction : IR port map(
   		input => DataIn,
   		IL => controlWord(15),
   		Opcode => IROpcode,
   		DR => IRDR,
   		SA => IRSA,
   		SB => IRSB
   	);
   	
   	muxC : mux2x8 port map(
   		s0 => controlWord(16),
	
   		in1 => controlWord(27 downto 20),
   		in2 => IROpcode,
	
    	Z => muxc_Z
   );

   memory : controlMemory port map(
   		input => Car_out,
   		controlWord => controlWord
   	);

   extendComponant : extend port map(
   		inDR => IRDR,
   		inSB => IRSB,

		output => extendOut
   	);

   ControlAddressReg : Car port map(
   		input => muxc_Z,
   		Reset => Reset,
   		SelectIn => muxs_Z,
   		Z => Car_out
   	);

   pc : ProgramCounter port map(
   		Load => controlWord(13),
   		Increment => controlWord(14),
   		Reset => Reset,
   		input => extendOut,
   		Pout => PCout
   	);
    
   	DA(3) <= controlWord(12);
  	DA(2 downto 0) <= IRDR;

  	AA(3) <= controlWord(11);
  	AA(2 downto 0) <= IRSA;

  	BA (3) <= controlWord(10);
  	BA (2 downto 0) <= IRSB;

  	constantOut <= IRSB;
  	MB_FS_MD_RW_MM_MW <= controlWord(9 downto 0);
       
	    
end Behavioral;	