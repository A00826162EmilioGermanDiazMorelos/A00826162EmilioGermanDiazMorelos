library ieee;
use ieee.std_logic_1164.all;

entity fulladder is
	port (
			A, B : in bit;
			Cin : in bit;
			S, Cout : out bit
		);
end entity;

architecture behav of fulladder is
	begin

	process (A, B, Cin)
	begin
		S <= (A xor B) xor Cin;
		Cout <= (A and B) or (A and Cin) or (B and Cin);
	end process;
end architecture;
