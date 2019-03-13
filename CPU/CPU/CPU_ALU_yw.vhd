library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity CPU_ALU_yw is
	port(shl,shr,shpass,en:in std_logic;
		ALU_in:in std_logic_vector(7 downto 0);
		ALU_out:out std_logic_vector(7 downto 0));
end CPU_ALU_yw;

architecture ALU_architecture of CPU_ALU_yw is
begin
	process(shl,shr,shpass)
	begin
	if en='1' then
		if(shpass='1') then
			ALU_out<=ALU_in;
		else
			if(shr='1') then
				ALU_out<='0'&ALU_in(7 downto 1);
			else
				ALU_out<=ALU_in(6 downto 0)&'0';
			end if;
		end if;
	end if;
	end process;			
end ;	