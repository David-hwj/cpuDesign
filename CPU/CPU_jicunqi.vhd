library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.STD_LOGIC_ARITH.ALL;
entity CPU_jicunqi is
	port(load,clk:in std_logic;
		data_in: in std_logic_vector(7 downto 0);
		data_out: out std_logic_vector(7 downto 0));
end CPU_jicunqi;

architecture ALU_architecture of CPU_jicunqi is
begin
	process(clk,load)
	begin
		if(clk'event and clk='1') then
			if(load='1') then
				data_out<=data_in;
			end if;
		end if;
	end process;			
end ;	