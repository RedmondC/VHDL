library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity register_file is
Port ( 
	load_enable : in std_LOGIC;
	DData : in STD_LOGIC_VECTOR(15 downto 0);
	src_A : in std_logic_vector(3 downto 0);
	src_B : in std_logic_vector(3 downto 0);
	des : in std_logic_vector(3 downto 0);
	Clk : in std_logic;
	Aout : out std_logic_vector(15 downto 0);
	Bout : out std_logic_vector(15 downto 0));
	
end register_file;

architecture Behavioral of register_file is

	COMPONENT decoder9x1
	Port ( s0 : in  STD_LOGIC;
			s1 : in  STD_LOGIC;
			s2 : in  STD_LOGIC;
			s3 : in STD_LOGIC;
           out1 : out  STD_LOGIC;
           out2 : out  STD_LOGIC;
           out3 : out  STD_LOGIC;
           out4 : out  STD_LOGIC;
		   out5 : out  STD_LOGIC;
           out6 : out  STD_LOGIC;
           out7 : out  STD_LOGIC;
           out8 : out  STD_LOGIC;
           out9 : out STD_LOGIC);
	END COMPONENT;
	
	COMPONENT reg
	PORT(
		D : IN std_logic_vector(15 downto 0);
		load : IN std_logic;
		Clk : IN std_logic;
		Q : OUT std_logic_vector(15 downto 0)
	);
	END COMPONENT;
	
	-- 2 to 1 line multiplexer
	COMPONENT mux2x16
	PORT(
		s : IN std_logic;
		In1 : IN std_logic_vector(15 downto 0);
		In2 : IN std_logic_vector(15 downto 0);
		Z : OUT std_logic_vector(15 downto 0)
	);
	END COMPONENT;

	-- 4 to 1 line multiplexer
	COMPONENT mux9x16
	PORT(
		S0 : IN std_logic;
		S1 : IN std_logic;
		s2 : IN std_logic;
		s3 : IN std_logic;
		In1 : IN std_logic_vector(15 downto 0);
		In2 : IN std_logic_vector(15 downto 0);
		In3 : IN std_logic_vector(15 downto 0);
		In4 : IN std_logic_vector(15 downto 0);
		In5 : IN std_logic_vector(15 downto 0);
		In6 : IN std_logic_vector(15 downto 0);
		In7 : IN std_logic_vector(15 downto 0);
		In8 : IN std_logic_vector(15 downto 0);
		In9 : IN std_logic_vector(15 downto 0);
		Z : OUT std_logic_vector(15 downto 0)
	);
	END COMPONENT;
-- signals
signal load_reg0, load_reg1, load_reg2, load_reg3, load_reg4, load_reg5, load_reg6, load_reg7, load_reg8,
        do0,do1,do2,do3,do4,do5,do6,do7,do8 : std_logic;

signal reg0_q, reg1_q, reg2_q, reg3_q,reg4_q, reg5_q, reg6_q, reg7_q, reg8_q,resultA,resultB,
data_src_mux_out, src_reg : std_logic_vector(15 downto 0);

begin

    load_reg0 <=  load_enable AND do0;
    load_reg1 <=  load_enable AND do1;
    load_reg2 <=  load_enable AND do2;
    load_reg3 <=  load_enable AND do3;
    load_reg4 <=  load_enable AND do4;
    load_reg5 <=  load_enable AND do5;
    load_reg6 <=  load_enable AND do6;
    load_reg7 <=  load_enable AND do7;
    load_reg8 <=  load_enable AND do8;
        
	-- port maps ;-)
	reg00: reg PORT MAP(
		D => DData,
		load => load_reg0,
		Clk => Clk,
		Q => reg0_q
	);
	reg01: reg PORT MAP(
		D => DData,
		load => load_reg1,
		Clk => Clk,
		Q => reg1_q
	);
	reg02: reg PORT MAP(
		D => DData,
		load => load_reg2,
		Clk => Clk,
		Q => reg2_q
	);
	reg03: reg PORT MAP(
		D => DData,
		load => load_reg3,
		Clk => Clk,
		Q => reg3_q
	);
	reg04: reg PORT MAP(
		D => DData,
		load => load_reg4,
		Clk => Clk,
		Q => reg4_q
	);
	reg05: reg PORT MAP(
		D => DData,
		load => load_reg5,
		Clk => Clk,
		Q => reg5_q
	);
	reg06: reg PORT MAP(
		D => DData,
		load => load_reg6,
		Clk => Clk,
		Q => reg6_q
	);
	reg07: reg PORT MAP(
		D => DData,
		load => load_reg7,
		Clk => Clk,
		Q => reg7_q
	);
	reg08: reg PORT MAP(
		D => DData,
		load => load_reg8,
		Clk => Clk,
		Q => reg8_q
	);
	-- Destination register decoder
	des_decoder: decoder9x1 PORT MAP(
		s0 => des(0),
		s1 => des(1),
		s2 => des(2),
		s3 => des(3),
		
		out1 => do0,
		out2 => do1,
		out3 => do2,
		out4 => do3,
		out5 => do4,
		out6 => do5,
		out7 => do6,
		out8 => do7,
		out9 => do8
	);
	
	dataA: mux9x16 PORT MAP(
		In1 => reg0_q,
		In2 => reg1_q,
		In3 => reg2_q,
		In4 => reg3_q,
		In5 => reg4_q,
		In6 => reg5_q,
		In7 => reg6_q,
		In8 => reg7_q,
		In9 => reg8_q,
		S0 => src_A(0),
		S1 => src_A(1),
		s2 => src_A(2),
		s3 => src_A(3),
		Z => resultA
	);
	
	dataB: mux9x16 PORT MAP(
		In1 => reg0_q,
		In2 => reg1_q,
		In3 => reg2_q,
		In4 => reg3_q,
		In5 => reg4_q,
		In6 => reg5_q,
		In7 => reg6_q,
		In8 => reg7_q,
		In9 => reg8_q,
		S0 => src_B(0),
		S1 => src_B(1),
		s2 => src_B(2),
		s3 => src_B(3),
		Z => resultB
	);

	Aout <= resultA;
	Bout <= resultB;
	
end Behavioral;