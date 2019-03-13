LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY CPU_DSC IS
	PORT(
		
		MOVA	:IN STD_LOGIC;
		MOVB	:IN STD_LOGIC;
		MOVC	:IN STD_LOGIC;
		ALU		:IN STD_LOGIC;
		NOT0	:IN STD_LOGIC;
		SHL		:IN STD_LOGIC;
		SHR		:IN STD_LOGIC;
		JMP     :in STD_LOGIC;
	    JZ      :in STD_LOGIC;
	    JC      :in STD_LOGIC;
	    IN1     :in STD_LOGIC;
	    OUT1    :in STD_LOGIC;
	    NOP     :in STD_LOGIC;
		HALT	:IN STD_LOGIC;
		IR		:IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		Y		:IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		REGFILE_RA0			:OUT STD_LOGIC;
		REGFILE_RA1			:OUT STD_LOGIC;
		REGFILE_WA0			:OUT STD_LOGIC;
		REGFILE_WA1			:OUT STD_LOGIC;
		REGFILE_WE			:OUT STD_LOGIC;
		
	    PC_LOD				:OUT STD_LOGIC;
		XZQ_EN				:OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		RAM_WE				:OUT STD_LOGIC;
		RAM_OUTEN			:OUT STD_LOGIC;
		RAM_MEMEN			:OUT STD_LOGIC;
		ALU_M				:OUT STD_LOGIC;
		YMQ_EN				:OUT STD_LOGIC;
		JSQ_CLR				:OUT STD_LOGIC;
		JSQ_INC				:OUT STD_LOGIC;
		S					:OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		fbus,flbus,frbus    :out std_logic);
END CPU_DSC;

ARCHITECTURE DESCRIPTION OF CPU_DSC IS
BEGIN
PROCESS(MOVA,MOVB,MOVC,ALU,NOT0,SHR,SHL,Y,IR)
VARIABLE FETCH1,FETCH2,MOVA1,MOVA2,MOVB1,MOVB2,MOVC1,MOVC2,ALU1,ALU2,ALU3,NOT1,NOT2,SHR1,SHR2,SHL1,SHL2,ZHOUQI:STD_LOGIC;
		
		BEGIN
		FETCH1:=Y(0);
		FETCH2:=Y(1);
		
		MOVB1:=MOVB AND Y(2);
		MOVB2:=MOVB AND Y(3);
		
		MOVA1:=MOVA AND Y(2);
		MOVA2:=MOVA AND Y(3);
		
		MOVC1:=MOVC AND Y(2);
		MOVC2:=MOVC AND Y(3);
		
		ALU1:=ALU AND Y(2);
		ALU2:=ALU AND Y(3);
		ALU3:=ALU AND Y(4);
		
		NOT1:=NOT0 AND Y(2);
		NOT2:=NOT0 AND Y(3);
		
		SHR1:=SHR AND Y(2);
		SHR2:=SHR AND Y(3);
		
		SHL1:=SHL AND Y(2);
		SHL2:=SHL AND Y(3);
		
		PC_LOD<='1';
		XZQ_EN<="00";
		YMQ_EN<='1';
		RAM_WE<='1';
		RAM_OUTEN<='1';
		RAM_MEMEN<='1';
		
		
		REGFILE_WE<=MOVA2 OR MOVB2 OR MOVC2 OR ALU3 OR NOT2 OR SHR2 OR SHL2;
		REGFILE_RA0<=IR(0);
		REGFILE_RA1<=IR(1);
		REGFILE_WA0<=IR(2);
		REGFILE_WA1<=IR(3);
		
		IF ALU1='1' OR NOT1='1' OR SHR1='1' OR SHL1='1' THEN
		REGFILE_RA0<=IR(2);
		REGFILE_RA1<=IR(3);
		END IF;

		S<=IR(7 DOWNTO 4);
		IF (ALU='1' OR NOT0='1' OR IR(7 DOWNTO 4)="1111")THEN
			ALU_M<='1';
		END IF;
		IF(IR(7 DOWNTO 4)="1010")THEN 
			ALU_M<='0';
		END IF;
		if(IR(7 DOWNTO 4)="1010" and IR(1 DOWNTO 0)="00")then
		 frbus<='1';
		 flbus<='0';
		 fbus<='0';
		elsif(IR(7 DOWNTO 4)="1010" and IR(1 DOWNTO 0)="11")then
		 frbus<='0';
		 flbus<='1';
		 fbus<='0';
		else
		 frbus<='0';
		 flbus<='0';
		 fbus<='1';
		 end if;
		ZHOUQI:=MOVC2 OR MOVB2 OR MOVA2 OR ALU3 OR NOT2 OR SHR2 OR SHL2;
		
		JSQ_CLR<=ZHOUQI;
		JSQ_INC<=NOT ZHOUQI;	
		END PROCESS;
END DESCRIPTION;