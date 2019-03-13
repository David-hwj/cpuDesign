LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY jucunqizu IS 
	PORT
	(
		clock,WE,RAA0,RAA1,RWBA0,RWBA1 :  IN  STD_LOGIC;
		BUS0:IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		A,B: OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END jucunqizu;

ARCHITECTURE bdf_type OF jucunqizu IS 

COMPONENT jicun
	PORT(LOAD : IN STD_LOGIC;
		 CLOCK : IN STD_LOGIC;
		 D : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 Q : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	A_1,B_1,C_1,A_0,B_0,C_0 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
signal WE_0: std_logic;

BEGIN 
WE_0<= NOT WE;


b2v_A : jicun
PORT MAP(LOAD => WE_0,
		 CLOCK => clock,
		 D => A_0,
		 Q => A_1);


b2v_B : jicun
PORT MAP(LOAD => WE_0,
		 CLOCK => clock,
		 D => B_0,
		 Q => B_1);


b2v_C : jicun
PORT MAP(LOAD => WE_0,
		 CLOCK => clock,
		 D => C_0,
		 Q => C_1);

PROCESS(RAA0,RAA1,RWBA0,RWBA1)
BEGIN
			IF( RWBA1='0' and RWBA0='0')then
			A_0<=BUS0;
			B_0<=B_1;
			C_0<=C_1;				
			ELSIF(RAA1='0' and RAA0='1') then
			A_0<=A_1;
			B_0<=BUS0;
			C_0<=C_1;
			ELSIF(RAA1='1' and RAA0='0') then 
			A_0<=A_1;
			B_0<=B_1;
			C_0<=BUS0;
			ELSIF(RAA1='1' and RAA0='1') then
			A_0<=A_1;
			B_0<=B_1;		
			C_0<=BUS0;
			ELSE
			A_0<=A_1;
			B_0<=B_1;
			C_0<=C_1;
			END IF;
IF( RAA1='0' and RAA0='0')then
			A_0<=BUS0;
			B_0<=B_1;
			C_0<=C_1;				
			ELSIF(RAA1='0' and RAA0='1') then
			A_0<=A_1;
			B_0<=BUS0;
			C_0<=C_1;
			ELSIF(RAA1='1' and RAA0='0') then 
			A_0<=A_1;
			B_0<=B_1;
			C_0<=BUS0;
			ELSIF(RAA1='1' and RAA0='1') then
			A_0<=A_1;
			B_0<=B_1;		
			C_0<=BUS0;
			ELSE
			A_0<=A_1;
			B_0<=B_1;
			C_0<=C_1;
			END IF;
	END PROCESS;
END bdf_type;