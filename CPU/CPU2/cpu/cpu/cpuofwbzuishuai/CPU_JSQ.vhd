library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity CPU_JSQ is
	port(clk,clr,cin:in std_logic;
		 q:out std_logic_vector(2 downto 0));
end CPU_JSQ;

architecture bhv of CPU_JSQ is
signal iq:std_logic_vector(2 downto 0):="000";
begin 
	process(clk,clr,cin,iq)
	begin
		if(clk' event and clk='1') then
			if(clr='1') then
				iq<="000";
			elsif(iq="111" and cin='1') then
				iq<="000";
			elsif(cin='1') then
				iq<=iq+1;
			end if;
		end if;
	end process;
	q<=iq;
end bhv;
	