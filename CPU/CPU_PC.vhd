library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity CPU_PC is
	PORT (
		sysbus_in: in std_logic_vector(7 downto 0);
		sysbus_out: out std_logic_vector(7 downto 0);
		Lod_PC:in std_logic;
		LD_PC:in std_logic;
		PC_bus:in std_logic;
		CLK: in std_logic
	--	reset:in std_logic
	);
end CPU_PC;

architecture ONE of CPU_PC is
SIGNAL DATA:STD_LOGIC_VECTOR(7 DOWNTO 0):="00000000";

begin

  process (CLK,Lod_PC)
    BEGIN
	IF CLK'EVENT AND CLK='1' THEN 
		 IF Lod_PC='1' THEN 
			  DATA<=sysbus_in;
		 elsif LD_PC='1' THEN 
			  DATA<=DATA+"00000001";
		 END IF;
	END IF;
   END PROCESS;
 --process(DATA)
--begin
	--if DATA="00000011" then
	--	DATA<="00000000";
--		end if;
--	end process;	
sysbus_out<=DATA WHEN  PC_bus='1' 
			 ELSE "ZZZZZZZZ"; 
end ONE;