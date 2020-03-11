library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity rippleAdder is
	Port ( 
		a0  : in STD_LOGIC;
		a1  : in STD_LOGIC;
		a2  : in STD_LOGIC;
		a3  : in STD_LOGIC;
		a4  : in STD_LOGIC;
		a5  : in STD_LOGIC;
		a6  : in STD_LOGIC;
		a7  : in STD_LOGIC;
		a8  : in STD_LOGIC;
		a9  : in STD_LOGIC;
		a10 : in STD_LOGIC;
		a11 : in STD_LOGIC;
		a12 : in STD_LOGIC;
		a13 : in STD_LOGIC;
		a14 : in STD_LOGIC;
		a15 : in STD_LOGIC;
		
		b0  : in STD_LOGIC;
		b1  : in STD_LOGIC;
		b2  : in STD_LOGIC;
		b3  : in STD_LOGIC;
		b4  : in STD_LOGIC;
		b5  : in STD_LOGIC;
		b6  : in STD_LOGIC;
		b7  : in STD_LOGIC;
		b8  : in STD_LOGIC;
		b9  : in STD_LOGIC;
		b10 : in STD_LOGIC;
		b11 : in STD_LOGIC;
		b12 : in STD_LOGIC;
		b13 : in STD_LOGIC;
		b14 : in STD_LOGIC;
		b15 : in STD_LOGIC;
		
		cIn : in STD_LOGIC;
	
		s0  : out STD_LOGIC_VECTOR(15 downto 0);
		s1  : out STD_LOGIC_VECTOR(15 downto 0);
		s2  : out STD_LOGIC_VECTOR(15 downto 0);
		s3  : out STD_LOGIC_VECTOR(15 downto 0);
		s4  : out STD_LOGIC_VECTOR(15 downto 0);
		s5  : out STD_LOGIC_VECTOR(15 downto 0);
		s6  : out STD_LOGIC_VECTOR(15 downto 0);
		s7  : out STD_LOGIC_VECTOR(15 downto 0);
		s8  : out STD_LOGIC_VECTOR(15 downto 0);
		s9  : out STD_LOGIC_VECTOR(15 downto 0);
		s10 : out STD_LOGIC_VECTOR(15 downto 0);
		s11 : out STD_LOGIC_VECTOR(15 downto 0);
		s12 : out STD_LOGIC_VECTOR(15 downto 0);
		s13 : out STD_LOGIC_VECTOR(15 downto 0);
		s14 : out STD_LOGIC_VECTOR(15 downto 0);
		s15 : out STD_LOGIC_VECTOR(15 downto 0);
		
		CarryOut : out STD_LOGIC_VECTOR(15 downto 0));
end rippleAdder;

architecture Behavioral of rippleAdder is
	
	component fulladder 
		Port ( 
		A : in STD_LOGIC;
		B : in STD_LOGIC;
		CarryIn :in STD_LOGIC_VECTOR(15 downto 0);
		Sum : out STD_LOGIC_VECTOR(15 downto 0);
		CarryOut : out STD_LOGIC_VECTOR(15 downto 0));
	end component;

	constant timeDelay : time := 1ns;
begin
        fa0:  fulladder port map( A => a0;  B => b0;  CarryIn => cIn; 	     Sum => fa0_sum;  CarryOut => fa0_carry; );
		fa1:  fulladder port map( A => a1;  B => b1;  CarryIn => fa0_carry;  Sum => fa1_sum;  CarryOut => fa1_carry; );
		fa2:  fulladder port map( A => a2;  B => b2;  CarryIn => fa1_carry;  Sum => fa2_sum;  CarryOut => fa2_carry; );
		fa3:  fulladder port map( A => a3;  B => b3;  CarryIn => fa2_carry;  Sum => fa3_sum;  CarryOut => fa3_carry; );
		fa4:  fulladder port map( A => a4;  B => b4;  CarryIn => fa3_carry;  Sum => fa4_sum;  CarryOut => fa4_carry; );
		fa5:  fulladder port map( A => a5;  B => b5;  CarryIn => fa4_carry;  Sum => fa5_sum;  CarryOut => fa5_carry; );
		fa6:  fulladder port map( A => a6;  B => b6;  CarryIn => fa5_carry;  Sum => fa6_sum;  CarryOut => fa6_carry; );
		fa7:  fulladder port map( A => a7;  B => b7;  CarryIn => fa6_carry;  Sum => fa7_sum;  CarryOut => fa7_carry; );
		fa8:  fulladder port map( A => a8;  B => b8;  CarryIn => fa7_carry;  Sum => fa8_sum;  CarryOut => fa8_carry; );
		fa9:  fulladder port map( A => a9;  B => b9;  CarryIn => fa8_carry;  Sum => fa9_sum;  CarryOut => fa9_carry; );
		fa10: fulladder port map( A => a10; B => b10; CarryIn => fa9_carry;  Sum => fa10_sum; CarryOut => fa10_carry; );
		fa11: fulladder port map( A => a11; B => b11; CarryIn => fa10_carry; Sum => fa11_sum; CarryOut => fa11_carry; );
		fa12: fulladder port map( A => a12; B => b12; CarryIn => fa11_carry; Sum => fa12_sum; CarryOut => fa12_carry; );
		fa13: fulladder port map( A => a13; B => b13; CarryIn => fa12_carry; Sum => fa13_sum; CarryOut => fa13_carry; );
		fa14: fulladder port map( A => a14; B => b14; CarryIn => fa13_carry; Sum => fa14_sum; CarryOut => fa14_carry; );
		fa15: fulladder port map( A => a15; B => b15; CarryIn => fa14_carry; Sum => fa15_sum; CarryOut => fa15_carry; );
		
		s0  <= fa0_sum;
		s1  <= fa1_sum;
		s2  <= fa2_sum;
		s3  <= fa3_sum;
		s4  <= fa4_sum;
		s5  <= fa5_sum;
		s6  <= fa6_sum;
		s7  <= fa7_sum;
		s8  <= fa8_sum;
		s9  <= fa9_sum;
		s10 <= fa10_sum;
		s11 <= fa11_sum;
		s12 <= fa12_sum;
		s13 <= fa13_sum;
		s14 <= fa14_sum;
		s15 <= fa15_sum;
		
		CarryOut <= fa15_carry;
	
end Behavioral;
