library ieee;
use ieee.std_logic_1164.all;
USE IEEE.STD_LOGIC_ARITH.ALL;
use ieee.std_logic_unsigned.all;
entity CPU_RAM is
	port(cs,xl,dl,clk,en,jmp:in std_logic;
		data_in,add: in std_logic_vector(7 downto 0);--add is xia,data_in is shang
		data_out: out std_logic_vector(7 downto 0));
end CPU_RAM;

architecture ALU_architecture of CPU_RAM is
type ram is array(0 to 10)of std_logic_vector(7 downto 0);
begin
	process(clk,dl,xl,cs)
	variable r:ram;
	
	begin
	r(0):="00110010";
	r(1):="00111101";
	r(2):="10010001";
	r(3):="00010000";

		if(clk'event and clk='1') then
			if jmp='1' then
				data_out<="00000001";
				end if;
			if(cs='0') then
				if(xl='1') then
					r(conv_integer(add(7 downto 0))):=data_in	;
				elsif(dl='1') then
					if(en='1') then
					data_out<=r(conv_integer(add(7 downto 0)));
				end if;
				end if;
		end if;
		end if;
	end process;
				
end ;	