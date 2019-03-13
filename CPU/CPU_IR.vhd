library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.STD_LOGIC_ARITH.ALL;
entity CPU_IR is
	port(load,clk:in std_logic;
		sysbus: in std_logic_vector(7 downto 0);
		out_zl:out std_logic_vector(1 downto 0));
end CPU_IR;

architecture ALU_architecture of CPU_IR is
begin
	process(clk,load)
	begin
		if(clk'event and clk='1') then
			if(load='1') then
				if sysbus="00110010" then
					out_zl<="00";
				elsif sysbus="00111101" then
					out_zl<="01";
				elsif sysbus="10010001" then
					out_zl<="10";
				elsif sysbus="00010000" then
					out_zl<="11";
					end if;
			end if;
		end if;
	end process;			
end ;	