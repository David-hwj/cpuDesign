LIBRARY ieee;
USE ieee.std_logic_1164.all; 
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
LIBRARY work;
ENTITY ALU IS 
	PORT
	(
		R1 :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		R2 :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		M:IN STD_LOGIC;
		S :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		A:OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		C,Z:OUT STD_LOGIC
	);
END ALU;
ARCHITECTURE bdf_type OF ALU IS 
SIGNAL RESULT:STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL b,e,d:STD_LOGIC_VECTOR(8 DOWNTO 0);
BEGIN
PROCESS(b,e,d,M)
BEGIN
IF (M='1' and S="1001") THEN
d<='0' & R1;
b<='0' & R2;
d(8)<='0';
b(8)<='0';
e<=b+d;
C<=e(8);Z<='0';
FOR i IN  7 DOWNTO 0 LOOP
A(i)<=e(i); 
END LOOP;
ELSIF (M='1' and S="0110") THEN

IF (R1<R2) THEN
A<=R2-R1;C<='1';
ELSIF(R1>R2) THEN
A<=R1-R2;C<='0';
ELSIF(R1=R2) THEN
A<=R1-R2;C<='0';Z<='1';
END IF;
ELSIF (M='1' and S="1110")THEN
  FOR i IN  7 DOWNTO 0 LOOP
  if(R1(i)='1' and R2(i)='1') then
  A(i)<='1';
  else 
  A(i)<='0';
  end if;
END LOOP;
C<='0';Z<='0';
ELSIF (M='1' and S="0101")THEN
  FOR i IN  7 DOWNTO 0 LOOP
  if(R1(i)='1') then
  A(i)<='0';
  else 
  A(i)<='1';
  end if;
END LOOP;
C<='0';Z<='0';
ELSIF (S="1010")THEN
A<=R1;C<='0';Z<='1';
ELSE
A<=R1;
C<='0';Z<='0';
END IF;
END PROCESS;
END bdf_type;