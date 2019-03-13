library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned;
entity xzqofwb is
	port(madd:in integer;
		 in0,in1,in2:in std_logic_vector(7 downto 0);
		 x_out:out std_logic_vector( 7 downto 0));
end xzqofwb;
architecture a of xzqofwb is
begin
	process(madd)
	begin
		if (madd= 0) then
			x_out<=in0;
		elsif(madd= 1) then
			x_out<=in1;
		elsif(madd= 2) then
		    x_out<=in2;
		end if;
	end process;
	end a ;