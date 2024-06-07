library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
  
entity freq2 is
	port ( clk: in std_logic; -- Pin connected to P11 (N14)
			clk_80Hz: out std_logic);-- Can check it using PIN A8 - LEDR0

	end freq2;
  
architecture freq_div of freq2 is
  
signal count: integer:=1;
signal tmp : std_logic := '0';
  
begin
  
process(clk)
	begin
	if(clk'event and clk='1') then
		count <=count+1;
		if (count = 50000000/160) then -- (80Hz)
			tmp <= NOT tmp;
			count <= 1;
		end if;
	end if;
	clk_80Hz <= tmp;
end process;
 
end freq_div;