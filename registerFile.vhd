library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity register_file is
Port ( 
	src_s0 : in std_logic;
	src_s1 : in std_logic;
	src_s2 : in std_logic;
	
	src_A0 : in std_logic;
	src_A1 : in std_logic;
	src_A2 : in std_logic;
	
	src_B0 : in std_logic;
	src_B1 : in std_logic;
	src_B2 : in std_logic;
	
	des_A0 : in std_logic;
	des_A1 : in std_logic;
	des_A2 : in std_logic;
	
	Clk : in std_logic;
	data_src : in std_logic;
	data : in std_logic_vector(15 downto 0);
	
	Aout : out std_logic_vector(15 downto 0);
	Bout : out std_logic_vector(15 downto 0));
	
end register_file;

architecture Behavioral of register_file is

	COMPONENT decoder
	PORT(
		s0 : IN std_logic;
		s1 : IN std_logic;
		s2 : IN std_logic;
		out1 : OUT std_logic;
		out2 : OUT std_logic;
		out3 : OUT std_logic;
		out4 : OUT std_logic;
		out5 : OUT std_logic;
		out6 : OUT std_logic;
		out7 : OUT std_logic;
		out8 : OUT std_logic);
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
	COMPONENT mux8x1
	PORT(
		S0 : IN std_logic;
		S1 : IN std_logic;
		s2 : IN std_logic;
		In1 : IN std_logic_vector(15 downto 0);
		In2 : IN std_logic_vector(15 downto 0);
		In3 : IN std_logic_vector(15 downto 0);
		In4 : IN std_logic_vector(15 downto 0);
		In5 : IN std_logic_vector(15 downto 0);
		In6 : IN std_logic_vector(15 downto 0);
		In7 : IN std_logic_vector(15 downto 0);
		In8 : IN std_logic_vector(15 downto 0);
		Z : OUT std_logic_vector(15 downto 0)
	);
	END COMPONENT;
-- signals
signal load_reg0, load_reg1, load_reg2, load_reg3, load_reg4, load_reg5, load_reg6, load_reg7 : std_logic;

signal reg0_q, reg1_q, reg2_q, reg3_q,reg4_q, reg5_q, reg6_q, reg7_q,resultA,resultB,
data_src_mux_out, src_reg : std_logic_vector(15 downto 0);


begin
	-- port maps ;-)
	reg00: reg PORT MAP(
		D => data_src_mux_out,
		load => load_reg0,
		Clk => Clk,
		Q => reg0_q
	);
	reg01: reg PORT MAP(
		D => data_src_mux_out,
		load => load_reg1,
		Clk => Clk,
		Q => reg1_q
	);
	reg02: reg PORT MAP(
		D => data_src_mux_out,
		load => load_reg2,
		Clk => Clk,
		Q => reg2_q
	);
	reg03: reg PORT MAP(
		D => data_src_mux_out,
		load => load_reg3,
		Clk => Clk,
		Q => reg3_q
	);
	reg04: reg PORT MAP(
		D => data_src_mux_out,
		load => load_reg4,
		Clk => Clk,
		Q => reg4_q
	);
	reg05: reg PORT MAP(
		D => data_src_mux_out,
		load => load_reg5,
		Clk => Clk,
		Q => reg5_q
	);
	reg06: reg PORT MAP(
		D => data_src_mux_out,
		load => load_reg6,
		Clk => Clk,
		Q => reg6_q
	);
	reg07: reg PORT MAP(
		D => data_src_mux_out,
		load => load_reg7,
		Clk => Clk,
		Q => reg7_q
	);
	-- Destination register decoder
	des_decoder_3to8: decoder PORT MAP(
		s0 => des_A0,
		s1 => des_A1,
		s2 => des_A2,
		
		out1 => load_reg0,
		out2 => load_reg1,
		out3 => load_reg2,
		out4 => load_reg3,
		out5 => load_reg4,
		out6 => load_reg5,
		out7 => load_reg6,
		out8 => load_reg7
	);

	-- 2 to 1 Data source multiplexer
	data_src_mux2_16bit: mux2x16 PORT MAP(
		In1 => data,
		In2 => src_reg,
		s => data_src,
		Z => data_src_mux_out
	);
	-- 4 to 1 source register multiplexer
	Inst_mux8_16bit: mux8x1 PORT MAP(
		In1 => reg0_q,
		In2 => reg1_q,
		In3 => reg2_q,
		In4 => reg3_q,
		In5 => reg4_q,
		In6 => reg5_q,
		In7 => reg6_q,
		In8 => reg7_q,
		S0 => src_s0,
		S1 => src_s1,
		s2 => src_s2,
		Z => src_reg
	);
	
	dataA: mux8x1 PORT MAP(
		In1 => reg0_q,
		In2 => reg1_q,
		In3 => reg2_q,
		In4 => reg3_q,
		In5 => reg4_q,
		In6 => reg5_q,
		In7 => reg6_q,
		In8 => reg7_q,
		S0 => src_A0,
		S1 => src_A1,
		s2 => src_A2,
		Z => resultA
	);
	
	dataB: mux8x1 PORT MAP(
		In1 => reg0_q,
		In2 => reg1_q,
		In3 => reg2_q,
		In4 => reg3_q,
		In5 => reg4_q,
		In6 => reg5_q,
		In7 => reg6_q,
		In8 => reg7_q,
		S0 => src_B0,
		S1 => src_B1,
		s2 => src_B2,
		Z => resultB
	);

	Aout <= resultA;
	Bout <= resultB;
	
end Behavioral;



 	