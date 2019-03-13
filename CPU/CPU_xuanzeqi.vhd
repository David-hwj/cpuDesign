library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity CPU_xuanzeqi is
	port(load:in std_logic;
		A,B: in std_logic_vector(7 downto 0);
		data_out: out std_logic_vector(7 downto 0));
end CPU_xuanzeqi;

architecture ALU_architecture of CPU_xuanzeqi is
begin
	process(load)
	begin
			if(load='1') then
				data_out<=A;
			else
				data_out<=B;	
			end if;
	end process;			
end ;	