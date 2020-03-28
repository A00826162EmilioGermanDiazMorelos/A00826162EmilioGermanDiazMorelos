-- Escola Politecnica da Universidade de Sao Paulo
-- Laboratorio Digital A - Experiencia 4
--
-- Functional description of 4-bit binary counter on VHDL 
-- 
-- Author: Lucas Penna Saraiva and Stefan R. Raposo
-- 
-- >> Design requirements:
-- 
-- The Clear signal is asynchronous
-- The Load signal is syncrhonous
-- Enable signal

library ieee;
use ieee.numeric_bit.all;

entity Decade_Counter is

	Port ( Clear          : in bit;
			 Clock          : in bit;
			 Load           : in bit;
			 Enable         : in bit;
			 Up             : in bit; -- 'UP = 1 // Down = 0'
			 Counter_Input  : in bit_vector (3 downto 0);
			 RCO            : out bit;
			 Counter_Output : out bit_vector (3 downto 0));

end Decade_Counter;

architecture Behaviour of Decade_Counter is

	signal Count : unsigned(3 downto 0);

	begin
	
	-- Process Count
	
	process(Clock, Count)
	begin	

	if Clear = '1' then
		Count <= "0000";
		
	-- Up counter
	elsif rising_edge(Clock) and Enable ='1' then
	
		-- Verifying the count initial condition
		
		if Load = '1' then
		
			Count <= unsigned(Counter_Input);
			
		else
		
		-- Up counting
		
			if Up = '1' then
			
				if Count = "1000" then
				
				Count <= Count + 1;
				RCO <= '1';
					
				else
				
					RCO <= '0';
					Count <= Count + 1;
				
				end if;
			
			  if Count = "1001" then
				Count <= "0000";
			  end if;
			  
				
			-- Down Counting
			
			else
			
				if Count = "0001" then
					
				
					Count <= Count - 1;
					RCO <= '1';
				
				else
				
					Count <= Count - 1;
					RCO <= '0';
				
				end if;
				
				if Count = "0000" then
				Count <= "1001";
			  end if;

					
				end if;
			end if;
		end if;

	
	end process;
		
	Counter_Output <= bit_vector(Count);
		
end Behaviour;