library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity CPU_ALU is
	port(M:in std_logic;--what M???
		s:in std_logic_vector(3 downto 0);
		A,B:in std_logic_vector(7 downto 0);--r2 use A,r1 use B
		ALU_out:out std_logic_vector(7 downto 0));
end CPU_ALU;

architecture ALU_architecture of CPU_ALU is
begin
	process(s,A,B)
	begin
		if(M='1') then
		case s is
		
			when "0011"=>
				ALU_out<=A;
			when "1001"=>
				ALU_out<= A+B;
			when "0110"=>
				ALU_out<= B-A;	
			when "1110"=>
				ALU_out<= A and B;
			when "0101"=>
				ALU_out<= not B;
			when "1010"=>
				ALU_out<= B;	
			when others=>
			end case;
			end if;
	end process;
end ;	