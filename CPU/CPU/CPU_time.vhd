library ieee;
use ieee.std_logic_1164.all;
USE IEEE.STD_LOGIC_ARITH.ALL;
use ieee.std_logic_unsigned.all;
entity CPU_time is
	port(clk: in std_logic;
		tout:out std_logic_vector(2 downto 0));
end CPU_time;

architecture ALU_architecture of CPU_time is
signal tin:std_logic_vector(2 downto 0):="000";
begin
	process(clk)
	begin	
	if clk'event and clk='1' then 
		tin<=tin+"001";
		tout<=tin;
	end if;
	end process;	
	end ;