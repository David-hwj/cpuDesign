library ieee;
use ieee.std_logic_1164.all;
entity JICUNQIZU is
	port(clk,we,RAA0,RAA1,RWBA0,RWBA1: in std_logic;
		 BUS0:in std_logic_vector(7 downto 0);
		 A,B:out std_logic_vector(7 downto 0));
end JICUNQIZU;

architecture description of JICUNQIZU is
signal ra:std_logic_vector(7 downto 0):="00000001";
signal rb:std_Logic_vector(7 downto 0):="00000011";
signal rc:std_logic_vector(7 downto 0):="00000111";
begin 
	process(clk,we,RAA0,RAA1,RWBA0,RWBA1)
	begin
			if(RWBA1='0' and RWBA0='0')then
				B<=ra;
			elsif(RWBA1='0' and RWBA0='1') then
				B<=rb;
			elsif(RWBA1='1' and RWBA0='0') then 
				B<=rc;
			elsif(RWBA1='1' and RWBA0='1') then
				B<=rc;
			else
				B<="00000000";
			end if;
			if(RAA1='0' and RAA0='0')then
				A<=ra;
			elsif(RAA1='0' and RAA0='1') then
				A<=rb;
			elsif(RAA1='1' and RAA0='0') then 
				A<=rc;
			elsif(RAA1='1' and RAA0='1') then
				A<=rc;
			else
				A<="00000000";
			end if;
			if(clk'event and clk='1') then
				if(we='0' and RAA1='0' and RAA0='0') then
					ra<=BUS0;
				elsif(we='0' and RAA1='0' and RAA0='1') then
					rb<=BUS0;
				elsif(we='0' and RAA1='1' and RAA0='0') then
					rc<=BUS0;
				elsif(we='0' and RAA1='1' and RAA0='1') then
					rc<=BUS0;
				end if;
			end if;
	end process;
end description;