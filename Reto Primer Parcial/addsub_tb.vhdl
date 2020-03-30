library ieee;
use ieee.std_logic_1164.all;

entity addsub_tb is
end entity;

architecture behav of addsub_tb is
	component addsub is
		port (
				A : in bit_vector(7 downto 0);
				B : in bit_vector(7 downto 0); 
				T : in bit;
				C_FLAG : out bit;
				OV_FLAG : out bit;
				R : out bit_vector(7 downto 0)
			);
	end component;
	
	signal A, B, R : bit_vector(7 downto 0);
	signal T, C_FLAG, OV_FLAG : bit;
	
	begin
		AS : addsub port map(A, B, T, C_FLAG, OV_FLAG, R);
		
		test : process
		begin
		-- 2 casos de suma de números positivos
			A <= "00101100";
			B <= "00100100";
			T <= '0';
			wait for 5 ns;
			
			A <= "00010101";
			B <= "00000011";
			wait for 5 ns;
		
		-- 2 casos de suma de número positivo y número negativo
			A <= "00010101";
			B <= "10000011";
			wait for 5 ns;
			
			A <= "00000111";
			B <= "11111011";
			wait for 5 ns;
			
		-- 2 casos de suma de número negativo y número positivo
			A <= "10101100";
			B <= "00100100";
			wait for 5 ns;
			
			A <= "11110100";
			B <= "00001100";
			wait for 5 ns;
			
		-- 2 casos de overflow suma
			A <= "01111111";
			B <= "01111100";
			wait for 5 ns;
			
			A <= "01000111";
			B <= "01111110";
			wait for 5 ns;
			
		-- 2 casos de overflow resta
			A <= "01000111";
			B <= "10111010";
			T <= '1';
			wait for 5 ns;
			
			A <= "10000000";
			B <= "01111111";
			wait for 5 ns;
			
		-- 2 casos con carry out suma
			A <= "11000000";
			B <= "01000000";
			T <= '0';
			wait for 5 ns;
			
			A <= "11000000";
			B <= "01100000";
			wait for 5 ns;
			
		-- 2 casos con carry out resta
			A <= "11000000";
			B <= "00100000";
			T <= '1';
			wait for 5 ns;
			
			A <= "11000000";
			B <= "10100000";
			wait for 5 ns;
			
		end process;
		
end architecture;
			
			
			