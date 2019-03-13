library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity CPU_regs is
	port(RA0,RA1,RE,WE,WA0,WA1,clk,reset:in std_logic;
		--sysbus2:out std_logic_vector(7 downto 0);
		R1:out std_logic_vector(7 downto 0);
		sysbus_out:out std_logic_vector(7 downto 0);
		sysbus_in:in std_logic_vector(7 downto 0)
		);
		
end CPU_regs;

architecture ALU_architecture of CPU_regs is
signal A:std_logic_vector(7 downto 0):="00000001";
signal B:std_logic_vector(7 downto 0):="00000011";
signal C:std_logic_vector(7 downto 0):="00000111";
begin
	process(clk,WE,RE)
	begin
		if(clk'event and clk='1') then
			if(WE='1') then
				if(WA0='0')and(WA1='0') then
					A<=sysbus_in;
				elsif(WA0='0')and(WA1='1') then
					B<=sysbus_in;
				elsif(WA0='1')and(WA1='0') then
					C<=sysbus_in;
				end if;
			elsif RE='1' then	
				if(RA0='0')and(RA1='0') then
					sysbus_out<=A;
				elsif(RA0='0')and(RA1='1') then
					sysbus_out<=B;
				elsif(RA0='1')and(RA1='0') then
					sysbus_out<=C;	
				end if;
				end if;
		end if;
	end process;	
	R1<=A;
	end;