library ieee;
use ieee.std_logic_1164.all;

entity addsub is
   port (
      A : in bit_vector(7 downto 0);
      B : in bit_vector(7 downto 0); 
      T : in bit;
      C_FLAG : out bit;
      OV_FLAG : out bit;
      R : out bit_vector(7 downto 0)
   );
end entity;

architecture behav of addsub is
	component fulladder is
		port (
				A, B : in bit;
				Cin : in bit;
				S, Cout : out bit
		);
	end component;
	
	signal C : bit_vector(7 downto 0);
	signal Bs : bit_vector(7 downto 0);
	signal Rs : bit_vector(7 downto 0);
	
	begin
	
		Bs(0) <= B(0) xor T;
		Bs(1) <= B(1) xor T;
		Bs(2) <= B(2) xor T;
		Bs(3) <= B(3) xor T;
		Bs(4) <= B(4) xor T;
		Bs(5) <= B(5) xor T;
		Bs(6) <= B(6) xor T;
		Bs(7) <= B(7) xor T;
		
		FA0 : fulladder port map(A(0), Bs(0), T, Rs(0), C(0));
		FA1 : fulladder port map(A(1), Bs(1), C(0), Rs(1), C(1));
		FA2 : fulladder port map(A(2), Bs(2), C(1), Rs(2), C(2));
		FA3 : fulladder port map(A(3), Bs(3), C(2), Rs(3), C(3));
		FA4 : fulladder port map(A(4), Bs(4), C(3), Rs(4), C(4));
		FA5 : fulladder port map(A(5), Bs(5), C(4), Rs(5), C(5));
		FA6 : fulladder port map(A(6), Bs(6), C(5), Rs(6), C(6));
		FA7 : fulladder port map(A(7), Bs(7), C(6), Rs(7), C(7));
		
		R <= Rs;
		C_FLAG <= C(7);
		OV_FLAG <= ((A(7) and Bs(7) and (not Rs(7))) or ((not A(7)) and (not Bs(7)) and Rs(7))) or (C(6) xor C(7));
	
end architecture;	
